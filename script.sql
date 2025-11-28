CREATE DATABASE manutencao_equipamentos;
USE manutencao_equipamentos;

-- ======================
-- Tabela Usuario
-- ======================
CREATE TABLE usuario (
    id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    login VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    nivel_acesso INT NOT NULL
);

-- ======================
-- Subclasses (Herança)
-- ======================

CREATE TABLE tecnico (
    id_usuario BIGINT PRIMARY KEY,
    numero_registro VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE coordenador (
    id_usuario BIGINT PRIMARY KEY,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE gerente (
    id_usuario BIGINT PRIMARY KEY,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- ======================
-- Equipamento
-- ======================
CREATE TABLE equipamento (
    id_equipamento BIGINT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(100) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL,
    fabricante VARCHAR(150),
    data_aquisicao DATE NOT NULL
);

-- ======================
-- Ordem de Serviço (superclasse)
-- ======================
CREATE TABLE ordem_servico (
    id_os BIGINT AUTO_INCREMENT PRIMARY KEY,
    data_abertura DATETIME NOT NULL,
    data_encerramento DATETIME,
    status VARCHAR(50) NOT NULL,
    descricao_problema TEXT,
    tipo VARCHAR(20) NOT NULL,
    id_equipamento BIGINT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento)
);

-- ======================
-- OS Corretiva
-- ======================
CREATE TABLE os_corretiva (
    id_os BIGINT PRIMARY KEY,
    id_tecnico_responsavel BIGINT,
    FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os),
    FOREIGN KEY (id_tecnico_responsavel) REFERENCES tecnico(id_usuario)
);

-- ======================
-- OS Preventiva
-- ======================
CREATE TABLE os_preventiva (
    id_os BIGINT PRIMARY KEY,
    data_agendamento DATE NOT NULL,
    proxima_manutencao DATE,
    FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os)
);

-- ======================
-- Notificação Preventiva
-- ======================
CREATE TABLE notificacao_preventiva (
    id_notificacao BIGINT AUTO_INCREMENT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_envio DATETIME NOT NULL,
    id_os_preventiva BIGINT NOT NULL,
    FOREIGN KEY (id_os_preventiva) REFERENCES os_preventiva(id_os)
);

-- ======================
-- Histórico
-- ======================
CREATE TABLE historico (
    id_historico BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_os VARCHAR(20) NOT NULL,
    data_execucao DATETIME NOT NULL,
    descricao_servico TEXT,
    custo DECIMAL(12,2),
    finalizado TINYINT(1) DEFAULT 0,
    data_finalizacao DATETIME,
    id_equipamento BIGINT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento)
);

-- ======================
-- Relatório
-- ======================
CREATE TABLE relatorio_desempenho (
    id_relatorio BIGINT AUTO_INCREMENT PRIMARY KEY,
    total_os_corretivas INT NOT NULL,
    total_os_preventivas INT NOT NULL,
    custo_total DECIMAL(12,2) NOT NULL,
    id_gerente BIGINT NOT NULL,
    FOREIGN KEY (id_gerente) REFERENCES gerente(id_usuario)
);
