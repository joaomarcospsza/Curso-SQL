DROP DATABASE IF EXISTS aula_banco; 
CREATE DATABASE aula_banco;
USE aula_banco;
CREATE TABLE estado( 
id INT NOT NULL AUTO_INCREMENT 
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE 
,ativo ENUM('S','N') NOT NULL DEFAULT 'S' 
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
,CONSTRAINT pk_estado PRIMARY KEY (id)  
); 
CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT 
,nome VARCHAR(200) NOT NULL 
,ativo ENUM('S','N') NOT NULL DEFAULT 'S' 
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id) 
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id) 
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id) 
); 

INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARANÁ','PR','S','2015-2-25'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SÃO PAULO','SP','S','2015-10-31');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MATO GROSSO','MT','N','2015-12-02');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SANTA CATARINA','SC','S','2016-08-13'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO GRANDE DO SUL','RS','N','2016-08-30'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ACRE','AC','N','2017-01-22'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('TOCANTINS','TO','S','2018-03-01'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ALAGOAS','AL','N','2018-04-25'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SERGIPE','SE','N','2019-03-12'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARÁ','PA','S','2019-03-15'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RORAIMA','RO','S','2019-04-04'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('DISTRITO FEDERAL','DF','N','2019-10-26'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('BAHIA','BA','N','2020-4-03'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PIAUÍ','PI','S','2020-6-13'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ESPÍRITO SANTO','ES','N','2020-6-15'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO DE JANEIRO','RJ','S','2020-7-18'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MARANHÃO','MA','S','2020-8-22'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('CEARÁ','CE','S','2020-9-16'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO GRANDE DO NORTE','RN','N','2020-9-20'); 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('GOIÁS','GO','S','2020-10-19'); 

INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',2); 
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1); 
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2); 
INSERT INTO cidade (nome, estado_id) VALUES ('CAMPINAS',2); 
INSERT INTO cidade (nome, estado_id) VALUES ('FLORIANÓPOLIS',4); 
INSERT INTO cidade (nome, estado_id) VALUES ('PARANAVAÍ',1); 
INSERT INTO cidade (nome, estado_id) VALUES ('CUIABA',3); 
INSERT INTO cidade (nome, estado_id) VALUES ('BALNEÁRIO CAMBORIÚ',4); 
INSERT INTO cidade (nome, estado_id) VALUES ('LONDRINA',1); 
INSERT INTO cidade (nome, estado_id) VALUES ('CASCAVEL',1); 
INSERT INTO cidade (nome, estado_id) VALUES ('JOINVILLE',4); 
INSERT INTO cidade (nome, estado_id) VALUES ('PORTO ALEGRE',5); 
INSERT INTO cidade (nome, estado_id) VALUES ('BLUMENAL',4); 
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3); 
INSERT INTO cidade (nome, estado_id) VALUES ('CHAPECÓ',4); 
INSERT INTO cidade (nome, estado_id) VALUES ('ITAJAÍ',4);

-- EXERCICIOS DE INSERT
-- 1. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. */
INSERT INTO estado(id,nome, sigla, ativo, data_cadastro) VALUE (NULL,'PARANÁ','PR','S','2015-2-25');
INSERT INTO estado(id,nome, sigla, ativo, data_cadastro) VALUE (NULL, 'MARANHÃO', 'TA', 'S', '2022-09-02');
INSERT INTO estado(id,nome, sigla, ativo, data_cadastro) VALUE (NULL, 'PARÁ', 'PA', 'S', '2022-09-02');
-- 2. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 
INSERT INTO estado(nome, sigla, ativo, data_cadastro) VALUES ('SÃO PAULO', 'ME', 'N', '2022-09-02');
INSERT INTO estado(nome, sigla, ativo, data_cadastro) VALUES ('RORAIMA', 'JT', 'S', '2022-09-02');

-- EXERCICIOS DE UPDATE e DELETE
-- 3.	Escreva o comando para alterar o valor de uma coluna de um único registro de uma tabela utilizando como filtro, o Primary Key.
UPDATE estado SET sigla = 'PT' WHERE id = 1;
-- 4.	Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM estado WHERE nome = 'PARANÁ';

-- EXERCICIOS DE SELECTS
-- 5.	Escreva o comando para seleccionar todos os registros da tabela cidade com todas as colunas.
SELECT * FROM estado;
-- 6.	Escreva o comando para seleccionar o nome de todos os registros da tabela cidade.
SELECT nome FROM estado;

