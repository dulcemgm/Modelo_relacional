CREATE DATABASE proyecto;
USE proyecto;

CREATE TABLE activationes(
	code VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    nick VARCHAR(45) NOT NULL,
    PRIMARY KEY(code)
);

CREATE TABLE ususarios(
	id_user INT NOT NULL AUTO_INCREMENT,
	nom_user VARCHAR(100) NOT NULL,
    pass_user VARCHAR(45) NOT NULL,
    level  VARCHAR(45) NOT NULL,
    nombre  VARCHAR(100) NOT NULL,
    apell_user  VARCHAR(100) NOT NULL,
    email_user  VARCHAR(45) NOT NULL,
    active  VARCHAR(10) NOT NULL,
    activationesId VARCHAR(100) NOT NULL,
    INDEX(activationesId),
    FOREIGN KEY(activationesId) REFERENCES  activationes(code),
    PRIMARY KEY(id_user)
);
CREATE TABLE asignador_codigo(
	codigo VARCHAR(45) NOT NULL,
    PRIMARY KEY(codigo)
);

CREATE TABLE objetivos(
	cod_empr VARCHAR(45) NOT NULL,
    objgen VARCHAR(500) NOT NULL,
    obj1 VARCHAR(500) NOT NULL,
    obj2 VARCHAR(500) NOT NULL,
    obj3 VARCHAR(500) NOT NULL,
    obj4 VARCHAR(500) NOT NULL,
    PRIMARY KEY(cod_empr)
);

CREATE TABLE 


