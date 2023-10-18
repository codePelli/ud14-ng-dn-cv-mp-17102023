drop database if exists ejercicio10;
create database if not exists ejercicio10;
use ejercicio10;

create table if not exists Cajero (
	codigo int primary key,
    nomapels varchar(255)
);

create table if not exists Maquina_registradora (
	codigo int primary key,
    piso int
);

create table if not exists Producto (
	codigo int primary key,
    nombre nvarchar(100),
    precio int
);

create table if not exists Venta (
	fk1_codigo int primary key,
    fk2_codigo int,
    fk3_codigo int,
    FOREIGN KEY (fk1_codigo) references Cajero(codigo),
    FOREIGN KEY (fk2_codigo) references Maquina_registradora(codigo),
    FOREIGN KEY (fk3_codigo) references Producto(codigo)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
