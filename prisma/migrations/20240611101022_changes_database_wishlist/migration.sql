/*
  Warnings:

  - You are about to drop the `WishlistInvitation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WishlistMember` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `GroupId` to the `Wishlist` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "WishlistInvitation" DROP CONSTRAINT "WishlistInvitation_invitedById_fkey";

-- DropForeignKey
ALTER TABLE "WishlistInvitation" DROP CONSTRAINT "WishlistInvitation_receivedById_fkey";

-- DropForeignKey
ALTER TABLE "WishlistInvitation" DROP CONSTRAINT "WishlistInvitation_wishlistId_fkey";

-- DropForeignKey
ALTER TABLE "WishlistMember" DROP CONSTRAINT "WishlistMember_userProfileId_fkey";

-- DropForeignKey
ALTER TABLE "WishlistMember" DROP CONSTRAINT "WishlistMember_wishlistId_fkey";

-- AlterTable
ALTER TABLE "Group" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "GroupMember" ALTER COLUMN "invitationDate" SET DEFAULT now();

-- AlterTable
ALTER TABLE "Notification" ALTER COLUMN "timestamp" SET DEFAULT now();

-- AlterTable
ALTER TABLE "UserProfile" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "Wishlist" ADD COLUMN     "GroupId" UUID NOT NULL;

-- DropTable
DROP TABLE "WishlistInvitation";

-- DropTable
DROP TABLE "WishlistMember";

-- CreateTable
CREATE TABLE "WishlistGroupInvitation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "isInvited" BOOLEAN NOT NULL,
    "isAccepted" BOOLEAN NOT NULL DEFAULT false,
    "invitationDate" TIMESTAMP(3) NOT NULL,
    "acceptanceDate" TIMESTAMP(3),
    "invitedById" UUID NOT NULL,
    "receivedById" UUID NOT NULL,
    "groupId" UUID,

    CONSTRAINT "WishlistGroupInvitation_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Wishlist" ADD CONSTRAINT "Wishlist_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistGroupInvitation" ADD CONSTRAINT "WishlistGroupInvitation_invitedById_fkey" FOREIGN KEY ("invitedById") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistGroupInvitation" ADD CONSTRAINT "WishlistGroupInvitation_receivedById_fkey" FOREIGN KEY ("receivedById") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistGroupInvitation" ADD CONSTRAINT "WishlistGroupInvitation_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("id") ON DELETE SET NULL ON UPDATE CASCADE;
