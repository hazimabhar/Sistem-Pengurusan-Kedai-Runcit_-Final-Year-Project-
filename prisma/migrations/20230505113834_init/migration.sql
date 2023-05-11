/*
  Warnings:

  - You are about to drop the column `userId` on the `worker` table. All the data in the column will be lost.
  - Added the required column `idUser` to the `Worker` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `worker` DROP FOREIGN KEY `Worker_userId_fkey`;

-- AlterTable
ALTER TABLE `worker` DROP COLUMN `userId`,
    ADD COLUMN `idUser` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Worker` ADD CONSTRAINT `Worker_idUser_fkey` FOREIGN KEY (`idUser`) REFERENCES `User`(`idUser`) ON DELETE RESTRICT ON UPDATE CASCADE;
