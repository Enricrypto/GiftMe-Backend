// Contains the route files that define the endpoints for each part of your application.
//These files typically import the controllers to handle requests.
import express from "express";
import { createGroup } from "../controllers/groupsControllers.mjs";

const router = express.Router();

// here you have all the routes
router.post("/create-group", createGroup);

export default router;
