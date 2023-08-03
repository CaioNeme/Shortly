import { db } from "../database/database.connection.js";
import { nanoid } from "nanoid";

export async function urlsShorten(req, res) {
  const { authorization } = req.headers;
  const { url } = req.body;
  const token = authorization?.replace("Bearer ", "");
  const shorten = nanoid(8);

  if (!token) return res.sendStatus(401);

  try {
    const session = await db.query(`SELECT * FROM sessions WHERE token = $1`, [
      token,
    ]);

    if (session.rowCount != 1) {
      return res.status(401).send({ message: "Falha na autorização" });
    }
    await db.query(
      `INSERT INTO urls (url, short_url, user_id) VALUES ($1, $2, $3);`,
      [url, shorten, session.rows[0].user_id]
    );

    const urlObject = await db.query(`SELECT * FROM urls WHERE short_url=$1;`, [
      shorten,
    ]);

    res.status(201).send({
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
      `SELECT id, short_url AS "shortUrl", url FROM urls WHERE id = $1;`,
      [id]
    );
    if (url.rowCount != 1) {
      return res.status(404).send({ message: "URL não encontrada" });
    }
    res.status(200).send(url.rows[0]);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function urlsOpenShortUrl(req, res) {
  const { shortUrl } = req.params;

  try {
    const url = await db.query(`SELECT * FROM urls WHERE short_url = $1;`, [
      shortUrl,
    ]);

    if (url.rowCount <= 0) {
      return res.status(404).send({ message: "URL não encontrada" });
    }
    await db.query(`UPDATE urls SET accesses = $1 WHERE short_url = $2;`, [
      url.rows[0].accesses + 1,
      shortUrl,
    ]);

    res.redirect(url.rows[0].url);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function deleteUrlsById(req, res) {
  const { authorization } = req.headers;
  const { id } = req.params;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.status(401).send({ message: "Falha na autorização" });
  }

  if (isNaN(id) || id <= 0) {
    return res.status(404).send({ message: "URL não encontrada" });
  }

  try {
    const session = await db.query(`SELECT * FROM sessions WHERE token = $1;`, [
      token,
    ]);
    const url = await db.query(`SELECT * FROM urls WHERE id=$1;`, [id]);

    if (session.rowCount != 1) {
      return res.status(401).send({ message: "Falha na autorização" });
    }
    if (url.rowCount != 1) {
      return res.status(404).send({ message: "URL não encontrada" });
    }
    if (session.rows[0].user_id != url.rows[0].user_id) {
      return res.status(401).send({ message: "Essa URL não é sua" });
    }

    await db.query(`DELETE FROM urls WHERE id = $1;`, [url.rows[0].id]);

    res.status(204).send("A URL foi excluida com sucesso");
  } catch (err) {
    res.status(500).send(err.message);
  }
}
