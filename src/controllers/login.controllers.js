import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";

export async function signUp(req, res) {
  const { email, name, password, confirmPassword } = req.body;
  if (password != confirmPassword) {
    return res.status(422).send("As senhas não coincidem");
  }
  try {
    const verification = await db.query(`SELECT * FROM users WHERE email=$1;`, [
      email,
    ]);
    if (verification.rowCount > 0) {
      return res.status(422).send("Esse email já esta sendo usado");
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
  try {
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function usersMe(req, res) {
  try {
  } catch (err) {
    res.status(500).send(err.message);
  }
}
