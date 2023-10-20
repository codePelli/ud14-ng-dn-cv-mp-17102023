drop database if exists ejercicio2;
create database if not exists ejercicio2;
use ejercicio2;

create table if not exists Empresa (
	CIF varchar(20) PRIMARY KEY,
    direccion varchar(255),
    telefono varchar(12),
    edad int
);

CREATE TABLE IF NOT EXISTS Alumno (
    DNI VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(12),
    edad INT
);

CREATE TABLE IF NOT EXISTS Trabajar (
    fk_CIF VARCHAR(20),
    fk_DNI VARCHAR(20),
    PRIMARY KEY (fk_CIF , fk_DNI),
    FOREIGN KEY (fk_CIF)
        REFERENCES Empresa (CIF)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_DNI)
        REFERENCES Alumno (DNI)
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table if not exists Profesor (
	DNI varchar(20) PRIMARY KEY,
    nombre varchar(255),
    apellidos varchar(255),
    direccion varchar(255),
    telefono varchar(12)
);

CREATE TABLE IF NOT EXISTS Curso (
    codigo VARCHAR(20) PRIMARY KEY,
    programa VARCHAR(255),
    duracion TIME,
    titulo VARCHAR(255),
    numero INT
);

create table if not exists Impartir(
	fk_DNI varchar(10),
    fk_codigo varchar(10),
    primary key (fk_DNI, fk_codigo),
    foreign key (fk_DNI) REFERENCES Profesor(DNI)
    		ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_codigo) references Curso(codigo)
    		ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Cursar(
	fk_DNI varchar(20),
    fk_codigo varchar(20),
	primary key (fk_DNI, fk_codigo),
    foreign key (fk_codigo) REFERENCES Curso(codigo)
    		ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_DNI) references Alumno(DNI)
    		ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists DatosCurso (
	codigo varchar(20) PRIMARY KEY,
    programa varchar(255),
    duracion time,
    titulo varchar(255)
);

create table if not exists Corresponder(
	fk_codigo_curso varchar(20),
    fk_codigo_datos varchar(20),
    primary key (fk_codigo_curso, fk_codigo_datos),
    foreign key (fk_codigo_curso) REFERENCES Curso(codigo)
    		ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_codigo_datos) references DatosCurso(codigo)
    		ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- INSERTS --

-- Empresa --

