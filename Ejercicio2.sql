CREATE DATABASE dt_cliente;
USE dt_cliente;

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	fecha_nacimineto DATE NOT NULL,
	telefono VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE modo_pago (
	num_pago INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    otros_detalles VARCHAR(50) NOT NULL,
    PRIMARY KEY(num_pago)
);

CREATE TABLE categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE producto(
	idProducto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio FLOAT NOT NULL,
    stock INT NOT NULL,
    categoriaId INT NOT NULL,
    INDEX(categoriaId),
    FOREIGN KEY(categoriaId) REFERENCES categoria (id_categoria),
    PRIMARY KEY(idProducto)
);

CREATE TABLE factura(
	num_factura INT NOT NULL AUTO_INCREMENT,
    clienteId INT NOT NULL,
    INDEX( clienteId),
    FOREIGN KEY( clienteId) REFERENCES cliente(id_cliente),
    fecha DATETIME NOT NULL,
    idpago INT NOT NULL,
    INDEX(idpago),
    FOREIGN KEY(idpago) REFERENCES modo_pago(num_pago),
    PRIMARY KEY(num_factura)
);

CREATE TABLE detalle(
	num_detalle INT NOT NULL AUTO_INCREMENT,
    id_factura INT NOT NULL AUTO_INCREMENT,
    id_productor INT NOT NULL AUTO_INCREMENT,
    productoId INT NOT NULL,
    INDEX(productoId),
    FOREIGN KEY(productoId) REFERENCES producto(idProducto),
    cantidad INT NOT NULL,
    precio FLOAT NOT NULL,
    facturaId INT NOT NULL,
    INDEX(facturaId),
    FOREIGN KEY(facturaId) REFERENCES factura(num_factura),
    PRIMARY KEY(num_detalle, id_factura)
    
);


