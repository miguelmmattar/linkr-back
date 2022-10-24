import * as usersRepository from "../repositories/Users.repository.js";

const search = async (req, res) => {
    const { searchString } = res.locals.params;    
    
   const users = await usersRepository.getUsersByNamePart({ searchString })
    


    res.status(200).send(users.rows);
}

export { search }