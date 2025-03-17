-- Inserção de dados na tabela EVENTOS
INSERT INTO EVENTOS (id, nome, local, data_inicio, data_fim, descricao, tipo)
VALUES
    (1, 'Tech Conference 2024', 'Centro de Convenções, São Paulo', '2024-03-15', '2024-03-17',
        'Conferência anual de tecnologia com palestrantes internacionais.', 'Conferência'),
    (2, 'Workshop de Fotografia', 'Espaço Cultural, Rio de Janeiro', '2024-02-10', '2024-02-10',
        'Workshop prático para amantes da fotografia.', 'Workshop');

-- Inserção de dados na tabela LOJAS
INSERT INTO LOJAS (id, cnpj, codigo, telefone, email, funcionarios, segmento, aluguel, nome)
VALUES
    (1, '12345678000195', 101, '11987654321', 'empresa@exemplo.com', 50, 'Moda', 5000.00, 'Luis Modas'),
    (2, '98765432000121', 202, '21987654321', 'contato@lojavirtual.com', 15, 'Farmácia', 3000.00, 'Mateus Drogasil');

-- Inserção de dados na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (id, cpf, nome, cargo, email, loja_id, empresa_terceira_id)
VALUES
    (1, '12345678901', 'João Silva', 'Gerente', 'joao.silva@email.com', 1, NULL),
    (2, '98765432100', 'Maria Oliveira', 'Atendente', 'maria.oliveira@email.com', NULL, 2);

-- Inserção de dados na tabela EMPRESAS_TERCEIRAS
INSERT INTO EMPRESAS_TERCEIRAS (cnpj, codigo, nome, telefone, email)
VALUES
    ('66778899000177', '123', 'CITI', '21987654321', 'citi@cin.ufpe.br'),
    ('12345678000195', '124', 'Serviços Gerais LTDA', '11987654321', 'contato@servicosgerais.com');

-- Inserção na tabela EMPRESAS_PRESTADORAS_SERVICO
INSERT INTO EMPRESAS_PRESTADORAS_SERVICO (codigo, servico, qtd_funcionarios)
VALUES ('123', 'Limpeza e Conservação', 50);

-- Inserção na tabela FORNECEDORES
INSERT INTO FORNECEDORES (codigo)
VALUES ('124');

-- Inserção na tabela ATIVOS_FORNECEDORES
INSERT INTO ATIVOS_FORNECEDORES (id, fornecedor_codigo)
VALUES (1, '124'), (2, '124');

-- Inserção na tabela FORNECEDORES_ABASTECE
INSERT INTO FORNECEDORES_ABASTECE (id, cnpj_fornecedor, cnpj_cliente)
VALUES
    (1, '12345678000195', NULL),
    (2, NULL, '12345678000195');

-- Atualização do valor do aluguel na tabela LOJAS
UPDATE LOJAS
SET aluguel = 2800
WHERE cnpj = '98765432000121';

-- Exclusão de um registro na tabela LOJAS
DELETE FROM LOJAS
WHERE cnpj = '12345678000195';

-- Inserção na tabela VEÍCULOS
INSERT INTO VEICULOS (id, placa, tipo, registro)
VALUES
    (1, 'RIO2A18', 'carro', '40028922991'),
    (2, 'ELD2A22', 'moto', '12345678911');

-- Inserção na tabela TRANSAÇÕES
INSERT INTO TRANSACOES (id, valor, tipo, descricao, data, taxa, referencia, cliente_id)
VALUES
    (1, 2000, 'deb', 'aluguel', '2024-12-17', 1800, '98765432000121', 2),
    (2, 15, 'deb', 'estacionamento', '2024-12-17', 13, '40028922991', 1),
    (3, 12, 'deb', 'estacionamento', '2024-12-16', 10, '12345678911', 2);

-- Inserção na tabela REGISTRO_ESTACIONAMENTO
INSERT INTO REGISTRO_ESTACIONAMENTO (id, entrada, saida, valor, placa, cliente_id, referencia)
VALUES
    (1, '182200', '171800', 15, 'RIO2A18', 1, '40028922991'),
    (2, '192200', '212200', 12, 'ELD2A22', 2, '12345678911');

-- Inserção na tabela ATIVOS
INSERT INTO ATIVOS (id, valor, data_aquisicao, descricao, categoria)
VALUES
    (1, 1000, '2004-06-01', 'NOTEBOOK HP INTEL PENTIUM', 'informatica'),
    (2, 150000, '2005-05-27', 'ESCADA ROLANTE THYSSENKRUPP', 'infraestrutura');

-- Inserção na tabela EVENTOS_PROMOVIDOS
INSERT INTO EVENTOS_PROMOVIDOS (id, cnpj_loja, evento_id)
VALUES
    (1, '12345678000195', 1),
    (2, '98765432000121', 2);