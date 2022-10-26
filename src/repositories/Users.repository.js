import connection from "../database/Postgres.js";

const getUsersByNamePart = ({ searchString, userId }) => {
    return connection.query(`
        SELECT users.id, users.name, "userPicture".url, follows."createdAt" as "followedAt"
        FROM users 
        JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        LEFT JOIN  follows ON users.id = follows.followed AND follows.follower = $2
        WHERE users.name ILIKE $1
        ORDER BY "followedAt"
;`, [`${searchString}%`, userId]);
};

const getFollowByIds = ({ userId, id }) => {
    return connection.query(`
        SELECT * FROM follows WHERE follower = $1 AND followed = $2
    ;`, [userId, id]);
};

const insertNewFollower = ({ userId, id }) => {
    return connection.query(`
        INSERT INTO follows (follower, followed) VALUES ($1, $2)
    ;`, [userId, id]);
};

const deleteFollow = ({ userId, id }) => {
    return connection.query(`
    DELETE FROM follows 
    WHERE follower = $1 AND followed = $2
    ;`, [userId, id])
};

const getUserDataByIds = (id, userId) => {
    return connection.query(`
        SELECT users.id, users.name, "userPicture".url AS picture, follows."createdAt" as "followedAt"
        FROM users 
        JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        LEFT JOIN follows 
            ON users.id = follows.followed AND follows.follower = $2
        WHERE users.id = $1 
    ;`, [id, userId])
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
};

const getUserFollowers = (userId) => {
    return connection.query(`
        SELECT
            follower   
        FROM 
            follows
        WHERE
            followed = $1    
    ;`, [userId]);
};


export { 
    getUsersByNamePart,
    insertNewFollower,
    getFollowByIds,
    deleteFollow,
    getUserDataByIds,
    getUserFollows,
    getUserFollowers
}
