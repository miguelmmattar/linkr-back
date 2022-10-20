import { STATUS_CODE } from "../enums/statusCode.js";
import * as postsRepository from "../repositories/Posts.repository.js";
import urlMetadata from "url-metadata";

const postUrl = async (req, res) => {
  const { url, description } = req.body;
  const { userId } = res.locals;

  try {
    await postsRepository.postUrl(url, description, userId);

    res.sendStatus(201);
  } catch (error) {
    return res.status(500).send(error.message);
  }
};

const getPosts = async (req, res) => {
  try {
    const result = [
      {
        link: "https://www.globo.com/",
        description: "Description",
        user: {
          name: "Neytiri",
          picture:
            "https://conteudo.imguol.com.br/c/entretenimento/80/2017/04/25/a-atriz-zoe-saldana-como-neytiri-em-avatar-1493136439818_v2_4x3.jpg",
        },
        createdAt: "10/04/2021",
      },
      {
        link: "https://www.globo.com/",
        description: "Description",
        user: {
          name: "Aang",
          picture:
            "https://upload.wikimedia.org/wikipedia/pt/8/86/Avatar_Aang.png",
        },
        createdAt: "25/11/2020",
      },
    ];

    const posts = await getMetadatas(result);

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

        const info = {
          url: metadata.url,
          title: metadata.title,
          description: metadata.description,
          image: metadata.image,
        };

        return { ...post, link: info };
      })
    );

    return posts;
  } catch (error) {
    return console.log(error.message);
  }
};

export { postUrl, getPosts };
