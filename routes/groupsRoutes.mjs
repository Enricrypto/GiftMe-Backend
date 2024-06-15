
import express from "express";
import { createGroup } from "../controllers/groupsControllers.mjs";

const router = express.Router();

router.post("/create-group", createGroup);
export default router;
