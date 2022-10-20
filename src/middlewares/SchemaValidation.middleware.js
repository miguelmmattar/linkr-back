import  database  from "../database/Postgres.js";
import { schemas_configuration } from "../enums/SchemaConfiguration.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import { schemas } from "../schemas/schemas.js";

async function schemaValidation(request, response, next) {
  try {
    const route = request.route;
    const path = route.path;
    const method = request.method;
    const schema_config = schemas_configuration.find((schema) => {
      if (schema.path === path && schema.method === method) {
        return true;
      }
    });
    const data = response.locals[schema_config.request_data];
    const FIRST_ERROR = 0;
    const { value, error } = schemas[schema_config.schema_name].validate(data);

    if (error !== undefined) {
      console.log("schema error");
      response
        .status(STATUS_CODE.UNPROCESSABLE_ENTITY)
        .send(error.details[FIRST_ERROR].message);
      return;
    }

    if (schema_config.uniques !== undefined) {
      for (let i = 0, len = schema_config.uniques.length; i < len; i++) {
        const config = schema_config.uniques[i];
        const query = await database.query(
          `SELECT "${config.property}" FROM ${config.table} WHERE "${config.property}"=$1`,
          [value[config.property]]
        );
        const NOT_EXIST = query.rowCount === 0 ? true : false;

        if (config.must_not_exist) {
          if (!NOT_EXIST) {
            if (config.error_details) {
              response
                .status(config.must_not_exist_status_code)
                .send(`error at ${config.property}`);
              return;
            }

            response.sendStatus(config.must_not_exist_status_code);
            return;
          }
        } else {
          if (NOT_EXIST) {
            if (config.error_details) {
              response
                .status(config.must_not_exist_status_code)
                .send(`error at ${config.property}`);
              return;
            }

            response.sendStatus(config.must_not_exist_status_code);
            return;
          }
        }
      }
    }

    response.locals.safeData = value;
    next();
  } catch (error) {
    console.log(error);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { schemaValidation };
