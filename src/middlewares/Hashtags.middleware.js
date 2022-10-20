import {
  getRepeatedHashtag,
  insertHashtags,
} from "../repositories/Hashtags.repository.js";
import { STATUS_CODE } from "../enums/statusCode.js";

async function getHashtags(req, res) {
  const { description } = req.body;
  const getHashtagsFromDescription = description
    .split(" ")
    .filter((str) => str.includes("#"));

  try {
    for (let i = 0; i < getHashtagsFromDescription.length; i++) {
      let string = getHashtagsFromDescription[i];

      if (string === "#" || string[0] !== "#") {
        continue;
      }
      const hashtagArray = await getRepeatedHashtag(string);
      if (hashtagArray > 0) {
        continue;
      }
      await insertHashtags(string);
    }

    res.sendStatus(STATUS_CODE.OK);
  } catch (error) {
    console.log(error.message);
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { getHashtags };
