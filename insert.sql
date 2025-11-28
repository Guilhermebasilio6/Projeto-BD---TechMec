USE manutencao_equipamentos;

-- Usuários
INSERT INTO usuario (nome, login, senha, nivel_acesso) VALUES
('Carlos Silva', 'carlos.s', '123', 1),
('Ana Paula', 'ana.coord', '123', 2),
('Marcos Lima', 'marcos.g', '123', 3);

-- Técnicos / Coordenadores / Gerentes
INSERT INTO tecnico VALUES (1, 'TEC-1001');
INSERT INTO coordenador VALUES (2);
INSERT INTO gerente VALUES (3);

-- Equipamentos
INSERT INTO equipamento (codigo, nome, fabricante, data_aquisicao) VALUES
('EQ-001', 'Compressor Industrial', 'Atlas Copco', '2019-10-10'),
('EQ-002', 'Torno CNC', 'Hyundai', '2020-05-15');

-- OS (superclasse)
INSERT INTO ordem_servico (data_abertura, status, descricao_problema, tipo, id_equipamento)
VALUES
(NOW(), 'aberta', 'Vazamento de óleo', 'corretiva', 1),
(NOW(), 'agendada', 'Revisão preventiva mensal', 'preventiva', 2);

-- OS Corretiva
INSERT INTO os_corretiva VALUES (1, 1);

-- OS Preventiva
INSERT INTO os_preventiva VALUES (2, '2025-12-10', '2026-01-10');

-- Notificações
INSERT INTO notificacao_preventiva (mensagem, data_envio, id_os_preventiva)
VALUES ('Preventiva agendada para amanhã', NOW(), 2);

-- Histórico
INSERT INTO historico (tipo_os, data_execucao, descricao_servico, custo, finalizado, id_equipamento)
VALUES ('corretiva', NOW(), 'Troca de vedação', 350.00, 1, 1);
