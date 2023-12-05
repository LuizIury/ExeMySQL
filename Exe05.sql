CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes(
id BIGINT AUTO_INCREMENT,
lugar VARCHAR(25) NOT NULL,
tipo VARCHAR(25) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_classes;

CREATE TABLE tb_personagens(
id BIGINT AUTO_INCREMENT,
Nome VARCHAR(30),
PoderDeAtaque INT,
PoderDeDefesa INT,
TipoDeDano VARCHAR(30),
classes_id BIGINT,
PRIMARY KEY (id),
FOREIGN KEY (classes_id) REFERENCES tb_classes(id)
);

SELECT * FROM tb_personagens;

INSERT INTO tb_classes (lugar, tipo)
VALUES ("Demacia","Reino"),
("Freljord","Geleira"),
("Shurima","Deserto"),
("Vazio","Limbo"),
("Zaun","Cidade");

INSERT INTO tb_personagens (nome, PoderDeAtaque, PoderDeDefesa, TipoDeDano, classes_id)
VALUES ("Lucian", 1800, 800, "AD", 1),
("Lux", 4000, 1000, "AP", 2),
("Garen", 3000, 4500, "AD", 1),
("Quinn", 1750, 600, "AD", 2),
("Vel'Koz", 8000, 500, "AP", 5),
("Kassadin", 800, 2500, "AP", 3),
("Kai'Sa", 4000, 350, "AP/AD", 4),
("Kha'Zix", 7000, 1300, "AD", 3);

SELECT nome, PoderDeAtaque, PoderDeDefesa, tb_classes.lugar
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.classes_id = tb_classes.id
WHERE tb_classes.lugar = "Demacia"

