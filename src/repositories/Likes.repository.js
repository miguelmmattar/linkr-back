import connection from "../database/Postgres.js";

const TABLE = "likes";

function insertLike({ postId, userId }) {
  return connection.query(
    `INSERT INTO ${TABLE} (postId, userId) VALUES ($1, $2)`,
    [postId, userId]
  );
}

export { insertLike };
