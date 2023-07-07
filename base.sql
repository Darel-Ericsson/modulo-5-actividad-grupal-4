CREATE DATABASE newapp;
USE newapp;

CREATE TABLE registro_usuarios(
	id_usuario varchar(15) primary key, /*Perfiero un varchar ya que cuando se trata de usuarios estos sulen ser unicos, intrferibles y dificil de deducir*/
	nombre varchar(10) not null, /*Ya que es un texto*/
    apellido varchar(10) not null,/*Ya que es un texto*/
	contasenia varchar(255),/*Ya que se tranfiere como texto, pero su longitud puede varia entre enciptado y desencriptado*/
	zona_horaria varchar(10) default 'UTC-3', /*Las fechas se guardan como texto*/
    genero enum('M', 'F', 'O'), /*Si bien podria ser VARCHAR, enum solo aceptara las opciones presentadas, impicitamente se configura como dato de tipo texto*/
    telefono_contacto varchar(15) /*Varchar para aceptar signos como +*/
);

CREATE TABLE registro_ingreso_app(
	id_ingreso int primary key auto_increment, /*Es ta vez si usamos int con autoincremente, ya que solo deseamos especificar un orden relacionado al numero de visita y poder identificarla*/
	id_usuario varchar(15) not null,
    data_ingreso timestamp default current_timestamp, /*Tipo de dato que almacena la hora y fecha actual, la clausa asegura que de no entregarse el dato, de igual forma se guarde la hora y fecha actual*/
	foreign key (id_usuario) references registro_usuarios(id_usuario) /*Se declara como llave foranea el id del usuario para poder relacionar que usuario en particular entra en un momento determinado a la plataforma, pudiendo hacer seguimiento al usuario*/
);

ALTER TABLE registro_usuarios
modify zona_horaria varchar(10) default 'UTC-2';

INSERT INTO registro_usuarios
VALUES
    ('XSF34455F','Juan', 'Pérez', 'password1', 'UTC-3', 'M', '123456789'),
    ('FSs353124','María', 'López', 'password2', 'UTC-3', 'F', '987654321'),
    ('124DDDgt','Carlos', 'González', 'password3', 'UTC-3', 'M', '567890123'),
    ('fafafita2','Laura', 'Martínez', 'password4', 'UTC-3', 'F', '234567890'),
    ('45636A','Pedro', 'Sánchez', 'password5', 'UTC-3', 'M', '901234567'),
    ('TY2343ART','Ana', 'Ramírez', 'password6', 'UTC-3', 'F', '345678901'),
    ('DDe5678','Luis', 'Torres', 'password7', 'UTC-3', 'M', '789012345'),
    ('RRMEw','Sofía', 'Hernández', 'password8', 'UTC-3', 'F', '456789012');

INSERT INTO registro_ingreso_app (id_ingreso, id_usuario)
values
	(default,'XSF34455F'),
	(default,'FSs353124'),
	(default,'124DDDgt'),
	(default,'fafafita2'),
	(default,'45636A'),
	(default,'TY2343ART'),
	(default,'DDe5678'),
	(default,'RRMEw');
    
CREATE TABLE contactos(
	id_contacto int primary key auto_increment,
    id_usuario varchar(15) not null, 
    numero_telefono varchar(15),
    correo_electronico varchar(50)
);

ALTER TABLE contactos
     ADD foreign key (numero_telefono) references registro_usuarios(telefono_contacto); 