/*
  Warnings:

  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `user` table. All the data in the column will be lost.
  - Added the required column `idUser` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `idUser` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`idUser`);

-- CreateTable
CREATE TABLE `Test` (
    `idUser` INTEGER NOT NULL AUTO_INCREMENT,
    `icNumber` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `idProduk` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idUser`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
