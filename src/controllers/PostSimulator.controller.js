import connection from "../database/Postgres.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import {
  insertPost,
  insertPostHashtag,
} from "../repositories/Hashtags.repository.js";

async function postContent(req, res) {
  //  const {description, url} = req.body;
  const TABLE_POSTSHASHTAGS = "postsHashtags";
  const description =
    "kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12";
  const url = "https://youtube.com";
  const userId = 6;

  const hashtagsArray = res.locals.hashtags;

  // >>>>>>>>>>>> INSERT INTO posts
  try {
    const id = await insertPost({ description, url, userId });

    if (hashtagsArray.length > 0) {
      for (let i = 0; i < hashtagsArray.length; i++) {
        let hashtagId = await connection.query(
          `SELECT id FROM hashtags WHERE hashtag = $1;`,
          [hashtagsArray[i]]
        );
        hashtagId = hashtagId.rows[0].id;
        await insertPostHashtag({ id, hashtagId });
      }
    }
    res.send("okkkk");
  } catch (error) {
    console.log(error.message);
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { postContent };
