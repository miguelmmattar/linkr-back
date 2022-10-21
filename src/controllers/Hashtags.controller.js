import { STATUS_CODE } from "../enums/statusCode.js";
import { getHashtagsTrending } from "../repositories/Hashtags.repository.js";

async function hashtagsTrending(req, res) {
  try {
    const trendingArray = await getHashtagsTrending();
    res.send(trendingArray);
  } catch (error) {
    console.log(error.message);
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { hashtagsTrending };
