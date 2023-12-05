CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes(
id BIGINT AUTO_INCREMENT,
lugar VARCHAR(25) NOT NULL,
tipo VARCHAR(25) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_classes;

ALTER TABLE tb_classes RENAME COLUMN tipo TO sexo;

CREATE TABLE tb_personagens(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(30),
PoderDeAtaque DECIMAL(6,2),
PoderDeDefesa DECIMAL(6,2),
TipoDeDano DECIMAL(5,2),
classes_id BIGINT,
PRIMARY KEY (id),
FOREIGN KEY (classes_id) REFERENCES tb_classes(id)
);

ALTER TABLE tb_personagens MODIFY COLUMN TipoDeDano VARCHAR(30);

SELECT * FROM tb_personagens;

INSERT INTO tb_classes (lugar, tipo)
VALUES ("Demacia","Masculino"),
("Demacia","Feminino"),
("Vazio","Masculino"),
("Vazio","Feminino"),
("Vazio","Indefinido");

INSERT INTO tb_personagens (nome, PoderDeAtaque, PoderDeDefesa, TipoDeDano, classes_id)
VALUES ("Lucian", 1800, 800, "AD", 1),
("Lux", 4000, 1000, "AP", 2),
("Garen", 3000, 4500, "AD", 1),
("Quinn", 1750, 600, "AD", 2),
("Vel'Koz", 8000, 500, "AP", 5),
("Kassadin", 800, 2500, "AP", 3),
("Kai'Sa", 4000, 350, "AP/AD", 4),
("Kha'Zix", 7000, 1300, "AD", 3);

UPDATE tb_personagens SET PoderDeAtaque = 1800 WHERE Id = 1;
UPDATE tb_personagens SET PoderDeAtaque = 600 WHERE Id = 4;

SELECT * FROM tb_personagens WHERE PoderDeDefesa BETWEEN 1000 AND 2000;
