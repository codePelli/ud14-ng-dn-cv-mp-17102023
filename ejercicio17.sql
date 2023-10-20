drop database if exists ejercicio17;
create database if not exists ejercicio17;
use ejercicio17;

CREATE TABLE IF NOT EXISTS Centro (
    id_centro INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    grado VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS Ciclo (
    id_ciclo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    grado VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS Ensena (
    fk_id_centro INT,
    fk_id_ciclo INT,
    FOREIGN KEY (fk_id_centro)
        REFERENCES Centro (id_centro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_ciclo)
        REFERENCES Ciclo (id_ciclo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Profesor (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(15),
    mail VARCHAR(150),
    dni VARCHAR(15),
    num_ss VARCHAR(25),
    años_antiguedad INT
);

CREATE TABLE IF NOT EXISTS Aula (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    hora TIME,
    dia_semana DATE,
    metros DOUBLE
);

CREATE TABLE IF NOT EXISTS Asignatura (
    fk_id_aula INT,
    fk_id_profesor INT,
    id_asignatura INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100),
    id_europeo VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (fk_id_aula)
        REFERENCES Aula (id_aula)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_profesor)
        REFERENCES Profesor (id_profesor)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Contiene (
	id_contiene int auto_increment primary key,
    fk_id_ciclo INT,
    fk_id_asignatura INT,
    FOREIGN KEY (fk_id_ciclo)
        REFERENCES Ciclo (id_ciclo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_asignatura)
        REFERENCES Asignatura (id_asignatura)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Tutor (
    id_tutor INT PRIMARY KEY AUTO_INCREMENT,
    años_antiguedad INT,
    fk_id_profesor INT,
    FOREIGN KEY (fk_id_profesor)
        REFERENCES Profesor (id_profesor)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Centro (nombre, grado) VALUES ('Centro 1', 'Grado 1');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 2', 'Grado 2');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 3', 'Grado 3');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 4', 'Grado 4');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 5', 'Grado 5');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 6', 'Grado 6');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 7', 'Grado 7');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 8', 'Grado 8');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 9', 'Grado 9');
INSERT INTO Centro (nombre, grado) VALUES ('Centro 10', 'Grado 10');

INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 1', 'Grado 1');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 2', 'Grado 2');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 3', 'Grado 3');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 4', 'Grado 4');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 5', 'Grado 5');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 6', 'Grado 6');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 7', 'Grado 7');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 8', 'Grado 8');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 9', 'Grado 9');
INSERT INTO Ciclo (nombre, grado) VALUES ('Ciclo 10', 'Grado 10');

INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (1, 1);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (2, 2);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (3, 3);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (4, 4);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (5, 5);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (6, 6);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (7, 7);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (8, 8);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (9, 9);
INSERT INTO Ensena (fk_id_centro, fk_id_ciclo) VALUES (10, 10);

INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 1', 'Direccion 1', '123456789', 'profesor1@mail.com', 'DNI1', 'NSS1', 5);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 2', 'Direccion 2', '987654321', 'profesor2@mail.com', 'DNI2', 'NSS2', 8);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 3', 'Direccion 3', '111222333', 'profesor3@mail.com', 'DNI3', 'NSS3', 3);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 4', 'Direccion 4', '444555666', 'profesor4@mail.com', 'DNI4', 'NSS4', 6);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 5', 'Direccion 5', '777888999', 'profesor5@mail.com', 'DNI5', 'NSS5', 7);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 6', 'Direccion 6', '222333444', 'profesor6@mail.com', 'DNI6', 'NSS6', 4);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 7', 'Direccion 7', '555666777', 'profesor7@mail.com', 'DNI7', 'NSS7', 9);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 8', 'Direccion 8', '888999000', 'profesor8@mail.com', 'DNI8', 'NSS8', 2);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 9', 'Direccion 9', '999000111', 'profesor9@mail.com', 'DNI9', 'NSS9', 1);
INSERT INTO Profesor (nombre, direccion, telefono, mail, dni, num_ss, años_antiguedad) VALUES ('Profesor 10', 'Direccion 10', '111222333', 'profesor10@mail.com', 'DNI10', 'NSS10', 7);


INSERT INTO Aula (hora, dia_semana, metros) VALUES ('08:00:00', '2023-10-23', 100.5);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('10:30:00', '2023-10-24', 80.2);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('13:15:00', '2023-10-25', 120.7);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('15:45:00', '2023-10-26', 90.3);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('09:30:00', '2023-10-27', 110.1);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('11:45:00', '2023-10-28', 75.8);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('14:00:00', '2023-10-29', 95.4);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('16:30:00', '2023-10-30', 105.9);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('10:00:00', '2023-10-31', 110.8);
INSERT INTO Aula (hora, dia_semana, metros) VALUES ('12:15:00', '2023-11-01', 85.6);

INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (1, 1, 'Asignatura 1', 'ID1', '2023-10-23', '2023-11-15');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (2, 2, 'Asignatura 2', 'ID2', '2023-10-24', '2023-11-16');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (3, 3, 'Asignatura 3', 'ID3', '2023-10-25', '2023-11-17');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (4, 4, 'Asignatura 4', 'ID4', '2023-10-26', '2023-11-18');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (5, 5, 'Asignatura 5', 'ID5', '2023-10-27', '2023-11-19');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (6, 6, 'Asignatura 6', 'ID6', '2023-10-28', '2023-11-20');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (7, 7, 'Asignatura 7', 'ID7', '2023-10-29', '2023-11-21');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (8, 8, 'Asignatura 8', 'ID8', '2023-10-30', '2023-11-22');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (9, 9, 'Asignatura 9', 'ID9', '2023-10-31', '2023-11-23');
INSERT INTO Asignatura (fk_id_aula, fk_id_profesor, nombre, id_europeo, fecha_inicio, fecha_fin) VALUES (10, 10, 'Asignatura 10', 'ID10', '2023-11-01', '2023-11-24');



INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (1, 1);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (2, 2);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (3, 3);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (4, 4);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (5, 5);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (6, 6);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (7, 7);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (8, 8);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (9, 9);
INSERT INTO Contiene (fk_id_ciclo, fk_id_asignatura) VALUES (10, 10);

INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (5, 1);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (8, 2);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (3, 3);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (6, 4);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (7, 5);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (4, 6);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (9, 7);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (2, 8);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (1, 9);
INSERT INTO Tutor (años_antiguedad, fk_id_profesor) VALUES (7, 10);



UPDATE Centro SET nombre = 'Nuevo Nombre de Centro 1' WHERE id_centro = 1;
UPDATE Centro SET grado = 'Nuevo Grado de Centro 2' WHERE id_centro = 2;
UPDATE Centro SET nombre = 'Nuevo Nombre de Centro 3', grado = 'Nuevo Grado de Centro 3' WHERE id_centro = 3;

UPDATE Ciclo SET nombre = 'Nuevo Nombre de Ciclo 1' WHERE id_ciclo = 1;
UPDATE Ciclo SET grado = 'Nuevo Grado de Ciclo 2' WHERE id_ciclo = 2;
UPDATE Ciclo SET nombre = 'Nuevo Nombre de Ciclo 3', grado = 'Nuevo Grado de Ciclo 3' WHERE id_ciclo = 3;

UPDATE Profesor SET nombre = 'Nuevo Nombre Profesor 1' WHERE id_profesor = 1;
UPDATE Profesor SET direccion = 'Nueva Direccion Profesor 2' WHERE id_profesor = 2;
UPDATE Profesor SET nombre = 'Nuevo Nombre Profesor 3', direccion = 'Nueva Direccion Profesor 3' WHERE id_profesor = 3;

UPDATE Aula SET hora = '10:00:00' WHERE id_aula = 1;
UPDATE Aula SET dia_semana = '2023-10-30' WHERE id_aula = 2;
UPDATE Aula SET hora = '14:30:00', dia_semana = '2023-11-01' WHERE id_aula = 3;

UPDATE Asignatura SET nombre = 'Nueva Asignatura 1' WHERE id_asignatura = 1;
UPDATE Asignatura SET fecha_inicio = '2023-11-01' WHERE id_asignatura = 2;
UPDATE Asignatura SET nombre = 'Nueva Asignatura 3', fecha_inicio = '2023-11-02' WHERE id_asignatura = 3;

UPDATE Contiene SET fk_id_ciclo = 4 WHERE id_contiene = 1;
UPDATE Contiene SET fk_id_asignatura = 5 WHERE id_contiene = 2;
UPDATE Contiene SET fk_id_ciclo = 6, fk_id_asignatura = 7 WHERE id_contiene = 3;

UPDATE Tutor SET años_antiguedad = 6 WHERE id_tutor = 1;
UPDATE Tutor SET años_antiguedad = 9 WHERE id_tutor = 2;
UPDATE Tutor SET años_antiguedad = 4 WHERE id_tutor = 3;


DELETE FROM Centro WHERE id_centro = 1;
DELETE FROM Centro WHERE id_centro = 2;
DELETE FROM Centro WHERE id_centro = 3;

DELETE FROM Ciclo WHERE id_ciclo = 1;
DELETE FROM Ciclo WHERE id_ciclo = 2;
DELETE FROM Ciclo WHERE id_ciclo = 3;

DELETE FROM Profesor WHERE id_profesor = 1;
DELETE FROM Profesor WHERE id_profesor = 2;
DELETE FROM Profesor WHERE id_profesor = 3;

DELETE FROM Aula WHERE id_aula = 1;
DELETE FROM Aula WHERE id_aula = 2;
DELETE FROM Aula WHERE id_aula = 3;

DELETE FROM Asignatura WHERE id_asignatura = 1;
DELETE FROM Asignatura WHERE id_asignatura = 2;
DELETE FROM Asignatura WHERE id_asignatura = 3;

DELETE FROM Contiene WHERE id_contiene = 1;
DELETE FROM Contiene WHERE id_contiene = 2;
DELETE FROM Contiene WHERE id_contiene = 3;

DELETE FROM Tutor WHERE id_tutor = 1;
DELETE FROM Tutor WHERE id_tutor = 2;
DELETE FROM Tutor WHERE id_tutor = 3;

SELECT * FROM Centro;
SELECT * FROM Ciclo;
SELECT * FROM Profesor;
SELECT * FROM Aula;
SELECT * FROM Asignatura;
SELECT * FROM Contiene;
SELECT * FROM Tutor;
