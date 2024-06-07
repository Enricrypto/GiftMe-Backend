/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

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
ALTER TABLE "public"."UserProfile" ALTER COLUMN "createdAt" SET DEFAULT now();

-- DropTable
DROP TABLE "auth"."User";

-- CreateTable
CREATE TABLE "auth"."Users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "displayName" TEXT,
    "email" VARCHAR(255) NOT NULL,
    "phone" TEXT,
    "provider" TEXT,
    "created" TIMESTAMP(3),
    "lastSignIn" TIMESTAMP(3),
    "userUID" TEXT,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."UserProfile" ADD CONSTRAINT "UserProfile_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
