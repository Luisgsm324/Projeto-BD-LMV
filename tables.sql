CREATE TABLE funcionarios (
    id_unico INT PRIMARY KEY AUTO_INCREMENT,  
    cpf VARCHAR(11) UNIQUE NOT NULL,         
    nome VARCHAR(50) NOT NULL,
    funcao VARCHAR(40),
    email VARCHAR(254),
    idloja INT,
    idempresaserv INT,
    FOREIGN KEY (idloja) REFERENCES lojas(id),
    FOREIGN KEY (idempresaserv) REFERENCES empresas_prestadoras_servico(id_empresa_terceira)
);

CREATE TABLE veiculos (
    id INT PRIMARY KEY AUTO_INCREMENT,       
    placa VARCHAR(7) UNIQUE NOT NULL,       
    tipo VARCHAR(10),
    condutor VARCHAR(11) NOT NULL,          
    FOREIGN KEY (condutor) REFERENCES funcionarios(cpf)
);

CREATE TABLE registro_estacionamento (
    id INT PRIMARY KEY AUTO_INCREMENT,      
    hora_saida DATETIME NOT NULL,
    hora_entrada DATETIME NOT NULL,
    valor DECIMAL(10, 2),
    placa_veiculo VARCHAR(7),
    id_veiculo INT,
    cpf_condutor VARCHAR(11),
    FOREIGN KEY (placa_veiculo) REFERENCES veiculos(placa),
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id),
    FOREIGN KEY (cpf_condutor) REFERENCES funcionarios(cpf)
);

CREATE TABLE lojas (
    id INT PRIMARY KEY AUTO_INCREMENT,      
    cnpj VARCHAR(14) UNIQUE NOT NULL,       
    numero_sala INT NOT NULL,
    telefone VARCHAR(11),
    email VARCHAR(254),
    quantidade_funcionarios INT,
    categoria VARCHAR(50),
    aluguel DECIMAL(10, 2) NOT NULL,
    nome VARCHAR(200) NOT NULL
);

CREATE TABLE ativos (
    id_ativo INT PRIMARY KEY AUTO_INCREMENT, 
    valor DECIMAL(10, 2) NOT NULL,
    data_aquisicao DATE NOT NULL,
    modelo VARCHAR(255),
    classificacao VARCHAR(255)
);

CREATE TABLE transacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,      
    valor_bruto DECIMAL(10, 2) NOT NULL,
    deb_ou_cred VARCHAR(1) NOT NULL,
    origem VARCHAR(255) NOT NULL,
    data_transacao DATE NOT NULL,
    valor_liquido DECIMAL(10, 2) NOT NULL,
    cpf_autor VARCHAR(11),
    cnpj_autor VARCHAR(14),
    FOREIGN KEY (cpf_autor) REFERENCES funcionarios(cpf),
    FOREIGN KEY (cnpj_autor) REFERENCES empresas_terceiras(cnpj)
);


CREATE TABLE eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    localizacao VARCHAR(255),
    data_inicio DATETIME NOT NULL,
    data_termino DATETIME NOT NULL,
    descricao VARCHAR(255),
    tipo VARCHAR(20)
);


CREATE TABLE empresas_terceiras (
    cnpj VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(11),
    email VARCHAR(254)
);


CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT, 
    cnpj_empresa VARCHAR(14),
    FOREIGN KEY (cnpj_empresa) REFERENCES empresas_terceiras(cnpj)
);


CREATE TABLE empresas_prestadoras_servico (
    id_empresa_terceira VARCHAR(14) PRIMARY KEY,
    categoria VARCHAR(50),
    quantidade_funcionarios INT,
    FOREIGN KEY (id_empresa_terceira) REFERENCES empresas_terceiras(cnpj)
);


CREATE TABLE ativos_fornecedores (
    id_ativo INT,
    id_fornecedor INT,
    PRIMARY KEY (id_ativo, id_fornecedor),
    FOREIGN KEY (id_ativo) REFERENCES ativos(id_ativo),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE fornecedores_abastece (
    idloja INT,
    id_fornecedor INT,
    PRIMARY KEY (idloja, id_fornecedor),
    FOREIGN KEY (idloja) REFERENCES lojas(id),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE eventos_promovidos (
    idloja INT,
    id_evento INT,
    PRIMARY KEY (idloja, id_evento),
    FOREIGN KEY (idloja) REFERENCES lojas(id),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)
);