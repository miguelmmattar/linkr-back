import express from "express";
import { getHashtags } from "../controllers/Trending.controller.js";

const router = express.Router();

router.get("/trending", getHashtags);

export default router;
