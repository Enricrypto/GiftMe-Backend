// Contains the route files that define the endpoints for each part of your application.
//These files typically import the controllers to handle requests.
import express from 'express'
import { createUserProfile } from '../controllers/usersController.mjs'

const router = express.Router()

// here you have all the routes
router.patch('/create-profile/:id', createUserProfile)

export default router
