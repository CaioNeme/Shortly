import { db } from "../database/database.connection.js";
import { nanoid } from "nanoid";

export async function urlsShorten(req, res) {
  const { authorization } = req.headers;
  const { url } = req.body;
  const token = authorization?.replace("Bearer ", "");
  const shorten = nanoid(8);

  if (!token) return res.sendStatus(401);

  try {
    const user = await db.query(`SELECT * FROM sessions WHERE token = $1`, [
      token,
    ]);

    if (user.rowCount != 1) {
      return res.status(401).send({ message: "Falha na autorização" });
    }
    await db.query(
      `INSERT INTO urls (url, short_url, user_id) VALUES ($1, $2, $3);`,
      [url, shorten, user.rows[0].user_id]
    );

    const urlObject = await db.query(`SELECT * FROM urls WHERE short_url=$1;`, [
      shorten,
    ]);

    res.status(200).send({
      id: urlObject.rows[0].id,
      shortUrl: shorten,
    });
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getUrlsById(req, res) {
  const { id } = req.params;

  if (isNaN(id) || id <= 0) {
    return res.status(404).send({ message: "URL não encontrada" });
  }

  try {
    const url = await db.query(
      `SELECT id, short_url, url FROM urls WHERE id = $1;`,
      [id]
    );
    console.log(url);
    res.status(200).send(url.rows[0]);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function urlsOpenShortUrl(req, res) {
  try {
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function deleteUrlsById(req, res) {
  try {
  } catch (err) {
    res.status(500).send(err.message);
  }
}
