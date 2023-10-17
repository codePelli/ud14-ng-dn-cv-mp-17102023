drop database if exists ejercicio9;
create database if not exists ejercicio9;
use ejercicio9;

create table if not exists Ingrediente (
    id_ingrediente int primary key auto_increment,
    nombre varchar(100),
    unidad_medida varchar(50)
);

create table if not exists  Receta (
    id_receta int primary key auto_increment,
    nombre_receta varchar(255),
    tiempo_preparacion int,
    porciones int,
    utensilios text,
    instrucciones text
);

create table if not exists  Comida (
    id_comida int primary key auto_increment,
    nombre_plato varchar(255),
    tipo_plato varchar(50)
);

create table if not exists  Prepara (
    fk_id_ingrediente int,
    fk_id_comida int,
    foreign key(fk_id_ingrediente) references Ingrediente(id_ingrediente)
        ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_comida) references Comida(id_comida)
        ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists  Contiene (
    fk_id_ingrediente int,
    fk_id_receta int,
    cantidad_ingredientes double,
    foreign key (fk_id_ingrediente) references Ingrediente(id_ingrediente)    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_receta) references Receta(id_receta)
        ON DELETE CASCADE
    ON UPDATE CASCADE
);


