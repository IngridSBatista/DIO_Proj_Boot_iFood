-- POPULANDO AS TABELAS --

INSERT INTO CLIENTES VALUES
	(DEFAULT, 'JOSE DA SILVA', '98765432109', NULL, NULL, '69998765432', '69876543210', NULL),
	(DEFAULT, 'HELLEN MARQUES', NULL, 'CS ACESSORIOS', '12345678002132', '76546739807', NULL, 'Responsável é gerente de marketing. Ligar somente horário comercial'),
	(DEFAULT, 'VALDISLEI WASHINGTON', '12345678999', 'LOJAS SOL', '01022033000166', '21987658765', '21954367878', 'Responsável é o dono do negócio'),
    (DEFAULT, 'EUNICE URU', '88866612390', NULL, NULL, '76998980000', NULL, 'Telefone rural');

INSERT INTO IMOVEIS VALUES
	(DEFAULT, 1, '00123', 'Casa', 'Rua da Beira, 3546', 'Mercado', 'Sao Paulo/SP', 0, NULL),
	(DEFAULT, 1, '0012', 'Casa', 'Rua da Alfeneiros, 46', 'HP Neigh', 'Rio de Janeiro/RJ', 0, NULL),
	(DEFAULT, 2, '2011234', 'Sala Comercial', 'Rua Principal, ed. Portal, sala 101', 'Comercial', 'Palmas/TO', 0, NULL),
	(DEFAULT, 2, '2011235', 'Sala Comercial', 'Rua Principal, ed. Portal, sala 102', 'Comercial', 'Palmas/TO', 0, NULL),
	(DEFAULT, 2, '2011236', 'Sala Comercial', 'Rua Principal, ed. Portal, sala 103', 'Comercial', 'Palmas/TO', 0, NULL),
	(DEFAULT, 2, '2011237', 'Sala Comercial', 'Rua Principal, ed. Portal, sala 104', 'Comercial', 'Palmas/TO', 1, 1),
	(DEFAULT, 4, '90012', 'Terreno', 'Estrada da Poeira, Gleba B, Lote 5', 'Area rural', 'Buritis/RO', 0, NULL),
	(DEFAULT, 3, '7007', 'Apartamento', 'Rua Treze, Condom. Terra', 'Rezes', 'Rio Branco/AC', 1, 4);

INSERT INTO DADOSIMOVEIS VALUES
	(1, 2, 1, 1, '300m2', '100m2'),
	(3, NULL, 2, NULL, NULL, '100m2'),
	(2, 3, 2, 1, '250m2', '95m2'),
	(4, NULL, 2, NULL, NULL, '100m2'),
	(5, NULL, 2, NULL, NULL, '100m2'),
	(6, NULL, 2, NULL, NULL, '100m2'),
	(7, NULL, NULL, NULL, '10000m2', NULL),
	(8, 5, 3, 2, NULL, '400m2');
    
INSERT INTO ALUGUEIS VALUES
	(DEFAULT, 1, 900.00),
	(DEFAULT, 4, 1500.00),
	(DEFAULT, 5, 1500.00),
	(DEFAULT, 6, 1500.00),
	(DEFAULT, 7, 1500.00);

INSERT INTO REGULARDOC VALUES
	(DEFAULT, 7, 3, TRUE, TRUE, FALSE, TRUE, FALSE);

INSERT INTO VENDAS VALUES
	(DEFAULT, 1, 100000.00, TRUE, NULL),
	(DEFAULT, 2, 250000.00, TRUE, NULL),
	(DEFAULT, 6, 1000000.00, TRUE, NULL);

