-- CreateTable
CREATE TABLE `usuarios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cliente_usuario_lizard_id` INTEGER NOT NULL,
    `nome` VARCHAR(150) NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `login` VARCHAR(30) NOT NULL,
    `senha` VARCHAR(150) NOT NULL,
    `acesso_todos_chamados` BOOLEAN NOT NULL,
    `aprovar_orcamento` BOOLEAN NOT NULL,
    `chamado_cliente_obrigatorio` BOOLEAN NOT NULL DEFAULT false,
    `situacao` INTEGER NOT NULL,
    `criado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `atualizado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `chamado_id` INTEGER NULL,
    `chamado_cliente` VARCHAR(14) NOT NULL,
    `assunto` VARCHAR(45) NOT NULL,
    `tipo` INTEGER NOT NULL,
    `area_atuacao` INTEGER NOT NULL,
    `impacto` INTEGER NOT NULL,
    `urgencia` INTEGER NOT NULL,
    `rotina` VARCHAR(100) NULL,
    `descricao` VARCHAR(191) NOT NULL,
    `solicitante_email` VARCHAR(250) NOT NULL,
    `situacao` INTEGER NOT NULL DEFAULT 0,
    `notif_criacao_lizard` BOOLEAN NOT NULL DEFAULT true,
    `notif_edicao_lizard` BOOLEAN NOT NULL DEFAULT false,
    `criado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `atualizado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `usuario_id` INTEGER NOT NULL,
    `contato_ti_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `acoes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(191) NOT NULL,
    `tipo_acao` INTEGER NOT NULL,
    `acao_de` INTEGER NOT NULL,
    `criado_por` VARCHAR(250) NOT NULL,
    `vinculado_lizard` BOOLEAN NOT NULL DEFAULT false,
    `notif_criacao_lizard` BOOLEAN NOT NULL DEFAULT true,
    `criado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `atualizado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `ticket_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_contato_ti_id_fkey` FOREIGN KEY (`contato_ti_id`) REFERENCES `usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `acoes` ADD CONSTRAINT `acoes_ticket_id_fkey` FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
