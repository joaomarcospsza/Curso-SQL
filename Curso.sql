/** 
eliminando base de dados
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL UNIQUE, -- CONSTRAINT INLINE 'REGRAS NA MSM LINHA'
sigla CHAR(2) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_estado PRIMARY KEY(id),
CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N')) -- CONSTRAINT OU OF LINE 'REGRAS DEFINIDAS FORA DA LINHA DE DEFINIÇÃO DA COLUNA'
);
/**
INSERT INTO estado(id, nome, sigla, ativo, data_cadastro) VALUE('1', 'PARANÁ', 'PR', 'S', '2022-08-30');
INSERT INTO estado(id, nome, sigla, ativo, data_cadastro) VALUE('2', 'GOIAS', 'GO', 'S', '2022-05-30');
INSERT INTO estado(id, nome, sigla, ativo, data_cadastro) VALUE('3', 'MATO GROSSO', 'GO', 'S', '2022-04-30');
*/
INSERT INTO estado (nome, sigla) VALUES ('PARANÁ', 'PR');
INSERT INTO estado (nome, sigla) VALUES ('GOIAS', 'GO');
INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO', 'MT');

SELECT id, nome, sigla, ativo, data_cadastro FROM estado;
