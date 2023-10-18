drop database if exists ejercio3;
create database if not exists ejercio3;
use ejercio3;

create table if not exists Fabricantes (
	Codigo int primary key auto_increment,
    Nombre nvarchar(100)
);

create table if not exists Fabricantes (
	Codigo int primary key auto_increment,
    CodigoFabricante int,
    Nombre nvarchar(100),
    Precio int,
    Fabricante int,
    foreign key (CodigoFabricante) references Fabricantes(Codigo)
    ON DELETE CASCADE ON UPDATE CASCADE
);

