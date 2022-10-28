import { STATUS_CODE } from "./statusCode.js";

const schemas_configuration = Object.freeze([
  {
    path: "A rota que voce quer configurar",
    method: "verbo http da rota",
    schema_name:
      "nome da propriedade que acessa o schema que vc criou em schemas.js",
    request_data: "por onde virao os dados body | params | headers | query",
    uniques: [
      {
        property:
          "propriedade que vc quer que exista(ou nao). A propriedade da tabela e do corpo da requisicao devem ter o mesmo nome",
        table: "tabela onde se encontra a propriedade",
        must_not_exist: true, //A propriedade nao deve existir: true. A propriedade deve existir: false.
        must_not_exist_status_code: STATUS_CODE.CONFLICT, //erro que deve ser retornado ao usuário caso, por exemplo, a propriedade já existir
        error_details: true, //caso true, retorna uma mensagem genérica 'error at "email"'
      },
    ],
  },
  {
    path: "/signup",
    method: "POST",
    schema_name: "user_schema",
    request_data: "body",
    uniques: [
      {
        property: "email",
        table: "users",
        must_not_exist: true,
        must_not_exist_status_code: STATUS_CODE.CONFLICT,
        error_details: true,
      },
    ],
  },
  {
    path: "/signin",
    method: "POST",
    schema_name: "signin_schema",
    request_data: "body",
    uniques: [
      {
        property: "email",
        table: "users",
        must_not_exist: false,
        must_not_exist_status_code: STATUS_CODE.UNAUTHORIZED,
        error_details: false,
      },
    ],
  },
  {
    path: "/posts/likes/:id",
    method: "POST",
    schema_name: "idSchema",
    request_data: "params",
    uniques: [
      {
        property: "id",
        table: "posts",
        must_not_exist: false,
        must_not_exist_status_code: STATUS_CODE.NOT_FOUND,
        error_details: false,
      },
    ],
  },
  {
    path: "/posts/:id",
    method: "DELETE",
    schema_name: "idSchema",
    request_data: "params",
    uniques: [
      {
        property: "id",
        table: "posts",
        must_not_exist: false,
        must_not_exist_status_code: STATUS_CODE.NOT_FOUND,
        error_details: false,
      },
    ],
  },
  {
    path: "/posts",
    method: "PUT",
    schema_name: "updatePostSchema",
    request_data: "body",
    uniques: [
      {
        property: "id",
        table: "posts",
        must_not_exist: false,
        must_not_exist_status_code: STATUS_CODE.NOT_FOUND,
        error_details: false,
      },
    ],
  },
  {
    path: "/posts",
    method: "POST",
    schema_name: "postSchema",
    request_data: "body",
  },
  {
    path: "/sign-in",
    method: "POST",
    schema_name: "signInSchema",
    request_data: "body",
  },
  {
    path: "/sign-up",
    method: "POST",
    schema_name: "newUserSchema",
    request_data: "body",
    uniques: [
      {
        property: "email",
        table: "users",
        must_not_exist: true,
        must_not_exist_status_code: STATUS_CODE.CONFLICT,
        error_details: true,
      },
    ],
  },
  {
    path: "/follow",
    method: "POST",
    schema_name: "idSchema",
    request_data: "body",
  },
  {
    path: "/unfollow",
    method: "POST",
    schema_name: "idSchema",
    request_data: "body",
  },
  {
    path: "/comments",
    method: "POST",
    schema_name: "commentSchema",
    request_data: "body",
    uniques: [
      {
        property: "id",
        table: "posts",
        must_not_exist: false,
        must_not_exist_status_code: STATUS_CODE.NOT_FOUND,
        error_details: false,
      },
    ],
  },
]);

export { schemas_configuration };
