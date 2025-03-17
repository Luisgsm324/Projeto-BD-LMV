-- 1. empresas_terceiras
INSERT INTO empresas_terceiras (cnpj, nome, telefone, email)
VALUES
    ('66778899000177', 'CITI', '21987654321', 'citi@cin.ufpe.br'),
    ('12345678000195', 'Serviços Gerais LTDA', '11987654321', 'contato@servicosgerais.com');

-- 2. lojas
INSERT INTO lojas (id, cnpj, numero_sala, telefone, email, quantidade_funcionarios, categoria, aluguel, nome)
VALUES
    (1, '12345678000195', 101, '11987654321', 'empresa@exemplo.com', 50, 'Moda', 5000.00, 'Luis Modas'),
    (2, '98765432000121', 202, '21987654321', 'contato@lojavirtual.com', 15, 'Farmácia', 3000.00, 'Mateus Drogasil');

-- 3. empresas_prestadoras_servico
INSERT INTO empresas_prestadoras_servico (id_empresa_terceira, categoria, quantidade_funcionarios)
VALUES ('66778899000177', 'Limpeza e Conservação', 50);

-- 4. funcionarios
INSERT INTO funcionarios (id_unico, cpf, nome, funcao, email, idloja, id_empresa_terceira)
VALUES
    (1, '12345678901', 'João Silva', 'Gerente', 'joao.silva@email.com', 1, '66778899000177'),
    (2, '98765432100', 'Maria Oliveira', 'Atendente', 'maria.oliveira@email.com', 2, NULL);

-- 5. fornecedores
INSERT INTO fornecedores (cnpj_empresa)
VALUES ('12345678000195');

-- 6. ativos
INSERT INTO ativos (id_ativo, valor, data_aquisicao, modelo, classificacao)
VALUES
    (1, 1000.00, '2004-06-01', 'NOTEBOOK HP INTEL PENTIUM', 'informatica'),
    (2, 150000.00, '2005-05-27', 'ESCADA ROLANTE THYSSENKRUPP', 'infraestrutura');

-- 7. ativos_fornecedores
INSERT INTO ativos_fornecedores (id_ativo, id_fornecedor)
VALUES (1, 1), (2, 1);

-- 8. eventos
INSERT INTO eventos (id_evento, nome, localizacao, data_inicio, data_termino, descricao, tipo)
VALUES
    (1, 'Tech Conference 2024', 'Centro de Convenções, São Paulo', '2024-03-15', '2024-03-17',
        'Conferência anual de tecnologia com palestrantes internacionais.', 'Conferência'),
    (2, 'Workshop de Fotografia', 'Espaço Cultural, Rio de Janeiro', '2024-02-10', '2024-02-10',
        'Workshop prático para amantes da fotografia.', 'Workshop');

-- 9. veiculos
INSERT INTO veiculos (id, placa, tipo, condutor)
VALUES
    (1, 'RIO2A18', 'carro', '12345678901'),
    (2, 'ELD2A22', 'moto', '98765432100');

-- 10. transacoes
INSERT INTO transacoes (id, valor_bruto, deb_ou_cred, origem, data_transacao, valor_liquido, cpf_autor, cnpj_autor)
VALUES
    (1, 2000.00, 'd', 'aluguel', '2024-12-17', 1800.00, '98765432100', NULL),
    (2, 15.00, 'd', 'estacionamento', '2024-12-17', 13.00, '12345678901', NULL),
    (3, 12.00, 'd', 'estacionamento', '2024-12-16', 10.00, '98765432100', NULL);

-- 11. registro_estacionamento
INSERT INTO registro_estacionamento (id, hora_entrada, hora_saida, valor, placa_veiculo, id_veiculo, cpf_condutor)
VALUES
    (1, '2024-12-17 18:22:00', '2024-12-17 17:18:00', 15.00, 'RIO2A18', 1, '12345678901'),
    (2, '2024-12-17 19:22:00', '2024-12-17 21:22:00', 12.00, 'ELD2A22', 2, '98765432100');

-- 12. fornecedores_abastece
INSERT INTO fornecedores_abastece (idloja, id_fornecedor)
VALUES
    (1, 1),
    (2, 1);

-- 13. eventos_promovidos
INSERT INTO eventos_promovidos (idloja, id_evento)
VALUES
    (1, 1),
    (2, 2);