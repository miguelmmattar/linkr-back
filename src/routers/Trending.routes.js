import express from "express";
import { postContent } from "../controllers/PostSimulator.controller.js";
import { getHashtags } from "../middlewares/Hashtags.middleware.js";

const router = express.Router();

router.get("/trending", getHashtags, postContent);

export default router;
