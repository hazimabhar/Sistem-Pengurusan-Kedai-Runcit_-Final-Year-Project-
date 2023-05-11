/*
  Warnings:

  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `icNumber` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `idUser` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `idUser` on the `worker` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[icNumber]` on the table `Worker` will be added. If there are existing duplicate values, this will fail.
  - The required column `idAccount` was added to the `User` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `idManager` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idWorker` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `icNumber` to the `Worker` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `Worker` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `worker` DROP FOREIGN KEY `Worker_idUser_fkey`;

-- DropIndex
DROP INDEX `User_icNumber_key` ON `user`;

-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    DROP COLUMN `icNumber`,
    DROP COLUMN `idUser`,
    DROP COLUMN `password`,
    ADD COLUMN `idAccount` VARCHAR(191) NOT NULL,
    ADD COLUMN `idManager` VARCHAR(191) NOT NULL,
    ADD COLUMN `idWorker` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idAccount`);

-- AlterTable
ALTER TABLE `worker` DROP COLUMN `idUser`,
    ADD COLUMN `icNumber` VARCHAR(191) NOT NULL,
    ADD COLUMN `password` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `Manager` (
    `idManager` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `icNumber` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(191) NOT NULL,
    `gender` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `role` VARCHAR(191) NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Manager_icNumber_key`(`icNumber`),
    PRIMARY KEY (`idManager`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Worker_icNumber_key` ON `Worker`(`icNumber`);

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_idWorker_fkey` FOREIGN KEY (`idWorker`) REFERENCES `Worker`(`idWorker`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_idManager_fkey` FOREIGN KEY (`idManager`) REFERENCES `Manager`(`idManager`) ON DELETE RESTRICT ON UPDATE CASCADE;
