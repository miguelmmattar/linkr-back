import express from "express";
import * as authController from "../constrollers/Auth.controller.js";

const router = express.Router();

router.post("/signup", authController.signup);
// router.post("/signin", authController.login);
// router.delete("/logout", authController.logout);

export default router;