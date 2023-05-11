-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_idManager_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `User_idWorker_fkey`;

-- AlterTable
ALTER TABLE `user` MODIFY `idManager` VARCHAR(191) NULL,
    MODIFY `idWorker` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_idWorker_fkey` FOREIGN KEY (`idWorker`) REFERENCES `Worker`(`idWorker`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_idManager_fkey` FOREIGN KEY (`idManager`) REFERENCES `Manager`(`idManager`) ON DELETE SET NULL ON UPDATE CASCADE;
