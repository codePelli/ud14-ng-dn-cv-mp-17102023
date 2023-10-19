drop database if exists ejercicio07;
create database if not exists ejercicio07;
use ejercicio07;

create table if not exists Departamento (
    id_departamento int primary key,
    nombre_departamento varchar(255)
);

create table if not exists Contrato (
    id_contrato int primary key,
    fecha_inicio date,
    fecha_fin date
);

create table if not exists Nomina (
    id_nomina int primary key,
    fecha date,
    salario double,
    nombre_trabajador varchar(150)
);

create table if not exists Empleado (
	id_trabajador int primary key,
    fk_id_departamento int,
    fk_id_responsable int,
    fk_id_contrato int,
    num_ss int,
    dni varchar(255),
    nombre varchar(255),
    apellidos varchar(255),
    direccion varchar(255),
    telefono int,
    es_coordinador boolean,
    foreign key (fk_id_departamento) references Departamento(id_departamento)
    ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (fk_id_responsable) references Empleado(id_trabajador)
    ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (fk_id_contrato) references Contrato(id_contrato)
    ON DELETE CASCADE ON UPDATE CASCADE
);