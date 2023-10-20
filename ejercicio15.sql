drop database if exists ejercicio15;
create database if not exists ejercicio15;
use ejercicio15;

CREATE TABLE IF NOT EXISTS Menu (
    id_menu VARCHAR(20) PRIMARY KEY,
    fecha DATE,
    num_personas INT
);

CREATE TABLE IF NOT EXISTS Plato (
    id_plato VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40),
    tipo VARCHAR(15),
    descripcion TEXT,
    temperatura VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS Compone (
    fk_id_menu VARCHAR(20),
    fk_id_plato VARCHAR(20),
    PRIMARY KEY (fk_id_menu , fk_id_plato),
    FOREIGN KEY (fk_id_menu)
        REFERENCES Menu (id_menu)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_plato)
        REFERENCES Plato (id_plato)
        ON DELETE CASCADE ON UPDATE CASCADE
);

create table if not exists Dia (
    id_dia int primary key auto_increment,
    num_personas int
	fecha date
);

CREATE TABLE IF NOT EXISTS Sirve (
    fk_id_menu VARCHAR(20),
    fk_fecha_sirve DATE,
    PRIMARY KEY (fk_id_menu , fk_fecha_sirve),
    FOREIGN KEY (fk_id_menu)
        REFERENCES Menu (id_menu)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_fecha_sirve)
        REFERENCES Dia (id_dia)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Consume (
    fk_id_dia DATE,
    fk_id_plato VARCHAR(20),
    cantidad INT,
    plato_exitoso VARCHAR(40),
    PRIMARY KEY (fk__id_dia , fk_id_plato),
    FOREIGN KEY (fk_id_dia)
        REFERENCES Dia (id_dia)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_plato)
        REFERENCES Plato (id_plato)
        ON DELETE CASCADE ON UPDATE CASCADE
);