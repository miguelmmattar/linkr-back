import express from "express";
import * as postsController from "../controllers/Posts.controller.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js";
import { getHashtags } from "../middlewares/Hashtags.middleware.js";

const router = express.Router();

router.use(authorization);

router.post("/posts", schemaValidation, getHashtags, HTMLSanitizer, postsController.postUrl);
router.get("/posts",HTMLSanitizer, postsController.getPosts);
router.get("/user/:id", HTMLSanitizer, postsController.getPosts);
router.get("/hashtag/:hashtag",HTMLSanitizer, postsController.getPosts);
router.delete(
  "/posts/:id",
  HTMLSanitizer,
  schemaValidation,
  postsController.deletePost
);
router.put(
  "/posts",
  HTMLSanitizer,
  schemaValidation,
  getHashtags,
  postsController.updatePost
);
router.get("/numbers", HTMLSanitizer, postsController.getPostNumbers);

export default router;
