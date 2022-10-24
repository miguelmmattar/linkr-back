import connection from "../database/Postgres.js";

const getUsersByNamePart = ({ searchString }) => {
    return  connection.query(`
        SELECT users.id, users.name, "userPicture".url
        FROM users 
        JOIN "userPicture"
            ON users.id = "userPicture"."userId"
        WHERE users.name ILIKE $1
;`, [`${searchString}%`]);
};


export { getUsersByNamePart }