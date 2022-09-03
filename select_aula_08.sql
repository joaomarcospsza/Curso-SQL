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
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

-- inserindo estados
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SÃO PAULO','SP','S','2015-10-31');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARANÁ','PR','S','2015-2-25');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MATO GROSSO','MT','N','2015-12-02');

-- inserindo cidades
INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',1);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',2);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);


SELECT cidade.nome, estado.sigla FROM estado, cidade WHERE estado.id = cidade.id;
SELECT cidade.nome, estado.sigla FROM estado, cidade WHERE estado.id = cidade.estado_id;
/*
-- JOIN Padrão SQL 89
SELECT 	*
FROM estado, cidade; 

-- JOIN Padrão SQL 92
SELECT *
FROM estado
JOIN cidade ON cidade.estado_id = estado.id;

/*
Para apresentar o resultado correto no JOIN 
precisamos definir o condição de junção
que seria comparando a FK com a Pk da tabela correta
no nosso, exemplo, precismoas conidcionar a junção da cidade com estado para registros que tem a referência do estado igual ao identificador do estado 
no caso → cidade.estado_id = estado.id

-- SQL 89 → AGORA AS INFORMAÇÕES ESTÃO CORRETAS
SELECT 	*
FROM estado, cidade
WHERE cidade.estado_id = estado.id;

-- SQL 92 → AGORA AS INFORMAÇÕES ESTÃO CORRETAS
SELECT *
FROM estado
JOIN cidade ON cidade.estado_id = estado.id;

/*
Podemos especificar colunas
-- SQL 89
SELECT 	
	cidade.id 'ID CIDADE'
    ,cidade.nome 'NOME CIDADE'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado, cidade
WHERE cidade.estado_id = estado.id;

-- SQL 92
SELECT 
	cidade.id 'ID CIDADE'
    ,cidade.nome 'NOME CIDADE'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado
JOIN cidade ON cidade.estado_id = estado.id;

/*
Para colunas que possuem nomes iguais em ambas tabelas (id, nome), somos obrigados a especificar a tabela 
SELECT 	
	id  -- esta consulta gera erro, pois o BD não irá saber qual id apresentar (estado? cidade?)
    ,cidade.nome 'NOME CIDADE'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado, cidade
WHERE cidade.estado_id = estado.id;


Podemos adicionar filtros
-- SQL 89
SELECT 	
	cidade.id 'ID CIDADE'
    ,cidade.nome 'NOME CIDADE'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado, cidade
WHERE cidade.estado_id = estado.id
	AND estado.nome = 'PARANÁ';
-- SQL 92
SELECT 
	cidade.id 'ID CIDADE'
    ,cidade.nome 'NOME CIDADE'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado
JOIN cidade ON cidade.estado_id = estado.id 
WHERE estado.nome = 'PARANÁ';
*/

/*
Responda as questões:
01 - O que é JOIN? Quando é necessário?
JOIN e um comando que serve para cobinar as colunas de uma ou mais tabelas de um banco de dados.

02 - Qual a sintaxe do JOIN? Maiúscula ou minúscula faz diferença? Existe algum padrão? Explique.
O JOIN possui duas sintaxes diferentes 89 e 92, as letras maiúscula ou minúscula tem diferença apenas na padronização da sua empresa.

04 - O que é primordial para que o resultado tenha sentido em consultas com JOIN? Explique.
Para apresentar o resultado correto no JOIN precisamos definir o condição de junção

/**
Lista de exercícios - JOIN 

Responda as questões:
01 - O que é JOIN? Quando é necessário?
JOIN e um comando que serve para cobinar as colunas de uma ou mais tabelas de um banco de dados.

02 - Qual a sintaxe do JOIN? Maiúscula ou minúscula faz diferença? Existe algum padrão? Explique.
O JOIN possui dois padrões o  89 e 92.
No banco de dados não a difereça de maiúscula ou muniscula, porém e recomendado que se adote o padrão da empresa em que trabalha ou crie um proprio caso a empresa não tenha um.

04 - O que é primordial para que o resultado tenha sentido em consultas com JOIN? Explique.
Para apresentar o resultado correto no JOIN precisamos definir o condição de junção

05 - Existe mais de uma maneira de realizar o JOIN? Quantas? Qual é a mais eficiente? 
sim, os formatos padrão 89 e o 92, não a diferença entre os dois.
06 - Para realizar o JOIN de 1523 tabelas, quantas comparações de junções são necessárias? Explique.
1522.

07 - O que é análise semântica e de sintaxe? Qual a diferença? Para que serve?
A sintaxe e a forma correta de um comando.
Já a semantica e o resultado desejado por aquele comando.

08 - Em uma consulta com JOIN, há casos em que seja necessário atribuir o nome da tabela na projeção das colunas? Explique.


09 - De acordo com o estudo de caso, cite 4 exemplos em que seja possível utilizar o JOIN e 3 exemplos que não seja possível realizar o JOIN.


Conforme o estudo de caso, elabore as consultas solicitadas abaixo:
obs: Para cada questão utilize o padrão SQL89 e SQL92

*/

-- 01 - Liste o id e o nome de todas as cidades e as respectivas siglas do estado. */
-- SQL89
SELECT cidade.id, cidade.nome, sigla FROM cidade, estado WHERE estado.id = estado_id;
-- SQL92
SELECT cidade.id, cidade.nome, sigla FROM estado INNER JOIN cidade ON estado.id = estado_id;

/* 02 - Em relação ao resultado do exercício anterior, note que os nomes das colunas não estão claras. Refaça o comando para que torne mais claras. */
-- SQL89
SELECT cidade.id 'código cidade' , cidade.nome 'nome cidade' ,sigla 'sigla estado' FROM cidade, estado WHERE estado.id = estado_id;
-- SQL92
SELECT cidade.id 'código cidade', cidade.nome 'nome cidade', sigla 'sigla estado' FROM estado INNER JOIN cidade ON estado.id = estado_id;

/* 03 - Refaça o exercício anterior atribuindo o nome completo da tabela em todos os atributos. */
-- SQL89
SELECT cidade.id 'código cidade', cidade.nome 'nome cidade', estado.sigla 'sigla estado' FROM cidade, estado WHERE estado.id = cidade.estado_id;
-- SQL92
SELECT cidade.id 'código cidade', cidade.nome 'nome cidade', estado.sigla 'sigla estado' FROM estado INNER JOIN cidade ON estado.id = cidade.estado_id;

/* 04 - Refaça o exercício anterior definindo o apelido na tabela. */
-- SQL89
SELECT c.id 'código cidade', c.nome 'nome cidade', e.sigla 'sigla estado' FROM cidade c, estado e WHERE e.id = c.estado_id;
-- SQL92
SELECT c.id 'código cidade', c.nome 'nome cidade', e.sigla 'sigla estado' FROM estado e INNER JOIN cidade c ON e.id = c.estado_id;