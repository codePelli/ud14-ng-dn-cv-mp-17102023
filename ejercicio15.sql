drop database if exists ejercicio15;
create database if not exists ejercicio15;
use ejercicio15;

create table if not exists Menu (
	id_menu varchar(20) primary key,
	fecha date,
    num_personas int
);

create table if not exists Plato (
	id_plato varchar(20) primary key,
	nombre varchar(40),
    tipo varchar(15),
    descripcion text,
    temperatura varchar(5)
);

create table if not exists Compone (
	fk_id_menu varchar(20),
	fk_id_plato varchar(20),
    primary key (fk_id_menu,fk_id_plato),
    foreign key (fk_id_menu) references Menu(id_menu)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	foreign key (fk_id_plato) references Plato(id_plato)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Dia (
    id_dia int primary key auto_increment,
    num_personas int
	fecha date
);

create table if not exists Sirve (
	fk_id_menu varchar(20),
	fk_fecha_sirve date,
    primary key (fk_id_menu,fk_fecha_sirve),
    foreign key (fk_id_menu) references Menu(id_menu)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	foreign key (fk_fecha_sirve) references Dia(id_dia)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Consume (
	fk_id_dia date,
	fk_id_plato varchar(20),
    cantidad int,
    plato_exitoso varchar(40),
    primary key (fk__id_dia,fk_id_plato),
    foreign key (fk_id_dia) references Dia(id_dia)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	foreign key (fk_id_plato) references Plato(id_plato)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);