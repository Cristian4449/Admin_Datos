drop database if exists aeropuerto;
create database aeropuerto;
use aeropuerto;

# Creacion de tablas

create table ubicacion (
id_ubicacion int unsigned not null,
nombre_ubicacion varchar(45) not null
);

create table aeropuerto (
id_aeropuerto int unsigned not null,
nombre_aeropuerto varchar(45) not null,
fk_id_ubicacion int unsigned not null
);

create table aeropuerto_aerolinea (
num_local_aeropuerto_aerolinea int unsigned not null,
num_angar_aeropuerto_aerolinea int unsigned not null,
fk_id_aeropuerto int unsigned not null,
fk_id_aerolinea int unsigned not null
);

create table aerolinea (
id_aerolinea int unsigned not null,
nombre_aerolinea varchar(45) not null
);

create table vuelo (
id_vuelo int unsigned not null,
origen_vuelo varchar(45) not null,
destino_vuelo varchar(45) not null,
fecha_salida_vuelo timestamp not null,
fecha_llegada_vuelo timestamp not null,
fk_id_aerolinea int unsigned not null,
fk_id_avion int unsigned not null
);

create table avion (
id_avion int unsigned not null,
nombre_avion varchar(45) not null,
num_puestos_avion int unsigned not null
);

create table piloto (
id_piloto int unsigned not null,
horas_vuelo_piloto int unsigned not null,
estado_piloto varchar(45) not null,
fk_id_persona int unsigned not null
);

create table azafata (
id_azafata int unsigned not null,
experiencia_azafata int unsigned not null,
estado_azafata varchar(45) not null,
fk_id_persona int unsigned not null
);

create table azafata_idioma (
fk_id_azafata int unsigned not null,
fk_id_idioma int unsigned not null,
nivel_azafata_idioma varchar(45) not null
);

create table piloto_idioma (
fk_id_piloto int unsigned not null,
fk_id_idioma int unsigned not null,
nivel_piloto_idioma varchar(45) not null
);

create table idioma (
id_idioma int unsigned not null,
nombre_idioma varchar(45) not null
);

create table vuelo_azafata (
fk_id_vuelo int unsigned not null,
fk_id_azafata int unsigned not null,
novedades_vuelo_azafata varchar(45)
);

create table vuelo_piloto (
fk_id_vuelo int unsigned not null,
fk_id_piloto int unsigned not null,
novedades_vuelo_piloto varchar(45)
);

create table persona (
id_persona int unsigned not null,
nombre_persona varchar(45) not null,
apellido_persona varchar(45) not null,
correo_persona varchar(45) not null,
fk_id_tipodocumento int unsigned not null
);

create table tipodocumento (
id_tipodocumento int unsigned not null,
nombre_tipodocumento varchar(45) not null
);

create table celular (
id_celular int unsigned not null,
numero_celular bigint unsigned not null,
fk_id_persona int unsigned not null
);

create table pasajero (
id_pasajero int unsigned not null,
motivo_pasajero varchar(45) not null,
fk_id_persona int unsigned not null
);

create table ticket (
id_ticket int unsigned not null,
precio_ticket int unsigned not null,
puesto_ticket int unsigned not null,
fk_id_pasajero int unsigned not null,
fk_id_vuelo int unsigned not null,
fk_id_clasepuesto int unsigned not null
);

create table clasepuesto (
id_clasepuesto int unsigned not null,
nombre_clasepuesto varchar(45) not null
);

create table equipaje (
id_equipaje int unsigned not null,
peso_equipaje int unsigned not null,
fk_id_pasajero int unsigned not null,
fk_id_categoria int unsigned not null
);

create table categoria (
id_categoria int unsigned not null,
nombre_categoria varchar(45) not null
);

# Llaves primarias

alter table azafata_idioma
add constraint pk_azafata_idioma
primary key (fk_id_azafata, fk_id_idioma);

alter table piloto_idioma
add constraint pk_piloto_idioma
primary key (fk_id_piloto, fk_id_idioma);

alter table aerolinea
add constraint pk_aerolinea
primary key (id_aerolinea);

alter table aeropuerto
add constraint pk_aeropuerto
primary key (id_aeropuerto);

alter table aeropuerto_aerolinea
add constraint pk_aeropuerto_aerolinea
primary key (fk_id_aeropuerto, fk_id_aerolinea);

alter table avion
add constraint pk_avion
primary key (id_avion);

alter table azafata
add constraint pk_azafata
primary key (id_azafata);

alter table categoria
add constraint pk_categoria
primary key (id_categoria);

alter table celular
add constraint pk_celular
primary key (id_celular);

alter table equipaje
add constraint pk_equipaje
primary key (id_equipaje);

alter table pasajero
add constraint pk_pasajero
primary key (id_pasajero);

alter table persona
add constraint pk_persona
primary key (id_persona);

alter table piloto
add constraint pk_piloto
primary key (id_piloto);

alter table ticket
add constraint pk_ticket
primary key (id_ticket);

alter table tipodocumento
add constraint pk_tipodocumento
primary key (id_tipodocumento);

alter table ubicacion
add constraint pk_ubicacion
primary key (id_ubicacion);

alter table vuelo
add constraint pk_vuelo
primary key (id_vuelo);

alter table idioma
add constraint pk_idioma
primary key (id_idioma);

alter table clasepuesto
add constraint pk_clasepuesto
primary key (id_clasepuesto);

alter table vuelo_azafata
add constraint pk_vuelo_azafata
primary key (fk_id_vuelo, fk_id_azafata);

alter table vuelo_piloto
add constraint pk_vuelo_piloto
primary key (fk_id_vuelo, fk_id_piloto);

# Llaves foraneas

alter table aeropuerto_aerolinea
add constraint fk_aerolinea_aeropuerto_aerolinea
foreign key (fk_id_aerolinea)
references aerolinea (id_aerolinea)
on delete no action
on update no action;

alter table aeropuerto_aerolinea
add constraint fk_aerolinea_aeropuerto_aeropuerto
foreign key (fk_id_aeropuerto)
references aeropuerto (id_aeropuerto)
on delete no action
on update no action;

alter table azafata
add constraint fk_persona_azafata
foreign key (fk_id_persona)
references persona (id_persona)
on delete no action
on update no action;

alter table vuelo_azafata
add constraint fk_vuelo_vuelo_azafata
foreign key (fk_id_vuelo)
references vuelo (id_vuelo)
on delete no action
on update no action;

alter table vuelo_azafata
add constraint fk_azafata_vuelo_azafata
foreign key (fk_id_azafata)
references azafata (id_azafata)
on delete no action
on update no action;

alter table celular
add constraint fk_persona_celular
foreign key (fk_id_persona)
references persona (id_persona)
on delete no action
on update no action;

alter table equipaje
add constraint fk_pasajero_equipaje
foreign key (fk_id_pasajero)
references pasajero (id_pasajero)
on delete no action
on update no action;

alter table equipaje
add constraint fk_categoria_equipaje
foreign key (fk_id_categoria)
references categoria (id_categoria)
on delete no action
on update no action;

alter table pasajero
add constraint fk_persona_pasajero
foreign key (fk_id_persona)
references persona (id_persona)
on delete no action
on update no action;

alter table persona
add constraint fk_tipodocumento_persona
foreign key (fk_id_tipodocumento)
references tipodocumento (id_tipodocumento)
on delete no action
on update no action;

alter table piloto
add constraint fk_persona_piloto
foreign key (fk_id_persona)
references persona (id_persona)
on delete no action
on update no action;

alter table vuelo_piloto
add constraint fk_vuelo_vuelo_piloto
foreign key (fk_id_vuelo)
references vuelo (id_vuelo)
on delete no action
on update no action;

alter table vuelo_piloto
add constraint fk_piloto_vuelo_piloto
foreign key (fk_id_piloto)
references piloto (id_piloto)
on delete no action
on update no action;

alter table ticket
add constraint fk_pasajero_ticket
foreign key (fk_id_pasajero)
references pasajero (id_pasajero)
on delete no action
on update no action;

alter table ticket
add constraint fk_vuelo_ticket
foreign key (fk_id_vuelo)
references vuelo (id_vuelo)
on delete no action
on update no action;

alter table ticket
add constraint fk_clasepuesto_ticket
foreign key (fk_id_clasepuesto)
references clasepuesto (id_clasepuesto)
on delete no action
on update no action;

alter table vuelo
add constraint fk_aerolinea_vuelo
foreign key (fk_id_aerolinea)
references aerolinea (id_aerolinea)
on delete no action
on update no action;

alter table vuelo
add constraint fk_avion_vuelo
foreign key (fk_id_avion)
references avion (id_avion)
on delete no action
on update no action;

alter table aeropuerto
add constraint fk_ubicacion_aeropuerto
foreign key (fk_id_ubicacion)
references ubicacion (id_ubicacion)
on delete no action
on update no action;

alter table azafata_idioma
add constraint fk_azafata_azafata_idioma
foreign key (fk_id_azafata)
references azafata (id_azafata)
on delete no action
on update no action;

alter table azafata_idioma
add constraint fk_idioma_azafata_idioma
foreign key (fk_id_idioma)
references idioma (id_idioma)
on delete no action
on update no action;

alter table piloto_idioma
add constraint fk_piloto_piloto_idioma
foreign key (fk_id_piloto)
references piloto (id_piloto)
on delete no action
on update no action;

alter table piloto_idioma
add constraint fk_idioma_piloto_idioma
foreign key (fk_id_idioma)
references idioma (id_idioma)
on delete no action
on update no action;

# Datos

insert into tipodocumento (id_tipodocumento, nombre_tipodocumento) values
(1, 'CEDULA'),
(2, 'TARJETA DE IDENTIDAD'),
(3, 'TARJETA DE EXTRANJERIA');

insert into idioma (id_idioma, nombre_idioma) values
(1, 'INGLES'),
(2, 'ESPAÑOL'),
(3, 'ITALIANO'),
(4, 'FRANCES'),
(5, 'RUSO'),
(6, 'JAPONES'),
(7, 'CHINO'),
(8, 'ALEMAN');

insert into avion (id_avion, nombre_avion, num_puestos_avion) values
(1, 'FANTASMA', 45),
(2, 'EL ULTIMO', 30),
(3, 'AQUI FUE', 50);

insert into aerolinea (id_aerolinea, nombre_aerolinea) values
(1, 'AVIANCA'),
(2, 'SATENA'),
(3, 'WINGO');

insert into clasepuesto (id_clasepuesto, nombre_clasepuesto) values
(1, 'TURISTA'),
(2, 'EJECUTIVA'),
(3, 'PRIMERA'),
(4, 'POBRE'),
(5, 'VAGABUNDO');

insert into ubicacion (id_ubicacion, nombre_ubicacion) values
(1, 'BOGOTA'),
(2, 'BUCARAMANGA'),
(3, 'ARMENIA');

insert into aeropuerto (id_aeropuerto, nombre_aeropuerto, fk_id_ubicacion) values
(1, 'EL DORADO', 1),
(2, 'PALONEGRO', 2),
(3, 'EL EDEN', 3),
(4, 'PILOTO CIEGO', 1);

insert into aeropuerto_aerolinea (num_local_aeropuerto_aerolinea, num_angar_aeropuerto_aerolinea, fk_id_aeropuerto, fk_id_aerolinea) values
(100, 7, 1, 1),
(101, 4, 2, 2),
(102, 6, 4, 2),
(103, 2, 3, 1),
(104, 3, 2, 3);

insert into vuelo (id_vuelo, origen_vuelo, destino_vuelo, fecha_salida_vuelo, fecha_llegada_vuelo, fk_id_aerolinea, fk_id_avion) values
(1, "BOGOTA", "MEXICO", '2021-11-27 01:30:00', '2021-12-27 04:00:00', 1, 1),
(2, "BUCARAMANGA", "MIAMI", '2021-10-02 04:30:00', '2021-11-02 06:25:00', 2, 3),
(3, "ARMENIA", "BOGOTA", '2021-05-07 00:30:00', '2021-05-07 04:00:00', 3, 1),
(4, "ARMENIA", "MEDELLIN", '2021-04-07 00:30:00', '2021-04-07 06:00:00', 3, 1),
(5, "BOGOTA", "PARIS", '2021-03-08 00:30:00', '2021-03-09 05:00:00', 1, 3);

insert into persona (id_persona, nombre_persona, apellido_persona, correo_persona, fk_id_tipodocumento) values
(1, 'JUAN', 'ORTIZ', 'juan@gmail.com', 1), # piloto
(2, 'JOSE', 'PLAZA', 'jose@gmail.com', 3), # azafata
(3, 'SATURDINA', 'MOLINA', 'saturdina@gmail.com', 2), # pasajero
(4, 'JAIMITO', 'RODRIGUEZ', 'jaimito@gmail.com', 1), # piloto
(5, 'ADRIAN', 'ESCUDERO', 'adrian@gmail.com', 3), # azafata
(6, 'PABLO', 'LOPEZ', 'pablo@gmail.com', 1), # pasajero
(9965,'XIOMARA', 'GUTIERREZ','xio@gmail.com', 2), # pasajero
(55,'DAVID', 'CALDERON','david-cal@gmail.com', 3), # piloto
(3849,'MAICOL', 'PARRA','maicol@yahoo.es', 1), # piloto
(8562,'LUISA', 'ORTIZ','luisa@gmail.com', 2), # pasajero
(389,'KATHERINE', 'GARCIA','ximena@gmail.com', 3), #azafata
(1566,'DANIELA', 'JIMENEZ','dani@gmail.com', 1), # azafata
(9547,'MACTA', 'LLEGA','macta@gmail.com', 2), # pasajero
(456,'CAMILO', 'DUQUE','camilo@gmail.com', 1), # pasajero
(123,'MARIA', 'MARTINEZ','maria@gmail.com', 2), # piloto
(556,'JUAN', 'CORTEZ','juan@gmail.com', 1); # azafata

insert into celular (id_celular, numero_celular, fk_id_persona) values
(1, 58441437850, 556),
(2, 26522627601, 123),
(3, 45096864127, 456),
(4, 11141404463, 9547),
(5, 29310549633, 1566),
(6, 38485270201, 389),
(7, 29636235929, 8562),
(8, 62041678874, 3849),
(9, 68057351636, 55),
(10, 78112468812, 9965),
(11, 72071598715, 6),
(12, 80177394774, 5),
(13, 41596218488, 4),
(14, 50433356329, 3),
(15, 98491331882, 2),
(16, 97404620027, 1);

insert into pasajero (id_pasajero, motivo_pasajero, fk_id_persona) values
(1, 'TURISMO', 3),
(2, 'NEGOCIOS', 6),
(3, 'ESTUDIOS', 9965),
(4, 'PLACER', 8562),
(5, 'SALUD', 9547),
(6, 'DEPORTES', 456);

insert into ticket (id_ticket, precio_ticket, puesto_ticket, fk_id_pasajero, fk_id_vuelo, fk_id_clasepuesto) values
(1, 50000, 14, 6, 1, 5),
(2, 40000, 12, 5, 2, 4),
(3, 34567, 4, 4, 3, 3),
(4, 45465, 6, 3, 4, 2),
(5, 566456, 7, 2, 5, 1),
(6, 10000, 9, 1, 1, 5);

insert into categoria (id_categoria, nombre_categoria) values
(1, 'BODEGA'),
(2, 'EXPECIAL'),
(3, 'DE MANO');

insert into equipaje (id_equipaje, peso_equipaje, fk_id_pasajero, fk_id_categoria) values
(1, 12, 6, 1),
(2, 4, 5, 2),
(3, 56, 4, 3),
(4, 20, 3, 3),
(5, 2, 2, 2),
(6, 6, 1, 1);

insert into azafata (id_azafata, experiencia_azafata, estado_azafata, fk_id_persona) values
(1, 10, 'ACTIVO', 2),
(2, 4, 'ACTIVO', 5),
(3, 2, 'ACTIVO', 389),
(4, 1, 'ACTIVO', 1566),
(5, 6, 'ACTIVO', 556);

insert into vuelo_azafata (fk_id_vuelo, fk_id_azafata, novedades_vuelo_azafata) values
(5, 1, null),
(4, 2, null),
(3, 3, null),
(2, 4, null),
(1, 5, null);

insert into piloto (id_piloto, horas_vuelo_piloto, estado_piloto, fk_id_persona) values
(1, 1, 'ACTIVO', 1),
(2, 500, 'ACTIVO', 4),
(3, 156, 'ACTIVO', 55),
(4, 900, 'ACTIVO', 3849),
(5, 854, 'ACTIVO', 123);

insert into vuelo_piloto (fk_id_vuelo, fk_id_piloto, novedades_vuelo_piloto) values
(1, 5, null),
(2, 4, null),
(3, 3, null),
(4, 2, null),
(5, 1, null);

insert into azafata_idioma (fk_id_azafata, fk_id_idioma, nivel_azafata_idioma) values
(1, 1, 'ALTO'),
(1, 2, 'ALTO'),
(2, 5, 'BASICO'),
(2, 6, 'ALTO'),
(3, 8, 'BASICO'),
(3, 4, 'BASICO'),
(4, 3, 'INTERMEDIO'),
(4, 2, 'ALTO'),
(5, 1, 'INTERMEDIO'),
(5, 7, 'BASICO');

insert into piloto_idioma (fk_id_piloto, fk_id_idioma, nivel_piloto_idioma) values
(5, 1, 'ALTO'),
(5, 2, 'ALTO'),
(4, 5, 'BASICO'),
(4, 6, 'ALTO'),
(3, 8, 'BASICO'),
(3, 4, 'BASICO'),
(2, 3, 'INTERMEDIO'),
(2, 2, 'ALTO'),
(1, 1, 'INTERMEDIO'),
(1, 7, 'BASICO');

insert into categoria values (7,'vip');
UPDATE VUELO_AZAFATA SET novedades_vuelo_azafata='SUFRE DE VERTIGO' WHERE FK_ID_VUELO=1;
insert into celular values (17, 32123, 1), (18, 21323, 1);

create user supervisor with password 'supervisor';
grant select, insert, update, delete on avion to supervisor;
grant insert, select, update on aerolinea, vuelo to supervisor;
grant insert, select on ticket to supervisor;
grant select on piloto,azafata to supervisor;

create user cliente with password 'cliente';
grant insert, select, update on ticket to cliente;
grant select on vuelo,aerolinea,avion to cliente;
grant insert,select,update,delete on piloto, azafata to cliente;