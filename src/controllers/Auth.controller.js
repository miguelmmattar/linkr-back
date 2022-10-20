import joi from "joi";
import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";
import connection from "../database/Postgres.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import * as authRepository from "../repositories/Auth.repository.js";

const newUserSchema = joi.object({
    name: joi.string().required().trim(),
    email: joi.string().email().trim().required(),
    password: joi.string().trim().required(),
    confirmPassword: joi.string().trim().required()
});

const signup = async (req, res) => {
    if(!res.locals.body) {
        return res.sendStatus(STATUS_CODE.BAD_REQUEST)
    }
    const { name, email, password, confirmPassword } = res.locals.body;
    const hashPassword = bcrypt.hashSync(password, 10);
    
    if (password !== confirmPassword) {
        return res.sendStatus(STATUS_CODE.UNPROCESSABLE_ENTITY);
    }

    // colocar no middleware de schemas 
    const validation = newUserSchema.validate({ name, email, password, confirmPassword }, { abortEarly: false });

    if (validation.error) {
        return res.status(STATUS_CODE.UNPROCESSABLE_ENTITY).send(validation.error.message);
    }
    // colocar no unique do middleware de schemas
    let emailAlreadyRegistered;

    try {
        emailAlreadyRegistered = await connection.query(`SELECT * FROM users WHERE email = $1;`, [email]);
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    if (emailAlreadyRegistered.rowCount > 0) {
        return res.sendStatus(STATUS_CODE.CONFLICT);
    }
    //===========================================

    try {
        await authRepository.insertUser({ name, email, hashPassword });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    return res.sendStatus(STATUS_CODE.CREATED);
}

export { signup }; 