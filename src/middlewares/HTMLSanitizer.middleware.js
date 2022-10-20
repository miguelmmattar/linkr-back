import { stripHtml } from "string-strip-html";
import { STATUS_CODE } from "../enums/statusCode.js";

const requestObjectsToSanitize = ["headers", "body", "query", "params"];
const propertiesToSanitize = [
  "postId",
  "userId",
  "description",
  "email",
  "name",
  "email",
  "password",
  "userPicture",
  "authorization"
];

function HTMLSanitizer(request, response, next) {
  try {
    for (let j = 0, len0 = requestObjectsToSanitize.length; j < len0; j++) {
      const objectKey = requestObjectsToSanitize[j];
      const object = request?.[objectKey];

      if (!object) {
        continue;
      }

      for (let i = 0, len1 = propertiesToSanitize.length; i < len1; i++) {
        const propertyName = propertiesToSanitize[i];
        const propertyValue = String(object?.[propertyName]);

        if (propertyValue === "undefined" || propertyValue === undefined) {
          continue;
        }

        response.locals[objectKey] = { ...response.locals[objectKey] };
        response.locals[objectKey][propertyName] =
          stripHtml(propertyValue).result;
      }
    }

    next();
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { HTMLSanitizer };
