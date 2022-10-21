import {
  getRepeatedHashtag,
  insertHashtags,
} from "../repositories/Hashtags.repository.js";
import { STATUS_CODE } from "../enums/statusCode.js";

async function getHashtags(req, res, next) {
  //const { description } = req.body;
  const description =
    "kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste13 #teste6 #teste7 #teste8 #teste9 #teste10 #teste11 #teste12 #teste14 #teste15 #teste16";

  const getHashtagsFromDescription = description
    .split(" ")
    .filter((str) => str.includes("#"));
  const hashtags = [];
  try {
    for (let i = 0; i < getHashtagsFromDescription.length; i++) {
      let string = getHashtagsFromDescription[i];

      if (string === "#" || string[0] !== "#") {
        continue;
      }
      hashtags.push(string);
      const hashtagArray = await getRepeatedHashtag(string);
      if (hashtagArray > 0) {
        continue;
      }
      await insertHashtags(string);
    }
    res.locals.hashtags = hashtags;
    next();
  } catch (error) {
    console.log(error.message);
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { getHashtags };
