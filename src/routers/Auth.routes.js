import express from "express";
import * as authController from "../controllers/Auth.controller.js";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js"

const router = express.Router();

router.use(HTMLSanitizer);

router.post("/sign-up", schemaValidation, authController.signUp);
router.post("/sign-in", schemaValidation, authController.signIn);
router.delete("/logout", authorization, authController.logout);

export default router;