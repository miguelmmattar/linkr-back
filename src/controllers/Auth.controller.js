import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";
import connection from "../database/Postgres.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import * as authRepository from "../repositories/Auth.repository.js";


const signUp = async (req, res) => {
    if (!res.locals.body) return res.sendStatus(STATUS_CODE.BAD_REQUEST)
    const { name, email, password, confirmPassword } = res.locals.body;

    if (password !== confirmPassword) {
        return res.sendStatus(STATUS_CODE.UNPROCESSABLE_ENTITY);
    }

    const hashPassword = bcrypt.hashSync(password, 10);

    try {
        await authRepository.insertUser({ name, email, hashPassword });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    return res.sendStatus(STATUS_CODE.CREATED);
};


const signIn = async (req, res) => {
    if (!res.locals.body) return res.sendStatus(STATUS_CODE.BAD_REQUEST)
    const { email, password } = res.locals.body;
    let existentUser;

    try {
        existentUser = await authRepository.getUserByEmail({ email });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    if (existentUser.rowCount === 0) {
        return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }

    if (!await bcrypt.compare(password, existentUser.rows[0].password)) {
        return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }

    return res.sendStatus(STATUS_CODE.OK);
};

export { signUp, signIn };