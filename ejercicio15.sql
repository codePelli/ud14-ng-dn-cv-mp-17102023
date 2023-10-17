create database if not exists ejercicio15;
use ejercicio15;

create table if not exists Menu (
    id_menu int primary key auto_increment,
    nombre varchar(100),
    unidad_medida varchar(50)
);

create table if not exists  Plato (
    id_plato int primary key auto_increment,
    nombre varchar(255),
    tipo varchar(255),
    descripcion text(255)
);

create table if not exists  Compone (
    fk_id_menu int,
    fk_id_plato int,
	foreign key (fk_id_menu) references Menu(id_menu)    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_plato) references Plato(id_plato)
        ON DELETE CASCADE
    ON UPDATE CASCADE
);