// Contains the route files that define the endpoints for each part of your application.
//These files typically import the controllers to handle requests.
import express from 'express'
import { createUserProfile } from '../controllers/usersController.mjs'

const router = express.Router()

// All the routes of the application
router.patch('/create-profile/:id', createUserProfile)

export default router
