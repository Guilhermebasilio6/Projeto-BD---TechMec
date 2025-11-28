-- 1. Listar todos os equipamentos
SELECT * FROM equipamento;

-- 2. OS abertas
SELECT * FROM ordem_servico WHERE status = 'aberta';

-- 3. Total de OS corretivas
SELECT COUNT(*) AS total_corretivas
FROM ordem_servico WHERE tipo = 'corretiva';

-- 4. OS com nome do equipamento
SELECT os.id_os, eq.nome, os.status
FROM ordem_servico os
JOIN equipamento eq ON eq.id_equipamento = os.id_equipamento;

-- 5. OS corretivas com técnicos
SELECT os.id_os, u.nome
FROM os_corretiva oc
JOIN tecnico t ON oc.id_tecnico_responsavel = t.id_usuario
JOIN usuario u ON u.id_usuario = t.id_usuario
JOIN ordem_servico os ON os.id_os = oc.id_os;

-- 6. Histórico de um equipamento
SELECT * FROM historico WHERE id_equipamento = 1;

-- 7. Custo total por equipamento
SELECT id_equipamento, SUM(custo)
FROM historico GROUP BY id_equipamento;

-- 8. OS encerradas nos últimos 30 dias
SELECT * FROM ordem_servico
WHERE data_encerramento >= NOW() - INTERVAL 30 DAY;

-- 9. Equipamentos com mais de 3 manutenções
SELECT id_equipamento, COUNT(*)
FROM historico GROUP BY id_equipamento HAVING COUNT(*) > 3;

-- 10. Preventivas para o próximo mês
SELECT * FROM os_preventiva
WHERE MONTH(data_agendamento) = MONTH(NOW() + INTERVAL 1 MONTH);

-- 11. Coordenadores e usuários
SELECT u.*
FROM coordenador c JOIN usuario u ON u.id_usuario = c.id_usuario;

-- 12. Notificações preventivas
SELECT np.*, op.data_agendamento
FROM notificacao_preventiva np
JOIN os_preventiva op ON op.id_os = np.id_os_preventiva;

-- 13. Ranking de técnicos
SELECT u.nome, COUNT(*) AS total_os
FROM os_corretiva oc
JOIN usuario u ON u.id_usuario = oc.id_tecnico_responsavel
GROUP BY u.nome ORDER BY total_os DESC;

-- 14. Média de custos por equipamento
SELECT id_equipamento, AVG(custo)
FROM historico GROUP BY id_equipamento;

-- 15. Buscar OS por palavra-chave
SELECT * FROM ordem_servico
WHERE descricao_problema LIKE '%motor%';
