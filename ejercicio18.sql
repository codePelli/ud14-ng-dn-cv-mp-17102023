drop database if exists ejercicio18;
create database if not exists ejercicio18;
use ejercicio18;

create table if not exists Inmueble (
    codigo INT PRIMARY KEY,
    metros double,
    descripcion TEXT,
    direccion VARCHAR(255)
);

create table if not exists Garaje (
    fk_codigo INT,
    numero INT,
    planta INT,
    FOREIGN KEY (fk_codigo) REFERENCES Inmueble(codigo)
);

create table if not exists Piso (
    fk_codigo INT,
    codigo_esp VARCHAR(255),
    fk_id_garaje INT,
    FOREIGN KEY (fk_codigo) REFERENCES Inmueble(codigo),
    FOREIGN KEY (fk_id_garaje) REFERENCES Garaje(fk_codigo)
);


create table if not exists Local (
    fk_codigo INT,
    tipo_uso VARCHAR(255),
    tiene_servicio BOOLEAN,
    FOREIGN KEY (fk_codigo) REFERENCES Inmueble(codigo)
);

create table if not exists Persona (
    DNI VARCHAR(10) PRIMARY KEY,
    fijo VARCHAR(15),
    movil VARCHAR(15),
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    codigo_personal INT
);

create table if not exists Cliente (
    fk_DNI VARCHAR(10),
    id_cliente INT PRIMARY KEY,
    foreign key (fk_DNI) references Persona(DNI)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Trabajador (
    fk_DNI VARCHAR(10),
    id_trabajador INT PRIMARY KEY,
    FOREIGN KEY (fk_DNI) REFERENCES Persona(DNI)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists Comprar (
    codigo INT PRIMARY KEY,
    fk_codigo_inmueble int,
    fk_id_cliente int,
    id_cliente INT,
    valor_compra double,
    fecha DATE,
    codigo_compra VARCHAR(255),
    foreign key (fk_codigo_inmueble) references Inmueble(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    foreign key (fk_id_cliente) references Cliente(id_cliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table if not exists ContratoAlquiler (
    codigo INT PRIMARY KEY,
    numero_alquiler INT,
    nombre_agente VARCHAR(255),
    empresa VARCHAR(255),
    persona_alquiler VARCHAR(10),
    precio double
);

create table if not exists PagoAlquiler (
    id_pago INT PRIMARY KEY,
    persona_alquiler VARCHAR(10),
    año_pago INT,
    mes_pago INT,
    precio double
);
