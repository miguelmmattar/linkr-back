import express from "express";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js"
import * as userController from "../controllers/User.controller.js"

const router = express.Router();


router.get("/search/:searchString", HTMLSanitizer, authorization, userController.search);

export default router;