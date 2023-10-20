drop database if exists ud14_ejercio09;
create database if not exists ud14_ejercicio09;

use ud14_ejercicio09;

CREATE TABLE IF NOT EXISTS Cientifico (
    DNI VARCHAR(8) PRIMARY KEY NOT NULL,
    NomApels NVARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Proyecto (
    Id CHAR(4) PRIMARY KEY NOT NULL,
    Nombre NVARCHAR(255),
    Horas INT
);

CREATE TABLE IF NOT EXISTS Asignado_A (
    Cientifico VARCHAR(8),
    Proyecto CHAR(4),
    PRIMARY KEY(Cientifico, Proyecto),
    FOREIGN KEY (Cientifico)
        REFERENCES Cientifico (DNI),
    FOREIGN KEY (Proyecto)
        REFERENCES Proyecto (Id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
