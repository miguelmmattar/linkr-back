import express from "express";
import * as postsController from "../repositories/Posts.repository.js"

const router = express.Router();

router.post("/posts", postsController.postUrl);
router.get("/posts", postsController.getPosts);

export default router;