DROP DATABASE IF EXISTS ejercicio10;
CREATE DATABASE IF NOT EXISTS ejercicio10;

USE ejercicio10;

CREATE TABLE IF NOT EXISTS Jugador (
    Id_Jugador INT PRIMARY KEY AUTO_INCREMENT,
    Dorsal INT NOT NULL,
    Nombre VARCHAR(255),
    Apellidos VARCHAR(255),
    Goles INT,
    Posicion VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Equipo (
    Id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Ano_Fundacion Date,
    Trofeos_Ganados INT,
    Puntos_Liga INT,
    Cuerpo_Tecnico VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Pertenece (
    Id_Jugador INT,
    Id_Equipo INT,
    PRIMARY KEY(Id_Jugador, Id_Equipo),
    FOREIGN KEY (Id_Jugador)
        REFERENCES Jugador (Id_Jugador),
    FOREIGN KEY (Id_Equipo)
        REFERENCES Equipo (Id_Equipo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Partido (
	Id_Partido INT PRIMARY KEY AUTO_INCREMENT,
    Jornada INT,
    Campeonato VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Juega (
	Id_Equipo INT,
    Id_Partido INT,
    PRIMARY KEY(Id_Equipo, Id_Partido),
    FOREIGN KEY (Id_Equipo)
        REFERENCES Equipo (Id_Equipo),
    FOREIGN KEY (Id_Partido)
        REFERENCES Partido (Id_Partido)
        ON DELETE CASCADE ON UPDATE CASCADE
);
