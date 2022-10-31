import connection from "../database/Postgres.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import * as postsRepository from "../repositories/Posts.repository.js";
import * as likesRepository from "../repositories/Likes.repository.js";
import urlMetadata from "url-metadata";
import * as hashtagRepository from "../repositories/Hashtags.repository.js";
import * as usersRepository from "../repositories/Users.repository.js";
import { getPostCommentsById } from "../repositories/Comments.repository.js";

const postUrl = async (req, res) => {
  const { url, description } = req.body;
  const { userId } = res.locals;
  const hashtagsArray = res.locals.hashtags;
  const TABLE_HASHTAG = "hashtags";

  try {
    const id = await postsRepository.postUrl({ url, description, userId });

    if (description === undefined) {
      res.sendStatus(STATUS_CODE.CREATED);
      return;
    }

    if (hashtagsArray.length > 0) {
      for (let i = 0; i < hashtagsArray.length; i++) {
        let hashtagId = await connection.query(
          `SELECT id FROM ${TABLE_HASHTAG} WHERE hashtag = $1;`,
          [hashtagsArray[i]]
        );
        hashtagId = hashtagId.rows[0].id;
        await hashtagRepository.insertPostHashtag({ id, hashtagId });
      }
    }
    res.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
  }
};

const getPosts = async (req, res) => {
  const { userId } = res.locals;
  const offset = req.query.offset;

  try {
    let filter;
    let type;
    let likesHashtable = {};
    let user;
    const resultLikes = await likesRepository.getLikes();

    if (req.params.id) {
      filter = req.params.id;
      type = "user";
    }

    if (req.params.hashtag) {
      filter = req.params.hashtag;
      type = "hashtag";
    }

    let resultPosts = await postsRepository.getPosts(
      filter,
      type,
      userId,
      offset
    );

    let resultReposts = await postsRepository.getReposts(
      filter,
      type,
      userId,
      offset
    );

    resultPosts = resultPosts.rows.map((value) => {
      return { ...value, isRepost: false, count: 0 };
    });

    resultReposts = resultReposts.rows.map((value) => {
      return { ...value, isRepost: true, count: 0 };
    });

    if (type !== "hashtag" && resultReposts.length > 0) {
      for (let i = 0; i < resultReposts.length; i++) {
        resultPosts.push(resultReposts[i]);
      }
    }

    resultPosts.sort((x, y) => {
      return y.createdAt - x.createdAt;
    });

    resultPosts = resultPosts.slice(0, 10);

    let resultCountReposts = await postsRepository.countReposts();
    resultCountReposts = resultCountReposts.rows;

    for (let i = 0; i < resultCountReposts.length; i++) {
      for (let j = 0; j < resultPosts.length; j++) {
        if (resultCountReposts[i].postId === resultPosts[j].id) {
          resultPosts[j] = {
            ...resultPosts[j],
            count: Number(resultCountReposts[i].count),
          };
        }
      }
    }

    resultLikes.rows.forEach((like) => {
      likesHashtable[like.postId] = like.likedBy;
    });

    const result = resultPosts.map((post) => {
      const postId = post.id;
      return { ...post, likedBy: likesHashtable[postId] };
    });

    let posts = await getMetadatas(result);
    posts = await getComments(posts);

    if (type === "user") {
      user = await usersRepository.getUserDataByIds(filter, userId);
      user = user.rows[0];
      return res.status(200).send({ user, posts });
    }

    res.status(200).send(posts);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
};

const getMetadatas = async (result) => {
  try {
    let info;
    const posts = await Promise.all(
      result.map(async (post) => {
        try {
          const metadata = await urlMetadata(post.link);

          let image = metadata.image;

          if (!image.includes("http")) {
            image =
              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019";
          }

          info = {
            url: metadata.url,
            title: metadata.title,
            description: metadata.description,
            image: image,
          };
        } catch (error) {
          info = {
            url: "",
            title: "Broken Link",
            description: "We colud not process this link adress",
            image:
              "https://www.med.unc.edu/webguide/wp-content/uploads/sites/419/2019/10/broken_link_AdobeStock_121742806.jpg",
          };
        }

        return { ...post, link: info };
      })
    );

    return posts;
  } catch (error) {
    return console.log(error.message);
  }
};

async function getComments(posts) {
  try {
    const postsWithComments = await Promise.all(
      posts.map(async (post) => {
        const comments = await getPostCommentsById(post.id);

        return { ...post, comments: comments.rows };
      })
    );

    return postsWithComments;
  } catch (error) {
    return console.log(error.message);
  }
}

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

const updatePost = async (request, response) => {
  const { description, id } = response.locals.safeData;
  const { userId } = response.locals;
  const hashtagsArray = response.locals.hashtags;
  const TABLE_HASHTAG = "hashtags";

  try {
    const updateQuery = await postsRepository.updatePost({
      description,
      userId,
      id,
    });

    if (updateQuery.rowCount === 0) {
      response.status(STATUS_CODE.SERVER_ERROR).send("failed to update post");
      return;
    }

    if (hashtagsArray.length > 0) {
      for (let i = 0; i < hashtagsArray.length; i++) {
        let hashtagId = await connection.query(
          `SELECT id FROM ${TABLE_HASHTAG} WHERE hashtag = $1;`,
          [hashtagsArray[i]]
        );
        hashtagId = hashtagId.rows[0].id;
        await hashtagRepository.insertPostHashtag({ id, hashtagId });
      }
    }

    response.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
};

const getPostNumbers = async (req, res) => {
  const userId = res.locals.userId;
  let posts;
  let reposts;
  let total;
  let type;
  let info;
  let query = res.locals.query;
  if(query) {
    if(query.user) {
      type = "user";
      info = query.user;
    }
    if(query.hashtag) {
      type = "hashtag";
      info = query.hashtag;
    }
  }

  posts = await postsRepository.getAllPosts(info, type, userId );
  // reposts = await postsRepository.getAllReposts(info, type, userId );
  total = Number(posts.rows[0].count);

  return res.status(STATUS_CODE.OK).send(total.toString());
};

export { postUrl, getPosts, deletePost, updatePost, getPostNumbers };
