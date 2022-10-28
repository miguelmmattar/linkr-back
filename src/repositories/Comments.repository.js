import connection from "../database/Postgres.js";

const TABLE = "comments";

function getPostCommentsById(id) {
  return connection.query(
    `
  SELECT 
  comment.id,
  posts.url AS link,
  posts.description,
  json_build_object('id', users.id,'name', users.name, 'picture', "userPicture".url) AS user,
FROM 
  comments
LEFT JOIN users
  ON users.id = comments."userId"
LEFT JOIN "userPicture"
  ON users.id = "userPicture"."userId"
ORDER BY "createdAt" DESC
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
