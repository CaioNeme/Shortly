import { Router } from "express";
import { signIn, signUp, usersMe } from "../controllers/login.controllers.js";
import validateSchema from "../middlewares/validationSchema.middlewares.js";
import { signInSchema, signUpSchema } from "../schemas/login.schemas.js";

const loginRouter = Router();

loginRouter.post("/signin", validateSchema(signInSchema), signIn);
loginRouter.post("/signup", validateSchema(signUpSchema), signUp);
loginRouter.get("/users/me", usersMe);

export default loginRouter;
