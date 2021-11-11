/*
  Warnings:

  - You are about to drop the `availableschedule` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `area` DROP FOREIGN KEY `Area_idAvailableSchedule_fkey`;

-- DropForeignKey
ALTER TABLE `availableschedule` DROP FOREIGN KEY `AvailableSchedule_idArea_fkey`;

-- DropForeignKey
ALTER TABLE `availableschedule` DROP FOREIGN KEY `AvailableSchedule_idDesk_fkey`;

-- DropForeignKey
ALTER TABLE `availableschedule` DROP FOREIGN KEY `AvailableSchedule_idUser_fkey`;

-- DropForeignKey
ALTER TABLE `desk` DROP FOREIGN KEY `Desk_idAvailableSchedule_fkey`;

-- DropTable
DROP TABLE `availableschedule`;

-- CreateTable
CREATE TABLE `Available_Schedule` (
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
ALTER TABLE `Area` ADD CONSTRAINT `Area_idAvailableSchedule_fkey` FOREIGN KEY (`idAvailableSchedule`) REFERENCES `Available_Schedule`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Desk` ADD CONSTRAINT `Desk_idAvailableSchedule_fkey` FOREIGN KEY (`idAvailableSchedule`) REFERENCES `Available_Schedule`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Available_Schedule` ADD CONSTRAINT `Available_Schedule_idUser_fkey` FOREIGN KEY (`idUser`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Available_Schedule` ADD CONSTRAINT `Available_Schedule_idArea_fkey` FOREIGN KEY (`idArea`) REFERENCES `Area`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Available_Schedule` ADD CONSTRAINT `Available_Schedule_idDesk_fkey` FOREIGN KEY (`idDesk`) REFERENCES `Desk`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
