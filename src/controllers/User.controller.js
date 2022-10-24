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

export { search }