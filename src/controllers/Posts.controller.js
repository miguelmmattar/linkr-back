import connection from "../database/Postgres.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import * as postsRepository from "../repositories/Posts.repository.js";
import urlMetadata from "url-metadata";
import {
  insertPostHashtag,
} from "../repositories/Hashtags.repository.js";

const postUrl = async (req, res) => {
  const { url, description } = req.body;
  const { userId } = res.locals;
  const hashtagsArray = res.locals.hashtags;
  const TABLE_HASHTAG = "hashtags";

  try {
    const id = await postsRepository.postUrl({url, description, userId});
    if (hashtagsArray.length > 0) {
      for (let i = 0; i < hashtagsArray.length; i++) {
        let hashtagId = await connection.query(
          `SELECT id FROM ${TABLE_HASHTAG} WHERE hashtag = $1;`,
          [hashtagsArray[i]]
        );
        hashtagId = hashtagId.rows[0].id;
        await insertPostHashtag({ id, hashtagId });
      }
    }
    res.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
  }
};

const getPosts = async (req, res) => {
  try {
    const result = await postsRepository.getPosts();

    const posts = await getMetadatas(result.rows);

    res.status(200).send(posts);
  } catch (error) {
    return res.status(500).send(error.message);
  }
};

const getMetadatas = async (result) => {
  try {
    const posts = await Promise.all(
      result.map(async (post) => {
        const metadata = await urlMetadata(post.link);
        let image = metadata.image;

        if(!image.includes('http')) {
          image = metadata.url + image;
        }

        const info = {
          url: metadata.url,
          title: metadata.title,
          description: metadata.description,
          image: image,
        };

        return { ...post, link: info };
      })
    );

    return posts;
  } catch (error) {
    return console.log(error.message);
  }
};

const deletePost = async (request, response) => {
  try {
    const { userId } = response.locals;
    const { id } = response.locals.safeData;
    const postQuery = await postsRepository.getPostById(id);
    const post = postQuery.rows[0];

    if (post.userId !== userId) {
      response.sendStatus(STATUS_CODE.UNAUTHORIZED);
      return;
    }

    const deleteQuery = postsRepository.deletePost(id);

    if (deleteQuery.rowCount === 0) {
      response.status(STATUS_CODE.SERVER_ERROR).send("failed to delete post");
      return;
    }

    response.sendStatus(STATUS_CODE.NO_CONTENT);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
};

export { 
  postUrl, 
  getPosts, 
  deletePost 
};
