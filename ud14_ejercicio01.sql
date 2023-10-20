drop database if exists ejercio1;
create database if not exists ejercio1;
use ejercio1;

create table if not exists Estacion (
	identificador int primary key auto_increment,
    latitud double,
    altitud double
);

create table if not exists Muestra (
	identificador_estacion int,
    temperatura_minima double,
    temperatura_maxima double,
    precipitaciones double,
    humedad_minima double,
    velocidad_del_viento_minima double,
    velocidad_del_viento_maxima double,
    foreign key (identificador_estacion) references Estacion(identificador)
    ON DELETE CASCADE ON UPDATE CASCADE
);
