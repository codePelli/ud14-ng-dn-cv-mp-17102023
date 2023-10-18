drop database if exists ejercicio5;
create database if not exists ejercicio5;
use ejercicio5;

create table almacen (
	codigo int primary key,
    lugar nvarchar(100),
    capacidad int
);

create table caja (
	num_referencia char(5) primary key,
    contenido nvarchar(100),
    valor int,
    almacen int,
    foreign key(almacen) references almacen(codigo)
);