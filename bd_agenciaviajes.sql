DROP DATABASE IF EXISTS bd_agenciaviajes;
CREATE DATABASE bd_agenciaviajes;
USE bd_agenciaviajes;
CREATE TABLE trabajadores (
  id_trabajadores INT NOT NULL,
  dni VARCHAR (9) NOT NULL,
  nombre VARCHAR (15) NOT NULL,
  apellidos VARCHAR (30) NOT NULL,
  puesto VARCHAR (20) NOT NULL,
  salario FLOAT NOT NULL,
  cod_agencia INT NOT NULL,
  PRIMARY KEY (id_trabajadores)
  );
CREATE TABLE agencia (
  cod_agencia INT NOT NULL,
  nombre VARCHAR (30) NOT NULL,
  direccion VARCHAR (30) NOT NULL,
  telefono INT NOT NULL,
  PRIMARY KEY (cod_agencia)
  );
CREATE TABLE clientes (
  dni VARCHAR (9) NOT NULL,
  nombre VARCHAR(15) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  telefono INT NOT NULL,
  id_hotel INT NOT NULL,
  PRIMARY KEY (dni)
  );
CREATE TABLE agenciaclientes (
  cod_agencia INT NOT NULL,
  dni VARCHAR (9) NOT NULL,
  PRIMARY KEY (cod_agencia, dni)
  );
CREATE TABLE hotel (
  id_hotel INT NOT NULL,
  nombre VARCHAR (30) NOT NULL,
  direccion VARCHAR (30) NOT NULL,
  telefono INT NOT NULL,
  categoria VARCHAR (25) NOT NULL,
  fecha_entrada DATE NOT NULL,
  fecha_salida DATE NOT NULL,
  PRIMARY KEY (id_hotel)
  );
CREATE TABLE categoria (
  id_hotel INT NOT NULL,
  tipo_hotel VARCHAR (25) NOT NULL,
  PRIMARY KEY (id_hotel)
  );
CREATE TABLE vuelo (
  id_vuelo INT NOT NULL,
  numero_plazas INT NOT NULL,
  fecha_ida DATE NOT NULL,
  fecha_vuelta DATE NOT NULL,
  PRIMARY KEY (id_vuelo)
  );
CREATE TABLE vueloclientes (
  id_vuelo INT NOT NULL,
  dni VARCHAR (9) NOT NULL,
  PRIMARY KEY (id_vuelo, dni)
  );
CREATE TABLE origen (
  id_origen INT NOT NULL,
  ciudad VARCHAR (30) NULL,
  PRIMARY KEY (id_origen)
  );
CREATE TABLE vueloorigen (
  id_vuelo INT NOT NULL,
  id_origen INT NOT NULL,
  PRIMARY KEY (id_vuelo, id_origen)
  );
CREATE TABLE destino (
  id_destino INT NOT NULL,
  ciudad VARCHAR (45) NOT NULL,
  PRIMARY KEY (id_destino)
  );
CREATE TABLE vuelodestino (
  id_vuelo INT NOT NULL,
  id_destino INT NOT NULL,
  PRIMARY KEY (id_vuelo, id_destino)
  );
CREATE TABLE compañia (
  id_compañia INT NOT NULL,
  nombre VARCHAR (20) NULL,
  telefono INT NOT NULL,
  correo VARCHAR (45) NULL,
  pais VARCHAR (20) NULL,
  PRIMARY KEY (id_compañia)
  );
CREATE TABLE vuelocompañia (
id_vuelo INT NOT NULL,
id_compañia INT NOT NULL,
PRIMARY KEY (id_vuelo, id_compañia)
);

ALTER TABLE trabajadores
ADD CONSTRAINT fk_agencia1 FOREIGN KEY (cod_agencia) REFERENCES agencia (cod_agencia);

ALTER TABLE clientes
ADD CONSTRAINT fk_hotel1 FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel);

ALTER TABLE agenciaclientes
ADD CONSTRAINT fk_agencia2 FOREIGN KEY (cod_agencia) REFERENCES agencia (cod_agencia), 
ADD CONSTRAINT fk_clientes1 FOREIGN KEY (dni) REFERENCES clientes (dni);

ALTER TABLE categoria
ADD CONSTRAINT fk_categoria FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel);

ALTER TABLE vueloclientes
ADD CONSTRAINT fk_vuelo1 FOREIGN KEY (id_vuelo) REFERENCES vuelo (id_vuelo), 
ADD CONSTRAINT fk_clientes2 FOREIGN KEY (dni) REFERENCES clientes (dni);

ALTER TABLE vueloorigen
ADD CONSTRAINT fk_vuelo2 FOREIGN KEY (id_vuelo) REFERENCES vuelo (id_vuelo), 
ADD CONSTRAINT fk_origen1 FOREIGN KEY (id_origen) REFERENCES origen (id_origen);

ALTER TABLE vuelodestino
ADD CONSTRAINT fk_vuelo3 FOREIGN KEY (id_vuelo) REFERENCES vuelo (id_vuelo), 
ADD CONSTRAINT fk_destino1 FOREIGN KEY (id_destino) REFERENCES destino (id_destino);

ALTER TABLE vuelocompañia
ADD CONSTRAINT FK_vuelo4 FOREIGN KEY (id_vuelo) REFERENCES vuelo (id_vuelo), 
ADD CONSTRAINT FK_compañia1 FOREIGN KEY (id_compañia) REFERENCES compañia (id_compañia);

insert into agencia 
(cod_agencia, nombre, direccion, telefono) values (01, "halcón viajes", "Ave del paraíso, 7", 928306019);
insert into agencia 
(cod_agencia, nombre, direccion, telefono) values (02, "viajes Paqui", "Barcelona, 5", 928163966);
insert into agencia 
(cod_agencia, nombre, direccion, telefono) values (03, "viajes el corte ingles", "Leon y Castillo, 16", 928347610);
insert into agencia 
(cod_agencia, nombre, direccion, telefono) values (04, "viajes carrefour", "Avenida del atlántico, 9", 928716317);
insert into agencia 
(cod_agencia, nombre, direccion, telefono) values (05, "Viajes La Fuente", "Pablo Neruda, 77", 928927768);

insert into trabajadores 
(id_trabajadores, dni, nombre, apellidos, puesto, salario, cod_agencia) values (01, "54136009P", "Juan", "Sánchez Artiles", "Gerente", 3100, 01);
insert into trabajadores 
(id_trabajadores, dni, nombre, apellidos, puesto, salario, cod_agencia) values (02, "54195709H", "Pedro", "Afonso Castellano", "Encargado", 2250, 02);
insert into trabajadores 
(id_trabajadores, dni, nombre, apellidos, puesto, salario, cod_agencia) values (03, "54113909V", "Francisco", "Pérez Bolaños", "Atención al cliente", 1200, 03);
insert into trabajadores 
(id_trabajadores, dni, nombre, apellidos, puesto, salario, cod_agencia) values (04, "54171929T", "Miguel", "Herrera Martínez", "Comercial", 1300, 04);
insert into trabajadores 
(id_trabajadores, dni, nombre, apellidos, puesto, salario, cod_agencia) values (05, "54171929X", "Luisa", "Guedes Fernandez", "Gerente", 3100, 05);

insert into hotel 
(id_hotel, nombre, direccion, telefono, categoria, fecha_entrada, fecha_salida) values (1001, "Radisson", "Avenida de los Artesanos, 217", 928789361, "4 estrellas", "2023-01-16", "2023-01-23");
insert into hotel 
(id_hotel, nombre, direccion, telefono, categoria, fecha_entrada, fecha_salida) values (2002, "Orquídea", "Avenida de Maspalomas, 192", 928734582, "2 estrellas", "2023-02-01", "2023-02-14");
insert into hotel 
(id_hotel, nombre, direccion, telefono, categoria, fecha_entrada, fecha_salida) values (3003, "Las dunas", "Avenida Meloneras, 25", 928124530, "5 estrellas", "2022-04-16", "2022-04-29");
insert into hotel 
(id_hotel, nombre, direccion, telefono, categoria, fecha_entrada, fecha_salida) values (4004, "Monte Carlo", "Calle Poeta Amador, 86", 928721546, "5 estrellas", "2023-02-10", "2023-02-20");
insert into hotel 
(id_hotel, nombre, direccion, telefono, categoria, fecha_entrada, fecha_salida) values (5005, "Villa del Conde", "Avenida de Meloneras, 217", 928723498, "1 estrella", "2022-08-25", "2022-09-23");

insert into clientes 
(dni, nombre, apellidos, telefono, id_hotel) values ("51163075L", "Juana", "De Arco Peñate", 691361472, 1001);
insert into clientes 
(dni, nombre, apellidos, telefono, id_hotel) values ("54189347H", "Juan Jesús", "Parrales Recio", 629748618, 2002);
insert into clientes 
(dni, nombre, apellidos, telefono, id_hotel) values ("58916743S", "María", "Stoickov Espino", 618934729, 3003);
insert into clientes 
(dni, nombre, apellidos, telefono, id_hotel) values ("42916817G", "David", "Alemán Romero", 691789467, 4004);
insert into clientes 
(dni, nombre, apellidos, telefono, id_hotel) values ("42678819K", "Francisco", "Guerra Expósito", 671829173, 5005);

insert into agenciaclientes 
(cod_agencia, dni) values (01, "51163075L");
insert into agenciaclientes 
(cod_agencia, dni) values (02, "54189347H");
insert into agenciaclientes 
(cod_agencia, dni) values (03, "58916743S");
insert into agenciaclientes 
(cod_agencia, dni) values (04, "42916817G");
insert into agenciaclientes 
(cod_agencia, dni) values (05, "42678819K");

insert into categoria
(id_hotel, tipo_hotel) values (1001, "Resort & Spa");
insert into categoria
(id_hotel, tipo_hotel) values (2002, "Resort");
insert into categoria
(id_hotel, tipo_hotel) values (3003, "Resort & Spa & Golf");
insert into categoria
(id_hotel, tipo_hotel) values (4004, "Resort & Spa & Golf");
insert into categoria
(id_hotel, tipo_hotel) values (5005, "Apartahotel");

insert into vuelo
(id_vuelo, numero_plazas, fecha_ida, fecha_vuelta) values (111, 80, "2023-01-01", "2023-01-15");
insert into vuelo
(id_vuelo, numero_plazas, fecha_ida, fecha_vuelta) values (222, 50, "2023-02-01", "2023-02-07");
insert into vuelo
(id_vuelo, numero_plazas, fecha_ida, fecha_vuelta) values (333, 65, "2022-04-08", "2022-04-15");
insert into vuelo
(id_vuelo, numero_plazas, fecha_ida, fecha_vuelta) values (444, 80, "2022-07-21", "2022-07-22");
insert into vuelo
(id_vuelo, numero_plazas, fecha_ida, fecha_vuelta) values (555, 30, "2023-02-07", "2023-02-15");

insert into vueloclientes
(id_vuelo, dni) values (111, "51163075L");
insert into vueloclientes
(id_vuelo, dni) values (222, "54189347H");
insert into vueloclientes
(id_vuelo, dni) values (333, "58916743S");
insert into vueloclientes
(id_vuelo, dni) values (444, "42916817G");
insert into vueloclientes
(id_vuelo, dni) values (555, "42678819K");

insert into origen
(id_origen, ciudad) values (20, "Las Palmas");
insert into origen
(id_origen, ciudad) values (40, "Roma");
insert into origen
(id_origen, ciudad) values (60, "Paris");
insert into origen
(id_origen, ciudad) values (80, "Santa Cruz");
insert into origen
(id_origen, ciudad) values (100, "Lisboa");

insert into vueloorigen
(id_vuelo, id_origen) values (111, 20);
insert into vueloorigen
(id_vuelo, id_origen) values (222, 40);
insert into vueloorigen
(id_vuelo, id_origen) values (333, 60);
insert into vueloorigen
(id_vuelo, id_origen) values (444, 80);
insert into vueloorigen
(id_vuelo, id_origen) values (555, 100);

insert into destino
(id_destino, ciudad) values (10, "Marrackech");
insert into destino
(id_destino, ciudad) values (30, "Siria");
insert into destino
(id_destino, ciudad) values (50, "Sidney");
insert into destino
(id_destino, ciudad) values (70, "Lima");
insert into destino
(id_destino, ciudad) values (90, "Bogotá");

insert into vuelodestino
(id_vuelo, id_destino) values (111, 10);
insert into vuelodestino
(id_vuelo, id_destino) values (222, 30);
insert into vuelodestino
(id_vuelo, id_destino) values (333, 50);
insert into vuelodestino
(id_vuelo, id_destino) values (444, 70);
insert into vuelodestino
(id_vuelo, id_destino) values (555, 90);

insert into compañia
(id_compañia, nombre, telefono, correo, pais) values (11111, "Binter", 928369217, "bintercanarias@gmail.com", "España");
insert into compañia
(id_compañia, nombre, telefono, correo, pais) values (22222, "Ryanair", 928123964, "ryanair@gmail.com", "España");
insert into compañia
(id_compañia, nombre, telefono, correo, pais) values (33333, "Vueling", 928331766, "vueling@gmail.com", "Portugal");
insert into compañia
(id_compañia, nombre, telefono, correo, pais) values (44444, "Fly Emirates", 928169347, "flyemirates@gmail.com", "Francia");
insert into compañia
(id_compañia, nombre, telefono, correo, pais) values (55555, "Iberia", 928446031, "iberia@gmail.com", "Italia");

insert into vuelocompañia
(id_vuelo, id_compañia) values (111, 11111);
insert into vuelocompañia
(id_vuelo, id_compañia) values (222, 22222);
insert into vuelocompañia
(id_vuelo, id_compañia) values (333, 33333);
insert into vuelocompañia
(id_vuelo, id_compañia) values (444, 44444);
insert into vuelocompañia
(id_vuelo, id_compañia) values (555, 55555);