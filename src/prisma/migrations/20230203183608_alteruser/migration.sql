/*
  Warnings:

  - You are about to drop the column `cliente_usuario_lizard_id` on the `usuarios` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `usuarios` DROP COLUMN `cliente_usuario_lizard_id`,
    MODIFY `id` INTEGER NOT NULL;
