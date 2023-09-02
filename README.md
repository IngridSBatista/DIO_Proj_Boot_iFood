## Desafio de Projeto: *Construa um Projeto Lógico de Banco de Dados do Zero*

  

Este diretório é dedicado ao Desafio de Projeto do curso ***Potência Tech powered by iFood | Ciência de Dados***, da Digital Innovation One, módulo ***Modelagem de Dados e Projetos Lógicos na Prática com SQL***.

  

O diretório está dividido em 3 arquivos:

* Criação das tabelas;

* Inserção de dados nas tabelas;

*  *Queries* para recuperação de dados.

  

### Sobre o negócio

  

Este projeto visa o cadastro de clientes e imóveis de uma imobiliária e o controle dos serviços oferecidos.

### Lógica das tabelas

```mermaid
classDiagram

Imoveis "1"<-->"1" DadosImoveis
Imoveis "0"<-->"1" Alugueis
Imoveis "0"<-->"1" Vendas
Clientes "1"<-->"1" RegularDoc
Imoveis "1"<-->"1" RegularDoc
Clientes "1"-->"N" Imoveis

class Clientes{
	idCliente INT
	Nome_Responsavel VARCHAR
	CPF VARCHAR
	Razao_Social VARCHAR
	CNPJ VARCHAR
	Tel1 CHAR
    Tel2 CHAR
    Observacao VARCHAR
}
Clientes: PK (idCliente)
Clientes: UNIQUE (CPF, CNPJ)
Clientes: AUTO_INCREMENT (idCliente)
Clientes: NOT_NULL (Tel1)

class Imoveis{
	idImovel int
	idCliente int
	CadMunicipal VARCHAR
	Tipo ENUM
	Logradouro VARCHAR
	Bairro VARCHAR
	CidadeEstado VARCHAR
	Ocupado BOOLEAN
	Ocupante INT
}
Imoveis: PK (idImovel, idCliente)
Imoveis: FK (idCliente, Ocupante) -> Clientes(idCliente)
Imoveis: AUTO_INCREMENT (idImovel)
Imoveis: UNIQUE(CadMunicipal)
Imoveis: Tipos ('Casa','Apartamento','Sala Comercial','Prédio Comercial','Terreno')
 
class DadosImoveis{
	idImovel INT
    QtQuartos SMALLINT
    QtBanheiros SMALLINT
    QtSuites SMALLINT
    TamanhoTotal VARCHAR
    AreaConstruida VARCHAR
    }
    DadosImoveis: PK (idImovel)
    DadosImoveis: FK(idImovel)
    DadosImoveis: UNIQUE(idImovel)

class Alugueis{
	idAluguel INT,
    idImovel INT,
    ValorAluguel FLOAT
    }
    Alugueis: PRIMARY KEY(idAluguel, idImovel)
    Alugueis: AUTO_INCREMENT (idAluguel)
    Alugueis: FK (idImovel)

class RegularDoc{
		idDocs INT
        idImovel INT
        idCliente INT
        Contrato BOOLEAN 
        Doc_vendedor BOOLEAN  
        Doc_prefeitura BOOLEAN  
        Doc_cartorio BOOLEAN  
        Escritura BOOLEAN
        }
        RegularDoc: AUTO_INCREMENT (idDocs)
        RegularDoc: PK(idDocs, idImovel, idCliente)


class Vendas{
	idVenda INT auto_increment,
    idImovel INT,
    ValorVenda FLOAT DEFAULT 0,
    Financia BOOLEAN DEFAULT TRUE,
    Documentos INT,
    }
    Vendas: PK(idVenda, idImovel),
    Vendas: FK(idImovel, idDocs),
    Vendas: AUTO_INCREMENT (idDocs)
```