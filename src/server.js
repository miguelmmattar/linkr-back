import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import likeRouter from "./routers/Likes.routes.js";
import authRouter from "./routers/Auth.routes.js";
import postsRouter from "./routers/Posts.routes.js";
import trendingRouter from "./routers/Trending.routes.js";
import userRouter from "./routers/User.routes.js";
import repostsRouter from "./routers/Reposts.routes.js";
import commentsRouter from "./routers/Comments.routes.js";

dotenv.config();

const server = express();

server
  .use(cors())
  .use(express.json())
  .use(likeRouter)
  .use(authRouter)
  .use(postsRouter)
  .use(repostsRouter)
  .use(trendingRouter)
  .use(userRouter)
  .use(commentsRouter);

server.get("/", (req, res) => {
  return res.sendStatus(200);
});

server.listen(process.env.PORT, () =>
  console.log("Listening on port " + process.env.PORT)
);
