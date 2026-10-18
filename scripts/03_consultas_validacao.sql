
USE NovaMarket;
GO

SELECT 'Clientes' AS Tabela, COUNT(*) AS Total FROM dbo.Clientes
UNION ALL
SELECT 'Produtos', COUNT(*) FROM dbo.Produtos
UNION ALL
SELECT 'Pedidos', COUNT(*) FROM dbo.Pedidos;

SELECT OBJECT_NAME(object_id) AS Tabela,
       name AS Coluna,
       seed_value AS Valor_Inicial,
       increment_value AS Incremento
FROM sys.identity_columns
WHERE OBJECT_NAME(object_id) IN ('Clientes', 'Produtos', 'Pedidos');

SELECT fk.name AS Nome_Relacionamento,
       OBJECT_NAME(fk.parent_object_id) AS Tabela_Origem,
       COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS Coluna_Origem,
       OBJECT_NAME(fk.referenced_object_id) AS Tabela_Destino,
       COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS Coluna_Destino
FROM sys.foreign_keys AS fk
INNER JOIN sys.foreign_key_columns AS fkc
    ON fk.object_id = fkc.constraint_object_id
WHERE fk.parent_object_id = OBJECT_ID('dbo.Pedidos');

SELECT id_produto, nome, categoria, preco, estoque
FROM dbo.Produtos
ORDER BY id_produto;
