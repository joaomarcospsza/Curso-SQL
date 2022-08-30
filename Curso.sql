/** 
eliminando base de dados
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY,
nome VARCHAR(200) NOT NULL UNIQUE,
sigla CHAR(2) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL,
data_cadastro DATETIME,
CHECK (ativo IN('S', 'N'))
);

INSERT INTO estado(id, nome, sigla, ativo, data_cadastro) VALUE('1', 'PARANÁ', 'PR', 'S', '2022-08-30');
INSERT INTO estado(id, nome, sigla, ativo, data_cadastro) VALUE('2', 'GOIAS', 'GO', 'S', '2022-05-30');
INSERT INTO estado(id, nome, sigla, ativo, data_cadastro) VALUE('3', 'MATO GROSSO', 'MT', 'S', '2022-04-30');
SELECT id, nome, sigla, ativo, data_cadastro FROM estado;
