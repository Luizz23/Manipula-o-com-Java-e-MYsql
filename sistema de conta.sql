create database manijava;

use manijava;

CREATE TABLE usuario (
    id_usuario int PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT chk_cpf CHECK (LENGTH(cpf) = 11) -- CPF deve ter 11 caracteres
);

drop table usuario;
select * from usuario;

insert into usuario values
(default, "Luiz", "Fab23@gmail.com", "1198355733", "56073888890");


CREATE TABLE conta (
    id_conta int PRIMARY KEY auto_increment,
    id_usuario int,
    saldo float(10, 2) NOT NULL,
    tipo_conta VARCHAR(20),
    CONSTRAINT fk_usuario_conta FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT chk_saldo CHECK (saldo >= 0) -- Saldo não pode ser negativo
);
select *from conta;




CREATE TABLE receitas (
    id_receita int PRIMARY KEY,
    id_usuario int,
    descricao VARCHAR(255),
    valor float(10, 2),
    data_recebimento DATE,
    CONSTRAINT fk_usuario_receitas FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT chk_valor_receita CHECK (valor > 0) -- Valor da receita deve ser positivo
);

CREATE TABLE despesas (
    id_despesa int PRIMARY KEY,
    id_usuario int,
    descricao VARCHAR(255),
    valor float(10, 2),
    data_pagamento DATE,
    CONSTRAINT fk_usuario_despesas FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT chk_valor_despesa CHECK (valor > 0) -- Valor da despesa deve ser positivo
);

CREATE TABLE investimentos (
    id_investimento int PRIMARY KEY,
    id_usuario int,
    tipo_investimento VARCHAR(50),
    valor float(10, 2),
    data_investimento DATE,
    CONSTRAINT fk_usuario_investimentos FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT chk_valor_investimento CHECK (valor > 0) -- Valor do investimento deve ser positivo
);



