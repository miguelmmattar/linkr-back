import connection from "../database/Postgres.js";

const TABLE = "posts";

function deletePost(id) {
  return connection.query(`DELETE FROM ${TABLE} WHERE "id"=$1`, [id]);
}

async function postUrl({ url, description, userId }) {
  const insert = await connection.query(
    `
        INSERT INTO posts (url, description, "userId") VALUES ($1, $2, $3) RETURNING id
    `,
    [url, description, userId]
  );
  return insert.rows[0].id;
}

const getPosts = (info, type, userId, offset) => {
  let filter = false;
  if (info && type === "user") {
    filter = `WHERE users.id = $1 AND extract(epoch FROM posts."createdAt") < $2`;
  }

  if (info && type === "hashtag") {
    filter = `WHERE hashtags.hashtag = $1 AND extract(epoch FROM posts."createdAt") < $2`;
    info = "#" + info;
  }

  if (filter) {
    return connection.query(
      `
        SELECT 
            posts.id,
            posts.url AS link,
            posts.description,
            json_build_object('id', users.id,'name', users.name, 'picture', "userPicture".url) AS user,
            extract(epoch FROM posts."createdAt") AS "createdAt"
        FROM 
            posts
        LEFT JOIN users
            ON users.id = posts."userId"
        LEFT JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        LEFT JOIN "postsHashtags"
            ON "postsHashtags"."postId" = posts.id
        LEFT JOIN hashtags
            ON hashtags.id = "postsHashtags"."hashtagId"
        ${filter}
        ORDER BY "createdAt" DESC
        LIMIT 10;
        `,
      [info, offset]
    );
  }

  return connection.query(
    `
        SELECT
            posts.id,
            posts.url AS link,
            posts.description,
            json_build_object('id', users.id,'name', users.name, 'picture', "userPicture".url) AS user,
            extract(epoch FROM posts."createdAt") AS "createdAt"
        FROM 
            posts
        LEFT JOIN users
            ON users.id = posts."userId"
        LEFT JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        LEFT JOIN "postsHashtags"
            ON "postsHashtags"."postId" = posts.id
        LEFT JOIN hashtags
            ON hashtags.id = "postsHashtags"."hashtagId"
        LEFT JOIN follows
            ON follows.followed = users.id
        WHERE 
            (follows.follower = $1 OR posts."userId" = $1) AND extract(epoch FROM posts."createdAt") < $2
        GROUP BY posts.id, users.id, "userPicture".id, "postsHashtags"."postId"
        ORDER BY "createdAt" DESC
        LIMIT 10;
        `,
    [userId, offset]
  );
};

const getReposts = (info, type, userId, offset) => {
  let filter = false;

  if (info && type === "user") {
    filter = `WHERE (reposts."userId" = $1) AND extract(epoch FROM reposts."createdAt") < $2`;
    return connection.query(
      `
    SELECT     
    posts.id AS id,
    reposts.id AS "repostId",
    reposts."userId" AS "repostUserId",
    u2.name AS "repostUserName",
    posts.url AS link,
    posts.description,
    json_build_object('id', u1.id,'name', u1.name, 'picture', "userPicture".url) AS user,
    extract(epoch FROM reposts."createdAt") AS "createdAt"
       FROM posts
      	LEFT JOIN reposts ON posts.id = reposts."postId"
        LEFT JOIN users u1 ON u1.id = posts."userId"
        LEFT JOIN users u2 ON u2.id = reposts."userId"
        LEFT JOIN "userPicture" ON posts."userId" = "userPicture"."userId"      
         LEFT JOIN follows ON reposts."userId" = follows.followed
        ${filter}
        GROUP BY reposts.id, posts.id, u2.name, u1.name, u1.id, "userPicture".url
        ORDER BY "createdAt" DESC
        LIMIT 10; 
    `,
      [userId, offset]
    );
  }

  return connection.query(
    `
    SELECT     
    posts.id AS id,
    reposts.id AS "repostId",
    reposts."userId" AS "repostUserId",
    u2.name AS "repostUserName",
    posts.url AS link,
    posts.description,
    json_build_object('id', u1.id,'name', u1.name, 'picture', "userPicture".url) AS user,
    extract(epoch FROM reposts."createdAt") AS "createdAt"
       FROM posts
      JOIN reposts ON posts.id = reposts."postId"
        JOIN users u1 ON u1.id = posts."userId"
        JOIN users u2 ON u2.id = reposts."userId"
        JOIN "userPicture" ON posts."userId" = "userPicture"."userId"      
         JOIN follows ON reposts."userId" = follows.followed
        WHERE (follows.follower = $1 OR reposts."userId" = $1) AND extract(epoch FROM reposts."createdAt") < $2
        GROUP BY reposts.id, posts.id, u2.name, u1.name, u1.id, "userPicture".url
        ORDER BY "createdAt" DESC
        LIMIT 10;   
  `,
    [userId, offset]
  );
};

function getPostById(id) {
  return connection.query(`SELECT "userId" FROM posts WHERE id=$1;`, [id]);
}

function updatePost({ description, userId, id }) {
  return connection.query(
    `UPDATE ${TABLE} SET  description=$1, "userId"=$2  WHERE id=$3;`,
    [description, userId, id]
  );
}

export { postUrl, getPosts, getReposts, deletePost, getPostById, updatePost };
