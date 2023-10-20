DROP DATABASE IF EXISTS ejercicio16;
CREATE DATABASE IF NOT EXISTS ejercicio16;

USE ejercicio16;

CREATE TABLE IF NOT EXISTS Usuario (
    Id_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Apellidos VARCHAR(255),
    Email VARCHAR(100),
    urlFoto VARCHAR(100),
    isCelebridad BOOLEAN
);

CREATE TABLE IF NOT EXISTS TrendingTopic (
    Hashtag VARCHAR(100) PRIMARY KEY NOT NULL,
    Caracteres VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Tweet (
    Id_Tweet INT PRIMARY KEY AUTO_INCREMENT,
    Id_Usuario INT,
    Hashtag VARCHAR(100),
    Caracteres VARCHAR(255),
    Localizacion VARCHAR(100),
    Foto BLOB,
    FOREIGN KEY (Id_Usuario)
        REFERENCES Usuario (Id_Usuario),
    FOREIGN KEY (Hashtag)
        REFERENCES TrendingTopic (Hashtag)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Sigue (
	Id_Usuario1 INT,
    Id_Usuario2 INT,
    Mensaje_Privado VARCHAR(255),
     PRIMARY KEY(Id_Usuario1, Id_Usuario2),
    FOREIGN KEY (Id_Usuario1)
        REFERENCES Usuario (Id_Usuario),
    FOREIGN KEY (Id_Usuario2)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Retweet (
	Id_Tweet INT,
    Id_Usuario INT,
     PRIMARY KEY(Id_Tweet, Id_Usuario),
    FOREIGN KEY (Id_Tweet)
        REFERENCES Tweet (Id_Tweet),
    FOREIGN KEY (Id_Usuario)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Mensaje (
    Id_Mensaje INT PRIMARY KEY AUTO_INCREMENT,
    Mensaje VARCHAR(255),
    Fecha DATE
);

CREATE TABLE IF NOT EXISTS Envia (
	Id_Usuario INT,
    Id_Mensaje INT,
     PRIMARY KEY(Id_Usuario, Id_Mensaje),
    FOREIGN KEY (Id_Usuario)
        REFERENCES Usuario (Id_Usuario),
    FOREIGN KEY (Id_Mensaje)
        REFERENCES Mensaje (Id_Mensaje)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Recibe (
	Id_Usuario INT,
    Id_Mensaje INT,
     PRIMARY KEY(Id_Usuario, Id_Mensaje),
    FOREIGN KEY (Id_Usuario)
        REFERENCES Usuario (Id_Usuario),
    FOREIGN KEY (Id_Mensaje)
        REFERENCES Mensaje (Id_Mensaje)
        ON DELETE CASCADE ON UPDATE CASCADE
);

