drop database if exists ud14_ejercicio06;
create database if not exists ud14_ejercicio06;
use ud14_ejercicio06;

CREATE TABLE Peliculas (
    codigo INT PRIMARY KEY,
    nombre NVARCHAR(100),
    calificacion_edad INT
);

CREATE TABLE Salas (
    codigo INT PRIMARY KEY,
    nombre NVARCHAR(100),
    pelicula INT,
    FOREIGN KEY (pelicula)
        REFERENCES Peliculas (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);