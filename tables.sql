CREATE TABLE funcionarios (
	id_unico INTEGER PRIMARY KEY,
	cpf      VARCHAR(11) PRIMARY KEY,
	nome 	 VARCHAR(50),
	funcao	 VARCHAR(40),
	email	 VARCHAR(254),
    idloja   FOREIGN KEY REFERENCES lojas(id),
    idempresaserv FOREIGN KEY REFERENCES empresas_prestadoras_servico(id_empresa_terceira)
)

CREATE TABLE veiculos (
	id	 INTEGER PRIMARY KEY,
	placa    VARCHAR(7) PRIMARY KEY,
	tipo 	 VARCHAR(10),
    condutor VARCHAR(11) NOT NULL
)

CREATE TABLE registro_estacionamento (
	id	 INTEGER PRIMARY KEY,
	hora_saida DATETIME NOT NULL,
	hora_entrada DATETIME NOT NULL,
	valor 	     DECIMALS(10, 2),
    placa_veiculo FOREIGN KEY REFERENCES veiculos(placa),
    id_veiculo    FOREIGN KEY REFERENCES veiculos(id),
    cpf_condutor  FOREIGN KEY REFERENCES veiculos(condutor)
)

CREATE TABLE lojas (
	id	    		INTEGER PRIMARY KEY,
	cnpj        		VARCHAR(14) PRIMARY KEY,
	numero_sala 		INTEGER NOT NULL,
	telefone    		VARCHAR(11),
	email       		VARCHAR(254),
	quantidade_funcionarios INTEGER,
	categoria		VARCHAR(50),
	aluguel			DECIMALS(10,2) NOT NULL,
	nome			VARCHAR(200) NOT NULL  -- Avaliar se precisa alterar o nome desse campo para "Nome Fantasia" ou "Razão Social"
)

CREATE TABLE ativos (
	id_ativo	 INTEGER PRIMARY KEY,
	valor 	     	 DECIMALS(10, 2) NOT NULL,
	data_aquisicao	 DATE NOT NULL,
	modelo 		 VARCHAR(255), 
	classificao 	 VARCHAR(255)
)

CREATE TABLE transacoes (
	id	 	   INTEGER PRIMARY KEY,
	valor_bruto 	   DECIMALS(10, 2) NOT NULL,
	deb_ou_cred	   VARCHAR(1) NOT NULL,
	origem		   VARCHAR(255) NOT NULL,
	data_transacao     DATE NOT NULL,
	valor_liquido	   DECIMALS(10, 2) NOT NULL,
    -- Ajustes precisaram ser realizados sobre o campo cpf_ou_cnpj que virou dois outros campos que podem vir de uma ou de outra tabela
	cpf_autor 	   FOREIGN KEY REFERENCES registro_estacionamento(cpf_condutor), 
    cnpj_autor     FOREIGN KEY REFERENCES empresas_terceiras(cnpj)
)

CREATE TABLE eventos (
	id_evento 	INTEGER PRIMARY KEY,
	nome 	  	VARCHAR(255) NOT NULL,
	localizacao 	VARCHAR(255),
	data_inicio	DATETIME NOT NULL,
	data_termino	DATETIME NOT NULL,
	descricao	VARCHAR(255),
	tipo		VARCHAR(20)
)

CREATE TABLE empresas_terceiras (
	cnpj	 	 VARCHAR(14) PRIMARY KEY,
	id_empresa	 INTEGER PRIMARY KEY,
	nome 	     	 VARCHAR(50) NOT NULL,
	telefone	 VARCHAR(11),
	email 		 VARCHAR(254)
)

CREATE TABLE fornecedores (
    id_fornecedor FOREIGN KEY REFERENCES empresas_terceiras(id_empresa) 
)

CREATE TABLE empresas_prestadoras_servico (
    id_empresa_terceira     FOREIGN KEY REFERENCES empresas_terceiras(id_empresa),
    categoria               VARCHAR(50),
    quantidade_funcionarios INTEGER
)

CREATE TABLE ativos_fornecedores (
    id_ativo FOREIGN KEY REFERENCES ativos(id_ativo),
    id_fornecedor FOREIGN KEY REFERENCES fornecedores(id_fornecedor)
)

CREATE TABLE fornecedores_abastece (
    idloja  FOREIGN KEY REFERENCES lojas(id),
    cnpj_loja FOREIGN KEY REFERENCES lojas(cnpj),
    id_fornecedor FOREIGN KEY REFERENCES fornecedores(id_fornecedor)
)

CREATE TABLE eventos_promovidos (
    idloja FOREIGN KEY REFERENCES lojas(id),
    cnpj_loja FOREIGN KEY REFERENCES lojas(cnpj),
    id_evento FOREIGN KEY REFERENCES eventos(id_evento)
)