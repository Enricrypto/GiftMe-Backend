import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
// CREATE GROUP
export const createGroup = async (req, res) => {
  const { userId, newGroupName, newGroupMembers } = req.body
  try {
    // 1. Check if the user exists
    const existingUserProfile = await prisma.userProfile.findUnique({
      where: { id: userId }
    })
    if (!existingUserProfile) {
      return res.status(404).json({ message: 'User profile not found' })
    }

    // 2. Check if groupName exists
    if (!newGroupName) {
      return res.status(400).json({ message: 'Group must have a name' })
    }
    const existingGroup = await prisma.group.findFirst({
      where: { groupName: newGroupName }
    })
    if (existingGroup) {
      return res.status(400).json({ message: 'Group name already exists' })
    }
    // 3. Validate new group members
    let newGroupMembersData = []
    if (newGroupMembers && newGroupMembers.length > 0) {
      for (const newGroupMember of newGroupMembers) {
        let currentNewGroupMember = null
        if (newGroupMember?.email) {
          currentNewGroupMember = await prisma.userProfile.findFirst({
            where: { email: newGroupMember.email }
          })
        }
        if (currentNewGroupMember) {
          newGroupMembersData.push({
            currentUserId: currentNewGroupMember.id,
            isInvited: true,
            isAccepted: false
          })
        } else {
          return res.status(404).json({
            message: `User profile for ${newGroupMember?.email} not found`
          })
        }
      }
    }
    // 4. Create the group and add members
    const newGroup = await prisma.group.create({
      data: {
        groupName: newGroupName,
        createdById: userId,
        groupMembers: {
          create: newGroupMembersData
        }
      },
      include: {
        groupMembers: true
      }
    })
    return res.status(201).json(newGroup)
  } catch (error) {
    console.error(error)
    return res.status(500).json({ message: 'Internal server error' })
  }
}
