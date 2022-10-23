import express from "express";
import { hashtagsTrending } from "../controllers/Hashtags.controller.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";

const router = express.Router();
router.use(HTMLSanitizer);

router.get("/trending", hashtagsTrending);

export default router;