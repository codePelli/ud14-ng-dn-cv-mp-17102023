drop database if exists ejercicio11;
create database if not exists ejercicio11;
use ejercicio11;

create table if not exists Facultad (
	codigo int primary key,
    nombre nvarchar(100)
);

create table if not exists Equipo (
	num_serie char(4) primary key,
    nombre nvarchar(100),
    facultad int,
    FOREIGN KEY (facultad) references Facultad(codigo)
);

create table if not exists Investigador (
	dni varchar(8) primary key,
    nomapels nvarchar(255),
    facultad int,
    FOREIGN KEY (facultad) references Facultad(codigo)
);

create table if not exists Reserva (
    fk_num_serie char(4) primary key,
    fk_dni varchar(8),
    comienzo date,
    fin date,
    FOREIGN KEY (fk_dni) references Investigador(dni),
    FOREIGN KEY (fk_num_serie) references Equipo(num_serie)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);