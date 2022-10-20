import connection from "../database/Postgres.js";

const postUrl = (url, description, user) => {
    return connection.query(`
        INSERT INTO posts (url, description, "userId") VALUES ($1, $2, $3)
    `, [url, description, user]);
}

const getPosts = () => {
    return connection.query(`
        SELECT url, description, "userId", "createdAt" FROM posts
            ORDER BY "createdAt" DESC
            LIMIT 20;
    `);
}

export {
    postUrl,
    getPosts
};