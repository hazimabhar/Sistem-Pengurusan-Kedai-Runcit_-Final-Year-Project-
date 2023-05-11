/*
  Warnings:

  - The primary key for the `manager` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `icManager` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `icWorker` on the `user` table. All the data in the column will be lost.
  - The primary key for the `worker` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `idManager` was added to the `Manager` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `idManager` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idWorker` to the `User` table without a default value. This is not possible if the table is not empty.
  - The required column `idWorker` was added to the `Worker` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_icManager_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_icWorker_fkey`;

-- AlterTable
ALTER TABLE `manager` DROP PRIMARY KEY,
    ADD COLUMN `idManager` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idManager`);

-- AlterTable
ALTER TABLE `user` DROP COLUMN `icManager`,
    DROP COLUMN `icWorker`,
    ADD COLUMN `idManager` VARCHAR(191) NOT NULL,
    ADD COLUMN `idWorker` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `worker` DROP PRIMARY KEY,
    ADD COLUMN `idWorker` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idWorker`);

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_idWorker_fkey` FOREIGN KEY (`idWorker`) REFERENCES `Worker`(`idWorker`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_idManager_fkey` FOREIGN KEY (`idManager`) REFERENCES `Manager`(`idManager`) ON DELETE RESTRICT ON UPDATE CASCADE;
