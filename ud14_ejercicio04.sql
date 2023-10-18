drop database if exists ejercicio4;
create database if not exists ejercicio4;
use ejercicio4;

create table if not exists Departamentos(
	codigo int PRIMARY KEY,
    nombre nvarchar(100),
    presupuesto int
);

create table if not exists Empleados (
	DNI varchar(8) PRIMARY KEY,
    nombre nvarchar(100),
    apellidos nvarchar(255),
    departamento int,
   foreign key (departamento) REFERENCES Departamentos(codigo)
);