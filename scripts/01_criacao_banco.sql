
USE master;
GO
CREATE DATABASE NovaMarket;
GO
USE NovaMarket;
GO

CREATE TABLE dbo.Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    cidade VARCHAR(100),
    estado CHAR(2),
    data_cadastro DATE NOT NULL
);
GO

CREATE TABLE dbo.Produtos (
    id_produto INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);
GO

CREATE TABLE dbo.Pedidos (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATETIME2(0) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES dbo.Clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES dbo.Produtos(id_produto)
);
GO
