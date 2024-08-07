-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('GROUP', 'WISHLIST', 'GIFT_RESERVATION', 'GIFT_PURCHASE');

-- CreateEnum
CREATE TYPE "NotificationStatus" AS ENUM ('PENDING', 'READ', 'UNREAD', 'ARCHIVED', 'DISMISSED');

-- CreateTable
CREATE TABLE "UserProfile" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" VARCHAR(255),
    "surname" VARCHAR(255),
    "avatarImage" VARCHAR(255),
    "email" TEXT NOT NULL,
    "birthDate" TIMESTAMP(3),
    "primaryAddress" TEXT,
    "secondaryAddress" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT now(),

    CONSTRAINT "UserProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Group" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "groupName" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT now(),
    "isActive" BOOLEAN,
    "createdById" UUID NOT NULL,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GroupMember" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "isInvited" BOOLEAN NOT NULL,
    "isAccepted" BOOLEAN NOT NULL DEFAULT false,
    "invitationDate" TIMESTAMP(3) NOT NULL DEFAULT now(),
    "acceptanceDate" TIMESTAMP(3) NOT NULL,
    "groupId" UUID NOT NULL,
    "currentUserId" UUID NOT NULL,

    CONSTRAINT "GroupMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wishlist" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "createdById" UUID NOT NULL,
    "isActive" BOOLEAN,
    "createdAt" TIMESTAMP(3),
    "closedBy" TIMESTAMP(3),

    CONSTRAINT "Wishlist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WishlistMember" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "wishlistId" UUID NOT NULL,
    "userProfileId" UUID NOT NULL,

    CONSTRAINT "WishlistMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WishlistInvitation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "wishlistId" UUID NOT NULL,
    "isInvited" BOOLEAN NOT NULL,
    "isAccepted" BOOLEAN NOT NULL DEFAULT false,
    "invitationDate" TIMESTAMP(3) NOT NULL,
    "acceptanceDate" TIMESTAMP(3),
    "invitedById" UUID NOT NULL,
    "receivedById" UUID NOT NULL,

    CONSTRAINT "WishlistInvitation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gift" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "vendor" TEXT,
    "url" TEXT,
    "image" TEXT,
    "price" DOUBLE PRECISION,
    "category" TEXT,
    "currency" TEXT,
    "isPriceTracked" BOOLEAN NOT NULL,
    "priceUpperLimit" DOUBLE PRECISION,
    "priceLowerLimit" DOUBLE PRECISION,
    "status" TEXT NOT NULL,
    "reservationDate" TIMESTAMP(3),
    "reservedBy" TEXT,
    "isPurchased" BOOLEAN NOT NULL,
    "purchasedDate" TIMESTAMP(3),
    "deliveryDate" TIMESTAMP(3),
    "isDeliveredToReceiver" BOOLEAN,
    "wishlistId" UUID NOT NULL,

    CONSTRAINT "Gift_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "status" "NotificationStatus" NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT now(),
    "notificationType" "NotificationType" NOT NULL,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupMember" ADD CONSTRAINT "GroupMember_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupMember" ADD CONSTRAINT "GroupMember_currentUserId_fkey" FOREIGN KEY ("currentUserId") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wishlist" ADD CONSTRAINT "Wishlist_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistMember" ADD CONSTRAINT "WishlistMember_wishlistId_fkey" FOREIGN KEY ("wishlistId") REFERENCES "Wishlist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistMember" ADD CONSTRAINT "WishlistMember_userProfileId_fkey" FOREIGN KEY ("userProfileId") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistInvitation" ADD CONSTRAINT "WishlistInvitation_wishlistId_fkey" FOREIGN KEY ("wishlistId") REFERENCES "Wishlist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistInvitation" ADD CONSTRAINT "WishlistInvitation_invitedById_fkey" FOREIGN KEY ("invitedById") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistInvitation" ADD CONSTRAINT "WishlistInvitation_receivedById_fkey" FOREIGN KEY ("receivedById") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gift" ADD CONSTRAINT "Gift_wishlistId_fkey" FOREIGN KEY ("wishlistId") REFERENCES "Wishlist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
