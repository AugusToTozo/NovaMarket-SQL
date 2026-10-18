
USE NovaMarket;
GO


SELECT ped.id_pedido,
       cli.nome AS nome_cliente,
       pro.nome AS nome_produto,
       ped.quantidade,
       ped.data_pedido,
       pro.preco AS preco_unitario,
       ped.quantidade * pro.preco AS valor_total
FROM dbo.Pedidos AS ped
INNER JOIN dbo.Clientes AS cli ON ped.id_cliente = cli.id_cliente
INNER JOIN dbo.Produtos AS pro ON ped.id_produto = pro.id_produto
ORDER BY ped.id_pedido;


SELECT SUM(ped.quantidade * pro.preco) AS Faturamento_Total,
       AVG(ped.quantidade * pro.preco) AS Ticket_Medio,
       SUM(ped.quantidade) AS Unidades_Vendidas,
       COUNT(*) AS Total_Pedidos
FROM dbo.Pedidos AS ped
INNER JOIN dbo.Produtos AS pro ON ped.id_produto = pro.id_produto;

