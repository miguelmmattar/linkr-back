import connection from "../database/Postgres.js";

const TABLE = "likes";

function insertLike({ postId, userId }) {
  return connection.query(
    `INSERT INTO ${TABLE} (postId, userId) VALUES ($1, $2)`,
    [postId, userId]
  );
}

function deleteLike({ postId, userId }) {
  return connection.query(
    `DELETE FROM ${TABLE} WHERE "postId"=$1 AND "userId"=$2`,
    [postId, userId]
  );
}

export { insertLike };
