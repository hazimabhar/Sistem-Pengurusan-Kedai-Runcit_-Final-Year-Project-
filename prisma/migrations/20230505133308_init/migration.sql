/*
  Warnings:

  - The primary key for the `manager` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idManager` on the `manager` table. All the data in the column will be lost.
  - You are about to drop the column `idManager` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `idWorker` on the `user` table. All the data in the column will be lost.
  - The primary key for the `worker` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idWorker` on the `worker` table. All the data in the column will be lost.
  - Added the required column `icManager` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `icWorker` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_idManager_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_idWorker_fkey`;

-- AlterTable
ALTER TABLE `manager` DROP PRIMARY KEY,
    DROP COLUMN `idManager`,
    ADD PRIMARY KEY (`icNumber`);

-- AlterTable
ALTER TABLE `user` DROP COLUMN `idManager`,
    DROP COLUMN `idWorker`,
    ADD COLUMN `icManager` VARCHAR(191) NOT NULL,
    ADD COLUMN `icWorker` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `worker` DROP PRIMARY KEY,
    DROP COLUMN `idWorker`,
    ADD PRIMARY KEY (`icNumber`);

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_icWorker_fkey` FOREIGN KEY (`icWorker`) REFERENCES `Worker`(`icNumber`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_icManager_fkey` FOREIGN KEY (`icManager`) REFERENCES `Manager`(`icNumber`) ON DELETE RESTRICT ON UPDATE CASCADE;
