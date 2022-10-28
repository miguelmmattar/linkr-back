import express from "express";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js";
import { repostContent } from "../controllers/Reposts.controller.js";

const router = express.Router();

router.use(authorization);

router.post("/reposts", HTMLSanitizer, repostContent);

export default router;
