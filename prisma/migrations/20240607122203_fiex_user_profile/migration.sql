-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "auth";

-- AlterTable
ALTER TABLE "public"."Group" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."GroupMember" ALTER COLUMN "invitationDate" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."Notification" ALTER COLUMN "timestamp" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."UserProfile" ADD COLUMN     "userId" UUID,
ALTER COLUMN "createdAt" SET DEFAULT now();

-- CreateTable
CREATE TABLE "auth"."User" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "displayName" TEXT,
    "email" VARCHAR(255) NOT NULL,
    "phone" TEXT,
    "provider" TEXT,
    "created" TIMESTAMP(3),
    "lastSignIn" TIMESTAMP(3),
    "userUID" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."UserProfile" ADD CONSTRAINT "UserProfile_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
