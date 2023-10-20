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
    id_trending_topic VARCHAR(100) PRIMARY KEY NOT NULL,
    Caracteres VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Tweet (
    Id_Tweet INT PRIMARY KEY AUTO_INCREMENT,
    fk_Id_Usuario INT,
    fk_id_trending_topic VARCHAR(100),
    Caracteres VARCHAR(255),
    Localizacion VARCHAR(100),
    Foto BLOB,
    FOREIGN KEY (fk_Id_Usuario)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_trending_topic)
        REFERENCES TrendingTopic (id_trending_topic)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Sigue (
    fk_Id_Usuario1 INT,
    fk_Id_Usuario2 INT,
    Mensaje_Privado VARCHAR(255),
    PRIMARY KEY (fk_Id_Usuario1 , fk_Id_Usuario2),
    FOREIGN KEY (fk_Id_Usuario1)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_Id_Usuario2)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Retweet (
    fk_Id_Tweet INT,
    fk_Id_Usuario INT,
    PRIMARY KEY (fk_Id_Tweet , fk_Id_Usuario),
    FOREIGN KEY (fk_Id_Tweet)
        REFERENCES Tweet (Id_Tweet)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_Id_Usuario)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Mensaje (
    Id_Mensaje INT PRIMARY KEY AUTO_INCREMENT,
    Mensaje VARCHAR(255),
    Fecha DATE
);

CREATE TABLE IF NOT EXISTS Envia (
    fk_Id_Usuario INT,
    fk_Id_Mensaje INT,
    PRIMARY KEY (fk_Id_Usuario , fk_Id_Mensaje),
    FOREIGN KEY (fk_Id_Usuario)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_Id_Mensaje)
        REFERENCES Mensaje (Id_Mensaje)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Recibe (
    fk_Id_Usuario INT,
    fk_Id_Mensaje INT,
    PRIMARY KEY (fk_Id_Usuario , fk_Id_Mensaje),
    FOREIGN KEY (fk_Id_Usuario)
        REFERENCES Usuario (Id_Usuario)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_Id_Mensaje)
        REFERENCES Mensaje (Id_Mensaje)
        ON DELETE CASCADE ON UPDATE CASCADE
);

