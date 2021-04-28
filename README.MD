# COMANDOS PARA CRIAÇÃO DAS TABELAS:

```
$ docker ps

    id_mysql_image    mysql:5.7

$ docker exec -it id_mysql_image /bin/sh

$ mysql -u root -p
bcd127


CREATE DATABASE IF NOT EXISTS project;

USE project;

CREATE TABLE IF NOT EXISTS funcionario(
    id int not null auto_increment primary key,
    nome varchar(30),
    age_nasc date,
    createdAt date,
    updatedAt date
);

CREATE TABLE IF NOT EXISTS canteiro(
    id int not null auto_increment primary key,
    nome varchar(30),
    daily_ligth varchar(10),
    daily_whater varchar(10),
    createdAt date,
    updatedAt date
);

CREATE TABLE IF NOT EXISTS planta(
    id int not null auto_increment primary key,
    nome varchar(30),
    daily_ligth varchar(10),
    agua varchar(10),
    peso varchar(10),
    createdAt date,
    updatedAt date
);

CREATE TABLE IF NOT EXISTS colhido(
    id int not null auto_increment primary key,
    data date,
    quantidade int,
    peso varchar(10),
    planta_id int,
    funcionario_id int,
    canteiro_id int,
    CONSTRAINT FK_PLANTA_COLHIDA foreign key(planta_id) REFERENCES planta(id),
    CONSTRAINT FK_funcionario_colheu foreign key(funcionario_id) REFERENCES funcionario(id),
    CONSTRAINT FK_CANTEIRO_COLHIDO foreign key(canteiro_id) REFERENCES canteiro(id),
    createdAt date,
    updatedAt date
);

CREATE TABLE IF NOT EXISTS plantio(
    id int not null auto_increment primary key,
    data date,
    sementes int,
    planta_id int,
    funcionario_id int,
    canteiro_id int,
    CONSTRAINT FK_PLANTA_plantada foreign key(planta_id) REFERENCES planta(id),
    CONSTRAINT FK_funcionario_plantou foreign key(funcionario_id) REFERENCES funcionario(id),
    CONSTRAINT FK_CANTEIRO_plantou foreign key(canteiro_id) REFERENCES canteiro(id),
    createdAt date,
    updatedAt date
);

```