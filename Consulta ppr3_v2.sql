DROP TABLE CLASES
DROP TABLE PROFESORES
DROP TABLE MATERIAS
DROP TABLE ADMINISTRADORES
DROP TABLE CARRERAS

CREATE TABLE PROFESORES (
CODIGO INT NOT NULL,
NOMBRE VARCHAR(20) NOT NULL,
APELLIDO VARCHAR(20)  NOT NULL,
DNI_PROFESOR INT(8) NOT NULL ,
MAIL VARCHAR(20) NOT NULL,
CONTRASEÑA VARCHAR(40) NOT NULL,
PRIMARY KEY (CODIGO),
CONSTRAINT UK_PROFESORES_DNI_PROFESOR UNIQUE(DNI_PROFESOR)
);

CREATE TABLE ADMINISTRADORES(
CODIGO INT NOT NULL,
NOMBRE VARCHAR(20) NOT NULL,
APELLIDO VARCHAR(20)  NOT NULL,
DNI_ADMINISTRADOR INT(8) NOT NULL,
CARGO VARCHAR(20) NOT NULL,
MAIL VARCHAR(20) NOT NULL,
CONTRASEÑA VARCHAR(40) NOT NULL,
PRIMARY KEY (CODIGO),
CONSTRAINT UK_ADMINISTRADORES_DNI_ADMINISTRADOR UNIQUE(DNI_ADMINISTRADOR)
);


CREATE TABLE CARRERAS(
ID INT NOT NULL,
TITULO_ABREVIADO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
PRIMARY KEY (ID)
);


CREATE TABLE MATERIAS (
CODIGO INT NOT NULL,
NOMBRE VARCHAR(30) NOT NULL,
ID_CARRERA INT NOT NULL,
CODIGO_ADMINISTRADOR INT NOT NULL,
PRIMARY KEY (CODIGO),
FOREIGN KEY (ID_CARRERA) REFERENCES CARRERAS(ID),
FOREIGN KEY (CODIGO_ADMINISTRADOR) REFERENCES ADMINISTRADORES(CODIGO)
);

CREATE TABLE clases(
ID_CLASE INT NOT NULL AUTO_INCREMENT,
CODIGO_PROFESOR INT NOT NULL ,
CODIGO_MATERIA INT NOT NULL,
COMISION VARCHAR(10) NOT NULL,
FECHA DATE NOT NULL,
HORA VARCHAR(13) NOT NULL,
TEMAS VARCHAR(50),
NOVEDAD VARCHAR(50),
PRIMARY KEY (ID_CLASE,CODIGO_PROFESOR,CODIGO_MATERIA),
FOREIGN KEY (CODIGO_PROFESOR) REFERENCES PROFESORES(CODIGO),
FOREIGN KEY (CODIGO_MATERIA) REFERENCES MATERIAS(CODIGO),
CONSTRAINT CK_CLASES_COMISION CHECK (COMISION="1.º, 1.ª" OR COMISION="1.º, 2.ª" OR COMISION="1.º, 3.ª"),
CONSTRAINT CK_CLASES_HORA CHECK (HORA="8:00-10:00" OR HORA="10:10-12:00" OR HORA="8:00-12:00" OR HORA="18:00-20:00" 
OR HORA="20:10-22:00" OR HORA="18:00-22:00")
);

INSERT INTO PROFESORES 
VALUES
(1,"Jose","Perez",45912421,"perez.gmail.com","lolo");

INSERT INTO ADMINISTRADORES
VALUES
(1,"Lionel","Messi",34567892,"Supremo","messi@gmail.com","koko");

INSERT INTO carreras
VALUES
(1,"TSAS","Tecnicatura Superior en Analista de Sistemas");


INSERT INTO MATERIAS
VALUES
(1,"Análisis Matemático 1",1,1),
(2,"Inglés 2",1,1),
(3,"Prácticas Profesionalizantes 3",1,1);



TRUNCATE TABLE claseS;

