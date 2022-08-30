/** 
eliminando base de dados
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

CREATE TABLE estado(
id INT PRIMARY KEY,
nome VARCHAR(200),
sigla CHAR(2),
ativo CHAR(1),
data_cadastro DATETIME
);

INSERT INTO estado(id, nome, sigla, ativo, data_cadastro) VALUE('1', 'PARANÁ', 'PR', 'S', '2022-08-30');
SELECT id, nome, sigla, ativo, data_cadastro FROM estado;