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

function getLikes() {
  return connection.query(
    `SELECT 
        posts.id AS "postId",
        COALESCE(json_agg(json_build_object('id', likes."userId", 'name', users.name)) 
            FILTER (WHERE likes."userId" IS NOT NULL), '[]') AS "likedBy"
    FROM 
        posts
    LEFT JOIN likes
        ON likes."postId" = posts.id
    LEFT JOIN users
        ON likes."userId" = users.id
    GROUP BY posts.id
    
    ORDER BY posts."createdAt" DESC;`
  );
}

export { insertLike, deleteLike, getLikes };
