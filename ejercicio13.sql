drop database if exists ejercicio13;
create database if not exists ejercicio13;
use ejercicio13;

create table if not exists Empleado (
	DNI varchar(10) primary key,
    nombre varchar(50),
    apellido varchar(50),
    num_ss varchar(20),
    tel_fijo varchar(15),
    tel_movil varchar(15)
);

create table if not exists Cocinero (
	fk_DNI varchar(10) primary key,
    años_en_empresa int,
    FOREIGN KEY (fk_DNI) references Empleado(DNI)
);


create table if not exists Pinche (
	fk_DNI varchar(10) primary key,
    fecha_nacimiento date,
    fk_DNI_cocinero varchar(10),
    FOREIGN KEY (fk_DNI) references Empleado(DNI),
    foreign key (fk_DNI_cocinero) references Cocinero(fk_DNI)
);

create table if not exists Plato (
	id_plato int primary key auto_increment,
    nombre varchar(255),
    precio double,
    tipo_plato varchar(100)
);

create table if not exists Cocina (
	fk_DNI varchar(10),
    fk_id_plato int,
    FOREIGN KEY (fk_DNI) references Cocinero(fk_DNI),
    foreign key (fk_id_plato) references Plato(id_plato)
);

create table if not exists Ingrediente (
	id_ingrediente int primary key auto_increment,
    cantidad int,
    almacen int,
    estanteria int
);



create table if not exists Estanteria (
	id_estanteria int primary key auto_increment,
    cantidad int,
    almacen int,
    estanteria int
);


create table if not exists Almacen (
	id_almacen int primary key auto_increment,
    nombre varchar(150),
    num_almacen int,
    descripcion Text
);

create table if not exists Almacena (
	fk_id_almacen int,
    fk_id_estanteria int,
	foreign key (fk_id_almacen) references Almacen(id_almacen),
    foreign key (fk_id_estanteria) references Estanteria(id_estanteria)
);

create table if not exists Elabora (
	fk_id_plato int,
    fk_id_ingrediente int,
    foreign key (fk_id_plato) references Plato(id_plato),
    foreign key (fk_id_ingrediente) references Ingrediente(id_ingrediente)
);


create table if not exists Guarda (
	fk_id_ingrediente int,
    fk_id_estanteria int,
	foreign key (fk_id_ingrediente) references Ingrediente(id_ingrediente),
    foreign key (fk_id_estanteria) references Estanteria(id_estanteria)
);