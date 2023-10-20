drop database if exists ud14_ejercicio03;
create database if not exists ud14_ejercicio03;
use ud14_ejercicio03;

CREATE TABLE IF NOT EXISTS Fabricantes (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre NVARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Articulos (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    CodigoFabricante INT,
    Nombre NVARCHAR(100),
    Precio INT,
    Fabricante INT,
    FOREIGN KEY (CodigoFabricante)
        REFERENCES Fabricantes (Codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

