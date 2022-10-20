import connection from "../database/Postgres.js";


const insertUser = async ({ name, email, hashPassword }) => {
    return connection.query(
        `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
        [name, email, hashPassword]
    );
}


export { insertUser }