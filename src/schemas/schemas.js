import Joi from "joi";
import { joiPasswordExtendCore } from "joi-password";

const JoiPassword = Joi.extend(joiPasswordExtendCore);

const schemas = {
  newUserSchema: Joi.object({
    name: Joi.string().min(1).required(),
    email: Joi.string().min(1).email().required(),
    password: JoiPassword.string()
      .min(8)
      .minOfSpecialCharacters(1)
      .minOfLowercase(1)
      .minOfUppercase(1)
      .minOfNumeric(1)
      .noWhiteSpaces()
      .required(),
    userPicture: Joi.string().uri().required()
  }).unknown(false),

  signInSchema: Joi.object({
    email: Joi.string().min(1).email().required(),
    password: JoiPassword.string()
      .noWhiteSpaces()
      .required(),
  }).unknown(false),

  idSchema: Joi.object({
    id: Joi.number().integer().required(),
  }),

  urlSchema: Joi.object({
    url: Joi.string().uri().required(),
  }),

  postSchema: Joi.object({
    url: Joi.string().uri().required(),
    description: Joi.string()
  }),
};

export { schemas };