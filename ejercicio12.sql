drop database if exists ejercicio12;
create database if not exists ejercicio12;
use ejercicio12;

create table if not exists Proyecto (
    id_proyecto int primary key auto_increment,
    fecha_inicio date,
    fecha_prevision_fin date,
    fecha_real_fin date
);


create table if not exists Empresa (
    cod_interno int primary key auto_increment,
    CIF varchar(20),
    nombre varchar(255),
    direccion varchar(255),
    telefono varchar(15),
    fk_id_proyecto_realiza int,
    fk_id_proyecto_pertenece int,
    foreign key (fk_id_proyecto_realiza) REFERENCES Proyecto(id_proyecto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_proyecto_pertenece) references Proyecto(id_proyecto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


create table if not exists Trabajador (
    id_trabajador int primary key auto_increment,
    DNI varchar(10),
    nombre varchar(255),
    apellidos varchar(255),
    profesion varchar(255)
);

create table if not exists Participan (
    fk_id_proyecto int,
    fk_id_trabajador int,
    cargo_ejecutado varchar(255),
    horas_trabajadas int,
    primary key(fk_id_proyecto, fk_id_trabajador),
    foreign key (fk_id_proyecto) references Proyecto(id_proyecto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_trabajador) references Trabajador(id_trabajador)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
