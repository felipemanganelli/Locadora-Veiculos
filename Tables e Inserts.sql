DROP SCHEMA IF EXISTS locadora;

CREATE SCHEMA locadora;
USE locadora;

SET GLOBAL log_bin_trust_function_creators = 1;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnh VARCHAR(9) NOT NULL,
    data_validade_cnh DATE NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);



CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR (7) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    cor VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    tipo_combustivel VARCHAR(50) NOT NULL,
    tipo_cambio VARCHAR(50) NOT NULL,
    potencia DECIMAL(5,2) NOT NULL,
    quilometragem INT NOT NULL,
    disponibilidade VARCHAR(10) NOT NULL
);



CREATE TABLE locacoes (
    id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    data_locacao DATE NOT NULL,
    valor_total DECIMAL(10,2),
    data_entrega DATE,
    quilometros_rodados INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES veiculos (id_veiculo)
);



CREATE TABLE multas_transito (
    id_multa INT AUTO_INCREMENT PRIMARY KEY,
    id_locacao INT,
    status_multa VARCHAR(100) NOT NULL,
    data_multa DATE NOT NULL,
    gravidade VARCHAR(100),
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES locacoes (id_locacao)
);



CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);



CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_locacao INT NOT NULL,
    id_funcionario INT NOT NULL,
    tipo_multa VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status_pagamento VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES locacoes (id_locacao),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario)
);



INSERT INTO clientes (nome, cnh, data_validade_cnh, cpf, endereco, telefone, email) VALUES
('João Silva', '123456789', '2025-12-31', '123.456.789-00', 'Rua A, 123', '(11) 1234-5678', 'joao.silva@gmail.com'),
('Maria Santos', '987654321', '2024-06-30', '987.654.321-00', 'Avenida B, 456', '(22) 2345-6789', 'maria.santos@hotmail.com'),
('Pedro Oliveira', '567891234', '2023-10-15', '456.789.123-00', 'Rua C, 789', '(33) 3456-7890', 'pedro.oliveira@yahoo.com.br'),
('Ana Rodrigues', '432156789', '2026-01-31', '654.321.987-00', 'Avenida D, 234', '(44) 4567-8901', 'ana.rodrigues@gmail.com'),
('Lucas Souza', '987123456', '2027-07-31', '321.654.987-00', 'Rua E, 567', '(55) 5678-9012', 'lucas.souza@hotmail.com'),
('Camila Almeida', '456789123', '2022-03-01', '987.123.456-00', 'Avenida F, 890', '(66) 6789-0123', 'camila.almeida@yahoo.com.br'),
('Rafael Castro', '789123456', '2025-05-31', '321.987.654-00', 'Rua G, 123', '(77) 7890-1234', 'rafael.castro@gmail.com'),
('Gabriela Silva', '654321789', '2024-12-31', '789.456.123-00', 'Avenida H, 456', '(88) 8901-2345', 'gabriela.silva@hotmail.com'),
('Felipe Oliveira', '123789456', '2023-08-15', '456.123.789-00', 'Rua I, 789', '(99) 9012-3456', 'felipe.oliveira@yahoo.com.br'),
('Juliana Santos', '987456123', '2026-02-28', '654.987.321-00', 'Avenida J, 234', '(00) 1234-5678', 'juliana.santos@gmail.com');



INSERT INTO veiculos (placa, modelo, marca, cor, ano, tipo_combustivel, tipo_cambio, potencia, quilometragem, disponibilidade) VALUES
('ABC1234', 'Gol', 'Volkswagen', 'Preto', 2010, 'Gasolina', 'Manual', 1.0, 100000, 'disponivel'),
('DEF5678', 'Palio', 'Fiat', 'Vermelho', 2015, 'Flex', 'Automático', 1.4, 50000, 'disponivel'),
('GHI9012', 'HB20', 'Hyundai', 'Branco', 2020, 'Flex', 'Manual', 1.6, 20000, 'disponivel'),
('JKL3456', 'Corolla', 'Toyota', 'Prata', 2018, 'Flex', 'Automático', 2.0, 80000, 'alugado'),
('MNO7890', 'Civic', 'Honda', 'Preto', 2015, 'Gasolina', 'Manual', 1.8, 70000, 'disponivel'),
('PQR2345', 'Onix', 'Chevrolet', 'Vermelho', 2017, 'Flex', 'Automático', 1.4, 60000, 'disponivel'),
('STU6789', 'T-Cross', 'Volkswagen', 'Branco', 2021, 'Flex', 'Automático', 1.4, 10000, 'disponivel'),
('VWX0123', 'Uno', 'Fiat', 'Azul', 2012, 'Gasolina', 'Manual', 1.0, 90000, 'disponivel'),
('YZA4567', 'Ranger', 'Ford', 'Preto', 2015, 'Diesel', 'Automático', 3.2, 80000, 'disponivel'),
('BCD8901', 'Compass', 'Jeep', 'Prata', 2020, 'Flex', 'Automático', 2.0, 30000, 'alugado'),
('EFG2345', 'Sandero', 'Renault', 'Azul', 2014, 'Flex', 'Manual', 1.6, 60000, 'disponivel'),
('HIJ6789', 'Strada', 'Fiat', 'Branco', 2016, 'Flex', 'Manual', 1.4, 70000, 'alugado'),
('KLM0123', 'Cruze', 'Chevrolet', 'Preto', 2019, 'Gasolina', 'Automático', 1.4, 40000, 'disponivel'),
('NOP4567', 'S10', 'Chevrolet', 'Vermelho', 2014, 'Diesel', 'Manual', 2.8, 90000, 'disponivel'),
('QRS8901', 'Fusion', 'Ford', 'Prata', 2016, 'Gasolina', 'Automático', 2.5, 80000, 'disponivel');



INSERT INTO locacoes (id_cliente, id_veiculo, data_locacao, valor_total, data_entrega, quilometros_rodados) VALUES 
    (1, 2, '2023-04-10', 500.00, '2023-04-15', 300),
    (1, 7, '2023-04-11', 200.00, '2023-04-13', 120),
    (2, 3, '2023-04-12', 700.00, '2023-04-17', 400),
    (3, 4, '2023-04-13', 800.00, '2023-04-18', 500),
    (3, 8, '2023-04-14', 100.00, '2023-04-15', 60),
    (4, 1, '2023-04-15', 750.00, '2023-04-20', 450),
    (4, 5, '2023-04-16', 250.00, '2023-04-18', 130),
    (4, 9, '2023-04-17', 1000.00, '2023-04-21', 600),
    (5, 6, '2023-04-18', 150.00, '2023-04-19', 80),
    (5, 10, '2023-04-19', 400.00, '2023-04-22', 250),
    (6, 4, '2023-04-20', 500.00, '2023-04-23', 300),
    (7, 3, '2023-04-21', 100.00,  '2023-04-22', 60),
    (7, 9, '2023-04-22', 300.00, '2023-04-24', 180),
    (8, 5, '2023-04-23', 700.00, '2023-04-27', 400),
    (9, 12, '2023-04-24', 800.00, '2023-04-28', 500);



INSERT INTO multas_transito (id_locacao, status_multa, data_multa, gravidade, valor) VALUES
(3, 'passada para condutor', '2023-04-15', 'média', 150.00),
(7, 'pendente', '2023-04-17', 'grave', 350.00),
(15, 'pendente', '2023-04-19', 'leve', 70.00);

INSERT INTO multas_transito (status_multa, data_multa, gravidade, valor) VALUES
('paga', '2023-04-19', 'média', 150.00);



INSERT INTO funcionarios (nome, cpf, telefone, endereco, cargo) VALUES
('João Silva', '123.456.789-10', '(11) 99999-1111', 'Rua A, 123', 'Gerente'),
('Maria Santos', '234.567.890-11', '(11) 99999-2222', 'Rua B, 456', 'Atendente'),
('Pedro Almeida', '345.678.901-12', '(11) 99999-3333', 'Rua C, 789', 'Motorista'),
('Ana Oliveira', '456.789.012-13', '(11) 99999-4444', 'Rua D, 987', 'Atendente'),
('José Costa', '567.890.123-14', '(11) 99999-5555', 'Rua E, 654', 'Gerente');



INSERT INTO pagamento (id_locacao, id_funcionario, tipo_multa, data, valor, status_pagamento) VALUES
    (1, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (2, 2, 'Atraso Devolução', '2022-03-15','100', 'pendente'),
    (2, 2, 'Gasolina', '2022-03-15','150', 'pendente'),
    (2, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (3, 3, 'Seguro Completo', '2022-03-15', '200', 'pendente'),
    (3, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (4, 4, 'Atraso Devolução', '2022-03-15', '100', 'pago'),
    (4, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (5, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (6, 1, 'Seguro Completo', '2022-03-15', '200', 'pago'),
    (6, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (7, 2, 'Gasolina', '2022-03-15', '150', 'pendente'),
    (7, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (8, 3, 'Lavagem', '2022-03-15', '50', 'pendente'),
    (8, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (9, 4, 'Km Livre', '2022-03-15', '100', 'pago'),
    (9, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (10, 5, 'Contudor Jovem', '2022-03-15', '200', 'pago'),
    (10, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (11, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (12, 2, 'Bebê Conforto', '2022-03-15', '50', 'pago'),
    (12, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (13, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (14, 1, 'Calção', '2022-03-15', '1000', 'pago'),
    (15, 1, 'Calção', '2022-03-15', '1000', 'pago');

