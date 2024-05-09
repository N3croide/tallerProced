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
