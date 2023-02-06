/*
  Warnings:

  - Added the required column `cliente_lizard_id` to the `usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `usuarios` ADD COLUMN `cliente_lizard_id` INTEGER NOT NULL;
