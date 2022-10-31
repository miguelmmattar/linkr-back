import express from "express";
import { postComment } from "../controllers/Comments.controller.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js";

const router = express.Router();

router.post(
  "/comments",
  HTMLSanitizer,
  schemaValidation,
  authorization,
  postComment
);

export default router;
