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

const getPosts = (info, type) => {
  let filter;

  if(info && type === "user") {
    filter = `WHERE users.id = $1`;
  }

  if(info && type === "hashtag") {
    filter = `WHERE hashtags.hashtag = $1`;
    info = "#" + info;
  }

  if(filter) {
    return connection.query(`
        SELECT 
            posts.id,
            posts.url AS link,
            posts.description,
            json_build_object('id', users.id,'name', users.name, 'picture', "userPicture".url) AS user,
            posts."createdAt"
        FROM 
            posts
        JOIN users
            ON users.id = posts."userId"
        JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        JOIN "postsHashtags"
            ON "postsHashtags"."postId" = posts.id
        JOIN hashtags
            ON hashtags.id = "postsHashtags"."hashtagId"
        ${filter}
        ORDER BY "createdAt" DESC
        LIMIT 20;
    `,[info]);
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
        JOIN users
            ON users.id = posts."userId"
        JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        JOIN "postsHashtags"
            ON "postsHashtags"."postId" = posts.id
        JOIN hashtags
            ON hashtags.id = "postsHashtags"."hashtagId"
        
        ORDER BY "createdAt" DESC
        LIMIT 20;
    `);
  
}

function getPostById(id) {
  return connection.query(`SELECT "userId" FROM posts WHERE id=$1;`, [id]);
}

function updatePost({ url, description, userId, id }) {
  return connection.query(
    `UPDATE ${TABLE} SET url=$1, description=$2, "userId"=$3  WHERE id=$4;`,
    [url, description, userId, id]
  );
}

export { postUrl, getPosts, deletePost, getPostById, updatePost };
