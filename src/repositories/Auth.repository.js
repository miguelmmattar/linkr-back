import connection from "../database/Postgres.js";

const insertUser = ({ name, email, hashPassword }) => {
    return connection.query(
        `INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id;`,
        [name, email, hashPassword]
    );
};

const insertUserPicture = ({ userId, userPicture }) => {
    return connection.query(
        `INSERT INTO "userPicture" ("userId", url ) VALUES ($1, $2);`,
        [userId, userPicture]
    );
};

const getUserByEmail = ({ email }) => {
    return connection.query(
        `SELECT users.id, users.name, users.password, users.email, "userPicture".url as "userPicture"
        FROM users 
        JOIN "userPicture"
        ON users.id = "userPicture"."userId" 
        WHERE users.email = $1;`,
        [email]
    );
};

const getSessionByUserId = ({ userId }) => {
    return connection.query(
        `SELECT * FROM sessions WHERE "userId" = $1 AND "closedAt" IS NULL;`,
        [userId]
    );
};

const updateSession = ({ userId, token }) => {
    return connection.query(
        `UPDATE sessions SET token = $1 WHERE "userId" = $2 AND "closedAt" IS NULL;`,
        [token, userId]
    );
}
const insertSession = ({ userId, token }) => {
    return connection.query(
        `INSERT INTO sessions ("userId", token) VALUES ($1, $2);`,
        [userId, token]
    );
};

const upsertSession = async ({ userId, token }) => {
    let existentSession;
    try {
        existentSession = await getSessionByUserId({ userId });
    } catch (error) {
        console.log(error);
    }

    if (existentSession.rowCount > 0) {
        return updateSession({ userId, token });
    } else {
        return insertSession({ userId, token });
    }
};

const closeSession = ({ userId }) => {
    return connection.query(
        `UPDATE sessions SET "closedAt" = now() WHERE "userId" = $1 AND "closedAt" IS NULL;`,
        [userId]
    );
};


export {
    insertUser,
    insertUserPicture,
    getUserByEmail,
    upsertSession,
    updateSession,
    getSessionByUserId,
    insertSession,
    closeSession
}