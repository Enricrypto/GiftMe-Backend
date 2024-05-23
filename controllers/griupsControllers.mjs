import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// CREATE NEW GROUP
export const createNewGroup = async (req, res) => {
  const { groupName, userId, groupMembers } = req.body;

  try {
    // Check if user profile exists
    const existingUserProfile = await prisma.userProfile.findUnique({
      where: { id: userId },
    });

    if (!existingUserProfile) {
      return res.status(404).json({ message: "User profile not found" });
    }

    // Create group data object
    let groupData = {
      groupName,
      createdById: userId,
      isActive: true,
    };

    // If groupMembers array is provided and not empty, add members
    if (Array.isArray(groupMembers) && groupMembers.length > 0) {
      const membersToCreate = [];

      for (const member of groupMembers) {
        const memberProfile = await prisma.userProfile.findUnique({
          where: { id: member.currentUserId },
        });

        if (!memberProfile) {
          return res
            .status(404)
            .json({ message: `User profile not found for member ID ${member.currentUserId}` });
        }

        membersToCreate.push({
          currentUserId: member.currentUserId,
          isInvited: member.isInvited ?? true,
          isAccepted: member.isAccepted ?? false,
          invitationDate: new Date(),
          acceptanceDate: member.isAccepted ? new Date() : null,
        });
      }

      groupData.groupMembers = {
        create: membersToCreate,
      };
    }

    // Create new group
    const newGroup = await prisma.group.create({
      data: groupData,
      include: {
        groupMembers: {},
      },
    });

    res.status(200).json({
      message: "Group successfully created",
      group: newGroup,
    });
  } catch (err) {
    console.error("Error creating group", err);
    res.status(500).json({ message: "Failed to create group", error: err.message });
  }
};
