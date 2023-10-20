drop database if exists ud14_ejercicio08;
create database if not exists ud14_ejercicio08;
use ud14_ejercicio08;

CREATE TABLE IF NOT EXISTS Proveedor (
    Id CHAR(4) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Pieza (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Suministra (
    Codigo_Pieza INT,
    Id_Proveedor CHAR(4),
    Precio INT,
    PRIMARY KEY (Codigo_Pieza , Id_Proveedor),
    FOREIGN KEY (Codigo_Pieza)
        REFERENCES Pieza (Codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_Proveedor)
        REFERENCES Proveedor (Id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
