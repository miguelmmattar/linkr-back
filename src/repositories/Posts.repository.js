import connection from "../database/Postgres.js";

const TABLE = "posts";

function deletePost({ postId, userId }) {
  return connection.query(
    `DELETE FROM ${TABLE} WHERE "id"=$1 AND "userId"=$2`,
    [postId, userId]
  );
}

export { insertLike };
