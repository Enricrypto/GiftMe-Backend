// Contains the controller files where each file manages the logic for a specific part of your application (e.g., users, groups, tables).
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// UPDATE USER PROFILE
export const createUserProfile = async (req, res) => {
  const { id } = req.params
  const userData = req.body

  try {
    // Check if user profile exists
    const existingUserProfile = await prisma.userProfile.findUnique({
      where: { id }
    })

    if (!existingUserProfile) {
      return res.status(404).json({ message: 'User profile not found' })
    }

    // Ensure that the ID and email fields are not included in the updates
    delete userData.id
    delete userData.email

    // Update user profile
    const updatedUserProfile = await prisma.userProfile.update({
      where: { id },
      data: {
        name: userData.name,
        surname: userData.surname,
        avatarImage: userData.avatarImage,
        birthDate: new Date(userData.birthDate),
        primaryAddress: userData.primaryAddress,
        secondaryAddress: userData.secondaryAddress
      }
    })

    res.status(200).json({
      message: 'User profile updated successfully',
      userProfile: updatedUserProfile
    })
  } catch (err) {
    console.error('Error updating user profile', err)
    res
      .status(500)
      .json({ message: 'Failed to update user profile', error: err.message })
  }
}

//GET ALL USERS
export const getAllUsers = async (req, res) => {
  try {
    const users = await prisma.userProfile.findMany()
    res.status(200).json(users)
  } catch (err) {
    res.status(500).json({ message: err.message })
  }
}
