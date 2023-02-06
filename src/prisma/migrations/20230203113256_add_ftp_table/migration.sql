-- CreateTable
CREATE TABLE `ftp_customax` (
    `url_base` VARCHAR(200) NOT NULL,
    `user` VARCHAR(200) NOT NULL,
    `password` VARCHAR(200) NOT NULL,

    PRIMARY KEY (`url_base`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
