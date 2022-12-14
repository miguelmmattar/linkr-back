import express from "express";
import { HTMLSanitizer } from "../middlewares/HTMLSanitizer.middleware.js";
import { schemaValidation } from "../middlewares/SchemaValidation.middleware.js";
import { authorization } from "../middlewares/Authorization.middleware.js"
import * as userController from "../controllers/User.controller.js"

const router = express.Router();


router.get("/search/:searchString", HTMLSanitizer, authorization, userController.search);
router.get("/follows", HTMLSanitizer, authorization, userController.getFollows);
router.post("/follow", schemaValidation, HTMLSanitizer, authorization, userController.newFollow);
router.post("/unfollow", schemaValidation, HTMLSanitizer, authorization, userController.unfollow);



export default router;