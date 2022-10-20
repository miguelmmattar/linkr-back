import express from "express";
import * as postsController from "../controllers/Posts.controller.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js";

const router = express.Router();

router.use(HTMLSanitizer);
router.use(authorization);

router.post("/posts", schemaValidation, postsController.postUrl);
router.get("/posts", postsController.getPosts);
router.delete("/posts", schemaValidation, postsController.deletePosts);

export default router;
