import { db } from "../database/database.connection.js";

export async function ranking(req, res) {
  try {
    const users = await db.query(`
      SELECT users.id, users.name, COUNT(urls.id) AS "linksCount", SUM(urls.accesses) AS "visitCount" 
      FROM users
      JOIN urls ON users.id = urls.user_id
      GROUP BY users.id
      ORDER BY "visitCount" DESC
      LIMIT 10
    ;`);
    res.send(users.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}
