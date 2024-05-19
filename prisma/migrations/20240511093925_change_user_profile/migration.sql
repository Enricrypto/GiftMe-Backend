/*
  Warnings:

  - You are about to drop the column `supabaseUserId` on the `UserProfile` table. All the data in the column will be lost.
  - Added the required column `email` to the `UserProfile` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "UserProfile_supabaseUserId_key";

-- AlterTable
ALTER TABLE "Group" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "GroupMember" ALTER COLUMN "invitationDate" SET DEFAULT now();

-- AlterTable
ALTER TABLE "Notification" ALTER COLUMN "timestamp" SET DEFAULT now();

-- AlterTable
ALTER TABLE "UserProfile" DROP COLUMN "supabaseUserId",
ADD COLUMN     "email" TEXT NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT now();
