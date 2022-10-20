import jwt from "jsonwebtoken";
import dotenv from "dotenv";
import { STATUS_CODE } from "../enums/statusCode.js";
import * as authRepository from "../repositories/Auth.repository.js";

dotenv.config()

const authorization = async (req, res, next) => {
    if (!res.locals.headers) return res.sendStatus(STATUS_CODE.BAD_REQUEST);
    if (!res.locals.headers.authorization) return res.sendStatus(STATUS_CODE.BAD_REQUEST);
    const token = (res.locals.headers.authorization).replace("Bearer ", "");
    let userId;
    let existentSession

    try {
        userId = jwt.verify(token, process.env.TOKEN_SECRET).userId;
    } catch (error) {
        return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }

    try {
        existentSession = await authRepository.getSessionByUserId({ userId })
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
    
    if (existentSession.rowCount === 0) return res.sendStatus(STATUS_CODE.BAD_REQUEST);

    if (token !== existentSession.rows[0].token) {
        return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }

    res.locals.userId = userId

    next();
}

export { authorization }