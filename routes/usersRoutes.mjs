// Contains the route files that define the endpoints for each part of your application. These files typically import the controllers to handle requests.
import express from 'express'
import {
  updateUserProfile,
  getAllUsers
} from '../controllers/usersController.mjs'

const router = express.Router()

router.get('/', getAllUsers)
router.patch('/update-profile/:id', updateUserProfile)

export default router
