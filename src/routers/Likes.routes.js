import express from "express";
import { postLike } from "../controllers/Likes.controller.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js";

const router = express.Router();

router.use(HTMLSanitizer);
router.post("/posts/likes", schemaValidation, authorization, postLike);

export default router;
