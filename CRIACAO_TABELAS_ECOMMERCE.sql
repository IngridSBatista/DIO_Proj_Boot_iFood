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

