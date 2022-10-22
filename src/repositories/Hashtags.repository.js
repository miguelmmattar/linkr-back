import connection from "../database/Postgres.js";

const TABLE_HASHTAG = "hashtags";
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

function deletePostHashtagByPostId(id) {
  return connection.query(
    `DELETE FROM ${TABLE_POSTSHASHTAGS} WHERE "postId"=$1`,
    [id]
  );
}

export {
  getRepeatedHashtag,
  insertHashtags,
  insertPostHashtag,
  getHashtagsTrending,
  deletePostHashtagByPostId,
};
