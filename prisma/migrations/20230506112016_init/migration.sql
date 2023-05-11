/*
  Warnings:

  - You are about to drop the column `idCategory` on the `item` table. All the data in the column will be lost.
  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `category` DROP FOREIGN KEY `Category_idAccount_fkey`;

-- DropForeignKey
ALTER TABLE `category` DROP FOREIGN KEY `Category_idBuyList_fkey`;

-- DropForeignKey
ALTER TABLE `item` DROP FOREIGN KEY `Item_idCategory_fkey`;

-- AlterTable
ALTER TABLE `item` DROP COLUMN `idCategory`;

-- DropTable
DROP TABLE `category`;

-- CreateTable
CREATE TABLE `ItemBuyListUser` (
    `idItem` VARCHAR(191) NOT NULL,
    `idBuyList` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `ItemBuyListUser_idItem_key`(`idItem`),
    UNIQUE INDEX `ItemBuyListUser_idBuyList_key`(`idBuyList`),
    PRIMARY KEY (`idItem`, `idBuyList`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_BuyListToItem` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_BuyListToItem_AB_unique`(`A`, `B`),
    INDEX `_BuyListToItem_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ItemBuyListUser` ADD CONSTRAINT `ItemBuyListUser_idItem_fkey` FOREIGN KEY (`idItem`) REFERENCES `Item`(`idItem`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ItemBuyListUser` ADD CONSTRAINT `ItemBuyListUser_idBuyList_fkey` FOREIGN KEY (`idBuyList`) REFERENCES `BuyList`(`idBuyList`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_BuyListToItem` ADD CONSTRAINT `_BuyListToItem_A_fkey` FOREIGN KEY (`A`) REFERENCES `BuyList`(`idBuyList`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_BuyListToItem` ADD CONSTRAINT `_BuyListToItem_B_fkey` FOREIGN KEY (`B`) REFERENCES `Item`(`idItem`) ON DELETE CASCADE ON UPDATE CASCADE;
