CREATE DATABASE medicina;
USE medicina;
CREATE TABLE UBICACIONES (
    id_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    texto TEXT
);

CREATE TABLE PACIENTE (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    numero_identificacion VARCHAR(50) UNIQUE NOT NULL,
    genero VARCHAR(50),
    edad INT,
    curso_de_vida VARCHAR(255),
    movilidad VARCHAR(255),
    categoria VARCHAR(255),
    texto TEXT,
    id_ubicacion INT,
    FOREIGN KEY (id_ubicacion) REFERENCES UBICACIONES(id_ubicacion)
);

CREATE TABLE DIAGNOSTICOS (
    id_diagnostico INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    clasificacion VARCHAR(255),
    texto TEXT,
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id_paciente)
);

CREATE TABLE CODIGO_CIE_10 (
    id_codigo_cie_10 INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    numerico INT,
    texto TEXT
);

CREATE TABLE SITUACION (
    id_situacion INT PRIMARY KEY AUTO_INCREMENT,
    enfoque_participante VARCHAR(255),
    texto TEXT
);

CREATE TABLE CODIGO_CIE_10_DIAGNOSTICO (
    id_codigo_cie_10_diagnostico INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cie_10_id INT NOT NULL,
    diagnostico_id INT NOT NULL,
    texto TEXT,
    FOREIGN KEY (codigo_cie_10_id) REFERENCES CODIGO_CIE_10(id_codigo_cie_10),
    FOREIGN KEY (diagnostico_id) REFERENCES DIAGNOSTICOS(id_diagnostico)
);

CREATE TABLE PACIENTE_SITUACION (
    id_paciente INT NOT NULL,
    id_situacion INT NOT NULL,
    PRIMARY KEY (id_paciente, id_situacion),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id_paciente),
    FOREIGN KEY (id_situacion) REFERENCES SITUACION(id_situacion)
);

CREATE TABLE DIAGNOSTICO_SITUACION (
    id_diagnostico INT NOT NULL,
    id_situacion INT NOT NULL,
    PRIMARY KEY (id_diagnostico, id_situacion),
    FOREIGN KEY (id_diagnostico) REFERENCES DIAGNOSTICOS(id_diagnostico),
    FOREIGN KEY (id_situacion) REFERENCES SITUACION(id_situacion)
);