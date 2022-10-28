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
  console.log(userId)
  if (info && type === "user") {
    filter = `WHERE users.id = $1`;
  }

  if (info && type === "hashtag") {
    filter = `WHERE hashtags.hashtag = $1`;
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
            posts."createdAt"
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
        LIMIT 10
        OFFSET $2;
    `,[info, offset]);
  }

  return connection.query(`
        SELECT
            posts.id,
            posts.url AS link,
            posts.description,
            json_build_object('id', users.id,'name', users.name, 'picture', "userPicture".url) AS user,
            posts."createdAt"
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
            follows.follower = $1 OR posts."userId" = $1
        GROUP BY posts.id, users.id, "userPicture".id, "postsHashtags"."postId"
        ORDER BY "createdAt" DESC
        LIMIT 10
        OFFSET $2;
    `,[userId, offset]);
}

function getPostById(id) {
  return connection.query(`SELECT "userId" FROM posts WHERE id=$1;`, [id]);
}

function updatePost({ description, userId, id }) {
  return connection.query(
    `UPDATE ${TABLE} SET  description=$1, "userId"=$2  WHERE id=$3;`,
    [description, userId, id]
  );
}

export { postUrl, getPosts, deletePost, getPostById, updatePost };
