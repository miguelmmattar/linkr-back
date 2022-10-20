import express from "express";
import * as authController from "../controllers/Auth.controller.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";

const router = express.Router();

router.use(HTMLSanitizer);

router.post("/sign-up", authController.signUp);
router.post("/sign-in", authController.signIn);
// router.delete("/logout", authController.logout);

export default router;