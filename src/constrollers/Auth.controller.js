import connection from "../database/Postgres.js";

const signup = (req, res) => {
    const query = connection.query(`SELECT * FROM users;`)

    return res.status(200).send(query);
}

export { signup }