/*
  Warnings:

  - You are about to drop the column `idManager` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `idWorker` on the `user` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[idAccount]` on the table `Manager` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[idAccount]` on the table `Worker` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `idAccount` to the `Manager` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAccount` to the `Worker` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_idManager_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_idWorker_fkey`;

-- AlterTable
ALTER TABLE `manager` ADD COLUMN `idAccount` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `idManager`,
    DROP COLUMN `idWorker`;

-- AlterTable
ALTER TABLE `worker` ADD COLUMN `idAccount` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Manager_idAccount_key` ON `Manager`(`idAccount`);

-- CreateIndex
CREATE UNIQUE INDEX `Worker_idAccount_key` ON `Worker`(`idAccount`);

-- AddForeignKey
ALTER TABLE `Worker` ADD CONSTRAINT `Worker_idAccount_fkey` FOREIGN KEY (`idAccount`) REFERENCES `User`(`idAccount`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Manager` ADD CONSTRAINT `Manager_idAccount_fkey` FOREIGN KEY (`idAccount`) REFERENCES `User`(`idAccount`) ON DELETE RESTRICT ON UPDATE CASCADE;
