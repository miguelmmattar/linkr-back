import connection from "../database/Postgres.js";

const TABLE = "reposts";

function insertRepost({ userId, postId }) {
  return connection.query(
    `INSERT INTO ${TABLE} ("postId", "userId") VALUES ($1, $2);`,
    [postId, userId]
  );
}

export { insertRepost };
