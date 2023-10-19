drop database if exists ejercicio5;
create database if not exists ejercicio5;
use ejercicio5;

create table if not exists Pieza (
	id_pieza varchar(10) PRIMARY KEY,
    descripcion varchar(255),
    precio double
);

create table if not exists Compuesto(
	fk_id_pieza varchar(10),
    foreign key (fk_id_pieza) references Pieza(id_pieza)
);

create table if not exists Estanteria (
	id_estanteria varchar(10) PRIMARY KEY,
	cantidad_piezas int
);

create table if not exists Guarda(
	fk_id_pieza varchar(10),
    fk_id_estanteria varchar(10),
    foreign key (fk_id_pieza) references Pieza(id_pieza),
    foreign key (fk_id_estanteria) references Estanteria(id_estanteria)
);

create table if not exists Almacen (
	num_almacen varchar(10) PRIMARY KEY,
	descripcion text,
    direccion varchar(40),
    id_estanteria varchar(40)
);

create table if not exists Contiene (
	fk_id_estanteria varchar(40),
    fk_num_almacen varchar(40),
	foreign key (fk_id_estanteria) references Estanteria(id_estanteria),
    foreign key (fk_num_almacen) references Almacen(num_almacen)
);
