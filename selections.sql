-- 1. Listar todas as lojas do shopping com informações relevantes
SELECT id, cnpj, nome, numero_sala, telefone, email, quantidade_funcionarios, categoria, aluguel
FROM lojas;

-- 2. Contar o número total de funcionários por loja
SELECT l.nome, COUNT(f.id) AS total_funcionarios
FROM lojas l
LEFT JOIN funcionario f ON l.id = f.loja_id
GROUP BY l.nome;

-- 3. Obter todas as transações realizadas no shopping
SELECT id, valor, tipo, descricao, data, taxa, referencia, cliente_id
FROM transacoes;

-- 4. Listar os fornecedores e os ativos que eles fornecem
SELECT e.nome AS fornecedor, a.descricao AS ativo, a.categoria, a.valor
FROM fornecedores f
JOIN ativos_fornecedores af ON f.codigo = af.fornecedor_codigo
JOIN ativos a ON af.id = a.id
JOIN empresas_terceiras e ON f.codigo = e.codigo;

-- 5. Listar os eventos promovidos por cada loja
SELECT ev.nome AS evento, ev.local, ev.data_inicio, ev.data_fim, l.nome AS loja
FROM eventos ev
JOIN eventos_promovidos ep ON ev.id = ep.evento_id
JOIN lojas l ON ep.cnpj_loja = l.cnpj;

-- 6. Verificar os veículos que entraram no estacionamento e seus respectivos condutores
SELECT v.placa, v.tipo, v.registro, r.entrada, r.saida, r.valor
FROM veiculos v
JOIN registro_estacionamento r ON v.placa = r.placa;

-- 7. Consultar os valores arrecadados pelo estacionamento
SELECT SUM(valor) AS total_arrecadado_estacionamento
FROM registro_estacionamento;

-- 8. Consultar os pagamentos de aluguel realizados pelas lojas
SELECT l.nome AS loja, t.valor AS aluguel_pago, t.data
FROM transacoes t
JOIN lojas l ON t.referencia = l.cnpj
WHERE t.descricao = 'aluguel';

-- 9. Consultar as empresas terceirizadas prestadoras de serviço ao shopping
SELECT e.nome, e.telefone, e.email, eps.servico, eps.qtd_funcionarios
FROM empresas_terceiras e
JOIN empresas_prestadoras_servico eps ON e.codigo = eps.codigo;

-- 10. Listar os funcionários que possuem veículos cadastrados
SELECT f.nome, f.cargo, v.placa, v.tipo
FROM funcionario f
JOIN veiculos v ON f.cpf = v.registro;

-- 11. Consultar o total de transações de crédito e débito no shopping
SELECT tipo, SUM(valor) AS total
FROM transacoes
GROUP BY tipo;

-- 12. Consultar a quantidade de eventos realizados no shopping
SELECT COUNT(*) AS total_eventos FROM eventos;

-- 13. Listar os funcionários que trabalham nas empresas terceirizadas
SELECT f.nome, f.cargo, e.nome AS empresa
FROM funcionario f
JOIN empresas_prestadoras_servico eps ON f.empresa_terceira_id = eps.codigo
JOIN empresas_terceiras e ON eps.codigo = e.codigo;

-- 14. Consultar as transações realizadas por veículos estacionados
SELECT r.placa, t.valor, t.data
FROM transacoes t
JOIN registro_estacionamento r ON t.referencia = r.referencia;

-- 15. Listar os ativos adquiridos pelo shopping e seus fornecedores
SELECT a.descricao, a.categoria, a.valor, e.nome AS fornecedor
FROM ativos a
JOIN ativos_fornecedores af ON a.id = af.id
JOIN fornecedores f ON af.fornecedor_codigo = f.codigo
JOIN empresas_terceiras e ON f.codigo = e.codigo;