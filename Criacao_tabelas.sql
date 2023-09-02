-- Criação da tabela de clientes --

CREATE TABLE Clientes(
	idCliente INT auto_increment,
    Nome_Responsavel VARCHAR(50),
	CPF CHAR(11),
    Razao_Social VARCHAR(50),
	CNPJ CHAR(14),
    Tel1 CHAR(11) NOT NULL,
    Tel2 CHAR(11),
    Observacao VARCHAR(255),
    PRIMARY KEY (idCliente),
    CONSTRAINT unique_cpf UNIQUE(CPF),
    CONSTRAINT unique_cnpj UNIQUE(CNPJ)
);


-- Criação da tabela de produtos --

CREATE TABLE Imoveis(
	idImovel INT auto_increment,
    idCliente INT,
	CadMunicipal VARCHAR(20),
    Tipo ENUM ('Casa','Apartamento','Sala Comercial','Prédio Comercial','Terreno') DEFAULT 'Casa',
    Logradouro VARCHAR(100) NOT NULL,
    Bairro VARCHAR(20) NOT NULL,
    CidadeEstado VARCHAR(20) NOT NULL,
    Ocupado BOOLEAN DEFAULT FALSE,
    Ocupante INT,
    PRIMARY KEY (idImovel, idCliente),
    CONSTRAINT unique_cad_mun UNIQUE(CadMunicipal),
    CONSTRAINT pk_cliente_imovel FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    CONSTRAINT pk_ocupante_imovel FOREIGN KEY (Ocupante) REFERENCES Clientes(idCliente)
);

CREATE TABLE DadosImoveis(
	idImovel INT,
    QtQuartos SMALLINT,
    QtBanheiros SMALLINT,
    QtSuites SMALLINT,
    TamanhoTotal VARCHAR(11),
    AreaConstruida VARCHAR(11),
    PRIMARY KEY (idImovel),
    CONSTRAINT pk_dado_imovel FOREIGN KEY (idImovel) REFERENCES Imoveis(idImovel),
    CONSTRAINT unique_imovel UNIQUE(idImovel)
);

-- Criação das tabelas de serviços --
-- TABELA 1: Alugueis --

CREATE TABLE ALUGUEIS(
	idAluguel INT auto_increment,
    idImovel INT,
    ValorAluguel FLOAT DEFAULT 0,
    PRIMARY KEY(idAluguel, idImovel),
    CONSTRAINT pk_AluguelImovel FOREIGN KEY (idImovel) REFERENCES Imoveis(idImovel)
);

-- TABELA 2: Regularização Documental --

CREATE TABLE RegularDoc(
		idDocs INT auto_increment,
        idImovel INT,
        idCliente INT,
        Contrato BOOLEAN DEFAULT FALSE,
        Doc_vendedor BOOLEAN DEFAULT FALSE,
        Doc_prefeitura BOOLEAN DEFAULT FALSE,
        Doc_cartorio BOOLEAN DEFAULT FALSE,
        Escritura BOOLEAN DEFAULT FALSE,
        PRIMARY KEY(idDocs, idImovel, idCliente)
);

-- TABELA 3: Vendas --

CREATE TABLE Vendas(
	idVenda INT auto_increment,
    idImovel INT,
    ValorVenda FLOAT DEFAULT 0,
    Financia BOOLEAN DEFAULT TRUE,
    Documentos INT,
    PRIMARY KEY(idVenda, idImovel),
    CONSTRAINT pk_VendaImovel FOREIGN KEY (idImovel) REFERENCES Imoveis(idImovel),
    CONSTRAINT pk_VendaDoc FOREIGN KEY (Documentos) REFERENCES RegularDoc(idDocs)
);


