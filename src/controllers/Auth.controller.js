import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";
import { STATUS_CODE } from "../enums/statusCode.js";
import * as authRepository from "../repositories/Auth.repository.js";

dotenv.config()

const signUp = async (req, res) => {
    if (!res.locals.body) return res.sendStatus(STATUS_CODE.BAD_REQUEST);
    const { name, password, userPicture } = res.locals.body;
    let { email } = res.locals.body;
    email = email.toLowerCase();
    const hashPassword = bcrypt.hashSync(password, 10);
    let user;
    let userId;

    try {
        user = await authRepository.insertUser({ name, email, hashPassword });
        userId = user.rows[0].id;

    } catch (error) {
        if (error.code === "23505") {
            console.log("error", error.code, "handled");
            return res.sendStatus(STATUS_CODE.CONFLICT);
        }
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    try {
        await authRepository.insertUserPicture({ userPicture, userId });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    return res.sendStatus(STATUS_CODE.CREATED);
};

const signIn = async (req, res) => {
    if (!res.locals.body) return res.sendStatus(STATUS_CODE.BAD_REQUEST)
    const { password } = res.locals.body;
    let { email } = res.locals.body;
    email = email.toLowerCase()

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
    const userId = Number(existentUser.rows[0].id);
    const { name, userPicture } = existentUser.rows[0];
    const token = jwt.sign({ userId: userId }, process.env.TOKEN_SECRET);

    try {
        await authRepository.upsertSession({ userId, token });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    return res.status(STATUS_CODE.OK).send({ token, name, userPicture, userId});
};

const logout = async (req, res) => {
    const userId = res.locals.userId;

    try {
        await authRepository.closeSession({ userId });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    return res.sendStatus(204);
};

export { signUp, signIn, logout };
