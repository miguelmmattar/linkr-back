import express from "express";
import cors from "cors";
import dotenv from "dotenv";

import authRouter from "./routers/Auth.routes.js";
import trendingRouter from "./routers/Trending.routes.js";
dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());

server.use(authRouter);
server.use(trendingRouter);

server.get("/", (req, res) => {
  return res.sendStatus(200);
});

server.listen(process.env.PORT, () =>
  console.log("Listening on port " + process.env.PORT)
);
