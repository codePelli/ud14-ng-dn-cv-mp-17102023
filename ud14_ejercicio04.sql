drop database if exists ud14_ejercicio04;
create database if not exists ud14_ejercicio04;
use ud14_ejercicio04;

CREATE TABLE IF NOT EXISTS Departamentos (
    codigo INT PRIMARY KEY,
    nombre NVARCHAR(100),
    presupuesto INT
);

CREATE TABLE IF NOT EXISTS Empleados (
    DNI VARCHAR(8) PRIMARY KEY,
    nombre NVARCHAR(100),
    apellidos NVARCHAR(255),
    departamento INT,
    FOREIGN KEY (departamento)
        REFERENCES Departamentos (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);