CREATE DATABASE db_cidade_dos_vegetais;

USE db_cidade_dos_vegetais;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
tipo VARCHAR(200) NOT NULL,
descricao VARCHAR(200) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
dataValidade DATE NOT NULL,
preco DECIMAL(5,2) NOT NULL,
categoria_id BIGINT,
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Frutas","Deliciosas Frutas"),
("Legumes","Deliciosos Legumes"),
("Vegetais","Deliciosos Vegetais"),
("Verduras","Deliciosas Verduras"),
("Outros","O que é isso!");

INSERT INTO tb_produtos (nome, dataValidade, preco, categoria_id)
VALUES ("Maça", "2022-03-07", 1.99, 1),
("Banana", "2022-03-07", 1.25, 1),
("Couve", "2022-09-18", 2.00, 4),
("Cenoura", "2023-10-24", 3.50, 2),
("Batata", "2023-10-24", 3.00, 2),
("Umbu", "2022-03-07", 5.00, 1),
("Rabanete", "2023-10-24", 14.00, 3),
("Pepino", "2023-10-24", 14.50, 3);


-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT nome, dataValidade, preco, categoria_id 
FROM tb_produtos											
INNER JOIN tb_categorias 								
ON tb_produtos.categoria_id = tb_categorias.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
SELECT nome, tb_categorias.tipo
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = "Frutas";