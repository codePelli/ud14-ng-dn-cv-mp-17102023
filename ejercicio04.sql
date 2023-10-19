drop database if exists ejercicio04;
create database if not exists ejercicio04;
use ejercicio04;

create table if not exists Guerra (
	id_guerra int primary key,
    año_inicio DATE,
    año_fin DATE,
    nombre varchar(255)
);

create table if not exists Bando (
	id_bando int primary key,
    nombre varchar(255),
    ganadores varchar(255)
);

create table if not exists Pais (
	id_pais int primary key auto_increment,
    fk_id_bando int,
    nombre varchar(255),
    periodo_independencia varchar(255),
    foreign key (fk_id_bando) references Bando(id_bando)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Periodo (
	id_periodo int primary key,
    fk_id_pais int,
    fecha_inicio DATE,
    fecha_fin DATE,
    foreign key (fk_id_pais) references Pais(id_pais)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
