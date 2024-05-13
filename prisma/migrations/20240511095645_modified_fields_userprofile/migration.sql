-- AlterTable
ALTER TABLE "Group" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "GroupMember" ALTER COLUMN "invitationDate" SET DEFAULT now();

-- AlterTable
ALTER TABLE "Notification" ALTER COLUMN "timestamp" SET DEFAULT now();

-- AlterTable
ALTER TABLE "UserProfile" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "surname" DROP NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT now();
