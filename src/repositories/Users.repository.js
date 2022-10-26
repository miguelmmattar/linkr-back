import connection from "../database/Postgres.js";

const getUsersByNamePart = ({ searchString }) => {
    return connection.query(`
        SELECT users.id, users.name, "userPicture".url
        FROM users 
        JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        WHERE users.name ILIKE $1
;`, [`${searchString}%`]);
};

const getUserFollows = (userId) => {
    return connection.query(`
        SELECT
            followed   
        FROM 
            follows
        WHERE
            follower = $1    
    ;`, [userId]);
}

const getUserFollowers = (userId) => {
    return connection.query(`
        SELECT
            follower   
        FROM 
            follows
        WHERE
            followed = $1    
    ;`, [userId]);
}

export { getUsersByNamePart, getUserFollows, getUserFollowers }