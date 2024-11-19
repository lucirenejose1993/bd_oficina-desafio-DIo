-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS OficinaMecanica;
USE OficinaMecanica;

-- Removendo e recriando tabelas
DROP TABLE IF EXISTS OS_Peca;
DROP TABLE IF EXISTS Peca;
DROP TABLE IF EXISTS OS_Servico;
DROP TABLE IF EXISTS Servico;
DROP TABLE IF EXISTS OrdemServico;
DROP TABLE IF EXISTS Veiculo;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cliente;

-- Criando a tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15)
);

-- Criando a tabela Veículo
CREATE TABLE Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano YEAR,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Criando a tabela Funcionario
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

-- Criando a tabela Servico
CREATE TABLE Servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    preco DECIMAL(10,2) NOT NULL
);

-- Criando a tabela OrdemServico
CREATE TABLE OrdemServico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    data_os DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

-- Criando a tabela OS_Servico
CREATE TABLE OS_Servico (
    id_os INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

-- Criando a tabela Peça
CREATE TABLE Peca (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL
);

-- Criando a tabela OS_Peca
CREATE TABLE OS_Peca (
    id_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);


-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nome, endereco, telefone)
VALUES
('João Silva', 'Rua A, 123', '11987654321'),
('Maria Oliveira', 'Avenida B, 456', '21987654322'),
('Carlos Andrade', 'Travessa C, 789', '31987654323');

-- Inserindo dados na tabela Veículo
INSERT INTO Veiculo (placa, marca, modelo, ano, id_cliente)
VALUES
('ABC1234', 'Toyota', 'Corolla', 2019, 1),
('DEF5678', 'Honda', 'Civic', 2020, 2),
('GHI9012', 'Ford', 'Fusion', 2018, 1);

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (nome, cargo, salario)
VALUES
('José Mecânico', 'Mecânico', 2500.00),
('Ana Reparos', 'Especialista em Pintura', 3000.00),
('Carlos Ajustes', 'Mecânico', 2800.00);

-- Inserindo dados na tabela Servico
INSERT INTO Servico (descricao, preco)
VALUES
('Troca de óleo', 150.00),
('Balanceamento e Alinhamento', 200.00),
('Revisão Completa', 500.00),
('Pintura de Capô', 450.00);

-- Inserindo dados na tabela OrdemServico
INSERT INTO OrdemServico (id_cliente, id_veiculo, data_os)
VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-15'),
(1, 3, '2024-01-20');

-- Inserindo dados na tabela OS_Servico
INSERT INTO OS_Servico (id_os, id_servico, quantidade)
VALUES
(1, 1, 1), -- Troca de óleo na primeira OS
(1, 2, 1), -- Balanceamento e Alinhamento na primeira OS
(2, 3, 1), -- Revisão Completa na segunda OS
(3, 4, 1); -- Pintura de Capô na terceira OS

-- Inserindo dados na tabela Peça
INSERT INTO Peca (descricao, valor_unitario)
VALUES
('Filtro de óleo', 50.00),
('Pneu 205/55R16', 400.00),
('Correia dentada', 250.00);

-- Inserindo dados na tabela OS_Peca
INSERT INTO OS_Peca (id_os, id_peca, quantidade)
VALUES
(1, 1, 1), -- Filtro de óleo usado na primeira OS
(1, 2, 4), -- Quatro pneus usados na primeira OS
(3, 3, 1); -- Correia dentada usada na terceira OS
