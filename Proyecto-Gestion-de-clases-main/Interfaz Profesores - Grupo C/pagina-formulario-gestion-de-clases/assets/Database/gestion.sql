

# TABLAS - Crear por orden:
-- 1) PERSONAS
-- 2) USUARIOS
-- 3) CARRERAS
-- 4) MATERIAS
-- 5) CLASES
-- 6) ROLES
-- 7) USUXROL
-- 8) MODULOS
-- 9) ROLXMOD

-- Tabla `PERSONAS`
CREATE TABLE IF NOT EXISTS PERSONAS(
    DNI_PERSONA INT NOT NULL,
    NOMBRE_PERSONA VARCHAR(50) NOT NULL,
    APELLIDO_PERSONA VARCHAR(50) NOT NULL,
    CARGO TEXT NOT NULL,
    PRIMARY KEY (DNI_PERSONA)
);

-- Tabla `USUARIOS`
CREATE TABLE IF NOT EXISTS USUARIOS(
    CODIGO_USUARIO INT NOT NULL,
    DNI_PERSONA INT NOT NULL,
    MAIL_USUARIO VARCHAR(60) NOT NULL,
    CONTRASEÑA_USUARIO VARCHAR(20) NOT NULL,
    PRIMARY KEY (CODIGO_USUARIO),
    FOREIGN KEY (DNI_PERSONA) REFERENCES PERSONAS(DNI_PERSONA),
    CONSTRAINT UK_DNI_PERSONA UNIQUE (DNI_PERSONA)
);

-- Tabla `CARRERAS`
CREATE TABLE IF NOT EXISTS CARRERAS(
    ID_CARRERA INT NOT NULL AUTO_INCREMENT,
    TITULO_ABREVIADO VARCHAR(100) NOT NULL,
    DESCRIPCION TEXT NOT NULL,
    PRIMARY KEY (ID_CARRERA)
);

-- Tabla `MATERIAS`
CREATE TABLE IF NOT EXISTS MATERIAS(
    CODIGO_MATERIA INT NOT NULL,
    NOMBRE_MATERIA VARCHAR(100) NOT NULL,
    ID_CARRERA INT NOT NULL,
    PRIMARY KEY (CODIGO_MATERIA),
    FOREIGN KEY (ID_CARRERA) REFERENCES CARRERAS(ID_CARRERA)
);

-- Tabla `CLASES`
CREATE TABLE IF NOT EXISTS CLASES(
    ID_CLASE INT NOT NULL AUTO_INCREMENT,
    CODIGO_USUARIO INT NOT NULL,
    CODIGO_MATERIA INT NOT NULL,
    FECHA DATE NOT NULL,
    HORA VARCHAR(13) NOT NULL,
    TEMAS VARCHAR(50),
    NOVEDADES VARCHAR(50),
    COMISION VARCHAR(20) NOT NULL,
    AULA VARCHAR(20) NOT NULL,
    ARCHIVOS VARCHAR(400),
    PRIMARY KEY (ID_CLASE),
    FOREIGN KEY (CODIGO_USUARIO) REFERENCES USUARIOS(CODIGO_USUARIO),
    FOREIGN KEY (CODIGO_MATERIA) REFERENCES MATERIAS(CODIGO_MATERIA),
    CONSTRAINT CK_CLASES_COMISION CHECK (
        COMISION = '1ro1ra' OR
        COMISION = '1ro2da' OR
        COMISION = '1ro3ra' OR
        COMISION = '2do1ra' OR
        COMISION = '2do2da' OR
        COMISION = '3ro1ra' OR
        COMISION = '3ro2da'
    ),
	CONSTRAINT CK_CLASES_HORA CHECK (
        HORA = '8:00-10:00' or 
        HORA = '10:10-12:00' or 
        HORA = '8:00-12:00' or 
        HORA = '18:00-20:00' or 
        HORA = '20:10-22:00' or 
        HORA = '18:00-22:00'
    )
);

-- Tabla `ROLES`
CREATE TABLE IF NOT EXISTS ROLES(
    CODIGO_ROL INT NOT NULL,
    DESCRIPCION TEXT NOT NULL,
    PRIMARY KEY (CODIGO_ROL)
);

-- Tabla `USUXROL`
CREATE TABLE IF NOT EXISTS USUXROL(
    CODIGO_USUARIO INT NOT NULL,
    CODIGO_ROL INT NOT NULL,
    PRIMARY KEY (CODIGO_USUARIO, CODIGO_ROL),
    FOREIGN KEY (CODIGO_USUARIO) REFERENCES USUARIOS(CODIGO_USUARIO),
    FOREIGN KEY (CODIGO_ROL) REFERENCES ROLES(CODIGO_ROL)
);

-- Tabla `MODULOS`
CREATE TABLE IF NOT EXISTS MODULOS(
    CODIGO_MODULO INT NOT NULL,
    DESCRIPCION TEXT NOT NULL,
    PRIMARY KEY (CODIGO_MODULO)
);

-- Tabla `ROLXMOD`
CREATE TABLE IF NOT EXISTS ROLXMOD(
    CODIGO_ROL INT NOT NULL,
    CODIGO_MODULO INT NOT NULL,
    PRIMARY KEY (CODIGO_ROL, CODIGO_MODULO),
    FOREIGN KEY (CODIGO_ROL) REFERENCES ROLES(CODIGO_ROL),
    FOREIGN KEY (CODIGO_MODULO) REFERENCES MODULOS(CODIGO_MODULO)
);




# INSERTAR DATOS

-- Insertando datos en la tabla PERSONAS
INSERT INTO PERSONAS (DNI_PERSONA, NOMBRE_PERSONA, APELLIDO_PERSONA, CARGO) VALUES
(12345678, 'Pablo', 'Torrez', 'Profesor'),
(23456789, 'Maria', 'Gonzalez', 'Estudiante'),
(34567890, 'Luis', 'Martinez', 'Administrativo');


-- Insertando datos en la tabla USUARIOS
INSERT INTO USUARIOS (CODIGO_USUARIO, DNI_PERSONA, MAIL_USUARIO, CONTRASEÑA_USUARIO) VALUES
(1, 12345678, 'juan.perez@example.com', '12345678'),
(2, 23456789, 'maria.gonzalez@example.com', '23456789'),
(3, 34567890, 'luis.martinez@example.com', '34567890');


-- Insertando datos en la tabla CARRERAS
INSERT INTO CARRERAS (ID_CARRERA, TITULO_ABREVIADO, DESCRIPCION) VALUES
(1, 'Ing. Informática', 'Carrera de Ingeniería en Informática'),
(2, 'Lic. Administración', 'Carrera de Licenciatura en Administración');


-- Insertando datos en la tabla MATERIAS
INSERT INTO MATERIAS (CODIGO_MATERIA, NOMBRE_MATERIA, ID_CARRERA) VALUES
(101, 'Bases de Datos', 1),
(102, 'Contabilidad I', 2),
(103, 'Programación I', 1),
(104, 'Programación II', 1),
(105, 'Prácticas Profesionalizantes III', 1);


-- Insertando datos en la tabla CLASES
INSERT INTO CLASES (CODIGO_USUARIO, CODIGO_MATERIA, FECHA, HORA, TEMAS, NOVEDADES, COMISION, AULA, ARCHIVOS) VALUES
(1, 101, '2024-04-21', '8:00-10:00', 'Modelo Relacional', 'Ninguna novedad', '1ro1ra', '22', 'database_notes.pdf');
INSERT INTO CLASES (CODIGO_USUARIO, CODIGO_MATERIA, FECHA, HORA, TEMAS, NOVEDADES, COMISION, AULA, ARCHIVOS) VALUES
(1, 105, '2024-04-25', '8:00-12:00', 'Proyecto Final', 'Ninguna novedad', '3ro1ra', '24', 'metodologia_scrum.pdf');
INSERT INTO CLASES (CODIGO_USUARIO, CODIGO_MATERIA, FECHA, HORA, TEMAS, NOVEDADES, COMISION, AULA, ARCHIVOS) VALUES
(1, 103, '2024-04-20', '8:00-12:00', 'Programacion estructurada', 'Ninguna novedad', '1ro1ra', '24', 'java_para_novatos.pdf');
INSERT INTO CLASES (CODIGO_USUARIO, CODIGO_MATERIA, FECHA, HORA, TEMAS, NOVEDADES, COMISION, AULA, ARCHIVOS) VALUES
(1, 101, '2024-05-1', '8:00-10:00', 'DER', 'TP 1 DER', '2do2da', '22', 'tp1der.pdf');


-- Insertando datos en la tabla ROLES
INSERT INTO ROLES (CODIGO_ROL, DESCRIPCION) VALUES
(1, 'Administrador'),
(2, 'Profesor'),
(3, 'Estudiante');

-- Insertando datos en la tabla USUXROL
INSERT INTO USUXROL (CODIGO_USUARIO, CODIGO_ROL) VALUES
(1, 2),
(2, 3),
(3, 1);

-- Insertando datos en la tabla MODULOS
INSERT INTO MODULOS (CODIGO_MODULO, DESCRIPCION) VALUES
(1, 'Gestión de Usuarios'),
(2, 'Gestión de Clases');

-- Insertando datos en la tabla ROLXMOD
INSERT INTO ROLXMOD (CODIGO_ROL, CODIGO_MODULO) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 2);




# TRUNCAR TABLAS
TRUNCATE TABLE PERSONAS;
TRUNCATE TABLE USUARIOS;
TRUNCATE TABLE CARRERAS;
TRUNCATE TABLE MATERIAS;
TRUNCATE TABLE CLASES;
TRUNCATE TABLE ROLES;
TRUNCATE TABLE USUXROL;
TRUNCATE TABLE MODULOS;
TRUNCATE TABLE ROLXMOD

# DROPEAR TABLAS
DROP TABLE PERSONAS;
DROP TABLE USUARIOS;
DROP TABLE CARRERAS;
DROP TABLE MATERIAS;
DROP TABLE CLASES;
DROP TABLE ROLES;
DROP TABLE USUXROL;
DROP TABLE MODULOS;
DROP TABLE ROLXMOD;
