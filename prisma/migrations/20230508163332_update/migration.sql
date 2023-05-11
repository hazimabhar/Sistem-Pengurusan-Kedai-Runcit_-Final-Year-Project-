/*
  Warnings:

  - You are about to alter the column `weight` on the `item` table. The data in that column could be lost. The data in that column will be cast from `Double` to `VarChar(191)`.

*/
-- AlterTable
ALTER TABLE `item` MODIFY `weight` VARCHAR(191) NOT NULL;
