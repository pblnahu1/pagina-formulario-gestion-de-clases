CREATE TABLE carreras(
ID int NOT NULL AUTO_INCREMENT,
titulo_abreviado varchar(30) NOT NULL,
descripcion varchar(50) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE personas(
DNI INT NOT NULL,
nombre VARCHAR(20),
apellido VARCHAR(20),
cargo VARCHAR(20),
PRIMARY KEY (DNI));

CREATE TABLE roles(
CODIGO INT NOT NULL,
descripcion VARCHAR(20),
PRIMARY KEY (CODIGO));

CREATE TABLE modulos(
CODIGO INT NOT NULL,
descripcion VARCHAR(20),
PRIMARY KEY (CODIGO));

CREATE TABLE materias(
CODIGO INT NOT NULL AUTO_INCREMENT,
ID_CARRERA INT NOT NULL,
nombre VARCHAR(30),
PRIMARY KEY (CODIGO),
FOREIGN KEY (ID_CARRERA) REFERENCES carreras(ID));

CREATE TABLE usuarios(
CODIGO INT NOT NULL AUTO_INCREMENT,
DNI INT NOT NULL,
mail VARCHAR(30),
contraseña VARCHAR(20),
PRIMARY KEY (CODIGO),
UNIQUE (DNI),
FOREIGN KEY (DNI) REFERENCES personas(DNI));

CREATE TABLE usuxrol(
CODIGO_USUARIO INT NOT NULL,
CODIGO_ROL INT NOT NULL,
PRIMARY KEY (CODIGO_USUARIO, CODIGO_ROL),
FOREIGN KEY (CODIGO_USUARIO) REFERENCES usuarios(CODIGO),
FOREIGN KEY (CODIGO_ROL) REFERENCES roles(CODIGO));

CREATE TABLE rolxmod(
CODIGO_ROL INT NOT NULL,
CODIGO_MODULO INT NOT NULL,
PRIMARY KEY (CODIGO_ROL, CODIGO_MODULO),
FOREIGN KEY (CODIGO_ROL) REFERENCES roles(CODIGO),
FOREIGN KEY (CODIGO_MODULO) REFERENCES modulos(CODIGO));

CREATE TABLE clases(
ID_CLASE INT NOT NULL AUTO_INCREMENT,
CODIGO_USUARIO INT NOT NULL,
CODIGO_MATERIA INT NOT NULL,
fecha DATE NOT NULL,
hora VARCHAR(20) NOT NULL,
temas VARCHAR(50) NOT NULL,
novedades VARCHAR(40) NOT NULL,
comision VARCHAR(20) NOT NULL,
aula INT NOT NULL,
archivos VARCHAR(400) NOT NULL,
PRIMARY KEY (ID_CLASE),
FOREIGN KEY (CODIGO_USUARIO) REFERENCES usuarios(CODIGO),
FOREIGN KEY (CODIGO_MATERIA) REFERENCES materias(CODIGO));

