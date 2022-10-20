import express from "express";
import * as postsController from "../controllers/Posts.controller.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js"

const router = express.Router();

router.use(HTMLSanitizer);

router.post("/posts", schemaValidation, postsController.postUrl);
router.get("/posts", postsController.getPosts);

export default router;