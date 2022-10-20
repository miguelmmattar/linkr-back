import connection from "../database/Postgres.js";


const insertUser = ({ name, email, hashPassword }) => {
    return connection.query(
        `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
        [name, email, hashPassword]
    );
}

const getUserByEmail = ({ email }) => {
    return connection.query(
        `SELECT * FROM users WHERE email = $1;`,
        [email]
    );
}


export { insertUser, getUserByEmail }