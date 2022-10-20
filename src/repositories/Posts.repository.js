import connection from "../database/Postgres.js";

const postUrl = (url, description, user) => {
    return connection.query(`
        INSERT INTO posts (url, description, "userId") VALUES ($1, $2, $3)
    `, [url, description, user]);
}

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
}

export {
    postUrl,
    getPosts
};