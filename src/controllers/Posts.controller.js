import connection from "../database/Postgres.js";
import * as postsRepository from "../repositories/Posts.repository.js"

const postUrl = async (req, res) => {
    const { url, description } = req.body;
    const { id } = res.locals.user;

    try {
        await postsRepository.postUrl(url, description, id);

        res.sendStatus(201);
    } catch(error) {
        return res.status(500).send(error.message);
    }
} 

const getUrl = async (req, res) => {
    try {
        const result = await postsRepository.getPosts();

        res.status(200).send(result);
    } catch(error) {
        return res.status(500).send(error.message);
    }
}