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
    temperatura VARCHAR(15)
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
    num_personas int,
	fecha date
);

CREATE TABLE IF NOT EXISTS Sirve (
    fk_id_menu VARCHAR(20),
    fk_fecha_dia int,
    PRIMARY KEY (fk_id_menu , fk_fecha_dia),
    FOREIGN KEY (fk_id_menu)
        REFERENCES Menu (id_menu)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_fecha_dia)
        REFERENCES Dia (id_dia)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Consume (
    fk_id_dia int,
    fk_id_plato VARCHAR(20),
    cantidad INT,
    plato_exitoso VARCHAR(40),
    PRIMARY KEY (fk_id_dia , fk_id_plato),
    FOREIGN KEY (fk_id_dia)
        REFERENCES Dia (id_dia)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_plato)
        REFERENCES Plato (id_plato)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (1, '2023-10-21', 4);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (2, '2023-10-22', 2);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (3, '2023-10-23', 5);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (4, '2023-10-24', 3);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (5, '2023-10-25', 6);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (6, '2023-10-26', 4);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (7, '2023-10-27', 2);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (8, '2023-10-28', 3);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (9, '2023-10-29', 5);
INSERT INTO Menu (id_menu, fecha, num_personas) VALUES (10, '2023-10-30', 4);


INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (1, 'Pollo Asado', 'Principal', 'Pollo asado con especias', 'Caliente');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (2, 'Ensalada Mixta', 'Entrante', 'Ensalada fresca con verduras', 'Fria');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (3, 'Pasta Carbonara', 'Principal', 'Pasta con salsa carbonara', 'Caliente');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (4, 'Sopa de Tomate', 'Entrante', 'Sopa de tomate casera', 'Caliente');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (5, 'Salmon a la Parrilla', 'Principal', 'Filete de salmon a la parrilla', 'Caliente');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (6, 'Ensalada Cesar', 'Entrante', 'Ensalada con aderezo Cesar', 'Fria');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (7, 'Tacos de Carne', 'Principal', 'Tacos de carne de res', 'Caliente');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (8, 'Sopa de Champinones', 'Entrante', 'Sopa de champinones cremosa', 'Caliente');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (9, 'Pizza Margarita', 'Principal', 'Pizza con tomate y mozzarella', 'Caliente');
INSERT INTO Plato (id_plato, nombre, tipo, descripcion, temperatura) VALUES (10, 'Ensalada de Frutas', 'Postre', 'Ensalada de frutas frescas', 'Fria');

INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (1, 1);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (1, 2);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (2, 3);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (2, 4);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (3, 5);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (3, 6);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (4, 7);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (4, 8);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (5, 9);
INSERT INTO Compone (fk_id_menu, fk_id_plato) VALUES (5, 10);

INSERT INTO Dia (num_personas, fecha) VALUES (4, '2023-10-21');
INSERT INTO Dia (num_personas, fecha) VALUES (2, '2023-10-22');
INSERT INTO Dia (num_personas, fecha) VALUES (5, '2023-10-23');
INSERT INTO Dia (num_personas, fecha) VALUES (3, '2023-10-24');
INSERT INTO Dia (num_personas, fecha) VALUES (6, '2023-10-25');
INSERT INTO Dia (num_personas, fecha) VALUES (4, '2023-10-26');
INSERT INTO Dia (num_personas, fecha) VALUES (2, '2023-10-27');
INSERT INTO Dia (num_personas, fecha) VALUES (3, '2023-10-28');
INSERT INTO Dia (num_personas, fecha) VALUES (5, '2023-10-29');
INSERT INTO Dia (num_personas, fecha) VALUES (4, '2023-10-30');

INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (1, 1);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (2, 2);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (3, 3);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (4, 4);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (5, 5);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (6, 6);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (7, 7);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (8, 8);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (9, 9);
INSERT INTO Sirve (fk_id_menu, fk_fecha_dia) VALUES (10, 10);


INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (1, 1, 2, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (1, 2, 2, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (2, 3, 3, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (2, 4, 2, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (3, 5, 4, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (3, 6, 3, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (4, 7, 2, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (4, 8, 3, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (5, 9, 2, 'Si');
INSERT INTO Consume (fk_id_dia, fk_id_plato, cantidad, plato_exitoso) VALUES (5, 10, 3, 'Si');


UPDATE Menu SET num_personas = 6 WHERE id_menu = 1;
UPDATE Menu SET fecha = '2023-10-23' WHERE id_menu = 2;
UPDATE Menu SET num_personas = 4 WHERE id_menu = 3;

UPDATE Plato SET descripcion = 'Pollo asado con especias y hierbas' WHERE id_plato = 1;
UPDATE Plato SET tipo = 'Plato Principal' WHERE id_plato = 2;
UPDATE Plato SET temperatura = 'Caliente' WHERE id_plato = 3;

UPDATE Compone SET fk_id_menu = 4 WHERE fk_id_plato = 7;
UPDATE Compone SET fk_id_plato = 9 WHERE fk_id_menu = 15;
UPDATE Compone SET fk_id_plato = 6 WHERE fk_id_menu = 13;

UPDATE Dia SET num_personas = 7 WHERE id_dia = 1;
UPDATE Dia SET fecha = '2023-10-24' WHERE id_dia = 2;
UPDATE Dia SET num_personas = 6 WHERE id_dia = 3;

UPDATE Sirve SET fk_id_menu = 8 WHERE fk_fecha_dia = 9;
UPDATE Sirve SET fk_fecha_dia = 3 WHERE fk_id_menu = 6;
UPDATE Sirve SET fk_id_menu = 9 WHERE fk_fecha_dia = 7;

UPDATE Consume SET cantidad = 5 WHERE fk_id_dia = 1 AND fk_id_plato = 2;
UPDATE Consume SET plato_exitoso = 'No' WHERE fk_id_dia = 4 AND fk_id_plato = 7;
UPDATE Consume SET cantidad = 4 WHERE fk_id_dia = 5 AND fk_id_plato = 9;


DELETE FROM Menu WHERE id_menu = 1;
DELETE FROM Menu WHERE id_menu = 3;
DELETE FROM Menu WHERE id_menu = 5;

DELETE FROM Plato WHERE id_plato = 2;
DELETE FROM Plato WHERE id_plato = 4;
DELETE FROM Plato WHERE id_plato = 6;

DELETE FROM Plato WHERE id_plato = 2;
DELETE FROM Plato WHERE id_plato = 4;
DELETE FROM Plato WHERE id_plato = 6;

DELETE FROM Compone WHERE fk_id_menu = 2 AND fk_id_plato = 3;
DELETE FROM Compone WHERE fk_id_menu = 4 AND fk_id_plato = 7;
DELETE FROM Compone WHERE fk_id_menu = 6 AND fk_id_plato = 9;

DELETE FROM Dia WHERE id_dia = 2;
DELETE FROM Dia WHERE id_dia = 4;
DELETE FROM Dia WHERE id_dia = 6;

DELETE FROM Sirve WHERE fk_id_menu = 3 AND fk_fecha_dia = 3;
DELETE FROM Sirve WHERE fk_id_menu = 5 AND fk_fecha_dia = 5;
DELETE FROM Sirve WHERE fk_id_menu = 7 AND fk_fecha_dia = 7;

DELETE FROM Consume WHERE fk_id_dia = 2 AND fk_id_plato = 4;
DELETE FROM Consume WHERE fk_id_dia = 4 AND fk_id_plato = 8;
DELETE FROM Consume WHERE fk_id_dia = 6 AND fk_id_plato = 10;

SELECT * FROM Menu;
SELECT * FROM Plato;
SELECT * FROM Compone;
SELECT * FROM Dia;
SELECT * FROM Sirve;
SELECT * FROM Consume;

