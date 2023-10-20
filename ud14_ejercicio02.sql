drop database if exists ud14_ejercicio02;
create database if not exists ud14_ejercicio02;
use ud14_ejercicio02;

CREATE TABLE IF NOT EXISTS Tema (
    ClaveTema SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS Autor (
    ClaveAutor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS Editorial (
    ClaveEditorial SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(60),
    Direccion VARCHAR(60),
    Telefono VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Libro (
    ClaveLibro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(60),
    Idioma VARCHAR(15),
    Formato VARCHAR(15),
    ClaveEditorial SMALLINT,
    FOREIGN KEY (ClaveEditorial)
        REFERENCES Editorial (ClaveEditorial)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Ejemplar (
    ClaveEjemplar INT PRIMARY KEY AUTO_INCREMENT,
    ClaveLibro INT,
    NumeroOrden SMALLINT,
    Edicion SMALLINT,
    Ubicacion VARCHAR(15),
    Categoria CHAR,
    FOREIGN KEY (ClaveLibro)
        REFERENCES Libro (ClaveLibro)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Socio (
    ClaveSocio INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(60),
    Direccion VARCHAR(60),
    Telefono VARCHAR(15),
    Categoria CHAR
);

CREATE TABLE IF NOT EXISTS Prestamo (
    ClaveSocio INT,
    ClaveEjemplar INT,
    NumeroOrden SMALLINT,
    Fecha_prestamo DATE,
    Fecha_devolucion DATE,
    Notas BLOB,
    FOREIGN KEY (ClaveEjemplar)
        REFERENCES Ejemplar (ClaveEjemplar)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClaveSocio)
        REFERENCES Socio (ClaveSocio)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS Trata_sobre (
    ClaveLibro INT,
    ClaveTema SMALLINT,
    FOREIGN KEY (ClaveLibro)
        REFERENCES Libro (ClaveLibro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClaveTema)
        REFERENCES Tema (ClaveTema)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Escrito_por (
    ClaveLibro INT,
    ClaveAutor INT,
    FOREIGN KEY (ClaveLibro)
        REFERENCES Libro (ClaveLibro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClaveAutor)
        REFERENCES Autor (ClaveAutor)
        ON DELETE CASCADE ON UPDATE CASCADE
);
