// Contains the controller files where each file manages the logic for a specific part of your application (e.g., users, groups, tables).
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const createGroup = async (req, res) => {
  const groupInfo = req.body;
  const userId = groupInfo.userId;


  try {
    // Check if user profile exists
    const existingUserProfile = await prisma.userProfile.findUnique({
      where: { userId },
    });

    if (!existingUserProfile) {
      return res.status(404).json({ message: "User profile not found" });
    }


    // Update user profile
    const updatedUserProfile = await prisma.userProfile.update({
      where: { id },
      data: {
        name: groupInfo.name,
        surname: groupInfo.surname,
        avatarImage: groupInfo.avatarImage,
        birthDate: new Date(groupInfo.birthDate),
        primaryAddress: groupInfo.primaryAddress,
        secondaryAddress: groupInfo.secondaryAddress,
      },
    });

    res.status(200).json({
      message: "Group created successfully",
      userProfile: updatedUserProfile,
    });
  } catch (err) {
    console.error("Error creating group", err);
    res.status(500).json({ message: "Failed to create group", error: err.message });
  }
};

