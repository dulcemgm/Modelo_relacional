CREATE DATABASE control_tienda;
USE control_tienda;

CREATE TABLE productos(
	idProducto INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(45) NOT NULL,
    talle VARCHAR(45) NOT NULL,
    precio DOUBLE NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY(idProducto)
);

CREATE TABLE proveedores (
	idProveedor INT NOT NULL AUTO_INCREMENT,
    nroPuesto INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    codigoPostal INT NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefonoFijo VARCHAR(45) NOT NULL,
    telefonoCelular VARCHAR(45) NOT NULL,
    correo VARCHAR(45) NOT NULL, 
    PRIMARY KEY(idProveedor)
); 

CREATE TABLE codigosPostales(
	idcodigosPostales INT NOT NULL AUTO_INCREMENT,
    localidad VARCHAR(45) NOT NULL,
    proveesornu INT NOT NULL,
    INDEX(proveedornu),
    FOREIGN KEY(proveedornu) REFERENCES proveedores(idProveedor),
    PRIMARY KEY(idcodigosPostales)
);

CREATE TABLE clientes(
	dni VARCHAR(10) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    codigoPostal INT NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefonoFijo VARCHAR(45) NOT NULL,
    telefonoCelular VARCHAR(45) NOT NULL,
    correo VARCHAR(45) NOT NULL,
    codigoId INT NOT NULL,
    INDEX(codigosId),
    FOREIGN KEY(codigosId) REFERENCES codigosPostales(idcodigosPostales),
    PRIMARY KEY(dni)
);

CREATE TABLE ventas(
	idVenta INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    productoId INT NOT NULL,
    INDEX(productoId),
    FOREIGN KEY(productoId) REFERENCES productos(idProducto),
    idcliente INT NOT NULL,
    INDEX(idcliente),
    FOREIGN KEY(idcliente) REFERENCES clientes(dni),
    monto DOUBLE NOT NULL,
    formaPago VARCHAR(45) NOT NULL,
    PRIMARY KEY(idVenta)
);
