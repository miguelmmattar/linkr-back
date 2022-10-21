import express from "express";
import { hashtagsTrending } from "../controllers/Hashtags.controller.js";

const router = express.Router();

router.get("/trending", hashtagsTrending);

export default router;
