drop database if exists ejercicio14;
create database if not exists ejercicio14;
use ejercicio14;

create table if not exists Usuario (
	id_usuario int PRIMARY KEY,
    contrasena varchar(40),
    nombre varchar(40),
    apellidos varchar(40),
    direccion varchar(40),
   telefono varchar(15),
    email varchar(40),
    es_celebridad boolean
);

create table if not exists Celebridad(
	id_celebridad varchar(40) PRIMARY KEY,
    contrasena varchar(40),
    nombre varchar(40),
    apellidos varchar(40),
    id_usuario int,
    foto text,
    foreign key (id_usuario) REFERENCES Usuario(id_usuario)
);

create table if not exists Contacto (
	telefono varchar(15) PRIMARY KEY,
	descripcion text
);

create table if not exists Tiene (
	id_usuario int,
    telefono varchar(15),
    foreign key (id_usuario) REFERENCES Usuario(id_usuario),
    foreign key (telefono) REFERENCES Contacto(telefono)
);

create table if not exists Grupo (
	nombre varchar(255) PRIMARY KEY
);

create table if not exists Organiza (
	telefono varchar(15),
    nombre varchar(255),
	foreign key (telefono) REFERENCES Contacto(telefono),
    foreign key (nombre) REFERENCES Grupo(nombre)
);

create table if not exists Comentario (
	usuario varchar(255) PRIMARY KEY,
	texto text,
    imagen varchar(255)
);

create table if not exists Publica (
	id_usuario int,
    usuario varchar(255),
	foreign key (id_usuario) REFERENCES Usuario(id_usuario),
    foreign key (usuario) REFERENCES Comentario(usuario)
);