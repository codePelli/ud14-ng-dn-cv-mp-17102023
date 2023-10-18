drop database if exists ejercicio5;
create database if not exists ejercicio5;
use ejercicio5;

create table Peliculas(
	codigo int primary key,
    nombre nvarchar(100),
    calificacion_edad int
);

Create table Salas(
	codigo int primary key,
    nombre nvarchar(100),
    pelicula int,
    foreign key (pelicula) references Peliculas(codigo)
);