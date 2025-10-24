CREATE DATABASE loja_Pascotto;
USE loja_Pascotto;


CREATE TABLE Fornecedores(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(20) NOT NULL,
    telefone VARCHAR(11),
    CPF VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE Produtos(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    qtd_estoque INT NOT NULL,
    idFornecedor INT NOT NULL,
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedores(idFornecedor)
);

CREATE TABLE Funcionarios(
	idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,3) NOT NULL
);

CREATE TABLE Colaborador(
	idColaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Pedidos(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    idFuncionario INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT,
    FOREIGN KEY (idFuncionario) REFERENCES Funcionarios(idFuncionario),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

ALTER TABLE Fornecedores ADD COLUMN email VARCHAR(100) UNIQUE NOT NULL;

CREATE TABLE Categorias(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

ALTER TABLE Produtos ADD COLUMN idCategoria INT NOT NULL;
ALTER TABLE Produtos ADD FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria);

INSERT INTO Fornecedores(nome, CNPJ, telefone, CPF, email) VALUES
	('Cleito', '64309000/0001', '11 12345-6789', '143.455.789-10', 'seilaoque@dontmail'),
	('Tiago', '64309900/0001', '12 18345-6789', '423.466.788-11', 'deilaque@email'),
	('Bruna', '64309400/0001', '15 12345-6089', '133.456.909-14', 'tolaoq@hotmail');
    
INSERT INTO Funcionarios(nome, cargo, salario) VALUES
	("Cleiton", "RH", 1.200),
	("Thiago", "Administração", 1.500),
	("Bruno", "Telemarketing", 2.000);
    
INSERT INTO Colaborador(nome, cargo, salario) VALUES
	("Cleiton", "RH", 1.200),
	("Thiago", "Administração", 1.500),
	("Bruno", "Telemarketing", 2.000);
    
INSERT INTO Categorias(nome) VALUES
	("Comida"),
    ("Bebida");
    
INSERT INTO Produtos(nome, preco, qtd_estoque, idFornecedor, idCategoria) VALUES
	("Bolinho",   6.50, 10, 10, 1),
    ("Miojo",     4.50, 15, 12, 1),
    ("Coca Cola", 4.50, 20, 31, 2);
    
INSERT INTO Pedidos(data_pedido, idFuncionario, idProduto, quantidade) VALUES
	("2025-05-09", 1, 13, 10),
    ("2025-05-09", 2, 14, 20),
    ("2025-05-10", 3, 15, 37);

ALTER TABLE Fornecedores DROP COLUMN CPF;

SELECT * FROM Fornecedores;
SELECT * FROM Produtos;
SELECT * FROM Funcionarios;
SELECT * FROM Colaborador;
SELECT * FROM Pedidos;
SELECT * FROM Categorias;
