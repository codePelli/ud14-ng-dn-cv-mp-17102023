drop database if exists ud14_ejercicio11;
create database if not exists ud14_ejercicio11;
use ud14_ejercicio11;

CREATE TABLE IF NOT EXISTS Facultad (
    codigo INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Equipo (
    num_serie CHAR(4) PRIMARY KEY,
    nombre NVARCHAR(100),
    facultad INT,
    FOREIGN KEY (facultad)
        REFERENCES Facultad (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Investigador (
    dni VARCHAR(8) PRIMARY KEY,
    nomapels NVARCHAR(255),
    facultad INT,
    FOREIGN KEY (facultad)
        REFERENCES Facultad (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Reserva (
    fk_num_serie CHAR(4) PRIMARY KEY,
    fk_dni VARCHAR(8),
    comienzo DATE,
    fin DATE,
    FOREIGN KEY (fk_dni)
        REFERENCES Investigador (dni)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_num_serie)
        REFERENCES Equipo (num_serie)
        ON DELETE CASCADE ON UPDATE CASCADE
);