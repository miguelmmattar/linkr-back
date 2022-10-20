import { STATUS_CODE } from "../enums/statusCode.js";
import * as postRepository from "../repositories/Posts.repository.js";

async function postLike(request, response) {
  try {
    const { userId } = response.locals;
    const { postId } = response.locals.body;
    const deletePreviousLike = likesRepository.deleteLike({ userId, postId });
    const query = await likesRepository.insertLike({ userId, postId });

    if (deletePreviousLike.rowCount !== 0) {
      response.sendStatus(STATUS_CODE.NO_CONTENT);
      return;
    }

    if (query.rowCount === 0) {
      response
        .status(STATUS_CODE.SERVER_ERROR)
        .send("failed to register post like");
      return;
    }

    response.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

export { postLike };
