import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

export async function signUp(req, res) {
  const { email, name, password, confirmPassword } = req.body;
  if (password != confirmPassword) {
    return res.status(422).send({ message: "As senhas não coincidem" });
  }
  try {
    const verification = await db.query(`SELECT * FROM users WHERE email=$1;`, [
      email,
    ]);
    if (verification.rowCount > 0) {
      return res
        .status(409)
        .send({ message: "Esse email já esta sendo usado" });
    }

    const passwordHash = bcrypt.hashSync(password, 10);

    await db.query(
      `INSERT INTO users (email, name, password) VALUES ($1, $2, $3);`,
      [email, name, passwordHash]
    );
    res.sendStatus(201);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function signIn(req, res) {
  const { email, password } = req.body;

  try {
    const verification = await db.query(`SELECT * FROM users WHERE email=$1;`, [
      email,
    ]);
    if (verification.rowCount != 1) {
      return res.status(401).send({ message: "Dados incorretos" });
    }

    if (bcrypt.compareSync(password, verification.rows[0].password) === false) {
      return res.status(401).send({ message: "Dados incorretos" });
    }

    const token = uuid();
    await db.query(`INSERT INTO sessions (token, user_id) VALUES ($1, $2);`, [
      token,
      verification.rows[0].id,
    ]);

    res.status(200).send({ token });
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function usersMe(req, res) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.status(401).send({ message: "Falha na autorização" });
  }

  try {
    const object = await db.query(
      `
      SELECT users.id, users.name,
      CAST(SUM(urls.accesses) AS INTEGER) AS "visitCount",
      JSON_AGG(JSON_BUILD_OBJECT(
        'id',urls.id,
        'shortUrl', urls.short_url,
        'url', urls.url,
        'visitCount', urls.accesses
        )ORDER BY urls.id) AS "shortenedUrls"
      FROM sessions
      JOIN users ON sessions.user_id = users.id
      JOIN urls ON urls.user_id = users.id
      WHERE token=$1
      GROUP BY users.id
      ;`,
      [token]
    );
    if (object.rowCount != 1) {
      return res.status(401).send({ message: "Usuario não encontrado" });
    }

    res.status(200).send(object.rows[0]);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
