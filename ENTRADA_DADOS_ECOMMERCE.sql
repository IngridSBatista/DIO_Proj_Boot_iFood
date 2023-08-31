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