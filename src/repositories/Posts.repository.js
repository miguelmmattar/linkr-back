import connection from "../database/Postgres.js";

const TABLE = "posts";

function deletePost(id) {
  return connection.query(`DELETE FROM ${TABLE} WHERE "id"=$1`, [id]);
}

const postUrl = (url, description, user) => {
  return connection.query(
    `
        INSERT INTO posts (url, description, "userId") VALUES ($1, $2, $3)
    `,
    [url, description, user]
  );
};

const getPosts = () => {
  return connection.query(`
        SELECT 
            url,
            description,
            json_buid_object('name', users.name, 'picture', "userPicture".url) AS user,
            "createdAt"
        FROM 
            posts
        JOIN users
            ON users.id = posts."userId"
        JOIN "userPicture"
            ON users.id = "userPictures".userId
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
