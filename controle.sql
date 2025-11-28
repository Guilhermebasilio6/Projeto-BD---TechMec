USE manutencao_equipamentos;

-- =========================
-- Transações
-- =========================

START TRANSACTION;

INSERT INTO usuario (nome, login, senha, nivel_acesso)
VALUES ('João Técnico', 'joao.tec', '123', 1);

INSERT INTO tecnico VALUES (LAST_INSERT_ID(), 'TEC-2002');

COMMIT;

-- Exemplo com rollback
START TRANSACTION;

INSERT INTO equipamento (codigo, nome, fabricante, data_aquisicao)
VALUES ('EQ-300', 'Furadeira Industrial', 'Bosch', '2022-01-10');

-- erro proposital (fk inexistente)
INSERT INTO ordem_servico (data_abertura, status, tipo, id_equipamento)
VALUES (NOW(), 'aberta', 'corretiva', 9999);

ROLLBACK;

-- =========================
-- Controle de Acesso
-- =========================

CREATE USER 'tecnico_user'@'%' IDENTIFIED BY '123';
CREATE USER 'coordenador_user'@'%' IDENTIFIED BY '123';
CREATE USER 'gerente_user'@'%' IDENTIFIED BY '123';

-- Permissões
GRANT SELECT, UPDATE ON ordem_servico TO 'tecnico_user'@'%';
GRANT SELECT, INSERT ON historico TO 'tecnico_user'@'%';

GRANT SELECT, INSERT, UPDATE ON ordem_servico TO 'coordenador_user'@'%';

GRANT SELECT ON ordem_servico TO 'gerente_user'@'%';
GRANT SELECT ON historico TO 'gerente_user'@'%';
GRANT SELECT, INSERT ON relatorio_desempenho TO 'gerente_user'@'%';

-- Revogar exemplo
REVOKE UPDATE ON ordem_servico FROM 'tecnico_user'@'%';
