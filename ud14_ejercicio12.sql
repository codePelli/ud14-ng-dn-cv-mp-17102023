drop database if exists ud14_ejercicio12;
create database if not exists ud14_ejercicio12;
use ud14_ejercicio12;

CREATE TABLE IF NOT EXISTS Profesor (
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    titulo VARCHAR(100),
    gana INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Curso (
    cod_curso VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre_curso VARCHAR(100) NOT NULL UNIQUE,
    dni_profesor VARCHAR(9),
    max_alumnos INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    num_horas INT NOT NULL,
    FOREIGN KEY (dni_profesor)
        REFERENCES Profesor (dni)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (fecha_inicio < fecha_fin)
);

create table if not exists Alumno (
	nombre varchar(100),
	apellido1 varchar(100),
	apellido2 varchar(100),
	dni varchar(9) not null,
	direcccion varchar(100),
	sexo varchar(1) check(sexo like"M" or sexo like"H") default "H",
	fecha_nacimiento date,
	curso varchar(10) not null,
	primary key(dni),
	foreign key(curso) references Curso(cod_curso)
	on delete cascade
	on update cascade
);