import database from "../database/database.js";

const TABLE = "likes";

function insertLike({ postId, userId }) {
  return database.query(
    `INSERT INTO ${TABLE} (postId, userId) VALUES ($1, $2)`,
    [postId, userId]
  );
}

export { insertLike };
