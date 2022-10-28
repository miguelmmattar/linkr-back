import { STATUS_CODE } from "../enums/statusCode.js";
import * as commentsRepository from "../repositories/Comments.repository.js";

async function postComment(request, response) {
  try {
    const { userId } = response.locals;
    const { id, comment } = response.locals.safeData;
    const query = await commentsRepository.insertComment({ userId, postId: id, comment });
    
    if (query.rowCount === 0) {
      response
        .status(STATUS_CODE.SERVER_ERROR)
        .send("failed to register comment");
      return;
    }

    response.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

export { postComment };
