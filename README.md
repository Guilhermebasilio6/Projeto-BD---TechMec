# Sistema de Manutenção de Equipamentos
Projeto Integrador – Banco de Dados

## Objetivo
Este sistema gerencia:
- Equipamentos
- Ordens de Serviço (Corretivas e Preventivas)
- Técnicos, Coordenadores e Gerentes
- Histórico de Manutenção
- Relatórios de Desempenho

## Conteúdo da Pasta
- `script.sql` — criação completa do banco
- `insert.sql` — população com dados coerentes
- `consultas.sql` — consultas comentadas
- `controle.sql` — permissões, transações, commit/rollback
- `DER.png` — modelo conceitual
- `README.md` — documentação

## Entidades Principais
- Usuario (superclasse)
- Técnico, Coordenador, Gerente (subclasses)
- Equipamento
- Ordem_Servico (abstrata)
- OS_Corretiva
- OS_Preventiva
- Notificacao_Preventiva
- Historico
- Relatorio_Desempenho

## Cardinalidades
- Usuário 1–1 Técnico/Coordenador/Gerente
- Equipamento 1–N OS
- OS 1–1 Preventiva/Corretiva
- OS Preventiva 1–N Notificações
- Equipamento 1–N Histórico
- Gerente 1–N Relatório

## Equipe
- Guilherme Fonseca Basílio
- Igor Gabriel Oliveira 
- Délio Ives Galvão
- Matheus Peixoto Souza 
