USE NovaMarket;
GO

SELECT nome, preco, estoque
FROM Produtos
WHERE preco > 300
  AND estoque < 15;

SELECT nome, categoria, preco
FROM Produtos
WHERE preco BETWEEN 250 AND 900;

SELECT nome, categoria, preco, estoque
FROM Produtos
WHERE categoria IN ('Periféricos', 'Áudio', 'Armazenamento')
ORDER BY preco DESC;

SELECT nome, categoria, preco
FROM Produtos
WHERE nome LIKE '%Gamer%'
ORDER BY preco ASC;

SELECT nome, categoria, preco, estoque
FROM Produtos
WHERE preco BETWEEN 200 AND 1000
  AND NOT categoria = 'Periféricos'
  AND estoque > 10
ORDER BY preco DESC;


SELECT nome, categoria, preco, estoque
FROM Produtos
WHERE categoria IN ('Periféricos', 'Componentes')
  AND preco BETWEEN 200 AND 1000
  AND estoque >= 10
  AND nome NOT LIKE '%Mouse%'
ORDER BY preco DESC;
