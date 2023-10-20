drop database if exists ud14_ejercicio12;
create database if not exists ud14_ejercicio12;
use ud14_ejercicio12;

create table profesores(
dni varchar(9) primary key,
nombre varchar(100) not null unique,
apellido1 varchar(100) not null,
apellido2 varchar(100) not null,
direccion varchar(100),
titulo varchar(100),
gana int not null
);
create table cursos(
cod_curso varchar(10) primary key not null,
nombre_curso varchar(100) not null unique,
dni_profesor varchar(9) ,
max_alumnos int,
fecha_inicio date,
fecha_fin date ,
num_horas int not null,
foreign key(dni_profesor) references profesores(dni)
on delete cascade
on update cascade,
check(fecha_inicio < fecha_fin)
);
create table alumnos(
nombre varchar(100),
apellido1 varchar(100),
apellido2 varchar(100),
dni varchar(9) not null,
direcccion varchar(100),
sexo varchar(1) check(sexo like"M" or sexo like"H") default "H",
fecha_nacimiento date,
curso varchar(10) not null,
primary key(dni),
foreign key(curso) references cursos(cod_curso)
on delete cascade
on update cascade
);