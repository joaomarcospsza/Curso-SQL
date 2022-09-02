/*
SELECT - script videoaula (https://www.youtube.com/watch?v=ZjE9pY_ML6Q)
*/
DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco 
CREATE DATABASE aula_banco; -- criar aula_banco 
USE aula_banco; -- selecionar aula_banco 
CREATE TABLE estado( -- criando a tabela estado 
id INT NOT NULL AUTO_INCREMENT 
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE 
,ativo ENUM('S','N') NOT NULL DEFAULT 'S' 
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
,CONSTRAINT pk_estado PRIMARY KEY (id)  
); 
CREATE TABLE cidade ( -- criando a tabela cidade 
id INT NOT NULL AUTO_INCREMENT 
,nome VARCHAR(200) NOT NULL 
,ativo ENUM('S','N') NOT NULL DEFAULT 'S' 
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id) 
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id) 
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id) 
); 

CREATE TABLE cliente(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(250) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
telefone INT(20) NOT NULL,
contato VARCHAR(200) NOT NULL,
ativo ENUM('S', 'N') NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
cidade_id INT NOT NULL,
CONSTRAINT pk_cliente PRIMARY KEY (id),
CONSTRAINT fk_cliente_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);

-- inserindo estados 
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARANÁ','PR','S','2015-2-25'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SÃO PAULO','SP','S','2015-10-31'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MATO GROSSO','MT','N','2015-12-02'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SANTA CATARINA','SC','S','2016-08-13'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO GRANDE DO SUL','RS','N','2016-08-30'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ACRE','AC','N','2017-01-22'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('TOCANTINS','TO','S','2018-03-01'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ALAGOAS','AL','N','2018-04-25'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SERGIPE','SE','N','2019-03-12'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARÁ','PA','S','2019-03-15'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RORAIMA','RO','S','2019-04-04'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('DISTRITO FEDERAL','DF','N','2019-10-26'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('BAHIA','BA','N','2020-4-03'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PIAUÍ','PI','S','2020-6-13'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('ESPÍRITO SANTO','ES','N','2020-6-15'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO DE JANEIRO','RJ','S','2020-7-18'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MARANHÃO','MA','S','2020-8-22'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('CEARÁ','CE','S','2020-9-16'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('RIO GRANDE DO NORTE','RN','N','2020-9-20'); INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('GOIÁS','GO','S','2020-10-19'); 
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

/*
INSERT -Lista Exercício 
Caso queira fazer na prática, execute o script do link: https://github.com/heliokamakawa/curso_bd/blob/master/05a-SELECT%20-%20script%20aula.sql
*/

-- 1) Escreva o comando para inserir um registro da tabela estado com todas as colunas. 
-- INSERT INTO estado VALUES (NULL,'ACRE','AC','S','2021-05-01'); 
/* 
Como id é um campo com auto incremento, definimos NULL no comando.
Como estamos inserindo todas as colunas não precisamos informar a descrição das colunas. 
Porém, devemos informar os dados na sequência correta 
**/ 

-- 2) Escreva o comando para inserir um registro da tabela estado, definindo todos os dados, exceto a  chave primária que é auto incremento.  
-- INSERT INTO estado (nome,sigla,ativo,data_cadastro) 
-- VALUES ('ALAGOAS','AL','S','2021-05-02'); 
-- Como não estamos informando todos os dados, é necessário especificar de quais colunas são 

-- 3) Escreva o comando para inserir um registro da tabela estado, definindo somente os dados  necessários.  
-- INSERT INTO estado (nome,sigla) VALUES ('AMAPÁ','AP'); 
/** 
id → não precisa informar porque é auto incremento  
ativo e data_cadastro → não precisa informar porque possui o valor padrão  
**/ 

-- 4) Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
-- O registro de uma cidade requer a referência do estado (cidade é dependente  do estado). Assim, é necessário, primeiro, fazer a inserção dos estados. 
-- INSERT INTO cidade (id,nome,estado_id,ativo,data_cadastro) VALUES (NULL, 'ACRELANDIA',1,'S','2021-04-28'); 
-- INSERT INTO cidade (nome,estado_id,ativo,data_cadastro) VALUES ('ASSIS  BRASIL',1,'S','2021-03-14'); 
-- INSERT INTO cidade (nome,estado_id) VALUES ('BRASILEIA',1);

/*
AGORA É A SUA VEZ!!!! Para que você aprenda, é muito importante que não copie e cole,  digite os comandos e mentalize o que está fazendo na medida que digita cada comando. Uma dica  importante é que você digite primeiro no bloco de notas, com intuito de testar se realmente  consegue digitar os comandos sem a ajuda do IDE – depois teste os comandos. 
5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. */
INSERT INTO estado(id,nome, sigla, ativo, data_cadastro) VALUE (NULL, 'Terra', 'TR', 'N', '2022-09-02');
INSERT INTO estado(id,nome, sigla, ativo, data_cadastro) VALUE (NULL, 'Terra2', 'TA', 'S', '2022-09-02');
INSERT INTO estado(id,nome, sigla, ativo, data_cadastro) VALUE (NULL, 'Terra3', 'TE', 'N', '2022-09-02');
-- 6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 
INSERT INTO estado(nome, sigla, ativo, data_cadastro) VALUES ('Marte', 'ME', 'N', '2022-09-02');
INSERT INTO estado(nome, sigla, ativo, data_cadastro) VALUES ('Jupiter', 'JT', 'S', '2022-09-02');
-- 7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários. 
INSERT INTO estado(nome,sigla) VALUES ('CATARINA', 'CT');
INSERT INTO estado(nome,sigla) VALUES ('QUAKE', 'QK');
-- 8. Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.
INSERT INTO cidade (id,nome,estado_id,ativo,data_cadastro) VALUES (NULL, 'Sao tome',2,'N','2022-09-02'); 
INSERT INTO cidade (nome,estado_id,ativo,data_cadastro) VALUES ('Brasilzinho',1,'S','2022-09-02'); 
INSERT INTO cidade (nome,estado_id) VALUES ('Brasilzão',1);
-- 9. Faça a inserção de 2 registros de cliente. 
INSERT INTO cliente(nome, CPF, telefone, contato, cidade_id) VALUES ('Jão', '98748765450', '4564855', 'jão@gmail.com', '1');
INSERT INTO cliente(nome, CPF, telefone, contato, cidade_id) VALUES ('Marcola', '75895614250', '8759658', 'Marcola@gmail.com', '2');
-- 10. DESAFIO!!! Tente fazer todas as inserções necessárias para que se tenha um item de caixa. Na medida  que esteja digitando o código, tente associar os dados inseridos com o contexto real.
