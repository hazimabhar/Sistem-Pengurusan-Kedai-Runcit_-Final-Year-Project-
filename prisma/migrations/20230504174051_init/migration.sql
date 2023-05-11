/*
  Warnings:

  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `test` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    MODIFY `idUser` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idUser`);

-- DropTable
DROP TABLE `test`;
