import connection from "../database/Postgres.js";

const TABLE = "comments";

function getPostCommentsById(id) {
  return connection.query(
    `
    SELECT COMMENTS.COMMENT,
    USERS.ID AS ID,
    USERS.NAME AS NAME,
    "userPicture".URL AS PICTURE,
    COMMENTS."createdAt"
  FROM COMMENTS
  LEFT JOIN USERS ON USERS.ID = COMMENTS."userId"
  LEFT JOIN "userPicture" ON USERS.ID = "userPicture"."userId"
  WHERE COMMENTS."postId" = $1
  ORDER BY COMMENTS."createdAt"
;`,
    [id]
  );
}

function insertComment({ postId, userId, comment }) {
  return connection.query(
    `INSERT INTO ${TABLE} ("postId", "userId", comment) VALUES ($1, $2, $3);`,
    [postId, userId, comment]
  );
}

export { insertComment, getPostCommentsById };
