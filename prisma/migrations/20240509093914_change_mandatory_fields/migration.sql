/*
  Warnings:

  - You are about to alter the column `groupName` on the `Group` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `name` on the `UserProfile` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `surname` on the `UserProfile` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `avatarImage` on the `UserProfile` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.

*/
-- AlterTable
ALTER TABLE "Group" ALTER COLUMN "groupName" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "createdAt" SET DEFAULT now(),
ALTER COLUMN "isActive" DROP NOT NULL;

-- AlterTable
ALTER TABLE "GroupMember" ALTER COLUMN "invitationDate" SET DEFAULT now();

-- AlterTable
ALTER TABLE "Notification" ALTER COLUMN "timestamp" SET DEFAULT now();

-- AlterTable
ALTER TABLE "UserProfile" ALTER COLUMN "name" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "surname" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "avatarImage" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "birthDate" DROP NOT NULL,
ALTER COLUMN "primaryAddress" DROP NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "Wishlist" ALTER COLUMN "isActive" DROP NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL,
ALTER COLUMN "closedBy" DROP NOT NULL;
