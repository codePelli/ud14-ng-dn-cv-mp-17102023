drop database if exists ejercicio18;
create database if not exists ejercicio18;
use ejercicio18;

CREATE TABLE IF NOT EXISTS Inmueble (
    codigo INT PRIMARY KEY,
    metros DOUBLE,
    descripcion TEXT,
    direccion VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Garaje (
    fk_codigo INT PRIMARY KEY,
    numero INT,
    planta INT,
    FOREIGN KEY (fk_codigo)
        REFERENCES Inmueble (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Piso (
    fk_codigo INT PRIMARY KEY,
    codigo_esp VARCHAR(255),
    fk_id_garaje INT,
    FOREIGN KEY (fk_codigo)
        REFERENCES Inmueble (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_garaje)
        REFERENCES Garaje (fk_codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Local (
    fk_codigo INT,
    tipo_uso VARCHAR(255),
    tiene_servicio BOOLEAN,
    FOREIGN KEY (fk_codigo)
        REFERENCES Inmueble (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Persona (
    DNI VARCHAR(10) PRIMARY KEY,
    fijo VARCHAR(15),
    movil VARCHAR(15),
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    codigo_personal INT
);

CREATE TABLE IF NOT EXISTS Cliente (
    fk_DNI VARCHAR(10),
    id_cliente INT PRIMARY KEY,
    FOREIGN KEY (fk_DNI)
        REFERENCES Persona (DNI)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Trabajador (
    fk_DNI VARCHAR(10),
    id_trabajador INT PRIMARY KEY,
    FOREIGN KEY (fk_DNI)
        REFERENCES Persona (DNI)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Comprar (
    codigo INT PRIMARY KEY,
    fk_codigo_inmueble INT,
    fk_id_cliente INT,
    valor_compra DOUBLE,
    fecha DATE,
    codigo_compra VARCHAR(255),
    FOREIGN KEY (fk_codigo_inmueble)
        REFERENCES Inmueble (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_cliente)
        REFERENCES Cliente (id_cliente)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Alquiler (
    codigo INT PRIMARY KEY,
    numero_alquiler INT,
    nombre_agente VARCHAR(255),
    empresa VARCHAR(150),
    persona_alquiler VARCHAR(150),
    precio DECIMAL,
    fk_id_cliente INT,
    fk_id_trabajador INT,
    FOREIGN KEY (fk_id_cliente)
        REFERENCES Cliente (id_cliente)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_trabajador)
        REFERENCES Trabajador (id_trabajador)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PagoAlquiler (
    id_pago INT PRIMARY KEY,
    ano_pago INT,
    mes_pago INT,
    precio DECIMAL,
    fk_codigo_alquiler INT,
    FOREIGN KEY (fk_codigo_alquiler)
        REFERENCES Alquiler (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (1, 100.5, 'Casa amplia con jardin', '123 Main Street');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (2, 75.3, 'Apartamento centrico', '456 Elm Street');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (3, 150.2, 'Oficina en edificio de negocios', '789 Oak Avenue');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (4, 90.7, 'Local comercial en esquina', '567 Pine Road');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (5, 120.8, 'Piso con vista al mar', '101 Beachfront Road');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (6, 200.0, 'Casa de campo con piscina', '222 Countryside Lane');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (7, 80.1, 'Piso en zona residencial', '333 Sunset Boulevard');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (8, 65.6, 'Garaje para dos autos', '444 Garage Lane');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (9, 180.4, 'Local en centro comercial', '777 Mall Street');
INSERT INTO Inmueble (codigo, metros, descripcion, direccion) VALUES (10, 95.2, 'Piso moderno', '555 Modern Avenue');


INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('1234567890', '987654321', '654321987', 'Juan', 'Perez', 1);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('0987654321', '123456789', '321987654', 'Maria', 'Lopez', 2);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('5678901234', '456789012', '789012345', 'Luis', 'Gonzalez', 3);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('2345678900', '987654321', '654321987', 'Laura', 'Rodriguez', 4);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('4567890123', '123456789', '321987654', 'Carlos', 'Martinez', 5);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('7890123456', '456789012', '789012345', 'Elena', 'Sanchez', 6);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('9876543210', '123456789', '321987654', 'Pedro', 'Fernandez', 7);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('3456789012', '987654321', '654321987', 'Ana', 'Torres', 8);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('6543210987', '123456789', '789012345', 'David', 'Lopez', 9);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('8901234567', '456789012', '321987654', 'Marta', 'Perez', 10);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('1111111111', '111111111', '111111111', 'Juan', 'Diaz', 11);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('2222222222', '222222222', '222222222', 'Maria', 'Gomez', 12);
INSERT INTO Persona (DNI, fijo, movil, nombre, apellidos, codigo_personal) VALUES ('3333333333', '333333333', '333333333', 'Luis', 'Hernandez', 13);

INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('1234567890', 1);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('0987654321', 2);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('5678901234', 3);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('2345678900', 4);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('4567890123', 5);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('7890123456', 6);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('9876543210', 7);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('3456789012', 8);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('6543210987', 9);
INSERT INTO Cliente (fk_DNI, id_cliente) VALUES ('8901234567', 10);


INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('1234567890', 1);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('0987654321', 2);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('5678901234', 3);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('1111111111', 4);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('4567890123', 5);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('7890123456', 6);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('9876543210', 7);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('3456789012', 8);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('2222222222', 9);
INSERT INTO Trabajador (fk_DNI, id_trabajador) VALUES ('3333333333', 10);



INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (1, 2, 1);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (8, 1, 2);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (10, 3, 1);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (4, 5, 1);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (2, 4, 2);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (9, 6, 1);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (7, 2, 1);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (6, 3, 2);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (3, 1, 1);
INSERT INTO Garaje (fk_codigo, numero, planta) VALUES (5, 2, 2);

INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (5, 'PISO101', 1);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (10, 'PISO202', 3);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (4, 'PISO303', 2);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (2, 'PISO404', 4);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (7, 'PISO505', 1);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (9, 'PISO606', 5);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (6, 'PISO707', 1);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (3, 'PISO808', 3);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (8, 'PISO909', 2);
INSERT INTO Piso (fk_codigo, codigo_esp, fk_id_garaje) VALUES (1, 'PISO1010', 4);

INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (3, 'Comercial', 1);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (4, 'Oficina', 0);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (9, 'Tienda', 1);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (7, 'Restaurante', 1);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (10, 'Oficina', 0);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (2, 'Tienda', 1);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (5, 'Comercial', 0);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (1, 'Restaurante', 1);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (6, 'Oficina', 0);
INSERT INTO Local (fk_codigo, tipo_uso, tiene_servicio) VALUES (8, 'Tienda', 1);


INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (1, 1, 1, 150000, '2023-01-15', 'COMPRA001');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (2, 2, 2, 120000, '2023-02-20', 'COMPRA002');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (3, 3, 3, 250000, '2023-03-25', 'COMPRA003');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (4, 4, 4, 180000, '2023-04-10', 'COMPRA004');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (5, 5, 5, 210000, '2023-05-05', 'COMPRA005');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (6, 6, 6, 320000, '2023-06-15', 'COMPRA006');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (7, 7, 7, 190000, '2023-07-20', 'COMPRA007');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (8, 8, 8, 145000, '2023-08-10', 'COMPRA008');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (9, 9, 9, 260000, '2023-09-05', 'COMPRA009');
INSERT INTO Comprar (codigo, fk_codigo_inmueble, fk_id_cliente, valor_compra, fecha, codigo_compra) VALUES (10, 10, 10, 175000, '2023-10-15', 'COMPRA010');

INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (1, 101, 'Inmobiliaria A', 'Empresa 1', 'Persona 1', 800.50, 1, 1);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (2, 102, 'Inmobiliaria B', 'Empresa 2', 'Persona 2', 950.75, 2, 2);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (3, 103, 'Inmobiliaria C', 'Empresa 3', 'Persona 3', 1100.00, 3, 3);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (4, 104, 'Inmobiliaria D', 'Empresa 4', 'Persona 4', 750.25, 4, 4);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (5, 105, 'Inmobiliaria E', 'Empresa 5', 'Persona 5', 875.00, 5, 5);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (6, 106, 'Inmobiliaria F', 'Empresa 6', 'Persona 6', 990.50, 6, 6);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (7, 107, 'Inmobiliaria G', 'Empresa 7', 'Persona 7', 825.75, 7, 7);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (8, 108, 'Inmobiliaria H', 'Empresa 8', 'Persona 8', 1150.00, 8, 8);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (9, 109, 'Inmobiliaria I', 'Empresa 9', 'Persona 9', 780.25, 9, 9);
INSERT INTO Alquiler (codigo, numero_alquiler, nombre_agente, empresa, persona_alquiler, precio, fk_id_cliente, fk_id_trabajador) VALUES (10, 110, 'Inmobiliaria J', 'Empresa 10', 'Persona 10', 950.50, 10, 10);

INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (1, 2023, 1, 800.50, 1);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (2, 2023, 2, 950.75, 2);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (3, 2023, 3, 1100.00, 3);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (4, 2023, 4, 750.25, 4);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (5, 2023, 5, 875.00, 5);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (6, 2023, 6, 990.50, 6);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (7, 2023, 7, 825.75, 7);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (8, 2023, 8, 1150.00, 8);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (9, 2023, 9, 780.25, 9);
INSERT INTO PagoAlquiler (id_pago, ano_pago, mes_pago, precio, fk_codigo_alquiler) VALUES (10, 2023, 10, 950.50, 10);


UPDATE Persona SET nombre = 'Juan Carlos', apellidos = 'Perez Martinez' WHERE DNI = '1234567890';
UPDATE Persona SET movil = '666555444' WHERE DNI = '2345678900';
UPDATE Persona SET nombre = 'Carla' WHERE DNI = '4567890123';

UPDATE Cliente SET id_cliente = 11 WHERE id_cliente = 1;
UPDATE Cliente SET fk_DNI = '2345678900' WHERE id_cliente = 5;
UPDATE Cliente SET fk_DNI = '3456789012', id_cliente = 17 WHERE id_cliente = 3;

UPDATE Trabajador SET fk_DNI = '1111111111' WHERE id_trabajador = 2;
UPDATE Trabajador SET fk_DNI = '3333333333', id_trabajador = 12 WHERE id_trabajador = 6;
UPDATE Trabajador SET fk_DNI = '1111111111', id_trabajador = 22 WHERE id_trabajador = 10;

UPDATE Inmueble SET descripcion = 'Casa grande con jardín', direccion = 'Calle Principal 123' WHERE codigo = 1;
UPDATE Inmueble SET metros = 120.5 WHERE codigo = 2;
UPDATE Inmueble SET direccion = 'Avenida Central 456' WHERE codigo = 3;

UPDATE Garaje SET numero = 25, planta = 2 WHERE fk_codigo = 1;
UPDATE Garaje SET numero = 10 WHERE fk_codigo = 2;
UPDATE Garaje SET planta = 3 WHERE fk_codigo = 3;

UPDATE Piso SET codigo_esp = 'P-001', fk_id_garaje = 4 WHERE fk_codigo = 1;
UPDATE Piso SET fk_id_garaje = 5 WHERE fk_codigo = 2;
UPDATE Piso SET codigo_esp = 'P-003' WHERE fk_codigo = 3;

UPDATE Local SET tipo_uso = 'Oficina', tiene_servicio = 1 WHERE fk_codigo = 1;
UPDATE Local SET tipo_uso = 'Tienda' WHERE fk_codigo = 2;
UPDATE Local SET tiene_servicio = 0 WHERE fk_codigo = 3;

UPDATE Persona SET nombre = 'Pedro', apellidos = 'Garcia' WHERE DNI = '1234567890';
UPDATE Persona SET movil = '654987321' WHERE DNI = '0987654321';
UPDATE Persona SET nombre = 'Mariona' WHERE DNI = '5678901234';

UPDATE Trabajador SET fk_DNI = '5678901234' WHERE id_trabajador = 1;
UPDATE Trabajador SET fk_DNI = '6543210987' WHERE id_trabajador = 2;

UPDATE Cliente SET fk_DNI = '2345678901' WHERE id_cliente = 1;
UPDATE Cliente SET fk_DNI = '3456789012' WHERE id_cliente = 2;
UPDATE Cliente SET fk_DNI = '4567890123' WHERE id_cliente = 3;


DELETE FROM Persona WHERE DNI = '1234567890';
DELETE FROM Persona WHERE DNI = '0987654321';
DELETE FROM Persona WHERE DNI = '5678901234';

DELETE FROM Cliente WHERE id_cliente = 1;
DELETE FROM Cliente WHERE id_cliente = 2;
DELETE FROM Cliente WHERE id_cliente = 3;


DELETE FROM Trabajador WHERE id_trabajador = 4;
DELETE FROM Trabajador WHERE id_trabajador = 5;
DELETE FROM Trabajador WHERE id_trabajador = 6;

DELETE FROM Inmueble WHERE codigo = 1;
DELETE FROM Inmueble WHERE codigo = 2;
DELETE FROM Inmueble WHERE codigo = 3;

DELETE FROM Garaje WHERE fk_codigo = 1;
DELETE FROM Garaje WHERE fk_codigo = 2;
DELETE FROM Garaje WHERE fk_codigo = 3;

DELETE FROM Piso WHERE fk_codigo = 1;
DELETE FROM Piso WHERE fk_codigo = 2;
DELETE FROM Piso WHERE fk_codigo = 3;

DELETE FROM Local WHERE fk_codigo = 1;
DELETE FROM Local WHERE fk_codigo = 2;
DELETE FROM Local WHERE fk_codigo = 3;

DELETE FROM Comprar WHERE codigo = 1;
DELETE FROM Comprar WHERE codigo = 2;
DELETE FROM Comprar WHERE codigo = 3;

DELETE FROM Alquiler WHERE codigo = 1;
DELETE FROM Alquiler WHERE codigo = 2;
DELETE FROM Alquiler WHERE codigo = 3;

DELETE FROM PagoAlquiler WHERE id_pago = 1;
DELETE FROM PagoAlquiler WHERE id_pago = 2;
DELETE FROM PagoAlquiler WHERE id_pago = 3;

SELECT * FROM Inmueble;
SELECT * FROM Garaje;
SELECT * FROM Piso;
SELECT * FROM Local;
SELECT * FROM Persona;
SELECT * FROM Cliente;
SELECT * FROM Trabajador;
SELECT * FROM Comprar;
SELECT * FROM Alquiler;
SELECT * FROM PagoAlquiler;

