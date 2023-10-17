drop database if exists ejercicio6;
create database if not exists ejercicio6;
use ejercicio6;

create table if not exists Socio (
	DNI varchar(10) PRIMARY KEY,
    nombre varchar(255),
    apellidos varchar(255),
    codigo_socio int,
    direccion varchar(255),
    telefono varchar(15)
);

create table if not exists Articulo (
	codigo_articulo int PRIMARY KEY auto_increment,
    nombre varchar(255),
    año int,
    resumen text,
    comentario text,
    deteriorado boolean
);

create table if not exists Prestamo(
	fk_DNI varchar(10),
    fk_codigo_articulo INT,
    fecha_inicio date,
    fecha_fin date,
    fecha_devolucion date,
    foreign key (fk_DNI) REFERENCES Socio(DNI),
    foreign key (fk_codigo_articulo) references Articulo(codigo_articulo)
);

create table if not exists Libro(
	codigo_libro varchar(10) primary key,
    fk_codigo_articulo INT,
    escritor varchar(255),
    num_paginas int,

    foreign key (fk_codigo_articulo) references Articulo(codigo_articulo)
);

create table if not exists CD(
	codigo_cd int primary key,
    fk_codigo_articulo INT,
    interprete varchar(255),
    num_canciones int,
    foreign key (fk_codigo_articulo) REFERENCES Articulo(codigo_articulo)
);

create table if not exists Pelicula(
	codigo_pelicula int primary key,
    fk_codigo_articulo INT,
    director varchar(255),
    duracion int,
    foreign key (fk_codigo_articulo) REFERENCES Articulo(codigo_articulo)
);

create table if not exists Autor(
	id_autor int primary key,
    fk_codigo_articulo INT,
    interprete varchar(255),
    num_canciones int,
    foreign key (fk_codigo_articulo) REFERENCES Articulo(codigo_articulo)
);

create table if not exists Crea (
	fk_id_autor int,
    fk_codigo_articulo int,
    foreign key (fk_id_autor) references Autor(id_autor),
    foreign key (fk_codigo_articulo) references Articulo (codigo_articulo)
);
    





