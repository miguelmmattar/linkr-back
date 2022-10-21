import express from "express";
import { hashtagsTrending } from "../controllers/Hashtags.controller.js";
import { postContent } from "../controllers/PostSimulator.controller.js";
import { getHashtags } from "../middlewares/Hashtags.middleware.js";

const router = express.Router();

//router.get("/trending", getHashtags, postContent);
router.get("/trending", hashtagsTrending);

export default router;
