/*
  Warnings:

  - You are about to drop the column `userId` on the `UserProfile` table. All the data in the column will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "public"."UserProfile" DROP CONSTRAINT "UserProfile_id_fkey";

-- AlterTable
ALTER TABLE "public"."Group" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."GroupMember" ALTER COLUMN "invitationDate" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."Notification" ALTER COLUMN "timestamp" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."UserProfile" DROP COLUMN "userId",
ALTER COLUMN "createdAt" SET DEFAULT now();

-- DropTable
DROP TABLE "auth"."Users";
