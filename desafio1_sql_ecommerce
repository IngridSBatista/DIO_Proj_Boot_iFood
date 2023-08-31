-- Criação da DATABASE --

CREATE DATABASE Ecommerce;
USE Ecommerce;

-- Criação da tabela cliente --

CREATE TABLE Cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
	Pnome VARCHAR(20),
	Sobrenome VARCHAR(30),
	Dt_de_nascimento DATE,
	CPF CHAR(11) NOT NULL,
	endereco VARCHAR(45),
	CONSTRAINT unique_cpfcliente UNIQUE(CPF)
);
ALTER TABLE CLIENTE AUTO_INCREMENT=1;


-- Criação da tabela produto --

CREATE TABLE Produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
	Pnome VARCHAR(10) NOT NULL,
	Class_crianca BOOLEAN DEFAULT FALSE,
	Categoria ENUM('Móveis', 'Eletrônicos', 'Roupas', 'Brinquedos', 'Cama, Mesa e Banho', 'Livraria', 'Diversos') DEFAULT 'Diversos',
	Avaliacao FLOAT DEFAULT 0,
	Dimensao VARCHAR(10)
);
ALTER TABLE PRODUTO AUTO_INCREMENT=1;

-- Criação da tabela pagamento --

CREATE TABLE Pagamento(
	idCliente_pgto INT,
	idPagamento INT AUTO_INCREMENT,
	TipodePagamento ENUM ('Boleto', 'Cartão Débito', 'Cartão Crédito', 'Pix'),
	PRIMARY KEY(idPagamento, idCliente_pgto),
	CONSTRAINT fk_pgto_cliente FOREIGN KEY(idCliente_pgto) REFERENCES Cliente(idCliente)
);
ALTER TABLE PAGAMENTO AUTO_INCREMENT=1;

-- Criação da tabela pedido --

CREATE TABLE Pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
	idCliente_Pedido INT,
	idProduto_Pedido INT,
	Pedido_Status ENUM('Cancelado', 'Confirmado', 'Enviado', 'Entregue', 'Em processamento') DEFAULT 'Em processamento',
	Descricao VARCHAR(255),
	Frete FLOAT DEFAULT 0,
	idPagamento_Pedido INT,
	CONSTRAINT fk_pedido_produto FOREIGN KEY(idProduto_Pedido) REFERENCES Produto(idProduto),
	CONSTRAINT fk_pedido_cliente FOREIGN KEY(idCliente_Pedido) REFERENCES Cliente(idCliente),
	CONSTRAINT fk_pedido_pagamento FOREIGN KEY(idPagamento_Pedido) REFERENCES Pagamento(idPagamento)
	ON UPDATE CASCADE
);
ALTER TABLE pedido AUTO_INCREMENT=1;

-- Criação da tabela estoque --

CREATE TABLE Estoque(
	idEstoque INT AUTO_INCREMENT PRIMARY KEY,
	idProdutoEstoque INT,
	categoria ENUM('Móveis', 'Eletrônicos', 'Roupas', 'Brinquedos', 'Cama, Mesa e Banho', 'Livraria', 'diversos') DEFAULT 'Diversos',
	quantidade INT DEFAULT 0,
	estoque_local VARCHAR(255),
	CONSTRAINT fk_estoque_produto FOREIGN KEY(idProdutoEstoque) REFERENCES Produto(idProduto)
);
ALTER TABLE ESTOQUE AUTO_INCREMENT=1;

-- Criação da tabela fornecedor --

CREATE TABLE Fornecedor(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
	Razao_Social VARCHAR(255) NOT NULL,
	Endereço VARCHAR(45),
	CNPJ CHAR(14) NOT NULL,
	Contato CHAR(11) NOT NULL,
	CONSTRAINT unique_fornecedor UNIQUE(CNPJ)
);
ALTER TABLE FORNECEDOR AUTO_INCREMENT=1;

-- Criação da tabela vendedor --

CREATE TABLE Vendedor(
	idVendedor INT AUTO_INCREMENT PRIMARY KEY,
	CNPJ CHAR(14),
	CPF CHAR(11),
	Razao_Social VARCHAR(255) NOT NULL,
	Endereço VARCHAR(45),
	Contato CHAR(11) NOT NULL,
	CONSTRAINT unique_vendedor_cnpj UNIQUE(CNPJ),
	CONSTRAINT unique_vendedor_cpf UNIQUE(CPF)
);
ALTER TABLE VENDEDOR AUTO_INCREMENT=1;



-- RELAÇÕES --

-- Relação 1: produtos x vendedor --

CREATE TABLE VendProd(
	idPVendedor INT,
	idProduto_VP INT,
	QuantidadeProdutos INT DEFAULT 1,
	PRIMARY KEY(idPVendedor, idProduto_VP),
	CONSTRAINT fk_VendProd_vendedor FOREIGN KEY (idPVendedor) REFERENCES vendedor(idVendedor),
	CONSTRAINT fk_VendProd_produto FOREIGN KEY (idProduto_VP) REFERENCES produto(idProduto)
);


-- Relação 2: produtos x pedido --

CREATE TABLE ProdPed(
	idPProduto INT,
	idPPedido INT,
	PPQuantidade INT DEFAULT 1,
	PPStatus ENUM ('Disponível', 'Sem Estoque') DEFAULT 'Disponível',
	PRIMARY KEY (idPProduto, idPPedido),
	CONSTRAINT fk_ProdPed_produto FOREIGN KEY (idPProduto) REFERENCES produto(idProduto),
	CONSTRAINT fk_ProdPed_pedido FOREIGN KEY (idPPedido) REFERENCES pedido(idPedido)
);


-- Relação 3: local de estoque

CREATE TABLE LocalEstoque(
	idLProduto INT,
	idLEstoque INT,
	Endereco VARCHAR (255) NOT NULL,
	PRIMARY KEY (idLProduto, idLEstoque),
	CONSTRAINT fk_LEstoque_produto FOREIGN KEY (idLProduto) REFERENCES produto(idProduto),
	CONSTRAINT fk_LEstoque_estoque FOREIGN KEY (idLEstoque) REFERENCES estoque(idEstoque)
);


-- Relação 4: produto x fornecedor

CREATE TABLE ProdFornecedor(
	idPFFornecedor INT,
	idPFProduto INT,
	PFQuantidade INT NOT NULL,
	PRIMARY KEY (idPFFornecedor, idPFProduto),
	CONSTRAINT fk_ProdFornecedor_produto FOREIGN KEY (idPFProduto) REFERENCES produto(idProduto),
	CONSTRAINT fk_ProdFornecedor_fornecedor FOREIGN KEY (idPFFornecedor) REFERENCES fornecedor(idFornecedor)
);

---- POPULANDO O BANCO DE DADOS ----

  INSERT INTO Cliente VALUES
(DEFAULT, 'JOSE', 'DA SILVA', '1965-12-25', '00100200304', 'Rua X Bairro Alfabeto nº 1 - Salvador/BA'),
(DEFAULT, 'JOÃO', 'DA SILVA', '1987-05-01', '00100200305', 'Rua A Bairro Criação nº 2 - Fortaleza/CE'),
(DEFAULT, 'MARIA', 'DE ANGELIS', '1961-07-31', '01101202384', 'Rua 1 Bairro Numerado nº 0 - Palmas/TO'),
(DEFAULT, 'MARIO', 'DE SOUZA', '1989-04-26', '08109210374', 'Rua B Bairro Padrão nº 1 - São Paulo/SP'),
(DEFAULT, 'AGENOR', 'CARVALHO', '1960-12-25', '10100200309', 'Rua G Bairro Planalto nº 7 - Porto Velho/RO'),
(DEFAULT, 'HELENA', 'MATOS', '1975-02-02', '54100280301', 'Rua X Bairro Alfabeto nº 2 - Salvador/BA'),
(DEFAULT, 'CARLOS', 'MORENO', '1972-02-29', '80190200307', 'Rua J Bairro JK nº 100 - Boa Vista/RR'),
(DEFAULT, 'JOANA', 'DARC', '1981-01-01', '84161237302', 'Rua 5 Bairro Andre nº 25 - Rio de Janeiro/RJ'),
(DEFAULT, 'MARLI', 'COSTA', '1965-11-09', '11111247308', 'Rua P Bairro Portal nº 547 - Porto Alegre/RS');

INSERT INTO Produto VALUES
(DEFAULT, 'BOLA', TRUE, 'Brinquedos', DEFAULT, NULL),
(DEFAULT, 'CORDA', TRUE, 'Brinquedos', DEFAULT, NULL),
(DEFAULT, 'LIVRO', TRUE, 'Livraria', DEFAULT, '15x10'),
(DEFAULT, 'TOALHA', FALSE, 'Cama, Mesa e Banho', DEFAULT, NULL),
(DEFAULT, 'VESTIDO', FALSE, 'Roupas', DEFAULT, NULL),
(DEFAULT, 'CELULAR', TRUE, 'Eletrônicos', DEFAULT, NULL),
(DEFAULT, 'FONE', TRUE, 'Eletrônicos', DEFAULT, NULL);

INSERT INTO Pedido VALUES
(DEFAULT, 1, 8, DEFAULT, '', 15, 1),
(DEFAULT, 1, 9, DEFAULT, '', 1, 1),
(DEFAULT, 3, 9, DEFAULT, '', 10, 3),
(DEFAULT, 3, 10, DEFAULT, '', 25, 3),
(DEFAULT, 4, 11, DEFAULT, '', DEFAULT, 2),
(DEFAULT, 5, 13, DEFAULT, '', DEFAULT, 4);

INSERT INTO Pagamento VALUES
(1, DEFAULT, 'Pix'),
(3, DEFAULT, 'Cartão Crédito'),
(4, DEFAULT, 'Cartão Crédito'),
(5, DEFAULT, 'Boleto');

DESC ESTOQUE;

INSERT INTO Estoque VALUES
(DEFAULT, 8, 'Brinquedos', 5, 'CASA DA BONECA'),
(DEFAULT, 9, 'Livraria', 7, 'SAIBA ANTES'),
(DEFAULT, 10, 'Cama, Mesa e Banho', 9, 'DEITOU DORMIU'),
(DEFAULT, 11, 'Roupas', 11, 'COBERTO POR COMPLETO'),
(DEFAULT, 12, 'Eletrônicos', 13, 'BYTE AT ALL'),
(DEFAULT, 13, 'Eletrônicos', 15, 'ROLLER BIT'),
(DEFAULT, 14, 'Cama, Mesa e Banho', 17, 'TOALHARIA');

INSERT INTO Fornecedor VALUES
(DEFAULT, 'DISTRIBUIDORA GLOBAL', 'RUA PRINCIPAL, BAIRRO X - BAHIA', '01000000000155', '54984561234'),
(DEFAULT, 'DISTRIBUIDORA MUNDIAL', 'RUA TAMBOR, BAIRRO BANDA - CEARÁ', '04789456000123', '6874561234'),
(DEFAULT, 'DISTRIBUIDORA TERRAMAR', 'RUA PLANCHE, BAIRRO THENICS - CHUÍ', '09876543000287', '1134567891');

INSERT INTO Vendedor VALUES
(DEFAULT, NULL, '78632145968', 'RENATO TEIXEIRA', 'RUA 89, Nº 11, BAIRRO FLORES - RJ', '87412339765'),
(DEFAULT, NULL, '78632545985', 'DANIELE ANDREIA', 'RUA PX, Nº 4A, BAIRRO TROTE - BA', '74568415237'),
(DEFAULT, '45783126000454', NULL, 'ORGANIZACOES TABAJARA', 'RUA 0, BAIRRO PROJAC - SP', '21987765432'),
(DEFAULT, NULL, '95162384700', 'FELIPE SOARES', 'RUA 8, Nº 456, BAIRRO CIVIL - CE', '11966547821'),
(DEFAULT, '00000045002789', NULL, 'MERCADO PRECIOSO', 'RUA P, Nº 66, BAIRRO DIAMANTE - MT', '64997524568');

INSERT INTO VendProd VALUES
(1, 12, 7),
(1, 13, 8),
(2, 14, 17),
(2, 13, 7),
(3, 12, 6),
(4, 11, 11),
(4, 10, 9),
(5, 9, 7),
(5, 8, 5);

INSERT INTO ProdPed VALUES
(8, 7, 2, DEFAULT),
(9, 8, 2, DEFAULT),
(9, 9, 2, DEFAULT),
(10, 10, 2, DEFAULT),
(8, 11, 2, DEFAULT),
(12, 12, 2, DEFAULT);

INSERT INTO LocalEstoque VALUES
(8, 8, 'RUA T, N. 55 - BAIRRO DA CRUZ'),
(9, 8, 'RUA G, N. 1 - BAIRRO DA LAPA'),
(10, 9, 'RUA R, N. 765 - BAIRRO COSTEIRO'),
(11, 10, 'RUA Q, N. 3 - BAIRRO BADULAQUE'),
(12, 11, 'RUA A, N. 100 - BAIRRO DA CAVERNA'),
(13, 12, 'RUA B, N. 64 - BAIRRO DA GRUTA'),
(14, 13, 'RUA C, N. 7 - BAIRRO DA AORTA');

INSERT INTO ProdFornecedor VALUES
(1, 8, 5),
(1, 14, 17),
(2, 9, 7),
(3, 13, 15),
(3, 10, 9),
(1, 11, 11),
(2, 12, 13);

desc prodfornecedor;
