import express from "express";
import * as authController from "../controllers/Auth.controller.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";

const router = express.Router();

router.post("/sign-up", HTMLSanitizer, authController.signup);
// router.post("/signin", authController.login);
// router.delete("/logout", authController.logout);

export default router;