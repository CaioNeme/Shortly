import { Router } from "express";
import {
  deleteUrlsById,
  getUrlsById,
  urlsOpenShortUrl,
  urlsShorten,
} from "../controllers/urls.controllers.js";

const urlRouter = Router();

urlRouter.post("/urls/shorten", urlsShorten);
urlRouter.get("/urls/:id", getUrlsById);
urlRouter.get("/urls/open/:shortUrl", urlsOpenShortUrl);
urlRouter.delete("urls/:id", deleteUrlsById);

export default urlRouter;
