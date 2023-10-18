drop database if exists ejercio11;
create database if not exists ejercio11;
use ejercio11;

create table if not  exists AccidentesGeograficos (
    id_nombre varchar(200) primary key,
    posicion_horizontal double,
    posicion_vertical double
);

create table if not exists Rio (
    id_nombre varchar(200) primary key,
    id_nombre_accidentes_geograficos varchar(200),
    longitud double,
     foreign key (id_nombre_accidentes_geograficos) references AccidentesGeograficos(id_nombre)
        ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Lago (
    id_nombre varchar(200) primary key,
    id_nombre_accidentes_geograficos varchar(200),
    extension double,
    foreign key (id_nombre_accidentes_geograficos) references AccidentesGeograficos(id_nombre)
        ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Montana (
    id_nombre varchar(200) primary key,
    id_nombre_accidentes_geograficos varchar(200),
    altura double,
     foreign key (id_nombre_accidentes_geograficos) references AccidentesGeograficos(id_nombre)
        ON DELETE CASCADE
    ON UPDATE CASCADE
);


create table if not exists Pais (
    id_nombre varchar(200) primary key,
    extension double,
    poblacion int
);

create table if not exists Localidad (
    id_nombre varchar(200) primary key,
    id_pais varchar(200),
    foreign key (id_pais) references Pais(id_nombre)
        ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Pasa (
    id_nombre_rio varchar(200),
    id_nombre_localidad varchar(200),
    foreign key (id_nombre_rio) references  Rio(id_nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (id_nombre_localidad) references  Localidad(id_nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    primary key (id_nombre_rio, id_nombre_localidad)
);


create table if not exists Encuentra (
    id_nombre varchar(200),
    fk_id_nombre_pais varchar(200),
    foreign key(id_nombre) references AccidentesGeograficos(id_nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_nombre_pais) references Pais(id_nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



