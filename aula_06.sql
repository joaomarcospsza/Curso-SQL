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

CREATE TABLE cidade (				-- criando a tabela cidade
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

-- inserindo estados
INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR');
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');
INSERT INTO estado (nome,sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado (nome,sigla) VALUES ('RIO GRANDE DO SUL','RS');

-- inserindo cidades
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

-- COMANDOS 'UPDATE'
UPDATE estado SET nome = 'PARANA' WHERE id = 1;
UPDATE estado SET nome = 'PARANÁ', ativo = 'S' WHERE id = 1;
UPDATE estado SET nome = 'Parana', ativo = 'N', data_cadastro = '2022-09-02' WHERE id = 1;
UPDATE estado SET data_cadastro = CURRENT_TIMESTAMP WHERE id = 1;
UPDATE estado SET nome = 'PARANÁ', data_cadastro = DEFAULT WHERE id = 1;
UPDATE estado SET nome = 'PARANA' WHERE id = 1; 			
UPDATE estado SET nome = 'PARANA' WHERE nome = 'PARANÁ';
UPDATE estado SET nome = 'PARANA' WHERE sigla = 'PR';
UPDATE estado SET ativo = 'S';
UPDATE cidade SET ativo = 'S' WHERE estado_id = 3;


-- COMANDOS 'DELETE '
DELETE FROM cidade WHERE id = 1;
DELETE FROM cidade WHERE estado_id = 1;
DELETE FROM cidade;


SELECT * FROM estado;
SELECT * FROM cidade;





















