drop database if exists ud14_ejercicio10;
create database if not exists ud14_ejercicio10;
use ud14_ejercicio10;

CREATE TABLE IF NOT EXISTS Cajero (
    codigo INT PRIMARY KEY,
    nomapels VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Maquina_registradora (
    codigo INT PRIMARY KEY,
    piso INT
);

CREATE TABLE IF NOT EXISTS Producto (
    codigo INT PRIMARY KEY,
    nombre NVARCHAR(100),
    precio INT
);

CREATE TABLE IF NOT EXISTS Venta (
    fk1_codigo INT PRIMARY KEY,
    fk2_codigo INT,
    fk3_codigo INT,
    FOREIGN KEY (fk1_codigo)
        REFERENCES Cajero (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk2_codigo)
        REFERENCES Maquina_registradora (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk3_codigo)
        REFERENCES Producto (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);
