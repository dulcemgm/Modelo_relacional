CREATE DATABASE bd_predios;
USE bd_predios;
 
CREATE TABLE usuarios(
    clave VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidoP VARCHAR(50) NOT NULL,
    apellidoM VARCHAR(50) NOT NULL,
    tipo VARCHAR(12) NOT NULL,
    PRIMARY KEY (clave)
);
 
CREATE TABLE inventario(
    idInventario INT NOT NULL AUTO_INCREMENT,
    realizo VARCHAR(50) NOT NULL,
    PRIMARY KEY (idInventario)
);
 
CREATE TABLE predios(
    idPredio INT NOT NULL AUTO_INCREMENT,
    predio VARCHAR(100) NOT NULL,
    zona VARCHAR(50) NOT NULL,
    -- Clave foránea de la tabla inventario
    codigoInventario INT NOT NULL,
    INDEX (codigoInventario),
    FOREIGN KEY (codigoInventario) REFERENCES inventario (idInventario),
    -- fin de la creación de la clave foránea
    PRIMARY KEY (idPredio)
);
 
CREATE TABLE contratos(
    idContrato INT NOT NULL AUTO_INCREMENT,
    contrato VARCHAR(50) NOT NULL,
    -- Agregar clave foránea de la tabla predios
    codigoPredio INT NOT NULL,
    INDEX (codigoPredio),
    FOREIGN KEY (codigoPredio) REFERENCES predios (idPredio),
    -- Fin de la creación de la clave foránea
    PRIMARY KEY (idContrato)
);
 
CREATE TABLE orden(
    idOrden INT NOT NULL AUTO_INCREMENT,
    anioPlanta INT NOT NULL,
    superficie FLOAT NOT NULL,
    bloque INT NOT NULL,
    -- Agregar clave foránea de la tabla contratos
    codigoContrato INT NOT NULL,
    INDEX (codigoContrato),
    FOREIGN KEY (codigoContrato) REFERENCES contratos (idContrato),
    -- Fin de la creación de la clave foránea
    PRIMARY KEY (idOrden)
);
 
CREATE TABLE sitios(
    idSitio INT NOT NULL AUTO_INCREMENT,
    sitio INT NOT NULL,
    -- Clave foránea de la tabla orden
    codigoOrden INT NOT NULL,
    INDEX (codigoOrden),
    FOREIGN KEY (codigoOrden) REFERENCES orden (idOrden),
    -- Fin de la creación de la clave foránea
    PRIMARY KEY (idSitio)
);

CREATE TABLE arboles(
	idArbol INT NOT NULL AUTO_INCREMENT,
    fuente VARCHAR(30) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    edad REAL NOT NULL,
    numArbol INT NOT NULL,
    diametro REAL NOT NULL,
    artura REAL NOT NULL,
    -- Clave foránea de la tabla orden
    codigoSitio INT NOT NULL,
    INDEX(codigoSitio),
    FOREIGN KEY (codigoSitio) REFERENCES sitios (idSitio),
    -- Fin de la creación de la clave foránea
    fechaplan INT NOT NULL,
    PRIMARY KEY (idArbol)
);