drop database if exists ejercicio03;
create database if not exists ejercicio03;
use ejercicio03;

create table if not exists ComunidadAutonoma (
	nombre varchar(255) primary key unique,
    poblacion int,
    superficie double
);

create table if not exists Provincia (
	cod_postal int primary key ,
    fk_nombre_ca varchar(255),
    nombre varchar(255),
	foreign key (fk_nombre_ca) references ComunidadAutonoma(nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Localidad (
	id_localidad int primary key auto_increment,
    fk_cod_postal int,
    fk_nombre_ca varchar(255),
    nombre varchar(255),
    poblacion int,
    foreign key (fk_cod_postal) references Provincia(cod_postal),
    foreign key (fk_nombre_ca) references ComunidadAutonoma(nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
