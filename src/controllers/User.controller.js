import * as usersRepository from "../repositories/Users.repository.js";
import { STATUS_CODE } from "../enums/statusCode.js";

const search = async (req, res) => {
    const { searchString } = res.locals.params;    
    let users;

    try {
        users = await usersRepository.getUsersByNamePart({ searchString })
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    res.status(STATUS_CODE.OK).send(users.rows);
}

const getFollows = async (req, res) => {
    const { userId } = res.locals;

    try {
        const follows = await usersRepository.getUserFollows(userId);
        const followers = await usersRepository.getUserFollowers(userId);

        const result = {
            following: follows.rows,
            followers: followers.rows
        };

        res.status(STATUS_CODE.OK).send(result); 
    } catch (error) {
        console.log(error);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }   
}

export { search, getFollows }