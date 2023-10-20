drop database if exists ud14_ejercicio05;
create database if not exists ud14_ejercicio05;
use ud14_ejercicio05;

CREATE TABLE almacen (
    codigo INT PRIMARY KEY,
    lugar NVARCHAR(100),
    capacidad INT
);

CREATE TABLE caja (
    num_referencia CHAR(5) PRIMARY KEY,
    contenido NVARCHAR(100),
    valor INT,
    almacen INT,
    FOREIGN KEY (almacen)
        REFERENCES almacen (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);