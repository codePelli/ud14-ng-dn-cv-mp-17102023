drop database if exists ejercicio5;
create database if not exists ejercicio5;
use ejercicio5;

create table if not exists Pieza (
	id_pieza varchar(10) PRIMARY KEY,
    descripcion text,
    precio double
);

create table if not exists Compuesto(
	fk_id_pieza_1 varchar(10),
    fk_id_pieza_2 varchar(10),
    primary key (fk_id_pieza_1, fk_id_pieza_2),
    foreign key (fk_id_pieza_1) references Pieza(id_pieza)
		ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_pieza_2) references Pieza(id_pieza)
		ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Estanteria (
	id_estanteria varchar(10) PRIMARY KEY,
	cantidad_piezas int
);

create table if not exists Guarda(
	fk_id_pieza varchar(10),
    fk_id_estanteria varchar(10),
    primary key (fk_id_pieza, fk_id_estanteria),
    foreign key (fk_id_pieza) references Pieza(id_pieza)
		ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_estanteria) references Estanteria(id_estanteria)
		ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Almacen (
	num_almacen varchar(10) PRIMARY KEY,
	descripcion text,
    direccion varchar(60)
);

create table if not exists Contiene (
	fk_id_estanteria varchar(10),
    fk_num_almacen varchar(40),
    primary key (fk_id_estanteria, fk_num_almacen),
        foreign key (fk_num_almacen) references Almacen(num_almacen)
    	ON DELETE CASCADE
    ON UPDATE CASCADE,
	foreign key (fk_id_estanteria) references Estanteria(id_estanteria)
		ON DELETE CASCADE
    ON UPDATE CASCADE

);
