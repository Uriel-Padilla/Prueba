create database Tienda;

CREATE TABLE PROVEEDORES(
NOMBRE varchar(20),
DIRECCION varchar(60),
TELEFONO varchar(10),
ID_PROVEEDOR varchar(10) primary key);

CREATE TABLE CATEGORIAS(
ID_CATEGORIA varchar(10) primary key,
DESCRIPCION varchar(100));

CREATE TABLE CLIENTES(
NOMBRE varchar(20),
DIRECCION varchar(60),
TELEFONO varchar(10),
ID_CLIENTE varchar(10) primary key);

CREATE TABLE FACTURAS(
ID_FACTURA varchar(10) primary key,
FECHA Date,
Foreign key(Id_cliente) references CLIENTES(ID_CLIENTE));



