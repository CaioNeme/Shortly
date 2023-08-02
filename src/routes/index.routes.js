import { Router } from "express";
import loginRouter from "./login.routes.js";
import urlRouter from "./urls.routes.js";
import rankingRouter from "./ranking.routes.js";

const router = Router();

router.use(loginRouter);
router.use(urlRouter);
router.use(rankingRouter);

export default router;
