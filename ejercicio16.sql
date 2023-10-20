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


INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Juan', 'Perez', 'juan@example.com', 'foto1.jpg', 1);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Maria', 'Gonzalez', 'maria@example.com', 'foto2.jpg', 0);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Pedro', 'Rodriguez', 'pedro@example.com', 'foto3.jpg', 1);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Luis', 'Martinez', 'luis@example.com', 'foto4.jpg', 0);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Ana', 'Lopez', 'ana@example.com', 'foto5.jpg', 0);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Elena', 'Sanchez', 'elena@example.com', 'foto6.jpg', 1);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Carlos', 'Fernandez', 'carlos@example.com', 'foto7.jpg', 0);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Sara', 'Ramirez', 'sara@example.com', 'foto8.jpg', 0);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('David', 'Gomez', 'david@example.com', 'foto9.jpg', 1);
INSERT INTO Usuario (Nombre, Apellidos, Email, urlFoto, isCelebridad) VALUES
('Laura', 'Torres', 'laura@example.com', 'foto10.jpg', 0);


INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending1', 'Trending Topic 1');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending2', 'Trending Topic 2');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending3', 'Trending Topic 3');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending4', 'Trending Topic 4');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending5', 'Trending Topic 5');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending6', 'Trending Topic 6');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending7', 'Trending Topic 7');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending8', 'Trending Topic 8');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending9', 'Trending Topic 9');
INSERT INTO TrendingTopic (id_trending_topic, Caracteres) VALUES ('trending10', 'Trending Topic 10');

INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (1, 'trending1', 'Este es un tweet 1', 'Ubicacion 1', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (2, 'trending2', 'Este es un tweet 2', 'Ubicacion 2', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (3, 'trending3', 'Este es un tweet 3', 'Ubicacion 3', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (4, 'trending1', 'Este es un tweet 4', 'Ubicacion 4', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (5, 'trending2', 'Este es un tweet 5', 'Ubicacion 5', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (6, 'trending3', 'Este es un tweet 6', 'Ubicacion 6', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (7, 'trending1', 'Este es un tweet 7', 'Ubicacion 7', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (8, 'trending2', 'Este es un tweet 8', 'Ubicacion 8', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (9, 'trending3', 'Este es un tweet 9', 'Ubicacion 9', NULL);
INSERT INTO Tweet (fk_Id_Usuario, fk_id_trending_topic, Caracteres, Localizacion, Foto) VALUES (10, 'trending1', 'Este es un tweet 10', 'Ubicacion 10', NULL);

INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (1, 2, 'Hola, te sigo');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (3, 1, 'Gracias por seguirme');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (2, 4, 'Un placer seguirte');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (5, 1, 'Sigamos conectados');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (6, 2, 'Sigueme de vuelta');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (1, 7, 'Gracias por el seguimiento');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (8, 2, 'Siguiendote');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (2, 9, 'Estemos en contacto');
INSERT INTO Sigue (fk_Id_Usuario1, fk_Id_Usuario2, Mensaje_Privado) VALUES (10, 1, 'Sigamonos mutuamente');

INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (1, 2);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (3, 1);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (2, 4);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (5, 1);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (6, 2);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (7, 1);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (8, 3);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (9, 5);
INSERT INTO Retweet (fk_Id_Tweet, fk_Id_Usuario) VALUES (10, 2);

INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Hola, como estas?', '2023-10-20');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Feliz cumpleanos', '2023-09-15');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Quedamos para cenar?', '2023-11-05');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Te echo de menos', '2023-08-30');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Gracias por tu ayuda', '2023-10-10');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Felices fiestas', '2023-12-25');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Nos vemos pronto', '2023-07-22');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Como va todo?', '2023-11-15');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Recordemos viejos tiempos', '2023-09-02');
INSERT INTO Mensaje (Mensaje, Fecha) VALUES ('Has visto esta pelicula?', '2023-10-05');

INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (1, 1);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (2, 2);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (3, 3);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (4, 4);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (5, 5);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (6, 6);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (7, 7);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (8, 8);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (9, 9);
INSERT INTO Envia (fk_Id_Usuario, fk_Id_Mensaje) VALUES (10, 10);

INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (1, 1);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (2, 2);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (3, 3);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (4, 4);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (5, 5);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (6, 6);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (7, 7);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (8, 8);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (9, 9);
INSERT INTO Recibe (fk_Id_Usuario, fk_Id_Mensaje) VALUES (10, 10);



UPDATE TrendingTopic SET Caracteres = 'Nuevo Trending 1' WHERE id_trending_topic = 'trending1';
UPDATE TrendingTopic SET Caracteres = 'Nuevo Trending 2' WHERE id_trending_topic = 'trending2';
UPDATE TrendingTopic SET Caracteres = 'Nuevo Trending 3' WHERE id_trending_topic = 'trending3';

UPDATE Tweet SET Caracteres = 'Este tweet ha sido modificado' WHERE Id_Tweet = 1;
UPDATE Tweet SET Caracteres = 'Otro tweet modificado' WHERE Id_Tweet = 2;
UPDATE Tweet SET Caracteres = 'Tweet número 3 modificado' WHERE Id_Tweet = 3;


UPDATE Sigue SET Mensaje_Privado = 'Mensaje actualizado' WHERE fk_Id_Usuario1 = 1 AND fk_Id_Usuario2 = 2;
UPDATE Sigue SET Mensaje_Privado = 'Mensaje actualizado' WHERE fk_Id_Usuario1 = 3 AND fk_Id_Usuario2 = 15;
UPDATE Sigue SET Mensaje_Privado = 'Mensaje actualizado' WHERE fk_Id_Usuario1 = 2 AND fk_Id_Usuario2 = 4;


UPDATE Retweet SET fk_Id_Usuario = 3 WHERE fk_Id_Tweet = 1 AND fk_Id_Usuario = 2;
UPDATE Retweet SET fk_Id_Tweet = 5 WHERE fk_Id_Tweet = 3 AND fk_Id_Usuario = 11;
UPDATE Retweet SET fk_Id_Tweet = 6 WHERE fk_Id_Tweet = 2 AND fk_Id_Usuario = 4;


UPDATE Mensaje SET Mensaje = 'Mensaje actualizado 1' WHERE Id_Mensaje = 1;
UPDATE Mensaje SET Mensaje = 'Mensaje actualizado 2' WHERE Id_Mensaje = 2;
UPDATE Mensaje SET Mensaje = 'Mensaje actualizado 3' WHERE Id_Mensaje = 3;

UPDATE Envia SET fk_Id_Usuario = 2 WHERE fk_Id_Usuario = 1 AND fk_Id_Mensaje = 1;
UPDATE Envia SET fk_Id_Usuario = 4 WHERE fk_Id_Usuario = 3 AND fk_Id_Mensaje = 3;
UPDATE Envia SET fk_Id_Usuario = 5 WHERE fk_Id_Usuario = 2 AND fk_Id_Mensaje = 2;


UPDATE Recibe SET fk_Id_Usuario = 2 WHERE fk_Id_Usuario = 1 AND fk_Id_Mensaje = 1;
UPDATE Recibe SET fk_Id_Usuario = 4 WHERE fk_Id_Usuario = 3 AND fk_Id_Mensaje = 3;
UPDATE Recibe SET fk_Id_Usuario = 5 WHERE fk_Id_Usuario = 2 AND fk_Id_Mensaje = 2;


DELETE FROM TrendingTopic WHERE id_trending_topic = 'trending1';
DELETE FROM TrendingTopic WHERE id_trending_topic = 'trending1';
DELETE FROM TrendingTopic WHERE id_trending_topic = 'trending2';

DELETE FROM Tweet WHERE Id_Tweet = 1;
DELETE FROM Tweet WHERE Id_Tweet = 2;
DELETE FROM Tweet WHERE Id_Tweet = 3;

DELETE FROM Sigue WHERE fk_Id_Usuario1 = 1 AND fk_Id_Usuario2 = 2;
DELETE FROM Sigue WHERE fk_Id_Usuario1 = 3 AND fk_Id_Usuario2 = 1;
DELETE FROM Sigue WHERE fk_Id_Usuario1 = 2 AND fk_Id_Usuario2 = 4;

DELETE FROM Retweet WHERE fk_Id_Tweet = 1 AND fk_Id_Usuario = 3;
DELETE FROM Retweet WHERE fk_Id_Tweet = 3 AND fk_Id_Usuario = 1;
DELETE FROM Retweet WHERE fk_Id_Tweet = 2 AND fk_Id_Usuario = 4;

DELETE FROM Mensaje WHERE Id_Mensaje = 1;
DELETE FROM Mensaje WHERE Id_Mensaje = 2;
DELETE FROM Mensaje WHERE Id_Mensaje = 3;

DELETE FROM Envia WHERE fk_Id_Usuario = 1 AND fk_Id_Mensaje = 1;
DELETE FROM Envia WHERE fk_Id_Usuario = 3 AND fk_Id_Mensaje = 3;
DELETE FROM Envia WHERE fk_Id_Usuario = 2 AND fk_Id_Mensaje = 2;

DELETE FROM Recibe WHERE fk_Id_Usuario = 1 AND fk_Id_Mensaje = 1;
DELETE FROM Recibe WHERE fk_Id_Usuario = 3 AND fk_Id_Mensaje = 3;
DELETE FROM Recibe WHERE fk_Id_Usuario = 2 AND fk_Id_Mensaje = 2;

SELECT * FROM TrendingTopic;
SELECT * FROM Tweet;
SELECT * FROM Sigue;
SELECT * FROM Retweet;
SELECT * FROM Mensaje;
SELECT * FROM Envia;
SELECT * FROM Recibe;

