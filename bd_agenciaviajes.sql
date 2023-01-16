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
  nombre VARCHAR (15) NOT NULL,
  direccion VARCHAR (30) NOT NULL,
  telefono FLOAT NOT NULL,
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
  nombre VARCHAR (15) NOT NULL,
  direccion VARCHAR (30) NOT NULL,
  telefono INT NOT NULL,
  categoria VARCHAR (10) NOT NULL,
  fecha_entrada DATE NOT NULL,
  fecha_salida DATE NOT NULL,
  PRIMARY KEY (id_hotel)
  );
CREATE TABLE categoria (
  id_hotel INT NOT NULL,
  tipo_hotel VARCHAR (10) NOT NULL,
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
