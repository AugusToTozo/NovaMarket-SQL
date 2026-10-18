
USE NovaMarket;
GO

INSERT INTO dbo.Clientes (nome, email, cidade, estado, data_cadastro)
VALUES
    ('Ana Oliveira', 'ana.oliveira@email.com', 'Uberlândia', 'MG', '2026-10-17'),
    ('Lucas Ferreira', 'lucas.ferreira@email.com', 'Uberlândia', 'MG', '2026-10-17'),
    ('Mariana Costa', 'mariana.costa@email.com', 'São Paulo', 'SP', '2026-10-17'),
    ('Pedro Almeida', 'pedro.almeida@email.com', 'Campinas', 'SP', '2026-10-17'),
    ('Juliana Martins', 'juliana.martins@email.com', 'Uberlândia', 'MG', '2026-10-17'),
    ('Rafael Souza', 'rafael.souza@email.com', 'Belo Horizonte', 'MG', '2026-10-17'),
    ('Beatriz Lima', 'beatriz.lima@email.com', 'Curitiba', 'PR', '2026-10-17'),
    ('Gabriel Rocha', 'gabriel.rocha@email.com', 'Goiânia', 'GO', '2026-10-17'),
    ('Camila Ribeiro', 'camila.ribeiro@email.com', 'Brasília', 'DF', '2026-10-17'),
    ('Felipe Santos', 'felipe.santos@email.com', 'Rio de Janeiro', 'RJ', '2026-10-17');
GO


INSERT INTO dbo.Produtos (nome, categoria, preco, estoque)
VALUES
    ('Mouse Gamer Logitech', 'Periféricos', 149.90, 30),
    ('Teclado Mecânico Redragon', 'Periféricos', 289.90, 15),
    ('Monitor Samsung 24"', 'Monitores', 899.00, 12),
    ('Headset HyperX Cloud', 'Áudio', 399.90, 20),
    ('SSD Kingston 1TB', 'Armazenamento', 459.90, 25),
    ('Memória RAM Corsair 16GB', 'Componentes', 299.90, 18),
    ('Processador Ryzen 5', 'Componentes', 999.90, 10),
    ('Webcam Logitech C920', 'Periféricos', 429.90, 14),
    ('Notebook Lenovo IdeaPad', 'Computadores', 3499.90, 8),
    ('Cadeira Gamer ThunderX3', 'Acessórios', 1199.90, 6);
GO

WITH DadosPedidos (email_cliente, nome_produto, quantidade, data_pedido) AS (
    SELECT email_cliente, nome_produto, quantidade, data_pedido
    FROM (VALUES
    ('ana.oliveira@email.com', 'Mouse Gamer Logitech', 2, '2026-10-17 09:15:00'),
    ('lucas.ferreira@email.com', 'Teclado Mecânico Redragon', 1, '2026-10-17 09:45:00'),
    ('mariana.costa@email.com', 'Monitor Samsung 24"', 1, '2026-10-17 10:20:00'),
    ('pedro.almeida@email.com', 'Headset HyperX Cloud', 2, '2026-10-17 10:50:00'),
    ('juliana.martins@email.com', 'SSD Kingston 1TB', 1, '2026-10-17 11:30:00'),
    ('rafael.souza@email.com', 'Memória RAM Corsair 16GB', 3, '2026-10-17 12:15:00'),
    ('beatriz.lima@email.com', 'Processador Ryzen 5', 1, '2026-10-17 13:00:00'),
    ('gabriel.rocha@email.com', 'Webcam Logitech C920', 2, '2026-10-17 13:40:00'),
    ('camila.ribeiro@email.com', 'Notebook Lenovo IdeaPad', 1, '2026-10-17 14:10:00'),
    ('felipe.santos@email.com', 'Cadeira Gamer ThunderX3', 1, '2026-10-17 14:55:00'),
    ('ana.oliveira@email.com', 'Monitor Samsung 24"', 1, '2026-10-17 15:20:00'),
    ('lucas.ferreira@email.com', 'SSD Kingston 1TB', 2, '2026-10-17 15:45:00'),
    ('mariana.costa@email.com', 'Mouse Gamer Logitech', 4, '2026-10-17 16:10:00'),
    ('pedro.almeida@email.com', 'Processador Ryzen 5', 1, '2026-10-17 16:35:00'),
    ('juliana.martins@email.com', 'Teclado Mecânico Redragon', 2, '2026-10-17 17:00:00'),
    ('rafael.souza@email.com', 'Notebook Lenovo IdeaPad', 1, '2026-10-17 17:25:00'),
    ('beatriz.lima@email.com', 'Headset HyperX Cloud', 1, '2026-10-17 18:00:00'),
    ('gabriel.rocha@email.com', 'Memória RAM Corsair 16GB', 2, '2026-10-17 18:30:00'),
    ('camila.ribeiro@email.com', 'Webcam Logitech C920', 1, '2026-10-17 19:10:00'),
    ('felipe.santos@email.com', 'Cadeira Gamer ThunderX3', 2, '2026-10-17 19:45:00')
    ) AS d(email_cliente, nome_produto, quantidade, data_pedido)
)
INSERT INTO dbo.Pedidos (id_cliente, id_produto, quantidade, data_pedido)
SELECT c.id_cliente, p.id_produto, d.quantidade, d.data_pedido
FROM DadosPedidos AS d
INNER JOIN dbo.Clientes AS c ON c.email = d.email_cliente
INNER JOIN dbo.Produtos AS p ON p.nome = d.nome_produto;
GO

SELECT 'Clientes' AS Tabela, COUNT(*) AS Quantidade FROM dbo.Clientes
UNION ALL
SELECT 'Produtos', COUNT(*) FROM dbo.Produtos
UNION ALL
SELECT 'Pedidos', COUNT(*) FROM dbo.Pedidos;
