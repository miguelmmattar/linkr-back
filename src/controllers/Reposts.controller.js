import { STATUS_CODE } from "../enums/statusCode.js";
import { insertRepost } from "../repositories/Reposts.repository.js";

const repostContent = async (req, res) => {
  const { userId } = res.locals;
  const { postId } = req.body;
  try {
    await insertRepost({ userId, postId });
    res.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
  }
};

export { repostContent };
