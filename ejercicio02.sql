drop database if exists ejercicio2;
create database if not exists ejercicio2;
use ejercicio2;

create table if not exists Empresa (
	CIF varchar(20) PRIMARY KEY,
    direccion varchar(255),
    telefono varchar(12),
    edad int
);

create table if not exists Alumno (
	DNI varchar(20) PRIMARY KEY,
    nombre varchar(255),
    apellidos varchar(255),
    direccion varchar(255),
    telefono varchar(12),
    edad int
);

create table if not exists Trabajar(
	fk_CIF varchar(10),
    fk_DNI varchar(10),
    primary key (fk_CIF, fk_DNI),
    foreign key (fk_CIF) REFERENCES Empresa(CIF)
		ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_DNI) references Alumno(DNI)
		ON DELETE CASCADE
    ON UPDATE CASCADE
    
);

create table if not exists Profesor (
	DNI varchar(20) PRIMARY KEY,
    nombre varchar(255),
    apellidos varchar(255),
    direccion varchar(255),
    telefono varchar(12)
);

create table if not exists Curso (
	codigo varchar(20) PRIMARY KEY,
    programa varchar(255),
    duracion time,
    titulo varchar(255),
    numero int
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
	fk_DNI varchar(10),
    fk_codigo varchar(10),
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
	fk_codigo_curso varchar(10),
    fk_codigo_datos varchar(10),
    primary key (fk_codigo_curso, fk_codigo_datos),
    foreign key (fk_codigo_curso) REFERENCES Curso(codigo)
    		ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_codigo_datos) references DatosCurso(codigo)
    		ON DELETE CASCADE
    ON UPDATE CASCADE
);

