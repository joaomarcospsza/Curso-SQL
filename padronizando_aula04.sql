/** 
eliminando base de dados
só executa se existir
*/

DROP DATABASE IF EXISTS aula_banco; 	-- eliminando aula_banco
CREATE DATABASE aula_banco;				-- criando aula_banco
USE aula_banco;							-- selecionando aula_banco

DROP TABLE IF EXISTS estado;

-- criando tabela estado -- 
CREATE TABLE estado(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL UNIQUE, -- constraint inline - regras na mesma linha
sigla CHAR(2) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_estado PRIMARY KEY(id),
CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N')) -- constraint off line - regras definidas fora da linha de coluna
);

-- criando tabela cidade -- 
CREATE TABLE cidade(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
estado_id INT NOT NULL,
CONSTRAINT pk_cidade PRIMARY KEY (id),
CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id),
CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN('S','N')),
CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

-- inserindo dados na tabela estado -- 
INSERT INTO estado (nome, sigla, ativo) VALUES ('PARANÁ', 'PR', 'N');
INSERT INTO estado (nome, sigla) VALUES ('GOIAS', 'GO');
INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO', 'MT');

-- inserindo dados na tabela cidade -- 
INSERT INTO cidade(nome, estado_id) VALUES ('CURITIBA', '1');
INSERT INTO cidade(nome, estado_id) VALUES ('GOIANIA', '2');
INSERT INTO cidade(nome, estado_id) VALUES ('DOURADO', '3');

-- selecionando tabelas -- 
SELECT * FROM estado;
SELECT * FROM cidade;