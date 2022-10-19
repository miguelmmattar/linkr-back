import { STATUS_CODE } from "../enums/statusCode.js";
import * as likesRepository from "../repositories/Likes.repository.js";
async function postLike(request, response) {
  try {
    const { userId } = response.locals;
    const { postId } = response.locals.body;
    const query = await likesRepository.insertLike({ userId, postId });

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
