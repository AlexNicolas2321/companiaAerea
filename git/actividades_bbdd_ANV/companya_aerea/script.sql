CREATE DATABASE IF NOT EXISTS Compañia_aerea;

USE Compañia_aerea;

CREATE TABLE PROFESIONAL (
    Cod_categoria TINYINT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL
);

CREATE TABLE PERSONAL (
    Id_trabajador TINYINT NOT NULL PRIMARY KEY,
    Cod_categoria TINYINT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20) NULL,
    Telefono VARCHAR(9) NOT NULL,
    CONSTRAINT FK_Cod_categoria_PERSONAL
        FOREIGN KEY (Cod_categoria) REFERENCES PROFESIONAL (Cod_categoria)
);

CREATE TABLE TELEFONO_PERSONAL (
    Id_trabajador TINYINT NOT NULL,
    Telefono VARCHAR(9) NOT NULL,
    PRIMARY KEY (Id_trabajador, Telefono),
    CONSTRAINT FK_Id_trabajador_TELEFONO_PERSONAL
        FOREIGN KEY (Id_trabajador) REFERENCES PERSONAL (Id_trabajador)
);

CREATE TABLE AVION (
    Matricula CHAR(10) NOT NULL PRIMARY KEY,
    Fabricante VARCHAR(20) NOT NULL,
    Modelo CHAR(10) NOT NULL,
    Capacidad TINYINT NOT NULL,
    Autonomia VARCHAR(20) NOT NULL
);

CREATE TABLE VUELO (
    Id_vuelo TINYINT NOT NULL PRIMARY KEY,
    Matricula CHAR(10) NOT NULL,
    Origen VARCHAR(40) NOT NULL,
    Destino VARCHAR(40) NOT NULL,
    Fecha DATETIME NOT NULL,
    CONSTRAINT FK_Matricula_VUELO
        FOREIGN KEY (Matricula) REFERENCES AVION (Matricula)
);

CREATE TABLE PUESTO (
    Id_trabajador TINYINT NOT NULL,
    Id_vuelo TINYINT NOT NULL,
    Puesto VARCHAR(15) NOT NULL,
    PRIMARY KEY (Id_trabajador, Id_vuelo),
    CONSTRAINT FK_Id_trabajador_PUESTO
        FOREIGN KEY (Id_trabajador) REFERENCES PERSONAL (Id_trabajador),
    CONSTRAINT FK_Id_vuelo_PUESTO
        FOREIGN KEY (Id_vuelo) REFERENCES VUELO (Id_vuelo)
);

CREATE TABLE PASAJERO (
    Dni_pasajero CHAR(9) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(15) NOT NULL,
    Apellidos VARCHAR(15) NOT NULL,
    Email VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONO_PASAJERO (
    Dni_pasajero CHAR(9) NOT NULL,
    Telefono CHAR(9) NOT NULL,
    PRIMARY KEY (Dni_pasajero, Telefono),
    CONSTRAINT FK_Dni_pasajero_TELEFONO_PASAJERO
        FOREIGN KEY (Dni_pasajero) REFERENCES PASAJERO (Dni_pasajero)
);

CREATE TABLE DISTRIBUCION (
    Dni_pasajero CHAR(9) NOT NULL,
    Id_vuelo TINYINT NOT NULL,
    Asiento VARCHAR(10) NOT NULL,
    Clase VARCHAR(10) NOT NULL,
    PRIMARY KEY (Dni_pasajero, Id_vuelo),
    CONSTRAINT FK_Dni_pasajero_DISTRIBUCION
        FOREIGN KEY (Dni_pasajero) REFERENCES PASAJERO (Dni_pasajero),
    CONSTRAINT FK_Id_vuelo_DISTRIBUCION
        FOREIGN KEY (Id_vuelo) REFERENCES VUELO (Id_vuelo)
);




