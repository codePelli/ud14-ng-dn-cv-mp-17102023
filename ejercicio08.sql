drop database if exists ejercicio08;
create database if not exists ejercicio08;
use ejercicio08;

create table if not exists Cliente (
	DNI varchar(9) primary key,
	nombre varchar(15),
    apellidos varchar(15),
    direccion varchar(40),
    telefono varchar(13),
    targeta_credito varchar(40)
);

create table if not exists Targeta_Embarque (
	id_targeta_embarque varchar(10) primary key,
	num_reserva varchar(10),
    fecha date
);

create table if not exists Reserva (
	fk_DNI varchar(10),
	fk_id_targeta_embarque varchar(10),
    primary key (fk_DNI,fk_id_targeta_embarque),
    foreign key (fk_DNI) references Cliente(DNI)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	foreign key (fk_id_targeta_embarque) references Targeta_Embarque(id_targeta_embarque)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Avion (
	id_vuelo varchar(10) primary key,
	num_plazas varchar(10)
);

create table if not exists Asiento (
	id_asiento varchar(10) primary key,
	fila varchar(2),
    columna varchar(2),
    planta varchar(2),
    fk_id_vuelo varchar(10),
    fk_id_targeta_embarque varchar(10),
	foreign key (fk_id_vuelo) references Avion(id_vuelo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_targeta_embarque) references Targeta_Embarque(id_targeta_embarque)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Aeropuerto (
	codigo_aeropuerto varchar(10) primary key,
	nombre varchar(20),
    localidad varchar(20),
	pais varchar(20)
);

create table if not exists Vuelo (
	id_vuelo varchar(10) primary key,
	hora_salida time,
    hora_llegada time,
	fk_codigo_aeropuerto_salida varchar(10),
    fk_codigo_aeropuerto_llegada varchar(10),
    foreign key (fk_codigo_aeropuerto_salida) references Aeropuerto(codigo_aeropuerto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_codigo_aeropuerto_llegada) references Aeropuerto(codigo_aeropuerto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);





