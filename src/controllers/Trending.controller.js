import connection from "../database/Postgres.js";

async function getHashtags(req, res) {
  try {
    let descriptions = await connection.query(
      `SELECT description, "userId" FROM posts`
    );
    descriptions = descriptions.rows;

    const hashtagsArray = descriptions.map((str) => str.description.split(" "));
    const userIdsArray = descriptions.map((id) => id.userId);
    const teste = [];
    for (let i = 0; i < descriptions.length; i++) {
      let element = { hashtag: hashtagsArray[i], id: userIdsArray[i] };
      teste.push(element);
    }
    // .map((obj) => obj.description.includes("#"))
    // .filter((str) => (str.descriptions).includes("#"));

    // .filter((value) => value.description.includes("#"))

    // descriptions = descriptions.map((str) =>
    //   str.split(" ").filter((str) => str.includes("#"))
    // );

    // const hashtags = [];
    // for (let i = 0; i < descriptions.length; i++) {
    //   for (let j = 0; j < descriptions[i].length; j++) {
    //     let strHashtag = descriptions[i][j];
    //     if (
    //       strHashtag === "#" ||
    //       strHashtag[strHashtag.length - 1] === "#" ||
    //       strHashtag[0] !== "#"
    //     ) {
    //       continue;
    //     }
    //     hashtags.push(descriptions[i][j]);
    //   }
    // }

    res.send(teste);
  } catch (error) {
    console.log(error.message);
    res.sendStatus(500);
  }
}

export { getHashtags };
