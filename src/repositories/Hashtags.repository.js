import connection from "../database/Postgres.js";

const TABLE_HASHTAG = "hashtags";
const TABLE_POST = "posts";
const TABLE_POSTSHASHTAGS = `"postsHashtags"`;

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
    `INSERT INTO ${TABLE_POSTSHASHTAGS} ("postId", "hashtagId") VALUES ($1, $2);`,
    [id, hashtagId]
  );
}

async function getHashtagsTrending() {
  const trending = await connection.query(`
    SELECT ${TABLE_HASHTAG}.id, COUNT(${TABLE_POSTSHASHTAGS}."hashtagId") AS count, ${TABLE_HASHTAG}.hashtag FROM ${TABLE_HASHTAG} 
    JOIN ${TABLE_POSTSHASHTAGS} ON ${TABLE_HASHTAG}.id = ${TABLE_POSTSHASHTAGS}."hashtagId"
    GROUP BY ${TABLE_HASHTAG}.id
    ORDER BY count DESC
    LiMIT 10
    `);
  return trending.rows;
}

export {
  getRepeatedHashtag,
  insertHashtags,
  insertPost,
  insertPostHashtag,
  getHashtagsTrending,
};
