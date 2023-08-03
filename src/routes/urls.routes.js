import { Router } from "express";
import {
  deleteUrlsById,
  getUrlsById,
  urlsOpenShortUrl,
  urlsShorten,
} from "../controllers/urls.controllers.js";
import validateSchema from "../middlewares/validationSchema.middlewares.js";
import { urlsSchema } from "../schemas/urls.schemas.js";

const urlRouter = Router();

urlRouter.post("/urls/shorten", validateSchema(urlsSchema), urlsShorten);
urlRouter.get("/urls/:id", getUrlsById);
urlRouter.get("/urls/open/:shortUrl", urlsOpenShortUrl);
urlRouter.delete("urls/:id", deleteUrlsById);

export default urlRouter;
