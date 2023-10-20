drop database if exists ejercio2;
create database if not exists ejercio2;
use ejercio2;

create table if not exists Tema (
	ClaveTema smallint primary key auto_increment,
    Nombre varchar(40)
);

create table if not exists Autor (
	ClaveAutor int primary key auto_increment,
    Nombre varchar(60)
);

create table if not exists Editorial (
	ClaveEditorial smallint primary key auto_increment,
    Nombre varchar(60),
    Direccion varchar(60),
    Telefono varchar(15)
);

create table if not exists Libro (
	ClaveLibro int primary key auto_increment,
    Titulo varchar(60),
    Idioma varchar(15),
    Formato varchar(15),
    ClaveEditorial smallint,
    foreign key (ClaveEditorial) references Editorial(ClaveEditorial)
    ON DELETE CASCADE ON UPDATE CASCADE
);

create table if not exists Ejemplar (
	ClaveEjemplar int primary key auto_increment,
	ClaveLibro int,
    NumeroOrden smallint,
    Edicion smallint,
    Ubicacion varchar(15),
    Categoria char,
	foreign key (ClaveLibro) references Libro(ClaveLibro)
    ON DELETE CASCADE ON UPDATE CASCADE
);

create table if not exists Socio (
	ClaveSocio int primary key auto_increment,
    Nombre varchar(60),
    Direccion varchar(60),
    Telefono varchar(15),
    Categoria char
);

create table if not exists Prestamo (
	ClaveSocio int primary key auto_increment,
	ClaveEjemplar int,
	NumeroOrden smallint,
	Fecha_prestamo date,
    Fecha_devolucion date,
    Notas blob,
    foreign key (ClaveEjemplar) references Ejemplar(ClaveEjemplar)
    ON DELETE CASCADE ON UPDATE CASCADE
);
create table if not exists Trata_sobre (
	ClaveLibro int,
	ClaveTema smallint,
    foreign key (ClaveLibro) references Libro(ClaveLibro)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (ClaveTema) references Tema(ClaveTema)
    ON DELETE CASCADE ON UPDATE CASCADE
);

create table if not exists Escrito_por (
	ClaveLibro int,
	ClaveAutor int,
    foreign key (ClaveLibro) references Libro(ClaveLibro)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (ClaveAutor) references Autor(ClaveAutor)
    ON DELETE CASCADE ON UPDATE CASCADE
);


