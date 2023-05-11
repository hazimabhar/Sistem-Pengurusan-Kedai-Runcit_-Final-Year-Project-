-- CreateTable
CREATE TABLE `Category` (
    `idCategory` VARCHAR(191) NOT NULL,
    `idAccount` VARCHAR(191) NOT NULL,
    `idBuyList` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Category_idAccount_key`(`idAccount`),
    UNIQUE INDEX `Category_idBuyList_key`(`idBuyList`),
    PRIMARY KEY (`idCategory`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Item` (
    `idItem` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `category` VARCHAR(191) NOT NULL,
    `price` DOUBLE NOT NULL,
    `barcode` VARCHAR(191) NOT NULL,
    `weight` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,
    `idCategory` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Item_barcode_key`(`barcode`),
    UNIQUE INDEX `Item_idCategory_key`(`idCategory`),
    PRIMARY KEY (`idItem`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BuyList` (
    `idBuyList` VARCHAR(191) NOT NULL,
    `idSale` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `BuyList_idSale_key`(`idSale`),
    PRIMARY KEY (`idBuyList`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sale` (
    `idSale` VARCHAR(191) NOT NULL,
    `price` DOUBLE NOT NULL,
    `paymentMethod` VARCHAR(191) NOT NULL,
    `idAccount` VARCHAR(191) NOT NULL,
    `idReport` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Sale_idAccount_key`(`idAccount`),
    UNIQUE INDEX `Sale_idReport_key`(`idReport`),
    PRIMARY KEY (`idSale`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Report` (
    `idReport` VARCHAR(191) NOT NULL,
    `numberSale` INTEGER NOT NULL,
    `saleRevenue` DOUBLE NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idReport`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Category` ADD CONSTRAINT `Category_idAccount_fkey` FOREIGN KEY (`idAccount`) REFERENCES `User`(`idAccount`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Category` ADD CONSTRAINT `Category_idBuyList_fkey` FOREIGN KEY (`idBuyList`) REFERENCES `BuyList`(`idBuyList`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Item` ADD CONSTRAINT `Item_idCategory_fkey` FOREIGN KEY (`idCategory`) REFERENCES `Category`(`idCategory`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BuyList` ADD CONSTRAINT `BuyList_idSale_fkey` FOREIGN KEY (`idSale`) REFERENCES `Sale`(`idSale`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sale` ADD CONSTRAINT `Sale_idAccount_fkey` FOREIGN KEY (`idAccount`) REFERENCES `User`(`idAccount`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sale` ADD CONSTRAINT `Sale_idReport_fkey` FOREIGN KEY (`idReport`) REFERENCES `Report`(`idReport`) ON DELETE RESTRICT ON UPDATE CASCADE;
