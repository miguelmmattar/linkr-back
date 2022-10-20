import connection from "../database/Postgres.js";

const TABLE = "hashtags";

async function getRepeatedHashtag(string) {
  const repeatedHashtag = await connection.query(
    `SELECT * FROM ${TABLE} WHERE hashtag = $1;`,
    [string]
  );
  return repeatedHashtag.rowCount;
}

function insertHashtags(string) {
  return connection.query(`INSERT INTO ${TABLE} (hashtag) VALUES ($1);`, [
    string,
  ]);
}

export { getRepeatedHashtag, insertHashtags };
