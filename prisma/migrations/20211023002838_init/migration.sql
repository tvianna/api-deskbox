/*
  Warnings:

  - Added the required column `createdBy` to the `Area` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAvailableSchedule` to the `Area` table without a default value. This is not possible if the table is not empty.
  - Added the required column `createdBy` to the `Desk` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAvailableSchedule` to the `Desk` table without a default value. This is not possible if the table is not empty.
  - Made the column `status` on table `desk` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `createdBy` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `area` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `createdBy` INTEGER NOT NULL,
    ADD COLUMN `deletedAt` DATETIME(3) NULL,
    ADD COLUMN `deletedBy` INTEGER NULL,
    ADD COLUMN `idAvailableSchedule` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `desk` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `createdBy` INTEGER NOT NULL,
    ADD COLUMN `deletedAt` DATETIME(3) NULL,
    ADD COLUMN `deletedBy` INTEGER NULL,
    ADD COLUMN `idAvailableSchedule` INTEGER NOT NULL,
    MODIFY `status` BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `createdBy` INTEGER NOT NULL,
    ADD COLUMN `deletedAt` DATETIME(3) NULL,
    ADD COLUMN `deletedBy` INTEGER NULL;

-- CreateTable
CREATE TABLE `AvailableSchedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idUser` INTEGER NOT NULL,
    `idArea` INTEGER NOT NULL,
    `idDesk` INTEGER NOT NULL,
    `startDate` DATETIME(3) NOT NULL,
    `endDate` DATETIME(3) NOT NULL,
    `weekend` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idUser` INTEGER NOT NULL,
    `idArea` INTEGER NOT NULL,
    `idDesk` INTEGER NOT NULL,
    `startDate` DATETIME(3) NOT NULL,
    `endDate` DATETIME(3) NOT NULL,
    `weekend` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Area` ADD CONSTRAINT `Area_idAvailableSchedule_fkey` FOREIGN KEY (`idAvailableSchedule`) REFERENCES `AvailableSchedule`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Desk` ADD CONSTRAINT `Desk_idAvailableSchedule_fkey` FOREIGN KEY (`idAvailableSchedule`) REFERENCES `AvailableSchedule`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AvailableSchedule` ADD CONSTRAINT `AvailableSchedule_idUser_fkey` FOREIGN KEY (`idUser`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AvailableSchedule` ADD CONSTRAINT `AvailableSchedule_idArea_fkey` FOREIGN KEY (`idArea`) REFERENCES `Area`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AvailableSchedule` ADD CONSTRAINT `AvailableSchedule_idDesk_fkey` FOREIGN KEY (`idDesk`) REFERENCES `Desk`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_idUser_fkey` FOREIGN KEY (`idUser`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_idArea_fkey` FOREIGN KEY (`idArea`) REFERENCES `Area`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_idDesk_fkey` FOREIGN KEY (`idDesk`) REFERENCES `Desk`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
