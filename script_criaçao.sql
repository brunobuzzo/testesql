create database Locadora

go

use locadora;

go

create schema aluguel

go

create table aluguel.cliente(
NOME VARCHAR (255),
codigocliente int identity (1,1),
CPF TINYINT NOT NULL,
RG TINYINT NOT NULL,
UF  CHAR(2) NOT NULL,
DATANASC DATE,
EMAIL CHAR(100),
NUMCNH TINYINT,
CONSTRAINT PKCODIGO PRIMARY KEY (codigocliente),
CONSTRAINT UQCLIENTE UNIQUE (codigocliente, CPF),
CONSTRAINT UQ_RG UNIQUE (RG,UF)
);

create table aluguel.tipo_veiculo(
codigotipoveiculo int identity (5,5) PRIMARY KEY,
descricao varchar (75) not null,
CONSTRAINT UQTIPO_ALUGUEL UNIQUE (codigotipoveiculo)
);

create table aluguel.veiculo(
placa varchar (7) not null,
numchassi varchar (50) not null,
ano int not null,
km int not null,
datacompra date,
IDTIPO INT NOT NULL,
CONSTRAINT PKPLACA PRIMARY KEY (placa),
CONSTRAINT UQPLACA UNIQUE (placa, numchassi),
CONSTRAINT PKTIPO FOREIGN KEY (IDTIPO) REFERENCES aluguel.tipo_veiculo (codigotipoveiculo),
);

create table aluguel.aluga_carro(
datainicio date,
datafim date,
kminicio tinyint,
kmfim tinyint,
idcliente INT,
idplaca varchar (7), 
CONSTRAINT PKCLIENTE FOREIGN KEY (idcliente) REFERENCES aluguel.cliente (codigocliente),
CONSTRAINT PKVEICULO FOREIGN KEY (idplaca) references aluguel.veiculo (placa),
);


