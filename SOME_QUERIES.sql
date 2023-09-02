-- Pergunta 1: Quantos imóveis cadastrados estão ocupados?
SELECT SUM(OCUPADO) AS Ocupados FROM IMOVEIS;
-- Pergunta 2: Quem são os ocupantes dos imóveis?
SELECT CLIENTES.NOME_RESPONSAVEL AS OCUPANTES FROM CLIENTES JOIN IMOVEIS ON CLIENTES.IDCLIENTE=IMOVEIS.OCUPANTE;
-- Pergunta 3: Quantos imóveis estão disponíveis para vendas e aluguel?
SELECT COUNT(VENDAS.IDIMOVEL) AS VENDE_OU_ALUGA FROM VENDAS, ALUGUEIS WHERE VENDAS.IDIMOVEL=ALUGUEIS.IDIMOVEL;
-- Pergunta 4: Algum proprietário de imóvel é também um locatário?
SELECT TIPO, IDCLIENTE, CIDADEESTADO FROM IMOVEIS IA JOIN (SELECT OCUPANTE FROM IMOVEIS) IB ON IA.IDCLIENTE=IB.OCUPANTE;