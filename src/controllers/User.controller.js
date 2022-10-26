import * as usersRepository from "../repositories/Users.repository.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import connection from "../database/Postgres.js";

const search = async (req, res) => {
    const { searchString } = res.locals.params;    
    const { userId } = res.locals;
    let users;

    try {
        users = await usersRepository.getUsersByNamePart({ searchString, userId })
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
    return res.status(STATUS_CODE.OK).send(users.rows);
};

const newFollow = async (req, res) => {
    if (!res.locals.body) return res.sendStatus(STATUS_CODE.BAD_REQUEST)
    const { userId, body } = res.locals;
    const { id } = body;
    let alreadyFollow;
    try {
       alreadyFollow = await usersRepository.getFollowByIds({ userId, id });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
    
    if(alreadyFollow.rowCount > 0) {
        return res.sendStatus(STATUS_CODE.CONFLICT);
    }

    try {
        await usersRepository.insertNewFollower({ userId, id });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
    
    return res.sendStatus(200);
};

const unfollow = async (req, res) => {
    if (!res.locals.body) return res.sendStatus(STATUS_CODE.BAD_REQUEST)
    const { userId, body } = res.locals;
    const { id } = body;
    let alreadyFollow;

    try {
        alreadyFollow = await usersRepository.getFollowByIds({ userId, id });
     } catch (error) {
         console.log(error);
         return res.sendStatus(STATUS_CODE.SERVER_ERROR);
     }
     
     if(alreadyFollow.rowCount === 0) {
         return res.sendStatus(STATUS_CODE.NOT_FOUND);
     }

    try {
        await usersRepository.deleteFollow({ userId, id });
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    return res.sendStatus(STATUS_CODE.NO_CONTENT);
};

export { search, newFollow, unfollow }