-- AlterTable
ALTER TABLE "public"."Group" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."GroupMember" ALTER COLUMN "invitationDate" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."Notification" ALTER COLUMN "timestamp" SET DEFAULT now();

-- AlterTable
ALTER TABLE "public"."UserProfile" ALTER COLUMN "createdAt" SET DEFAULT now();
