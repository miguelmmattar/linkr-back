import connection from "../database/Postgres.js";

const TABLE = "posts";

function deletePost(id) {
  return connection.query(`DELETE FROM ${TABLE} WHERE "id"=$1`, [id]);
}

 async function postUrl ({url, description, userId}) {
  const insert = await connection.query(
    `
        INSERT INTO posts (url, description, "userId") VALUES ($1, $2, $3) RETURNING id
    `,
    [url, description, userId]
  );
  return insert.rows[0].id;
};

const getPosts = () => {
  return connection.query(`
        SELECT 
            posts.url AS link,
            posts.description,
            json_build_object('name', users.name, 'picture', "userPicture".url) AS user,
            posts."createdAt"
        FROM 
            posts
        JOIN users
            ON users.id = posts."userId"
        JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        ORDER BY "createdAt" DESC
        LIMIT 20;
    `);
};

function getPostById(id) {
  return connection.query(`SELECT "userId" FROM posts WHERE id=$1;`, [id]);
}

function updatePost({ id, description }) {
  return connection.query(
    `UPDATE ${TABLE} SET url=$1, description=$2, "userId"=$3  WHERE id=$4;`,
    [id, description]
  );
}

export { postUrl, getPosts, deletePost, getPostById, updatePost };
