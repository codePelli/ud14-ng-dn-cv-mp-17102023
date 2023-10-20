drop database if exists ud14_ejercicio01;
create database if not exists ud14_ejercicio01;
use ud14_ejercicio01;

CREATE TABLE IF NOT EXISTS Estacion (
    identificador INT PRIMARY KEY AUTO_INCREMENT,
    latitud DOUBLE,
    altitud DOUBLE
);

CREATE TABLE IF NOT EXISTS Muestra (
    identificador_estacion INT,
    fecha DATE,
    temperatura_minima DOUBLE,
    temperatura_maxima DOUBLE,
    precipitaciones DOUBLE,
    humedad_minima DOUBLE,
    velocidad_del_viento_minima DOUBLE,
    velocidad_del_viento_maxima DOUBLE,
    FOREIGN KEY (identificador_estacion)
        REFERENCES Estacion (identificador)
        ON DELETE CASCADE ON UPDATE CASCADE
);
