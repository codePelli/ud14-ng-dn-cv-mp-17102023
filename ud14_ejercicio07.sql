DROP DATABASE IF EXISTS ud14_ejercicio07;
CREATE DATABASE IF NOT EXISTS ud14_ejercicio07;

USE Ejercicio07;

CREATE TABLE IF NOT EXISTS Despacho (
    Numero INT PRIMARY KEY,
    Capacidad INT
);

CREATE TABLE IF NOT EXISTS Director (
    DNI VARCHAR(8) PRIMARY KEY NOT NULL,
    NomApels VARCHAR(255),
    DNI_Jefe VARCHAR(8),
    Num_Despacho INT,
    FOREIGN KEY (DNI_Jefe)
        REFERENCES Director (DNI),
    FOREIGN KEY (Num_Despacho)
        REFERENCES Despacho (Numero)
        ON DELETE CASCADE ON UPDATE CASCADE
);
