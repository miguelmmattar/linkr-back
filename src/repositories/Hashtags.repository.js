import connection from "../database/Postgres.js";

const TABLE_HASHTAG = "hashtags";
const TABLE_POST = "posts";

async function getRepeatedHashtag(string) {
  const repeatedHashtag = await connection.query(
    `SELECT * FROM ${TABLE_HASHTAG} WHERE hashtag = $1;`,
    [string]
  );
  return repeatedHashtag.rowCount;
}

function insertHashtags(string) {
  return connection.query(
    `INSERT INTO ${TABLE_HASHTAG} (hashtag) VALUES ($1);`,
    [string]
  );
}

async function insertPost({ description, url, userId }) {
  const insert = await connection.query(
    `INSERT INTO ${TABLE_POST} (description, url, "userId") VALUES ($1, $2, $3) RETURNING id;`,
    [description, url, userId]
  );
  return insert.rows[0].id;
}

function insertPostHashtag({ id, hashtagId }) {
  return connection.query(
    `INSERT INTO "postsHashtags" ("postId", "hashtagId") VALUES ($1, $2);`,
    [id, hashtagId]
  );
}

export { getRepeatedHashtag, insertHashtags, insertPost, insertPostHashtag };
