import connection from "../database/Postgres.js";

async function getHashtags(req, res) {
  try {
    
  } catch (error) {
    console.log(error.message);
    res.sendStatus(500);
  }
}

export { getHashtags };
