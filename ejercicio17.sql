drop database if exists ejercicio17;
create database if not exists ejercicio17;
use ejercicio17;

create table if not exists Centro (
	id_centro int primary key auto_increment,
    nombre varchar(100),
    grado varchar(150)
);

create table if not exists Ciclo (
	id_ciclo int primary key auto_increment,
    nombre varchar(100),
    grado varchar(150)
);

create table if not exists Enseña (
	fk_id_centro int,
    fk_id_ciclo int,
    foreign key (fk_id_centro) references Centro(id_centro),
    foreign key (fk_id_ciclo) references Ciclo(id_ciclo)
);

create table if not exists Asignatura (
	fk_id_aula int,
    fk_id_profesor int,
    id_asignatura int primary key,
    nombre varchar(100),
    id_europeo varchar(100),
    fecha_inicio date,
    fecha_fin date,
    foreign key (fk_id_aula) references Aula(id_aula),
    foreign key (fk_id_profesor) references Profesor(id_profesor)
);

create table if not exists Contiene (
	fk_id_ciclo int,
    fk_id_asignatura int,
    foreign key (fk_id_ciclo) references Ciclo(id_ciclo),
    foreign key (fk_id_asignatura) references Asignatura(id_asignatura)
);

create table if not exists Aula(
	if_aula int primary key auto_increment,
    hora time,
    dia_semana date,
    metros double
);

create table if not exists Profesor (
	id_profesor int primary key auto_increment,
    nombre varchar(100),
    direccion varchar(150),
    telefono varchar(15),
    mail varchar(150),
    dni varchar(15),
    num_ss varchar(25),
    años_antiguedad int
);

create table if not exists Tutor (
	if_tutor int primary key auto_increment,
    años_antiguedad int,
    fk_id_profesor int,
    foreign key (fk_id_profesor) references Profesor(id_profesor)
);