# TALLER PROCEDIMIENTOS Y VISTAS



![DIAGRAMA ER](diagramaER2.png)



**DDL(Data Definition Language):**

```mysql
create table pais(
    id int auto_increment primary key,
    nombre varchar(20) not null
);

create table region(
    id int auto_increment primary key,
    nombre varchar(50) not null,
    id_pais int not null,
    constraint FK_id_pais foreign key(id_pais) references pais(id)
);


create table ciudad(
    id int auto_increment primary key,
    nombre varchar(50) not null,
    id_region int  not null,
    constraint FK_id_region foreign key(id_region) references region(id)
);

create table departamento(
    id int auto_increment primary key,
    nombre varchar(50) not null
);

create table tipoTelefono(
    id int auto_increment primary key,
    descripcion varchar(100) not null
);

create table genero(
  id int auto_increment primary key,
  descripcion varchar(20) not null
);

create table tipoAsignatura(
  id int auto_increment primary key,
  descripcion varchar(50) not null
);

create table cursoEscolar(
  id int(10) primary key,
  anyo_inicio year(4) not null,
  anyo_fin year(4) not null
);

create table grado(
  id int(10) auto_increment primary key,
  nombre varchar(100) not null,
  anyo year(4) not null
);

create table alumno(
  id int(10) primary key,
  nif varchar(9) not null,
  nombre varchar(25) not null,
  apellido1 varchar(50) not null,
  apellido2 varchar(50) not null,
  direccion varchar(50) not null,
  fecha_nacimiento DATE not null,
  id_genero int not null,
  id_ciudad int not null,
  constraint FK_id_genero_estudiante foreign key(id_genero) references genero(id),
  constraint FK_id_ciudad_estudiante foreign key(id_ciudad) references ciudad(id)
);

create table profesor(
  id int(10) primary key,
  nif varchar(9) not null,
  nombre varchar(25) not null,
  apellido1 varchar(50) not null,
  apellido2 varchar(50) not null,
  direccion varchar(50) not null,
  fecha_nacimiento DATE not null,
  id_genero int not null,
  id_ciudad int not null,
  id_depto int not null,
  constraint FK_id_genero_profesor foreign key(id_genero) references genero(id),
  constraint FK_id_ciudad_profesor foreign key(id_ciudad) references ciudad(id),
  constraint FK_id_depto_profesor foreign key(id_depto) references departamento(id)
);

create table telefonoAlumno(
    id int auto_increment primary key,
    numero int(15) not null,
    prefijo int(5) not null,
    id_tipoTelefono int not null,
    id_alumno int(10),
    constraint FK_id_telefono_alumno foreign key(id_alumno) references alumno(id),
    constraint FK_id_tipoTelefono_alumno foreign key(id_tipoTelefono) references tipoTelefono(id)
);

create table telefonoProfesor(
    id int auto_increment primary key,
    numero int(15) not null,
    prefijo int(5) not null,
    id_tipoTelefono int not null,
    id_profesor int(10),
    constraint FK_id_telefono_profesor foreign key(id_profesor) references profesor(id),
    constraint FK_id_tipoTelefono_profesor foreign key(id_tipoTelefono) references tipoTelefono(id)
);

create table asignatura(
  id int(10) primary key,
  nombre varchar(100) not null,
  creditos float not null,
  id_tipoAsignatura int not null,
  id_profesor int(10),
  id_grado int(10) not null,
  cuatrimeste tinyint(3) not null,
  constraint FK_id_asignatura_tipoAsignatura foreign key(id_tipoAsignatura) references tipoAsignatura(id),
  constraint FK_id_asignatura_profesor foreign key(id_profesor) references profesor(id),
  constraint FK_id_asignatura_grado foreign key(id_grado) references grado(id)
);

create table alumnoMatriculaAsignatura(
  id_alumno int(10) not null,
  id_asignatura int(10) not null,
  id_cursoEscolar int(10) not null,
  constraint FK_id_alumno_matricula foreign key(id_alumno) references alumno(id),
  constraint FK_id_asignatura_matricula foreign key(id_asignatura) references asignatura(id),
  constraint FK_id_cursoEscolar_matricula foreign key(id_cursoEscolar) references cursoEscolar(id),
  primary key(id_alumno, id_asignatura, id_cursoEscolar)
);
```

**DML(Data Manipulation Language)**

**INSERTS**

```mysql
 /* Departamento */
INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');

/* Países */
INSERT INTO pais (nombre) VALUES ('España');

/* Regiones */
INSERT INTO region (nombre, id_pais) VALUES ('Andalucía', 1);

/* Ciudades */
INSERT INTO ciudad (nombre, id_region) VALUES ('Almería', 1);

/* Tipo de teléfono */
INSERT INTO tipoTelefono (nombre) VALUES ('Fijo');

/* Generos*/
INSERT INTO genero(descripcion) values("hombre");
INSERT INTO genero(descripcion) values("mujer");
INSERT INTO genero(descripcion) values("no binario");

/* Tipo Asignatura*/
INSERT INTO tipoAsignatura VALUES (1, 'Básica');
INSERT INTO tipoAsignatura VALUES (2, 'Obligatoria');
INSERT INTO tipoAsignatura VALUES (3, 'Optativa');

/* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola', 2015);
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica', 2014);
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial', 2010);
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática', 2015);
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica', 2010);
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial', 2010);
INSERT INTO grado VALUES (7, 'Grado en Biotecnología', 2015);
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales', 2009);
INSERT INTO grado VALUES (9, 'Grado en Matemáticas', 2010);
INSERT INTO grado VALUES (10, 'Grado en Química', 2009);

/* Curso escolar */
INSERT INTO cursoEscolar VALUES (1, 2014, 2015);
INSERT INTO cursoEscolar VALUES (2, 2015, 2016);
INSERT INTO cursoEscolar VALUES (3, 2016, 2017);
INSERT INTO cursoEscolar VALUES (4, 2017, 2018);

/* Alumno */
INSERT INTO alumno VALUES (1, '89542419S', 'Juan', 'Saez', 'Vega', 'C/ Mercurio', '1992/08/08', 2, 1);
INSERT INTO alumno VALUES (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'C/ Real del barrio alto', '1991/03/28', 2, 1);
INSERT INTO alumno VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'C/ Estrella fugaz', '2000/10/05', 2, 1);
INSERT INTO alumno VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'C/ Júpiter', '1998/01/28', 2, 1);
INSERT INTO alumno VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'C/ Neptuno', '1999/05/24', 2, 1);
INSERT INTO alumno VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'C/ Urano', '1996/11/21', 2, 1);
INSERT INTO alumno VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'C/ Andarax', '1997/04/26', 2, 1);
INSERT INTO alumno VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'C/ Picos de Europa', '1998/09/01', 3, 1);
INSERT INTO alumno VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'C/ Los pinos', '1998/01/01', 2, 1);
INSERT INTO alumno VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'C/ Cabo de Gata', '1999/02/11', 2, 1);
INSERT INTO alumno VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'C/ Zapillo', '1996/03/12', 3, 1);
INSERT INTO alumno VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'C/ Mercurio', '1995/04/13', 3, 1);

/* Telefono Alumno */
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (618253876, 950, 1, 1);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (950254837, 950, 1, 2);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (628349590, 950, 1, 6);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (679837625, 950, 1, 11);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (678652431, 950, 1, 19);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (678652431, 950, 1, 21);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (626652498, 950, 1, 22);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (628452384, 950, 1, 23);
INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno) VALUES (678812017, 950, 1, 24);


/* Profesor */
INSERT INTO profesor VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'C/ Marte', '1979-08-19', 3, 1, 1);
INSERT INTO profesor VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'C/ Venus', '1978-01-19', 2, 1, 2);
INSERT INTO profesor VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'C/ Saturno', '1977-08-21', 3, 1, 3);
INSERT INTO profesor VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'C/ Plutón', '1977-05-19', 3, 1, 4);
INSERT INTO profesor VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'C/ Almanzora', '1971-04-29', 3, 1, 4);
INSERT INTO profesor VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'C/ Guadalquivir', '1980-02-01', 2, 1, 6);
INSERT INTO profesor VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'C/ Duero', '1977-01-02', 2, 1, 1);
INSERT INTO profesor VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'C/ Tajo', '1980-03-14', 2, 1, 2);
INSERT INTO profesor VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'C/ Sierra de los Filabres', '1982-03-18', 2, 1, 3);
INSERT INTO profesor VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'C/ Sierra de Gádor', '1973-05-05', 2, 1, 4);
INSERT INTO profesor VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'C/ Veleta', '1976-02-25', 2, 1, 5);
INSERT INTO profesor VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'C/ Quinto pino', '1980-10-31', 2, 1, 6);
INSERT INTO profesor VALUES (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'C/ Quinto pino', '1980-10-16', 2, 1, 1);
INSERT INTO profesor VALUES (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', 'C/ Quinto pino', '1980-11-21', 2, 1, 1);
INSERT INTO profesor VALUES (23, '77194445M', 'María', 'Domínguez', 'Hernández', 'C/ Quinto pino', '1980-12-13', 3, 1, 2);

/* Telefono Profesor*/

INSERT INTO telefonoProfesor (numero, prefijo, id_tipoTelefono, id_profesor) VALUES (618223876, 950, 1, 3);
INSERT INTO telefonoProfesor (numero, prefijo, id_tipoTelefono, id_profesor) VALUES (678516294, 950, 1, 5);
INSERT INTO telefonoProfesor (numero, prefijo, id_tipoTelefono, id_profesor) VALUES (669162534, 950, 1, 8);
INSERT INTO telefonoProfesor (numero, prefijo, id_tipoTelefono, id_profesor) VALUES (950263514, 950, 1, 14);
INSERT INTO telefonoProfesor (numero, prefijo, id_tipoTelefono, id_profesor) VALUES (668726354, 950, 1, 15);
INSERT INTO telefonoProfesor (numero, prefijo, id_tipoTelefono, id_profesor) VALUES (662765413, 950, 1, 18);


/* Asignatura */
INSERT INTO asignatura VALUES (1, 'Álgegra lineal y matemática discreta', 6, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (2, 'Cálculo', 6, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (3, 'Física para informática', 6, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (4, 'Introducción a la programación', 6, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (5, 'Organización y gestión de empresas', 6, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (6, 'Estadística', 6, 1, NULL, 4, 2);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnología de computadores', 6, 1, NULL, 4, 2);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electrónica', 6, 1, NULL, 4, 2);
INSERT INTO asignatura VALUES (9, 'Lógica y algorítmica', 6, 1, NULL, 4, 2);
INSERT INTO asignatura VALUES (10, 'Metodología de la programación', 6, 1, NULL, 4, 2);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 1, 3, 4, 1);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 2, 3, 4, 1);
INSERT INTO asignatura VALUES (13, 'Ingeniería del Software', 6, 2, 3, 4, 1);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 2, 3, 4, 1);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 2, 3, 4, 1);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 1, 14, 4, 2);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 2, 14, 4, 2);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6, 2, 3, 4, 2);
INSERT INTO asignatura VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 2, 3, 4, 2);
INSERT INTO asignatura VALUES (20, 'Programación de Servicios Software', 6, 2, 14, 4, 2);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 2, 14, 4, 3);
INSERT INTO asignatura VALUES (22, 'Ingeniería de Requisitos', 6, 3, NULL, 4, 3);
INSERT INTO asignatura VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 3, NULL, 4, 3);
INSERT INTO asignatura VALUES (24, 'Modelado y Diseño del Software 1', 6, 3, NULL, 4, 3);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 3, NULL, 4, 3);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 3, NULL, 4, 3);
INSERT INTO asignatura VALUES (27, 'Sistema de Información para las Organizaciones', 6, 3, NULL, 4, 3); 
INSERT INTO asignatura VALUES (28, 'Tecnologías web', 6, 3, NULL, 4, 3);
INSERT INTO asignatura VALUES (29, 'Teoría de códigos y criptografía', 6, 3, NULL, 4, 3);
INSERT INTO asignatura VALUES (30, 'Administración de bases de datos', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (32, 'Informática industrial y robótica', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (33, 'Ingeniería de Sistemas de Información', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Diseño del Software 2', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electrónico', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (36, 'Periféricos e interfaces', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (38, 'Tecnologías de acceso a red', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de imágenes', 6, 3, NULL, 4, 4);
INSERT INTO asignatura VALUES (40, 'Administración de redes y sistemas operativos', 6, 3, NULL, 4, 5);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 3, NULL, 4, 5);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 3, NULL, 4, 5);
INSERT INTO asignatura VALUES (43, 'Líneas de Productos Software', 6, 3, NULL, 4, 5);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 3, NULL, 4, 5);
INSERT INTO asignatura VALUES (45, 'Tecnologías multimedia', 6, 3, NULL, 4, 5);
INSERT INTO asignatura VALUES (46, 'Análisis y planificación de las TI', 6, 3, NULL, 4, 6);
INSERT INTO asignatura VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 3, NULL, 4, 6);
INSERT INTO asignatura VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 3, NULL, 4, 6);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 3, NULL, 4, 6);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 3, NULL, 4, 6);
INSERT INTO asignatura VALUES (51, 'Seguridad Informática', 6, 3, NULL, 4, 6);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (53, 'Física', 6, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (54, 'Matemáticas I', 6, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (55, 'Química general', 6, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (56, 'Química orgánica', 6, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (57, 'Biología vegetal y animal', 6, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (58, 'Bioquímica', 6, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (59, 'Genética', 6, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (60, 'Matemáticas II', 6, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (61, 'Microbiología', 6, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (62, 'Botánica agrícola', 6, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (63, 'Fisiología vegetal', 6, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (64, 'Genética molecular', 6, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (65, 'Ingeniería bioquímica', 6, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (66, 'Termodinámica y cinética química aplicada', 6, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (68, 'Biotecnología microbiana', 6, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (69, 'Ingeniería genética', 6, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (70, 'Inmunología', 6, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (71, 'Virología', 6, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 2, NULL, 7, 3);
INSERT INTO asignatura VALUES (73, 'Fisiología animal', 4.5, 2, NULL, 7, 3);
INSERT INTO asignatura VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 2, NULL, 7, 3);
INSERT INTO asignatura VALUES (75, 'Operaciones de separación', 6, 2, NULL, 7, 3);
INSERT INTO asignatura VALUES (76, 'Patología molecular de plantas', 4.5, 2, NULL, 7, 3);
INSERT INTO asignatura VALUES (77, 'Técnicas instrumentales básicas', 4.5, 2, NULL, 7, 3);
INSERT INTO asignatura VALUES (78, 'Bioinformática', 4.5, 2, NULL, 7, 4);
INSERT INTO asignatura VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 2, NULL, 7, 4);
INSERT INTO asignatura VALUES (80, 'Biotecnología vegetal', 6, 2, NULL, 7, 4);
INSERT INTO asignatura VALUES (81, 'Genómica y proteómica', 4.5, 2, NULL, 7, 4);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnológicos', 6, 2, NULL, 7, 4);
INSERT INTO asignatura VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 2, NULL, 7, 4);

/* Matriculas*/
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 1, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 2, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 3, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 4, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 5, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 6, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 7, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 8, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 9, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 10, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 1, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 2, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 3, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 1, 3);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 2, 3);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 3, 3);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 1, 4);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 2, 4);
INSERT INTO alumnoMatriculaAsignatura VALUES (1, 3, 4);
INSERT INTO alumnoMatriculaAsignatura VALUES (2, 1, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (2, 2, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (2, 3, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 1, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 2, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 3, 1);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 1, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 2, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 3, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 4, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 5, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 6, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 7, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 8, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 9, 2);
INSERT INTO alumnoMatriculaAsignatura VALUES (4, 10, 2);
```

**CREACION DE LA VISTAS**

```mysql
/*1*/
CREATE VIEW alumnosCiudad AS
SELECT a.id AS alumnoId, a.nombre AS nombreAlumno, c.nombre AS ciudad
FROM alumno a
JOIN ciudad c ON a.id_ciudad = c.id;

/*2*/
CREATE VIEW profesoresDepartamento AS
SELECT p.id AS profesorId, p.nombre AS nombreProfesor, d.nombre AS departamento
FROM profesor p
JOIN departamento d ON p.id_depto = d.id;

/*3*/
CREATE VIEW asignaturasGrado AS
SELECT a.id AS asignaturaId, a.nombre AS nombreAsignatura, g.nombre AS grado
FROM asignatura a
JOIN grado g ON a.id_grado = g.id;

/*4*/
CREATE VIEW telefonosAlumnos AS
SELECT ta.id AS telefonoId, ta.numero AS numeroTelefono, ta.prefijo AS prefijoTelefono, t.descripcion AS tipoTelefono, a.nombre AS nombreAlumno
FROM telefonoAlumno ta
JOIN tipoTelefono t ON ta.id_tipoTelefono = t.id
JOIN alumno a ON ta.id_alumno = a.id;

/*5*/
CREATE VIEW telefonosProfesores AS
SELECT tp.id AS telefonoId, tp.numero AS numeroTelefono, tp.prefijo AS prefijoTelefono, t.descripcion AS tipoTelefono, p.nombre AS nombreProfesor
FROM telefonoProfesor tp
JOIN tipoTelefono t ON tp.id_tipoTelefono = t.id
JOIN profesor p ON tp.id_profesor = p.id;

/*6*/
CREATE VIEW asignaturasProfesor AS
SELECT a.id AS asignaturaId, a.nombre AS nombreAsignatura, p.nombre AS nombreProfesor
FROM asignatura a
JOIN profesor p ON a.id_profesor = p.id;

/*7*/
CREATE VIEW alumnosMatriculados AS
SELECT am.id_alumno AS alumnoId, a.nombre AS nombreAlumno, am.id_asignatura AS asignaturaId, asig.nombre AS nombreAsignatura, am.id_cursoEscolar AS cursoEscolarId
FROM alumnoMatriculaAsignatura am
JOIN alumno a ON am.id_alumno = a.id
JOIN asignatura asig ON am.id_asignatura = asig.id;

/*8*/
CREATE VIEW profesoresPorCiudad AS
SELECT p.id AS profesorId, p.nombre AS nombreProfesor, c.nombre AS ciudad
FROM profesor p
JOIN ciudad c ON p.id_ciudad = c.id;

/*9*/
CREATE VIEW asignaturasPorTipo AS
SELECT a.id AS asignaturaId, a.nombre AS nombreAsignatura, t.descripcion AS tipoAsignatura
FROM asignatura a
JOIN tipoAsignatura t ON a.id_tipoAsignatura = t.id;

/*10*/
CREATE VIEW alumnosPorGenero AS
SELECT a.id AS alumnoId, a.nombre AS nombreAlumno, g.descripcion AS genero
FROM alumno a
JOIN genero g ON a.id_genero = g.id;

```

**PROCEDIMIENTOS**

```mysql
/* 1.INSERTAR ALUMNO */
DELIMITER //
CREATE PROCEDURE insertNewAlumno(
    IN nif VARCHAR(9),
    IN nombre VARCHAR(25),
    IN apellido1 VARCHAR(50),
    IN apellido2 VARCHAR(50),
    IN direccion VARCHAR(50),
    IN fecha_nacimiento DATE,
    IN id_genero INT,
    IN id_ciudad INT
)
BEGIN
    INSERT INTO alumno(nif, nombre, apellido1, apellido2, direccion, fecha_nacimiento, id_genero, id_ciudad)
    VALUES (nif, nombre, apellido1, apellido2, direccion, fecha_nacimiento, id_genero, id_ciudad);
END //
DELIMITER ;

/* 2.ACTUALIZAR DIRECCION DE PROFESOR */
DELIMITER //
CREATE PROCEDURE updateProfesorDireccion(
    IN prof_id INT,
    IN new_address VARCHAR(50)
)
BEGIN
    UPDATE profesor
    SET direccion = new_address
    WHERE id = prof_id;
END //
DELIMITER ;

/* 3.BORRAR TELEFONO DE PROFESOR */
DELIMITER //
CREATE PROCEDURE deleteTelefonoProfesor(
    IN telefono_id INT
)
BEGIN
    DELETE FROM telefonoProfesor
    WHERE id = telefono_id;
END //
DELIMITER ;

/* 4.INSERTAR NUEVA ASIGNATURA */
DELIMITER //
CREATE PROCEDURE insertNewAsignatura(
    IN nombre VARCHAR(100),
    IN creditos FLOAT,
    IN id_tipoAsignatura INT,
    IN id_profesor INT,
    IN id_grado INT,
    IN cuatrimeste TINYINT
)
BEGIN
    INSERT INTO asignatura(nombre, creditos, id_tipoAsignatura, id_profesor, id_grado, cuatrimeste)
    VALUES (nombre, creditos, id_tipoAsignatura, id_profesor, id_grado, cuatrimeste);
END //
DELIMITER ;

/* 5.BORRAR MATRICULA DE UN ALUMNO*/
DELIMITER //
CREATE PROCEDURE deleteAlumnoMatriculado(
    IN alumno_id INT,
    IN asignatura_id INT,
    IN curso_escolar_id INT
)
BEGIN
    DELETE FROM alumnoMatriculaAsignatura
    WHERE id_alumno = alumno_id AND id_asignatura = asignatura_id AND id_cursoEscolar = curso_escolar_id;
END //
DELIMITER ;

/* 6.ACTUALIZAR TELEFONO DE ALUMNO */
DELIMITER //
CREATE PROCEDURE updateTelefonoAlumno(
    IN telefono_id INT,
    IN new_numero INT,
    IN new_prefijo INT
)
BEGIN
    UPDATE telefonoAlumno
    SET numero = new_numero, prefijo = new_prefijo
    WHERE id = telefono_id;
END //
DELIMITER ;

/* 7.ASIGNAR PROFESOR A ASIGNATURA*/
CREATE PROCEDURE insertAsignaturaProfesor(
    IN p_id_asignatura INT,
    IN p_id_profesor INT
)
BEGIN
    UPDATE asignatura
    SET id_profesor = p_id_profesor
    WHERE id = p_id_asignatura;
END;

/* 8.BORRAR TELEFONO ALUMNO */
CREATE PROCEDURE deleteTelefonoAlumno(
    IN p_telefono_id INT
)
BEGIN
    DELETE FROM telefonoAlumno
    WHERE id = p_telefono_id;
END;

/* 9.ACTUALIZAR NOMBRE ALUMNO */
CREATE PROCEDURE updateNombreAlumno(
    IN p_alumno_id INT,
    IN p_nuevo_nombre VARCHAR(25)
)
BEGIN
    UPDATE alumno
    SET nombre = p_nuevo_nombre
    WHERE id = p_alumno_id;
END;

/* 10.BORRAR PROFESOR POR ID*/
CREATE PROCEDURE deleteTelefonoProfesorByID(
    IN p_telefono_id INT
)
BEGIN
    DELETE FROM telefonoProfesor
    WHERE id = p_telefono_id;
END;

```



**CONSULTAS**

**Consultas sobre una tabla**

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de
    todos los alumnos. El listado deberá estar ordenado alfabéticamente de
    menor a mayor por el primer apellido, segundo apellido y nombre.

  

  ```mysql
  SELECT apellido1, apellido2, nombre
  FROM alumno
  ORDER BY apellido1, apellido2, nombre;
  
  +------------+-----------+----------+
  | apellido1  | apellido2 | nombre   |
  +------------+-----------+----------+
  | Domínguez  | Guerrero  | Antonio  |
  | Gea        | Ruiz      | Sonia    |
  | Gutiérrez  | López     | Juan     |
  | Heller     | Pagac     | Pedro    |
  | Herman     | Pacocha   | Daniel   |
  | Hernández  | Martínez  | Irene    |
  | Herzog     | Tremblay  | Ramón    |
  | Koss       | Bayer     | José     |
  | Lakin      | Yundt     | Inma     |
  | Saez       | Vega      | Juan     |
  | Sánchez    | Pérez     | Salvador |
  | Strosin    | Turcotte  | Ismael   |
  +------------+-----------+----------+
  
  ```

  

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de
    alta su número de teléfono en la base de datos.

  

  ```mysql
  SELECT apellido1, apellido2, nombre
  FROM alumno
  WHERE id NOT IN (SELECT id_alumno FROM telefonoAlumno);
  
  +-----------+-----------+--------+
  | apellido1 | apellido2 | nombre |
  +-----------+-----------+--------+
  | Heller    | Pagac     | Pedro  |
  | Strosin   | Turcotte  | Ismael |
  | Herzog    | Tremblay  | Ramón  |
  +-----------+-----------+--------+
  
  ```

  

3. Devuelve el listado de los alumnos que nacieron en 1999.

   

   ```mysql
   SELECT apellido1, apellido2, nombre
   FROM alumno
   WHERE YEAR(fecha_nacimiento) = 1999;
   
   +------------+-----------+---------+
   | apellido1  | apellido2 | nombre  |
   +------------+-----------+---------+
   | Strosin    | Turcotte  | Ismael  |
   | Domínguez  | Guerrero  | Antonio |
   +------------+-----------+---------+
   
   ```

   

4. Devuelve el listado de profesores que no han dado de alta su número de
    teléfono en la base de datos y además su nif termina en K.

  

  ```mysql
  SELECT apellido1, apellido2, nombre
  FROM profesor
  WHERE id NOT IN (SELECT id_profesor FROM telefonoProfesor)
  AND nif LIKE '%K';
  
  +-----------+-----------+-----------+
  | apellido1 | apellido2 | nombre    |
  +-----------+-----------+-----------+
  | Fahey     | Considine | Antonio   |
  | Ruecker   | Upton     | Guillermo |
  +-----------+-----------+-----------+
  
  ```

  

5. Devuelve el listado de las asignaturas que se imparten en el primer
    cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

  

  ```mysql
  select distinct * from alumnoMatriculaAsignatura ama, asignatura a where a.id_grado = 7 and ama.id_cursoEscolar = 3;
  
  +-----------+---------------+-----------------+----+--------------------------------------------------+----------+-------------------+-------------+----------+--------------+
  | id_alumno | id_asignatura | id_cursoEscolar | id | nombre                                           | creditos | id_tipoAsignatura | id_profesor | id_grado | cuatrimestre |
  +-----------+---------------+-----------------+----+--------------------------------------------------+----------+-------------------+-------------+----------+--------------+
  |         1 |             1 |               3 | 52 | Biologia celular                                 |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 53 | Física                                           |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 54 | Matemáticas I                                    |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 55 | Química general                                  |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 56 | Química orgánica                                 |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 57 | Biología vegetal y animal                        |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 58 | Bioquímica                                       |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 59 | Genética                                         |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 60 | Matemáticas II                                   |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 61 | Microbiología                                    |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 62 | Botánica agrícola                                |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 63 | Fisiología vegetal                               |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 64 | Genética molecular                               |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 65 | Ingeniería bioquímica                            |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 66 | Termodinámica y cinética química aplicada        |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             1 |               3 | 67 | Biorreactores                                    |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 68 | Biotecnología microbiana                         |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 69 | Ingeniería genética                              |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 70 | Inmunología                                      |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 71 | Virología                                        |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             1 |               3 | 72 | Bases moleculares del desarrollo vegetal         |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             1 |               3 | 73 | Fisiología animal                                |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             1 |               3 | 74 | Metabolismo y biosíntesis de biomoléculas        |        6 |                 2 |        NULL |        7 |            3 |
  |         1 |             1 |               3 | 75 | Operaciones de separación                        |        6 |                 2 |        NULL |        7 |            3 |
  |         1 |             1 |               3 | 76 | Patología molecular de plantas                   |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             1 |               3 | 77 | Técnicas instrumentales básicas                  |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             1 |               3 | 78 | Bioinformática                                   |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             1 |               3 | 79 | Biotecnología de los productos hortofrutículas   |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             1 |               3 | 80 | Biotecnología vegetal                            |        6 |                 2 |        NULL |        7 |            4 |
  |         1 |             1 |               3 | 81 | Genómica y proteómica                            |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             1 |               3 | 82 | Procesos biotecnológicos                         |        6 |                 2 |        NULL |        7 |            4 |
  |         1 |             1 |               3 | 83 | Técnicas instrumentales avanzadas                |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             2 |               3 | 52 | Biologia celular                                 |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 53 | Física                                           |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 54 | Matemáticas I                                    |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 55 | Química general                                  |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 56 | Química orgánica                                 |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 57 | Biología vegetal y animal                        |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 58 | Bioquímica                                       |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 59 | Genética                                         |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 60 | Matemáticas II                                   |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 61 | Microbiología                                    |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 62 | Botánica agrícola                                |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 63 | Fisiología vegetal                               |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 64 | Genética molecular                               |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 65 | Ingeniería bioquímica                            |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 66 | Termodinámica y cinética química aplicada        |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             2 |               3 | 67 | Biorreactores                                    |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 68 | Biotecnología microbiana                         |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 69 | Ingeniería genética                              |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 70 | Inmunología                                      |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 71 | Virología                                        |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             2 |               3 | 72 | Bases moleculares del desarrollo vegetal         |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             2 |               3 | 73 | Fisiología animal                                |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             2 |               3 | 74 | Metabolismo y biosíntesis de biomoléculas        |        6 |                 2 |        NULL |        7 |            3 |
  |         1 |             2 |               3 | 75 | Operaciones de separación                        |        6 |                 2 |        NULL |        7 |            3 |
  |         1 |             2 |               3 | 76 | Patología molecular de plantas                   |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             2 |               3 | 77 | Técnicas instrumentales básicas                  |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             2 |               3 | 78 | Bioinformática                                   |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             2 |               3 | 79 | Biotecnología de los productos hortofrutículas   |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             2 |               3 | 80 | Biotecnología vegetal                            |        6 |                 2 |        NULL |        7 |            4 |
  |         1 |             2 |               3 | 81 | Genómica y proteómica                            |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             2 |               3 | 82 | Procesos biotecnológicos                         |        6 |                 2 |        NULL |        7 |            4 |
  |         1 |             2 |               3 | 83 | Técnicas instrumentales avanzadas                |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             3 |               3 | 52 | Biologia celular                                 |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 53 | Física                                           |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 54 | Matemáticas I                                    |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 55 | Química general                                  |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 56 | Química orgánica                                 |        6 |                 1 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 57 | Biología vegetal y animal                        |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 58 | Bioquímica                                       |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 59 | Genética                                         |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 60 | Matemáticas II                                   |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 61 | Microbiología                                    |        6 |                 1 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 62 | Botánica agrícola                                |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 63 | Fisiología vegetal                               |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 64 | Genética molecular                               |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 65 | Ingeniería bioquímica                            |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 66 | Termodinámica y cinética química aplicada        |        6 |                 2 |        NULL |        7 |            1 |
  |         1 |             3 |               3 | 67 | Biorreactores                                    |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 68 | Biotecnología microbiana                         |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 69 | Ingeniería genética                              |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 70 | Inmunología                                      |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 71 | Virología                                        |        6 |                 2 |        NULL |        7 |            2 |
  |         1 |             3 |               3 | 72 | Bases moleculares del desarrollo vegetal         |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             3 |               3 | 73 | Fisiología animal                                |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             3 |               3 | 74 | Metabolismo y biosíntesis de biomoléculas        |        6 |                 2 |        NULL |        7 |            3 |
  |         1 |             3 |               3 | 75 | Operaciones de separación                        |        6 |                 2 |        NULL |        7 |            3 |
  |         1 |             3 |               3 | 76 | Patología molecular de plantas                   |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             3 |               3 | 77 | Técnicas instrumentales básicas                  |      4.5 |                 2 |        NULL |        7 |            3 |
  |         1 |             3 |               3 | 78 | Bioinformática                                   |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             3 |               3 | 79 | Biotecnología de los productos hortofrutículas   |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             3 |               3 | 80 | Biotecnología vegetal                            |        6 |                 2 |        NULL |        7 |            4 |
  |         1 |             3 |               3 | 81 | Genómica y proteómica                            |      4.5 |                 2 |        NULL |        7 |            4 |
  |         1 |             3 |               3 | 82 | Procesos biotecnológicos                         |        6 |                 2 |        NULL |        7 |            4 |
  |         1 |             3 |               3 | 83 | Técnicas instrumentales avanzadas                |      4.5 |                 2 |        NULL |        7 |            4 |
  +-----------+---------------+-----------------+----+--------------------------------------------------+----------+-------------------+-------------+----------+--------------+
  
  
  ```

  

**Consultas multitabla (Composición interna)**

1. Devuelve un listado con los datos de todas las alumnas que se han
    matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

  

  ```mysql
  SELECT a.nombre, a.apellido1, a.apellido2
  FROM alumno a
  INNER JOIN alumnoMatriculaAsignatura ama ON a.id = ama.id_alumno
  INNER JOIN asignatura asg ON ama.id_asignatura = asg.id
  INNER JOIN grado g ON asg.id_grado = g.id
  WHERE g.nombre = 'Grado en Ingeniería Informática' AND g.anyo = 2015
  AND a.id_genero = (SELECT id FROM genero WHERE descripcion = 'Femenino');
  
  Empty set (0,00 sec)
  
  ```

  

2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en
    Ingeniería Informática (Plan 2015).

  

  ```mysql
  SELECT asignatura.nombre FROM asignatura INNER JOIN grado ON asignatura.id_grado = grado.id WHERE lower(grado.nombre) like 'grado en ingenier%a inform%tica ';
  
  +---------------------------------------------------------------------------+
  | nombre                                                                    |
  +---------------------------------------------------------------------------+
  | Álgegra lineal y matemática discreta                                      |
  | Cálculo                                                                   |
  | Física para informática                                                   |
  | Introducción a la programación                                            |
  | Organización y gestión de empresas                                        |
  | Estadística                                                               |
  | Estructura y tecnología de computadores                                   |
  | Fundamentos de electrónica                                                |
  | Lógica y algorítmica                                                      |
  | Metodología de la programación                                            |
  | Arquitectura de Computadores                                              |
  | Estructura de Datos y Algoritmos I                                        |
  | Ingeniería del Software                                                   |
  | Sistemas Inteligentes                                                     |
  | Sistemas Operativos                                                       |
  | Bases de Datos                                                            |
  | Estructura de Datos y Algoritmos II                                       |
  | Fundamentos de Redes de Computadores                                      |
  | Planificación y Gestión de Proyectos Informáticos                         |
  | Programación de Servicios Software                                        |
  | Desarrollo de interfaces de usuario                                       |
  | Ingeniería de Requisitos                                                  |
  | Integración de las Tecnologías de la Información en las Organizaciones    |
  | Modelado y Diseño del Software 1                                          |
  | Multiprocesadores                                                         |
  | Seguridad y cumplimiento normativo                                        |
  | Sistema de Información para las Organizaciones                            |
  | Tecnologías web                                                           |
  | Teoría de códigos y criptografía                                          |
  | Administración de bases de datos                                          |
  | Herramientas y Métodos de Ingeniería del Software                         |
  | Informática industrial y robótica                                         |
  | Ingeniería de Sistemas de Información                                     |
  | Modelado y Diseño del Software 2                                          |
  | Negocio Electrónico                                                       |
  | Periféricos e interfaces                                                  |
  | Sistemas de tiempo real                                                   |
  | Tecnologías de acceso a red                                               |
  | Tratamiento digital de imágenes                                           |
  | Administración de redes y sistemas operativos                             |
  | Almacenes de Datos                                                        |
  | Fiabilidad y Gestión de Riesgos                                           |
  | Líneas de Productos Software                                              |
  | Procesos de Ingeniería del Software 1                                     |
  | Tecnologías multimedia                                                    |
  | Análisis y planificación de las TI                                        |
  | Desarrollo Rápido de Aplicaciones                                         |
  | Gestión de la Calidad y de la Innovación Tecnológica                      |
  | Inteligencia del Negocio                                                  |
  | Procesos de Ingeniería del Software 2                                     |
  | Seguridad Informática                                                     |
  +---------------------------------------------------------------------------+
  
  ```

  

3. Devuelve un listado de los profesores junto con el nombre del
    departamento al que están vinculados. El listado debe devolver cuatro
    columnas, primer apellido, segundo apellido, nombre y nombre del
    departamento. El resultado estará ordenado alfabéticamente de menor a
    mayor por los apellidos y el nombre.

  

  ```mysql
  SELECT profesor.apellido1, profesor.apellido2, profesor.nombre, departamento.nombre AS nombre_departamento
  FROM profesor
  INNER JOIN departamento ON profesor.id_depto = departamento.id
  ORDER BY profesor.apellido1, profesor.apellido2, profesor.nombre;
  
  +------------+------------+-----------+---------------------+
  | apellido1  | apellido2  | nombre    | nombre_departamento |
  +------------+------------+-----------+---------------------+
  | Domínguez  | Hernández  | María     | Matemáticas         |
  | Fahey      | Considine  | Antonio   | Economía y Empresa  |
  | Guerrero   | Martínez   | Juan      | Informática         |
  | Hamill     | Kozey      | Manolo    | Informática         |
  | Kohler     | Schoen     | Alejandro | Matemáticas         |
  | Lemke      | Rutherford | Cristina  | Economía y Empresa  |
  | Monahan    | Murray     | Micaela   | Agronomía           |
  | Ramirez    | Gea        | Zoe       | Informática         |
  | Ruecker    | Upton      | Guillermo | Educación           |
  | Sánchez    | Ruiz       | Pepe      | Informática         |
  | Schmidt    | Fisher     | David     | Matemáticas         |
  | Schowalter | Muller     | Francesca | Química y Física    |
  | Spencer    | Lakin      | Esther    | Educación           |
  | Stiedemann | Morissette | Alfredo   | Química y Física    |
  | Streich    | Hirthe     | Carmen    | Educación           |
  +------------+------------+-----------+---------------------+
  ```

  

4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de
    fin del curso escolar del alumno con nif 26902806M.

  

  ```mysql
  SELECT asignatura.nombre, ce.anyo_inicio, ce.anyo_fin
  FROM asignatura
  INNER JOIN alumnoMatriculaAsignatura ON asignatura.id = alumnoMatriculaAsignatura.id_asignatura
  INNER JOIN cursoEscolar ce ON alumnoMatriculaAsignatura.id_cursoEscolar = ce.id
  INNER JOIN alumno ON alumnoMatriculaAsignatura.id_alumno = alumno.id
  WHERE alumno.nif = '26902806M';
  
  +----------------------------------------+-------------+----------+
  | nombre                                 | anyo_inicio | anyo_fin |
  +----------------------------------------+-------------+----------+
  | Álgegra lineal y matemática discreta   |        2014 |     2015 |
  | Cálculo                                |        2014 |     2015 |
  | Física para informática                |        2014 |     2015 |
  +----------------------------------------+-------------+----------+
  
  ```

  

5. Devuelve un listado con el nombre de todos los departamentos que tienen
    profesores que imparten alguna asignatura en el Grado en Ingeniería
    Informática (Plan 2015).

  

  ```mysql
  SELECT DISTINCT departamento.nombre
  FROM departamento
  INNER JOIN profesor ON departamento.id = profesor.id_depto
  INNER JOIN asignatura ON profesor.id = asignatura.id_profesor
  INNER JOIN grado ON asignatura.id_grado = grado.id
  WHERE lower(grado.nombre) like 'grado en ingenier%a inform%tica ' AND grado.anyo = 2015;
  
  +--------------+
  | nombre       |
  +--------------+
  | Informática  |
  +--------------+
  1 row in set (0,00 sec)
  
  ```

  

6. Devuelve un listado con todos los alumnos que se han matriculado en
    alguna asignatura durante el curso escolar 2018/2019.

  

  ```mysql
  SELECT alumno.nombre, alumno.apellido1, alumno.apellido2
  FROM alumno
  INNER JOIN alumnoMatriculaAsignatura ON alumno.id = alumnoMatriculaAsignatura.id_alumno
  INNER JOIN cursoEscolar ce ON alumnoMatriculaAsignatura.id_cursoEscolar = ce.id
  WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;
  
  Empty set (0,00 sec)
  ```

  

**Consultas multitabla (Composición externa)**
**Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.**

1. Devuelve un listado con los nombres de todos los profesores y los
    departamentos que tienen vinculados. El listado también debe mostrar
    aquellos profesores que no tienen ningún departamento asociado. El listado
    debe devolver cuatro columnas, nombre del departamento, primer apellido,
    segundo apellido y nombre del profesor. El resultado estará ordenado
    alfabéticamente de menor a mayor por el nombre del departamento,
    apellidos y el nombre.

  

  ```mysql
  SELECT departamento.nombre AS nombre_departamento, profesor.apellido1, profesor.apellido2, profesor.nombre
  FROM profesor
  LEFT JOIN departamento ON profesor.id_depto = departamento.id
  ORDER BY nombre_departamento, profesor.apellido1, profesor.apellido2, profesor.nombre;
  
  +---------------------+------------+------------+-----------+
  | nombre_departamento | apellido1  | apellido2  | nombre    |
  +---------------------+------------+------------+-----------+
  | Agronomía           | Monahan    | Murray     | Micaela   |
  | Economía y Empresa  | Fahey      | Considine  | Antonio   |
  | Economía y Empresa  | Lemke      | Rutherford | Cristina  |
  | Educación           | Ruecker    | Upton      | Guillermo |
  | Educación           | Spencer    | Lakin      | Esther    |
  | Educación           | Streich    | Hirthe     | Carmen    |
  | Informática         | Guerrero   | Martínez   | Juan      |
  | Informática         | Hamill     | Kozey      | Manolo    |
  | Informática         | Ramirez    | Gea        | Zoe       |
  | Informática         | Sánchez    | Ruiz       | Pepe      |
  | Matemáticas         | Domínguez  | Hernández  | María     |
  | Matemáticas         | Kohler     | Schoen     | Alejandro |
  | Matemáticas         | Schmidt    | Fisher     | David     |
  | Química y Física    | Schowalter | Muller     | Francesca |
  | Química y Física    | Stiedemann | Morissette | Alfredo   |
  +---------------------+------------+------------+-----------+
  15 rows in set (0,00 sec)
  
  ```

  

2. Devuelve un listado con los profesores que no están asociados a un
    departamento.

  

  ```mysql
  SELECT profesor.apellido1, profesor.apellido2, profesor.nombre
  FROM profesor
  LEFT JOIN departamento ON profesor.id_depto = departamento.id
  WHERE departamento.id IS NULL;
  
  Empty set (0,01 sec)
  
  ```

  

3. Devuelve un listado con los departamentos que no tienen profesores
    asociados.

  

  ```mysql
  SELECT departamento.nombre AS nombre_departamento
  FROM departamento
  LEFT JOIN profesor ON departamento.id = profesor.id_depto
  WHERE profesor.id IS NULL;
  
  +-----------------------+
  | nombre_departamento   |
  +-----------------------+
  | Filología             |
  | Derecho               |
  | Biología y Geología   |
  +-----------------------+
  
  ```

  

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

   

   ```mysql
   SELECT profesor.apellido1, profesor.apellido2, profesor.nombre
   FROM profesor
   LEFT JOIN asignatura ON profesor.id = asignatura.id_profesor
   WHERE asignatura.id IS NULL;
   
   +------------+------------+-----------+
   | apellido1  | apellido2  | nombre    |
   +------------+------------+-----------+
   | Schmidt    | Fisher     | David     |
   | Lemke      | Rutherford | Cristina  |
   | Spencer    | Lakin      | Esther    |
   | Streich    | Hirthe     | Carmen    |
   | Stiedemann | Morissette | Alfredo   |
   | Kohler     | Schoen     | Alejandro |
   | Fahey      | Considine  | Antonio   |
   | Ruecker    | Upton      | Guillermo |
   | Monahan    | Murray     | Micaela   |
   | Schowalter | Muller     | Francesca |
   | Sánchez    | Ruiz       | Pepe      |
   | Guerrero   | Martínez   | Juan      |
   | Domínguez  | Hernández  | María     |
   +------------+------------+-----------+
   
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   

   ```mysql
   SELECT asignatura.nombre
   FROM asignatura
   LEFT JOIN profesor ON asignatura.id_profesor = profesor.id
   WHERE profesor.id IS NULL;
   
   +---------------------------------------------------------------------------+
   | nombre                                                                    |
   +---------------------------------------------------------------------------+
   | Álgegra lineal y matemática discreta                                      |
   | Cálculo                                                                   |
   | Física para informática                                                   |
   | Introducción a la programación                                            |
   | Organización y gestión de empresas                                        |
   | Estadística                                                               |
   | Estructura y tecnología de computadores                                   |
   | Fundamentos de electrónica                                                |
   | Lógica y algorítmica                                                      |
   | Metodología de la programación                                            |
   | Ingeniería de Requisitos                                                  |
   | Integración de las Tecnologías de la Información en las Organizaciones    |
   | Modelado y Diseño del Software 1                                          |
   | Multiprocesadores                                                         |
   | Seguridad y cumplimiento normativo                                        |
   | Sistema de Información para las Organizaciones                            |
   | Tecnologías web                                                           |
   | Teoría de códigos y criptografía                                          |
   | Administración de bases de datos                                          |
   | Herramientas y Métodos de Ingeniería del Software                         |
   | Informática industrial y robótica                                         |
   | Ingeniería de Sistemas de Información                                     |
   | Modelado y Diseño del Software 2                                          |
   | Negocio Electrónico                                                       |
   | Periféricos e interfaces                                                  |
   | Sistemas de tiempo real                                                   |
   | Tecnologías de acceso a red                                               |
   | Tratamiento digital de imágenes                                           |
   | Administración de redes y sistemas operativos                             |
   | Almacenes de Datos                                                        |
   | Fiabilidad y Gestión de Riesgos                                           |
   | Líneas de Productos Software                                              |
   | Procesos de Ingeniería del Software 1                                     |
   | Tecnologías multimedia                                                    |
   | Análisis y planificación de las TI                                        |
   | Desarrollo Rápido de Aplicaciones                                         |
   | Gestión de la Calidad y de la Innovación Tecnológica                      |
   | Inteligencia del Negocio                                                  |
   | Procesos de Ingeniería del Software 2                                     |
   | Seguridad Informática                                                     |
   | Biologia celular                                                          |
   | Física                                                                    |
   | Matemáticas I                                                             |
   | Química general                                                           |
   | Química orgánica                                                          |
   | Biología vegetal y animal                                                 |
   | Bioquímica                                                                |
   | Genética                                                                  |
   | Matemáticas II                                                            |
   | Microbiología                                                             |
   | Botánica agrícola                                                         |
   | Fisiología vegetal                                                        |
   | Genética molecular                                                        |
   | Ingeniería bioquímica                                                     |
   | Termodinámica y cinética química aplicada                                 |
   | Biorreactores                                                             |
   | Biotecnología microbiana                                                  |
   | Ingeniería genética                                                       |
   | Inmunología                                                               |
   | Virología                                                                 |
   | Bases moleculares del desarrollo vegetal                                  |
   | Fisiología animal                                                         |
   | Metabolismo y biosíntesis de biomoléculas                                 |
   | Operaciones de separación                                                 |
   | Patología molecular de plantas                                            |
   | Técnicas instrumentales básicas                                           |
   | Bioinformática                                                            |
   | Biotecnología de los productos hortofrutículas                            |
   | Biotecnología vegetal                                                     |
   | Genómica y proteómica                                                     |
   | Procesos biotecnológicos                                                  |
   | Técnicas instrumentales avanzadas                                         |
   +---------------------------------------------------------------------------+
   ```

   

6. Devuelve un listado con todos los departamentos que tienen alguna
    asignatura que no se haya impartido en ningún curso escolar. El resultado
    debe mostrar el nombre del departamento y el nombre de la asignatura que
    no se haya impartido nunca.

  

  ```mysql
  SELECT departamento.nombre AS nombre_departamento, asignatura.nombre AS nombre_asignatura
  FROM departamento
  LEFT JOIN profesor ON departamento.id = profesor.id_depto
  LEFT JOIN asignatura ON profesor.id = asignatura.id_profesor
  LEFT JOIN alumnoMatriculaAsignatura ON asignatura.id = alumnoMatriculaAsignatura.id_asignatura
  WHERE alumnoMatriculaAsignatura.id_asignatura IS NULL;
  
  +-----------------------+------------------------------------------------------+
  | nombre_departamento   | nombre_asignatura                                    |
  +-----------------------+------------------------------------------------------+
  | Informática           | Arquitectura de Computadores                         |
  | Informática           | Estructura de Datos y Algoritmos I                   |
  | Informática           | Ingeniería del Software                              |
  | Informática           | Sistemas Inteligentes                                |
  | Informática           | Sistemas Operativos                                  |
  | Informática           | Fundamentos de Redes de Computadores                 |
  | Informática           | Planificación y Gestión de Proyectos Informáticos    |
  | Informática           | Bases de Datos                                       |
  | Informática           | Estructura de Datos y Algoritmos II                  |
  | Informática           | Programación de Servicios Software                   |
  | Informática           | Desarrollo de interfaces de usuario                  |
  | Informática           | NULL                                                 |
  | Informática           | NULL                                                 |
  | Matemáticas           | NULL                                                 |
  | Matemáticas           | NULL                                                 |
  | Matemáticas           | NULL                                                 |
  | Economía y Empresa    | NULL                                                 |
  | Economía y Empresa    | NULL                                                 |
  | Educación             | NULL                                                 |
  | Educación             | NULL                                                 |
  | Educación             | NULL                                                 |
  | Agronomía             | NULL                                                 |
  | Química y Física      | NULL                                                 |
  | Química y Física      | NULL                                                 |
  | Filología             | NULL                                                 |
  | Derecho               | NULL                                                 |
  | Biología y Geología   | NULL                                                 |
  +-----------------------+------------------------------------------------------+
  
  ```

  

**Consultas resumen**

1. Devuelve el número total de alumnas que hay.

   

   ```mysql
   SELECT COUNT(*) AS total_alumnas FROM alumno WHERE id_genero = (SELECT id FROM genero WHERE lower(descripcion) like 'mujer' or 'femenino');
   
   +---------------+
   | total_alumnas |
   +---------------+
   |             3 |
   +---------------+
   1 row in set, 1 warning (0,00 sec)
   
   ```

   

2. Calcula cuántos alumnos nacieron en 1999.

   

   ```mysql
   SELECT COUNT(*) AS alumnos_1999
   FROM alumno
   WHERE YEAR(fecha_nacimiento) = 1999;
   
   +--------------+
   | alumnos_1999 |
   +--------------+
   |            2 |
   +--------------+
   1 row in set (0,00 sec)
   
   ```

   

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo
    debe mostrar dos columnas, una con el nombre del departamento y otra
    con el número de profesores que hay en ese departamento. El resultado
    sólo debe incluir los departamentos que tienen profesores asociados y
    deberá estar ordenado de mayor a menor por el número de profesores.

  

  ```mysql
  SELECT departamento.nombre, COUNT(profesor.id) AS numero_profesores
  FROM departamento
  JOIN profesor ON departamento.id = profesor.id_depto
  GROUP BY departamento.nombre
  ORDER BY numero_profesores DESC;
  
  +---------------------+-------------------+
  | nombre              | numero_profesores |
  +---------------------+-------------------+
  | Informática         |                 4 |
  | Matemáticas         |                 3 |
  | Educación           |                 3 |
  | Economía y Empresa  |                 2 |
  | Química y Física    |                 2 |
  | Agronomía           |                 1 |
  +---------------------+-------------------+
  
  
  ```

  

4. Devuelve un listado con todos los departamentos y el número de profesores
    que hay en cada uno de ellos. Tenga en cuenta que pueden existir
    departamentos que no tienen profesores asociados. Estos departamentos
    también tienen que aparecer en el listado.

  

  ```mysql
  SELECT departamento.nombre AS nombre_departamento, COUNT(profesor.id) AS numero_profesores
  FROM departamento
  LEFT JOIN profesor ON departamento.id = profesor.id_depto
  GROUP BY departamento.id
  ORDER BY numero_profesores DESC;
  
  +-----------------------+-------------------+
  | nombre_departamento   | numero_profesores |
  +-----------------------+-------------------+
  | Informática           |                 4 |
  | Matemáticas           |                 3 |
  | Educación             |                 3 |
  | Economía y Empresa    |                 2 |
  | Química y Física      |                 2 |
  | Agronomía             |                 1 |
  | Filología             |                 0 |
  | Derecho               |                 0 |
  | Biología y Geología   |                 0 |
  +-----------------------+-------------------+
  
  ```

  

5. Devuelve un listado con el nombre de todos los grados existentes en la base
    de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta 
    que pueden existir grados que no tienen asignaturas asociadas. Estos grados
    también tienen que aparecer en el listado. El resultado deberá estar
    ordenado de mayor a menor por el número de asignaturas.

  

  ```mysql
  SELECT grado.nombre, COUNT(asignatura.id) AS numero_asignaturas
  FROM grado
  LEFT JOIN asignatura ON grado.id = asignatura.id_grado
  GROUP BY grado.nombre
  ORDER BY numero_asignaturas DESC;
  
  +-----------------------------------------------+--------------------+
  | nombre                                        | numero_asignaturas |
  +-----------------------------------------------+--------------------+
  | Grado en Ingeniería Informática               |                 51 |
  | Grado en Biotecnología                        |                 32 |
  | Grado en Ingeniería Agrícola                  |                  0 |
  | Grado en Ingeniería Eléctrica                 |                  0 |
  | Grado en Ingeniería Electrónica Industrial    |                  0 |
  | Grado en Ingeniería Mecánica                  |                  0 |
  | Grado en Ingeniería Química Industrial        |                  0 |
  | Grado en Ciencias Ambientales                 |                  0 |
  | Grado en Matemáticas                          |                  0 |
  | Grado en Química                              |                  0 |
  +-----------------------------------------------+--------------------+
  
  ```

  

6. Devuelve un listado con el nombre de todos los grados existentes en la base
    de datos y el número de asignaturas que tiene cada uno, de los grados que
    tengan más de 40 asignaturas asociadas.

  

  ```mysql
  SELECT grado.nombre, COUNT(asignatura.id) AS numero_asignaturas
  FROM grado
  LEFT JOIN asignatura ON grado.id = asignatura.id_grado
  GROUP BY grado.nombre
  HAVING COUNT(asignatura.id) > 40
  ORDER BY numero_asignaturas DESC;
  
  +------------------------------------+--------------------+
  | nombre                             | numero_asignaturas |
  +------------------------------------+--------------------+
  | Grado en Ingeniería Informática    |                 51 |
  +------------------------------------+--------------------+
  
  ```

  

7. Devuelve un listado que muestre el nombre de los grados y la suma del
    número total de créditos que hay para cada tipo de asignatura. El resultado
    debe tener tres columnas: nombre del grado, tipo de asignatura y la suma
    de los créditos de todas las asignaturas que hay de ese tipo. Ordene el
    resultado de mayor a menor por el número total de crédidos.

  

  ```mysql
  SELECT grado.nombre, tipoAsignatura.descripcion AS tipo_asignatura, SUM(asignatura.creditos) AS total_creditos
  FROM grado
  LEFT JOIN asignatura ON grado.id = asignatura.id_grado
  LEFT JOIN tipoAsignatura ON asignatura.id_tipoAsignatura = tipoAsignatura.id
  GROUP BY grado.nombre, tipoAsignatura.descripcion
  ORDER BY total_creditos DESC;
  
  +-----------------------------------------------+-----------------+----------------+
  | nombre                                        | tipo_asignatura | total_creditos |
  +-----------------------------------------------+-----------------+----------------+
  | Grado en Ingeniería Informática               | Optativa        |            180 |
  | Grado en Biotecnología                        | Obligatoria     |            120 |
  | Grado en Ingeniería Informática               | Básica          |             72 |
  | Grado en Biotecnología                        | Básica          |             60 |
  | Grado en Ingeniería Informática               | Obligatoria     |             54 |
  | Grado en Ingeniería Agrícola                  | NULL            |           NULL |
  | Grado en Ingeniería Eléctrica                 | NULL            |           NULL |
  | Grado en Ingeniería Electrónica Industrial    | NULL            |           NULL |
  | Grado en Ingeniería Mecánica                  | NULL            |           NULL |
  | Grado en Ingeniería Química Industrial        | NULL            |           NULL |
  | Grado en Ciencias Ambientales                 | NULL            |           NULL |
  | Grado en Matemáticas                          | NULL            |           NULL |
  | Grado en Química                              | NULL            |           NULL |
  +-----------------------------------------------+-----------------+----------------+
  
  ```

  

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de
    alguna asignatura en cada uno de los cursos escolares. El resultado deberá
    mostrar dos columnas, una columna con el año de inicio del curso escolar y
    otra con el número de alumnos matriculados.

  

  ```mysql
  SELECT ce.anyo_inicio, COUNT(DISTINCT alumnoMatriculaAsignatura.id_alumno) AS alumnos_matriculados
  FROM cursoEscolar ce
  LEFT JOIN alumnoMatriculaAsignatura ON ce.id = alumnoMatriculaAsignatura.id_cursoEscolar
  GROUP BY ce.anyo_inicio;
  
  +-------------+----------------------+
  | anyo_inicio | alumnos_matriculados |
  +-------------+----------------------+
  |        2014 |                    3 |
  |        2015 |                    2 |
  |        2016 |                    1 |
  |        2017 |                    1 |
  +-------------+----------------------+
  ```

  

9. Devuelve un listado con el número de asignaturas que imparte cada
    profesor. El listado debe tener en cuenta aquellos profesores que no
    imparten ninguna asignatura. El resultado mostrará cinco columnas: id,
    nombre, primer apellido, segundo apellido y número de asignaturas. El
    resultado estará ordenado de mayor a menor por el número de asignaturas.

  

  ```mysql
  SELECT profesor.id, profesor.nombre, profesor.apellido1, profesor.apellido2, COUNT(asignatura.id) AS numero_asignaturas
  FROM profesor
  LEFT JOIN asignatura ON profesor.id = asignatura.id_profesor
  GROUP BY profesor.id, profesor.nombre, profesor.apellido1, profesor.apellido2
  ORDER BY numero_asignaturas DESC;
  
  +----+-----------+------------+------------+--------------------+
  | id | nombre    | apellido1  | apellido2  | numero_asignaturas |
  +----+-----------+------------+------------+--------------------+
  |  3 | Zoe       | Ramirez    | Gea        |                  7 |
  | 14 | Manolo    | Hamill     | Kozey      |                  4 |
  |  5 | David     | Schmidt    | Fisher     |                  0 |
  |  8 | Cristina  | Lemke      | Rutherford |                  0 |
  | 10 | Esther    | Spencer    | Lakin      |                  0 |
  | 12 | Carmen    | Streich    | Hirthe     |                  0 |
  | 13 | Alfredo   | Stiedemann | Morissette |                  0 |
  | 15 | Alejandro | Kohler     | Schoen     |                  0 |
  | 16 | Antonio   | Fahey      | Considine  |                  0 |
  | 17 | Guillermo | Ruecker    | Upton      |                  0 |
  | 18 | Micaela   | Monahan    | Murray     |                  0 |
  | 20 | Francesca | Schowalter | Muller     |                  0 |
  | 21 | Pepe      | Sánchez    | Ruiz       |                  0 |
  | 22 | Juan      | Guerrero   | Martínez   |                  0 |
  | 23 | María     | Domínguez  | Hernández  |                  0 |
  +----+-----------+------------+------------+--------------------+
  
  ```

  

**Subconsultas**

1. Devuelve todos los datos del alumno más joven.

   

   ```mysql
   SELECT id, nif, nombre, apellido1, apellido2, direccion, fecha_nacimiento, id_genero, id_ciudad
   FROM alumno
   WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM alumno);
   
   +----+-----------+----------+-----------+-----------+-------------------------+------------------+-----------+-----------+
   | id | nif       | nombre   | apellido1 | apellido2 | direccion               | fecha_nacimiento | id_genero | id_ciudad |
   +----+-----------+----------+-----------+-----------+-------------------------+------------------+-----------+-----------+
   |  2 | 26902806M | Salvador | Sánchez   | Pérez     | C/ Real del barrio alto | 1991-03-28       |         2 |         1 |
   +----+-----------+----------+-----------+-----------+-------------------------+------------------+-----------+-----------+
   
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un
    departamento.

  

  ```mysql
  SELECT id, nif, nombre, apellido1, apellido2, direccion, fecha_nacimiento, id_genero, id_ciudad, id_depto
  FROM profesor
  WHERE id_depto IS NULL;
  
  Empty set (0,00 sec)
  ```

  

3. Devuelve un listado con los departamentos que no tienen profesores
    asociados.

  

  ```mysql
  SELECT id, nombre
  FROM departamento
  WHERE id NOT IN (SELECT DISTINCT id_depto FROM profesor);
  
  +----+-----------------------+
  | id | nombre                |
  +----+-----------------------+
  |  7 | Filología             |
  |  8 | Derecho               |
  |  9 | Biología y Geología   |
  +----+-----------------------+
  3 rows in set (0,00 sec)
  
  ```

  

4. Devuelve un listado con los profesores que tienen un departamento
    asociado y que no imparten ninguna asignatura.

  

  ```mysql
  SELECT id, nif, nombre, apellido1, apellido2, direccion, fecha_nacimiento, id_genero, id_ciudad, id_depto
  FROM profesor
  WHERE id_depto IS NOT NULL
  AND id NOT IN (SELECT DISTINCT id_profesor FROM asignatura);
  
  Empty set (0,00 sec)
  
  ```

  

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   

   ```mysql
   SELECT id, nombre, creditos, id_tipoAsignatura, id_profesor, id_grado, cuatrimestre
   FROM asignatura
   WHERE id_profesor IS NULL;
   
   +----+---------------------------------------------------------------------------+----------+-------------------+-------------+----------+--------------+
   | id | nombre                                                                    | creditos | id_tipoAsignatura | id_profesor | id_grado | cuatrimestre |
   +----+---------------------------------------------------------------------------+----------+-------------------+-------------+----------+--------------+
   |  1 | Álgegra lineal y matemática discreta                                      |        6 |                 1 |        NULL |        4 |            1 |
   |  2 | Cálculo                                                                   |        6 |                 1 |        NULL |        4 |            1 |
   |  3 | Física para informática                                                   |        6 |                 1 |        NULL |        4 |            1 |
   |  4 | Introducción a la programación                                            |        6 |                 1 |        NULL |        4 |            1 |
   |  5 | Organización y gestión de empresas                                        |        6 |                 1 |        NULL |        4 |            1 |
   |  6 | Estadística                                                               |        6 |                 1 |        NULL |        4 |            2 |
   |  7 | Estructura y tecnología de computadores                                   |        6 |                 1 |        NULL |        4 |            2 |
   |  8 | Fundamentos de electrónica                                                |        6 |                 1 |        NULL |        4 |            2 |
   |  9 | Lógica y algorítmica                                                      |        6 |                 1 |        NULL |        4 |            2 |
   | 10 | Metodología de la programación                                            |        6 |                 1 |        NULL |        4 |            2 |
   | 22 | Ingeniería de Requisitos                                                  |        6 |                 3 |        NULL |        4 |            3 |
   | 23 | Integración de las Tecnologías de la Información en las Organizaciones    |        6 |                 3 |        NULL |        4 |            3 |
   | 24 | Modelado y Diseño del Software 1                                          |        6 |                 3 |        NULL |        4 |            3 |
   | 25 | Multiprocesadores                                                         |        6 |                 3 |        NULL |        4 |            3 |
   | 26 | Seguridad y cumplimiento normativo                                        |        6 |                 3 |        NULL |        4 |            3 |
   | 27 | Sistema de Información para las Organizaciones                            |        6 |                 3 |        NULL |        4 |            3 |
   | 28 | Tecnologías web                                                           |        6 |                 3 |        NULL |        4 |            3 |
   | 29 | Teoría de códigos y criptografía                                          |        6 |                 3 |        NULL |        4 |            3 |
   | 30 | Administración de bases de datos                                          |        6 |                 3 |        NULL |        4 |            4 |
   | 31 | Herramientas y Métodos de Ingeniería del Software                         |        6 |                 3 |        NULL |        4 |            4 |
   | 32 | Informática industrial y robótica                                         |        6 |                 3 |        NULL |        4 |            4 |
   | 33 | Ingeniería de Sistemas de Información                                     |        6 |                 3 |        NULL |        4 |            4 |
   | 34 | Modelado y Diseño del Software 2                                          |        6 |                 3 |        NULL |        4 |            4 |
   | 35 | Negocio Electrónico                                                       |        6 |                 3 |        NULL |        4 |            4 |
   | 36 | Periféricos e interfaces                                                  |        6 |                 3 |        NULL |        4 |            4 |
   | 37 | Sistemas de tiempo real                                                   |        6 |                 3 |        NULL |        4 |            4 |
   | 38 | Tecnologías de acceso a red                                               |        6 |                 3 |        NULL |        4 |            4 |
   | 39 | Tratamiento digital de imágenes                                           |        6 |                 3 |        NULL |        4 |            4 |
   | 40 | Administración de redes y sistemas operativos                             |        6 |                 3 |        NULL |        4 |            5 |
   | 41 | Almacenes de Datos                                                        |        6 |                 3 |        NULL |        4 |            5 |
   | 42 | Fiabilidad y Gestión de Riesgos                                           |        6 |                 3 |        NULL |        4 |            5 |
   | 43 | Líneas de Productos Software                                              |        6 |                 3 |        NULL |        4 |            5 |
   | 44 | Procesos de Ingeniería del Software 1                                     |        6 |                 3 |        NULL |        4 |            5 |
   | 45 | Tecnologías multimedia                                                    |        6 |                 3 |        NULL |        4 |            5 |
   | 46 | Análisis y planificación de las TI                                        |        6 |                 3 |        NULL |        4 |            6 |
   | 47 | Desarrollo Rápido de Aplicaciones                                         |        6 |                 3 |        NULL |        4 |            6 |
   | 48 | Gestión de la Calidad y de la Innovación Tecnológica                      |        6 |                 3 |        NULL |        4 |            6 |
   | 49 | Inteligencia del Negocio                                                  |        6 |                 3 |        NULL |        4 |            6 |
   | 50 | Procesos de Ingeniería del Software 2                                     |        6 |                 3 |        NULL |        4 |            6 |
   | 51 | Seguridad Informática                                                     |        6 |                 3 |        NULL |        4 |            6 |
   | 52 | Biologia celular                                                          |        6 |                 1 |        NULL |        7 |            1 |
   | 53 | Física                                                                    |        6 |                 1 |        NULL |        7 |            1 |
   | 54 | Matemáticas I                                                             |        6 |                 1 |        NULL |        7 |            1 |
   | 55 | Química general                                                           |        6 |                 1 |        NULL |        7 |            1 |
   | 56 | Química orgánica                                                          |        6 |                 1 |        NULL |        7 |            1 |
   | 57 | Biología vegetal y animal                                                 |        6 |                 1 |        NULL |        7 |            2 |
   | 58 | Bioquímica                                                                |        6 |                 1 |        NULL |        7 |            2 |
   | 59 | Genética                                                                  |        6 |                 1 |        NULL |        7 |            2 |
   | 60 | Matemáticas II                                                            |        6 |                 1 |        NULL |        7 |            2 |
   | 61 | Microbiología                                                             |        6 |                 1 |        NULL |        7 |            2 |
   | 62 | Botánica agrícola                                                         |        6 |                 2 |        NULL |        7 |            1 |
   | 63 | Fisiología vegetal                                                        |        6 |                 2 |        NULL |        7 |            1 |
   | 64 | Genética molecular                                                        |        6 |                 2 |        NULL |        7 |            1 |
   | 65 | Ingeniería bioquímica                                                     |        6 |                 2 |        NULL |        7 |            1 |
   | 66 | Termodinámica y cinética química aplicada                                 |        6 |                 2 |        NULL |        7 |            1 |
   | 67 | Biorreactores                                                             |        6 |                 2 |        NULL |        7 |            2 |
   | 68 | Biotecnología microbiana                                                  |        6 |                 2 |        NULL |        7 |            2 |
   | 69 | Ingeniería genética                                                       |        6 |                 2 |        NULL |        7 |            2 |
   | 70 | Inmunología                                                               |        6 |                 2 |        NULL |        7 |            2 |
   | 71 | Virología                                                                 |        6 |                 2 |        NULL |        7 |            2 |
   | 72 | Bases moleculares del desarrollo vegetal                                  |      4.5 |                 2 |        NULL |        7 |            3 |
   | 73 | Fisiología animal                                                         |      4.5 |                 2 |        NULL |        7 |            3 |
   | 74 | Metabolismo y biosíntesis de biomoléculas                                 |        6 |                 2 |        NULL |        7 |            3 |
   | 75 | Operaciones de separación                                                 |        6 |                 2 |        NULL |        7 |            3 |
   | 76 | Patología molecular de plantas                                            |      4.5 |                 2 |        NULL |        7 |            3 |
   | 77 | Técnicas instrumentales básicas                                           |      4.5 |                 2 |        NULL |        7 |            3 |
   | 78 | Bioinformática                                                            |      4.5 |                 2 |        NULL |        7 |            4 |
   | 79 | Biotecnología de los productos hortofrutículas                            |      4.5 |                 2 |        NULL |        7 |            4 |
   | 80 | Biotecnología vegetal                                                     |        6 |                 2 |        NULL |        7 |            4 |
   | 81 | Genómica y proteómica                                                     |      4.5 |                 2 |        NULL |        7 |            4 |
   | 82 | Procesos biotecnológicos                                                  |        6 |                 2 |        NULL |        7 |            4 |
   | 83 | Técnicas instrumentales avanzadas                                         |      4.5 |                 2 |        NULL |        7 |            4 |
   +----+---------------------------------------------------------------------------+----------+-------------------+-------------+----------+--------------+
   
   ```

   

6. Devuelve un listado con todos los departamentos que no han impartido
    asignaturas en ningún curso escolar.

  ```mysql
  SELECT id, nombre
  FROM departamento
  WHERE id NOT IN (SELECT DISTINCT id_depto FROM profesor 
                  INNER JOIN asignatura ON profesor.id = asignatura.id_profesor 
                  INNER JOIN alumnoMatriculaAsignatura ON asignatura.id = alumnoMatriculaAsignatura.id_asignatura);
  
  +----+-----------------------+
  | id | nombre                |
  +----+-----------------------+
  |  1 | Informática           |
  |  2 | Matemáticas           |
  |  3 | Economía y Empresa    |
  |  4 | Educación             |
  |  5 | Agronomía             |
  |  6 | Química y Física      |
  |  7 | Filología             |
  |  8 | Derecho               |
  |  9 | Biología y Geología   |
  +----+-----------------------+
  9 rows in set (0,00 sec)
  
  ```

 

**Vistas:**

1. Vista de los datos de los alumnos matriculados en asignaturas junto con sus calificaciones.

```mysql
CREATE VIEW vista_alumnos_asignaturas AS
SELECT a.id AS id_alumno, a.nombre AS nombre_alumno, a.apellido1 AS apellido1_alumno, a.apellido2 AS apellido2_alumno, 
       asignatura.id AS id_asignatura, asignatura.nombre AS nombre_asignatura, alumnoMatriculaAsignatura.calificacion
FROM alumno AS a
INNER JOIN alumnoMatriculaAsignatura ON a.id = alumnoMatriculaAsignatura.id_alumno
INNER JOIN asignatura ON alumnoMatriculaAsignatura.id_asignatura = asignatura.id;
```

2. Vista de los datos de los profesores junto con los nombres de los departamentos en los que trabajan.

```mysql
CREATE VIEW vista_profesores_departamentos AS
SELECT p.id AS id_profesor, p.nombre AS nombre_profesor, p.apellido1 AS apellido1_profesor, p.apellido2 AS apellido2_profesor, 
       departamento.nombre AS nombre_departamento
FROM profesor AS p
LEFT JOIN departamento ON p.id_depto = departamento.id;
```

3. Vista de los alumnos que no tienen teléfono asociado.

```mysql
CREATE VIEW vista_alumnos_sin_telefono AS
SELECT id, nif, nombre, apellido1, apellido2, direccion, fecha_nacimiento, id_genero, id_ciudad
FROM alumno
WHERE id NOT IN (SELECT id_alumno FROM telefonoAlumno);
```

4. Vista de las asignaturas que se imparten en el primer cuatrimestre.

```mysql
CREATE VIEW vista_asignaturas_primer_cuatrimestre AS
SELECT *
FROM asignatura
WHERE cuatrimestre = 1;
```

5. Vista de los profesores que enseñan asignaturas en el Grado en Ingeniería Informática (Plan 2015).

```mysql
CREATE VIEW vista_profesores_ingenieria_informatica AS
SELECT DISTINCT p.id AS id_profesor, p.nombre AS nombre_profesor, p.apellido1 AS apellido1_profesor, p.apellido2 AS apellido2_profesor
FROM profesor AS p
INNER JOIN asignatura ON p.id = asignatura.id_profesor
INNER JOIN grado ON asignatura.id_grado = grado.id
WHERE grado.nombre = 'Ingeniería Informática' AND grado.anyo = 2015;
```

6. Vista de los alumnos matriculados en asignaturas del Grado en Ingeniería Civil.

```mysql
CREATE VIEW vista_alumnos_ingenieria_civil AS
SELECT DISTINCT a.id AS id_alumno, a.nombre AS nombre_alumno, a.apellido1 AS apellido1_alumno, a.apellido2 AS apellido2_alumno
FROM alumno AS a
INNER JOIN alumnoMatriculaAsignatura ON a.id = alumnoMatriculaAsignatura.id_alumno
INNER JOIN asignatura ON alumnoMatriculaAsignatura.id_asignatura = asignatura.id
INNER JOIN grado ON asignatura.id_grado = grado.id
WHERE grado.nombre = 'Ingeniería Civil';
```

7. Vista de las asignaturas que tienen más de 6 créditos.

```mysql
CREATE VIEW vista_asignaturas_mayor_seis_creditos AS
SELECT *
FROM asignatura
WHERE creditos > 6;
```

8. Vista de los profesores que tienen teléfono asociado.

```mysql
CREATE VIEW vista_profesores_con_telefono AS
SELECT p.id AS id_profesor, p.nif, p.nombre, p.apellido1, p.apellido2, p.direccion, p.fecha_nacimiento, p.id_genero, p.id_ciudad, t.numero, t.prefijo, t.id_tipoTelefono
FROM profesor AS p
INNER JOIN telefonoProfesor AS t ON p.id = t.id_profesor;
```

9. Vista de los alumnos matriculados en asignaturas durante el curso escolar 2023/2024.

```mysql
CREATE VIEW vista_alumnos_matriculados_2023_2024 AS
SELECT DISTINCT a.id AS id_alumno, a.nombre AS nombre_alumno, a.apellido1 AS apellido1_alumno, a.apellido2 AS apellido2_alumno
FROM alumno AS a
INNER JOIN alumnoMatriculaAsignatura AS ama ON a.id = ama.id_alumno
INNER JOIN cursoEscolar AS ce ON ama.id_cursoEscolar = ce.id
WHERE ce.anyo_inicio = 2023 AND ce.anyo_fin = 2024;
```

10. Vista de los profesores que tienen un departamento asignado y enseñan asignaturas durante el primer cuatrimestre.

```mysql
CREATE VIEW vista_profesores_departamento_asignaturas_primer_cuatrimestre AS
SELECT p.id AS id_profesor, p.nombre AS nombre_profesor, p.apellido1 AS apellido1_profesor, p.apellido2 AS apellido2_profesor, 
       p.id_depto, asignatura.nombre AS nombre_asignatura
FROM profesor AS p
INNER JOIN asignatura ON p.id = asignatura.id_profesor
WHERE p.id_depto IS NOT NULL AND asignatura.cuatrimeste = 1;
```

**Procedimientos DML (Manipulación de Datos):**

1. Insertar un nuevo alumno:

```mysql
CREATE PROCEDURE insertar_alumno(
    IN p_nif VARCHAR(9),
    IN p_nombre VARCHAR(25),
    IN p_apellido1 VARCHAR(50),
    IN p_ap

ellido2 VARCHAR(50),
    IN p_direccion VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_id_genero INT,
    IN p_id_ciudad INT
)
BEGIN
    INSERT INTO alumno (nif, nombre, apellido1, apellido2, direccion, fecha_nacimiento, id_genero, id_ciudad)
    VALUES (p_nif, p_nombre, p_apellido1, p_apellido2, p_direccion, p_fecha_nacimiento, p_id_genero, p_id_ciudad);
END;
```

2. Actualizar la dirección de un alumno:

```mysql
CREATE PROCEDURE actualizar_direccion_alumno(
    IN p_id_alumno INT,
    IN p_nueva_direccion VARCHAR(50)
)
BEGIN
    UPDATE alumno
    SET direccion = p_nueva_direccion
    WHERE id = p_id_alumno;
END;
```

3. Eliminar un teléfono asociado a un profesor:

```mysql
CREATE PROCEDURE eliminar_telefono_profesor(
    IN p_id_profesor INT
)
BEGIN
    DELETE FROM telefonoProfesor
    WHERE id_profesor = p_id_profesor;
END;
```

4. Insertar un nuevo teléfono para un alumno:

```mysql
CREATE PROCEDURE insertar_telefono_alumno(
    IN p_numero INT,
    IN p_prefijo INT,
    IN p_id_tipoTelefono INT,
    IN p_id_alumno INT
)
BEGIN
    INSERT INTO telefonoAlumno (numero, prefijo, id_tipoTelefono, id_alumno)
    VALUES (p_numero, p_prefijo, p_id_tipoTelefono, p_id_alumno);
END;
```

5. Actualizar la calificación de un alumno en una asignatura:

```mysql
CREATE PROCEDURE actualizar_calificacion_alumno(
    IN p_id_alumno INT,
    IN p_id_asignatura INT,
    IN p_nueva_calificacion FLOAT
)
BEGIN
    UPDATE alumnoMatriculaAsignatura
    SET calificacion = p_nueva_calificacion
    WHERE id_alumno = p_id_alumno AND id_asignatura = p_id_asignatura;
END;
```

6. Eliminar un profesor y sus teléfonos asociados:

```mysql
CREATE PROCEDURE eliminar_profesor(
    IN p_id_profesor INT
)
BEGIN
    DELETE FROM profesor
    WHERE id = p_id_profesor;
    
    DELETE FROM telefonoProfesor
    WHERE id_profesor = p_id_profesor;
END;
```

7. Insertar una nueva asignatura:

```mysql
CREATE PROCEDURE insertar_asignatura(
    IN p_nombre VARCHAR(100),
    IN p_creditos FLOAT,
    IN p_id_tipoAsignatura INT,
    IN p_id_profesor INT,
    IN p_id_grado INT,
    IN p_cuatrimestre TINYINT
)
BEGIN
    INSERT INTO asignatura (nombre, creditos, id_tipoAsignatura, id_profesor, id_grado, cuatrimeste)
    VALUES (p_nombre, p_creditos, p_id_tipoAsignatura, p_id_profesor, p_id_grado, p_cuatrimestre);
END;
```

8. Actualizar el nombre de un departamento:

```mysql
CREATE PROCEDURE actualizar_nombre_departamento(
    IN p_id_departamento INT,
    IN p_nuevo_nombre VARCHAR(50)
)
BEGIN
    UPDATE departamento
    SET nombre = p_nuevo_nombre
    WHERE id = p_id_departamento;
END;
```

9. Eliminar un alumno y sus registros asociados:

```mysql
CREATE PROCEDURE eliminar_alumno(
    IN p_id_alumno INT
)
BEGIN
    DELETE FROM alumno
    WHERE id = p_id_alumno;
    
    DELETE FROM telefonoAlumno
    WHERE id_alumno = p_id_alumno;
    
    DELETE FROM alumnoMatriculaAsignatura
    WHERE id_alumno = p_id_alumno;
END;
```

10. Insertar un nuevo curso escolar:

```mysql
CREATE PROCEDURE insertar_curso_escolar(
    IN p_anyo_inicio YEAR(4),
    IN p_anyo_fin YEAR(4)
)
BEGIN
    INSERT INTO cursoEscolar (anyo_inicio, anyo_fin)
    VALUES (p_anyo_inicio, p_anyo_fin);
END;
```

Estos son ejemplos de vistas y procedimientos DML que podrían ser útiles en un sistema educativo para gestionar información sobre alumnos, profesores, asignaturas, etc. Si necesitas más detalles o tienes alguna otra pregunta, ¡no dudes en decirlo!