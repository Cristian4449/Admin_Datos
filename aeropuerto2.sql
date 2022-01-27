--
-- Generated from mysql2pgsql.perl
-- http://gborg.postgresql.org/project/mysql2psql/
-- (c) 2001 - 2007 Jose M. Duarte, Joseph Speigle
--

-- warnings are printed for drop tables if they do not exist
-- please see http://archives.postgresql.org/pgsql-novice/2004-10/msg00158.php

-- ##############################################################
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: aeropuerto
-- ------------------------------------------------------
-- Server version	8.0.27


--
-- Table structure for table aerolinea
--

CREATE TABLE  "aerolinea" (
   "id_aerolinea" int CHECK ("id_aerolinea" >= 0) NOT NULL,
   "nombre_aerolinea"   varchar(45) NOT NULL, 
   primary key ("id_aerolinea")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE aerolinea DISABLE KEYS */;

--
-- Dumping data for table aerolinea
--

INSERT INTO "aerolinea" VALUES (1,E'AVIANCA'),(2,E'SATENA'),(3,E'WINGO'); 
/*!40000 ALTER TABLE aerolinea ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table aeropuerto
--

CREATE TABLE  "aeropuerto" (
   "id_aeropuerto" int CHECK ("id_aeropuerto" >= 0) NOT NULL,
   "nombre_aeropuerto"   varchar(45) NOT NULL, 
   "fk_id_ubicacion" int CHECK ("fk_id_ubicacion" >= 0) NOT NULL,
   primary key ("id_aeropuerto")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE aeropuerto DISABLE KEYS */;

--
-- Dumping data for table aeropuerto
--

INSERT INTO "aeropuerto" VALUES (1,E'EL DORADO',1),(2,E'PALONEGRO',2),(3,E'EL EDEN',3),(4,E'PILOTO CIEGO',1); 
/*!40000 ALTER TABLE aeropuerto ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table aeropuerto_aerolinea
--

CREATE TABLE  "aeropuerto_aerolinea" (
   "num_local_aeropuerto_aerolinea" int CHECK ("num_local_aeropuerto_aerolinea" >= 0) NOT NULL,
   "num_angar_aeropuerto_aerolinea" int CHECK ("num_angar_aeropuerto_aerolinea" >= 0) NOT NULL,
   "fk_id_aeropuerto" int CHECK ("fk_id_aeropuerto" >= 0) NOT NULL,
   "fk_id_aerolinea" int CHECK ("fk_id_aerolinea" >= 0) NOT NULL,
   primary key ("fk_id_aeropuerto", "fk_id_aerolinea")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE aeropuerto_aerolinea DISABLE KEYS */;

--
-- Dumping data for table aeropuerto_aerolinea
--

INSERT INTO "aeropuerto_aerolinea" VALUES (100,7,1,1),(101,4,2,2),(104,3,2,3),(103,2,3,1),(102,6,4,2); 
/*!40000 ALTER TABLE aeropuerto_aerolinea ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table avion
--

CREATE TABLE  "avion" (
   "id_avion" int CHECK ("id_avion" >= 0) NOT NULL,
   "nombre_avion"   varchar(45) NOT NULL, 
   "num_puestos_avion" int CHECK ("num_puestos_avion" >= 0) NOT NULL,
   primary key ("id_avion")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE avion DISABLE KEYS */;

--
-- Dumping data for table avion
--

INSERT INTO "avion" VALUES (1,E'FANTASMA',45),(2,E'EL ULTIMO',30),(3,E'AQUI FUE',50); 
/*!40000 ALTER TABLE avion ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table azafata
--

CREATE TABLE  "azafata" (
   "id_azafata" int CHECK ("id_azafata" >= 0) NOT NULL,
   "experiencia_azafata" int CHECK ("experiencia_azafata" >= 0) NOT NULL,
   "estado_azafata"   varchar(45) NOT NULL, 
   "fk_id_persona" int CHECK ("fk_id_persona" >= 0) NOT NULL,
   primary key ("id_azafata")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE azafata DISABLE KEYS */;

--
-- Dumping data for table azafata
--

INSERT INTO "azafata" VALUES (1,10,E'ACTIVO',2),(2,4,E'ACTIVO',5),(3,2,E'ACTIVO',389),(4,1,E'ACTIVO',1566),(5,6,E'ACTIVO',556); 
/*!40000 ALTER TABLE azafata ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table azafata_idioma
--

CREATE TABLE  "azafata_idioma" (
   "fk_id_azafata" int CHECK ("fk_id_azafata" >= 0) NOT NULL,
   "fk_id_idioma" int CHECK ("fk_id_idioma" >= 0) NOT NULL,
   "nivel_azafata_idioma"   varchar(45) NOT NULL, 
   primary key ("fk_id_azafata", "fk_id_idioma")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE azafata_idioma DISABLE KEYS */;

--
-- Dumping data for table azafata_idioma
--

INSERT INTO "azafata_idioma" VALUES (1,1,E'ALTO'),(1,2,E'ALTO'),(2,5,E'BASICO'),(2,6,E'ALTO'),(3,4,E'BASICO'),(3,8,E'BASICO'),(4,2,E'ALTO'),(4,3,E'INTERMEDIO'),(5,1,E'INTERMEDIO'),(5,7,E'BASICO'); 
/*!40000 ALTER TABLE azafata_idioma ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table categoria
--

CREATE TABLE  "categoria" (
   "id_categoria" int CHECK ("id_categoria" >= 0) NOT NULL,
   "nombre_categoria"   varchar(45) NOT NULL, 
   primary key ("id_categoria")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE categoria DISABLE KEYS */;

--
-- Dumping data for table categoria
--

INSERT INTO "categoria" VALUES (1,E'BODEGA'),(2,E'EXPECIAL'),(3,E'DE MANO'),(7,E'VIP'); 
/*!40000 ALTER TABLE categoria ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table celular
--

CREATE TABLE  "celular" (
   "id_celular" int CHECK ("id_celular" >= 0) NOT NULL,
   "numero_celular" bigint CHECK ("numero_celular" >= 0) NOT NULL,
   "fk_id_persona" int CHECK ("fk_id_persona" >= 0) NOT NULL,
   primary key ("id_celular")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE celular DISABLE KEYS */;

--
-- Dumping data for table celular
--

INSERT INTO "celular" VALUES (1,58441437850,556),(2,26522627601,123),(3,45096864127,456),(4,11141404463,9547),(5,29310549633,1566),(6,38485270201,389),(7,29636235929,8562),(8,62041678874,3849),(9,68057351636,55),(10,78112468812,9965),(11,72071598715,6),(12,80177394774,5),(13,41596218488,4),(14,50433356329,3),(15,98491331882,2),(16,97404620027,1),(17,32123,1),(18,21323,1); 
/*!40000 ALTER TABLE celular ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table clasepuesto
--

CREATE TABLE  "clasepuesto" (
   "id_clasepuesto" int CHECK ("id_clasepuesto" >= 0) NOT NULL,
   "nombre_clasepuesto"   varchar(45) NOT NULL, 
   primary key ("id_clasepuesto")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE clasepuesto DISABLE KEYS */;

--
-- Dumping data for table clasepuesto
--

INSERT INTO "clasepuesto" VALUES (1,E'TURISTA'),(2,E'EJECUTIVA'),(3,E'PRIMERA'),(4,E'POBRE'),(5,E'VAGABUNDO'); 
/*!40000 ALTER TABLE clasepuesto ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table equipaje
--

CREATE TABLE  "equipaje" (
   "id_equipaje" int CHECK ("id_equipaje" >= 0) NOT NULL,
   "peso_equipaje" int CHECK ("peso_equipaje" >= 0) NOT NULL,
   "fk_id_pasajero" int CHECK ("fk_id_pasajero" >= 0) NOT NULL,
   "fk_id_categoria" int CHECK ("fk_id_categoria" >= 0) NOT NULL,
   primary key ("id_equipaje")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE equipaje DISABLE KEYS */;

--
-- Dumping data for table equipaje
--

INSERT INTO "equipaje" VALUES (1,12,6,1),(2,4,5,2),(3,56,4,3),(4,20,3,3),(5,2,2,2),(6,6,1,1); 
/*!40000 ALTER TABLE equipaje ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table idioma
--

CREATE TABLE  "idioma" (
   "id_idioma" int CHECK ("id_idioma" >= 0) NOT NULL,
   "nombre_idioma"   varchar(45) NOT NULL, 
   primary key ("id_idioma")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE idioma DISABLE KEYS */;

--
-- Dumping data for table idioma
--

INSERT INTO "idioma" VALUES (1,E'INGLES'),(2,E'ESPAÑOL'),(3,E'ITALIANO'),(4,E'FRANCES'),(5,E'RUSO'),(6,E'JAPONES'),(7,E'CHINO'),(8,E'ALEMAN'); 
/*!40000 ALTER TABLE idioma ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table pasajero
--

CREATE TABLE  "pasajero" (
   "id_pasajero" int CHECK ("id_pasajero" >= 0) NOT NULL,
   "motivo_pasajero"   varchar(45) NOT NULL, 
   "fk_id_persona" int CHECK ("fk_id_persona" >= 0) NOT NULL,
   primary key ("id_pasajero")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE pasajero DISABLE KEYS */;

--
-- Dumping data for table pasajero
--

INSERT INTO "pasajero" VALUES (1,E'TURISMO',3),(2,E'NEGOCIOS',6),(3,E'ESTUDIOS',9965),(4,E'PLACER',8562),(5,E'SALUD',9547),(6,E'DEPORTES',456); 
/*!40000 ALTER TABLE pasajero ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table persona
--

CREATE TABLE  "persona" (
   "id_persona" int CHECK ("id_persona" >= 0) NOT NULL,
   "nombre_persona"   varchar(45) NOT NULL, 
   "apellido_persona"   varchar(45) NOT NULL, 
   "correo_persona"   varchar(45) NOT NULL, 
   "fk_id_tipodocumento" int CHECK ("fk_id_tipodocumento" >= 0) NOT NULL,
   primary key ("id_persona")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE persona DISABLE KEYS */;

--
-- Dumping data for table persona
--

INSERT INTO "persona" VALUES (1,E'JUAN',E'ORTIZ',E'juan@gmail.com',1),(2,E'JOSE',E'PLAZA',E'jose@gmail.com',3),(3,E'SATURDINA',E'MOLINA',E'saturdina@gmail.com',2),(4,E'JAIMITO',E'RODRIGUEZ',E'jaimito@gmail.com',1),(5,E'ADRIAN',E'ESCUDERO',E'adrian@gmail.com',3),(6,E'PABLO',E'LOPEZ',E'pablo@gmail.com',1),(55,E'DAVID',E'CALDERON',E'david-cal@gmail.com',3),(123,E'MARIA',E'MARTINEZ',E'maria@gmail.com',2),(389,E'KATHERINE',E'GARCIA',E'ximena@gmail.com',3),(456,E'CAMILO',E'DUQUE',E'camilo@gmail.com',1),(556,E'JUAN',E'CORTEZ',E'juan@gmail.com',1),(1566,E'DANIELA',E'JIMENEZ',E'dani@gmail.com',1),(3849,E'MAICOL',E'PARRA',E'maicol@yahoo.es',1),(8562,E'LUISA',E'ORTIZ',E'luisa@gmail.com',2),(9547,E'MACTA',E'LLEGA',E'macta@gmail.com',2),(9965,E'XIOMARA',E'GUTIERREZ',E'xio@gmail.com',2); 
/*!40000 ALTER TABLE persona ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table piloto
--

CREATE TABLE  "piloto" (
   "id_piloto" int CHECK ("id_piloto" >= 0) NOT NULL,
   "horas_vuelo_piloto" int CHECK ("horas_vuelo_piloto" >= 0) NOT NULL,
   "estado_piloto"   varchar(45) NOT NULL, 
   "fk_id_persona" int CHECK ("fk_id_persona" >= 0) NOT NULL,
   primary key ("id_piloto")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE piloto DISABLE KEYS */;

--
-- Dumping data for table piloto
--

INSERT INTO "piloto" VALUES (1,1,E'ACTIVO',1),(2,500,E'ACTIVO',4),(3,156,E'ACTIVO',55),(4,900,E'ACTIVO',3849),(5,854,E'ACTIVO',123); 
/*!40000 ALTER TABLE piloto ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table piloto_idioma
--

CREATE TABLE  "piloto_idioma" (
   "fk_id_piloto" int CHECK ("fk_id_piloto" >= 0) NOT NULL,
   "fk_id_idioma" int CHECK ("fk_id_idioma" >= 0) NOT NULL,
   "nivel_piloto_idioma"   varchar(45) NOT NULL, 
   primary key ("fk_id_piloto", "fk_id_idioma")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE piloto_idioma DISABLE KEYS */;

--
-- Dumping data for table piloto_idioma
--

INSERT INTO "piloto_idioma" VALUES (1,1,E'INTERMEDIO'),(1,7,E'BASICO'),(2,2,E'ALTO'),(2,3,E'INTERMEDIO'),(3,4,E'BASICO'),(3,8,E'BASICO'),(4,5,E'BASICO'),(4,6,E'ALTO'),(5,1,E'ALTO'),(5,2,E'ALTO'); 
/*!40000 ALTER TABLE piloto_idioma ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table ticket
--

CREATE TABLE  "ticket" (
   "id_ticket" int CHECK ("id_ticket" >= 0) NOT NULL,
   "precio_ticket" int CHECK ("precio_ticket" >= 0) NOT NULL,
   "puesto_ticket" int CHECK ("puesto_ticket" >= 0) NOT NULL,
   "fk_id_pasajero" int CHECK ("fk_id_pasajero" >= 0) NOT NULL,
   "fk_id_vuelo" int CHECK ("fk_id_vuelo" >= 0) NOT NULL,
   "fk_id_clasepuesto" int CHECK ("fk_id_clasepuesto" >= 0) NOT NULL,
   primary key ("id_ticket")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE ticket DISABLE KEYS */;

--
-- Dumping data for table ticket
--

INSERT INTO "ticket" VALUES (1,50000,14,6,1,5),(2,40000,12,5,2,4),(3,34567,4,4,3,3),(4,45465,6,3,4,2),(5,566456,7,2,5,1),(6,10000,9,1,1,5); 
/*!40000 ALTER TABLE ticket ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table tipodocumento
--

CREATE TABLE  "tipodocumento" (
   "id_tipodocumento" int CHECK ("id_tipodocumento" >= 0) NOT NULL,
   "nombre_tipodocumento"   varchar(45) NOT NULL, 
   primary key ("id_tipodocumento")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE tipodocumento DISABLE KEYS */;

--
-- Dumping data for table tipodocumento
--

INSERT INTO "tipodocumento" VALUES (1,E'CEDULA'),(2,E'TARJETA DE IDENTIDAD'),(3,E'TARJETA DE EXTRANJERIA'); 
/*!40000 ALTER TABLE tipodocumento ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table ubicacion
--

CREATE TABLE  "ubicacion" (
   "id_ubicacion" int CHECK ("id_ubicacion" >= 0) NOT NULL,
   "nombre_ubicacion"   varchar(45) NOT NULL, 
   primary key ("id_ubicacion")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE ubicacion DISABLE KEYS */;

--
-- Dumping data for table ubicacion
--

INSERT INTO "ubicacion" VALUES (1,E'BOGOTA'),(2,E'BUCARAMANGA'),(3,E'ARMENIA'); 
/*!40000 ALTER TABLE ubicacion ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table vuelo
--

CREATE TABLE  "vuelo" (
   "id_vuelo" int CHECK ("id_vuelo" >= 0) NOT NULL,
   "origen_vuelo"   varchar(45) NOT NULL, 
   "destino_vuelo"   varchar(45) NOT NULL, 
   "fecha_salida_vuelo"   timestamp NOT NULL, 
   "fecha_llegada_vuelo"   timestamp NOT NULL, 
   "fk_id_aerolinea" int CHECK ("fk_id_aerolinea" >= 0) NOT NULL,
   "fk_id_avion" int CHECK ("fk_id_avion" >= 0) NOT NULL,
   primary key ("id_vuelo")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE vuelo DISABLE KEYS */;

--
-- Dumping data for table vuelo
--

INSERT INTO "vuelo" VALUES (1,E'BOGOTA',E'MEXICO',E'2021-11-27 06:30:00',E'2021-12-27 09:00:00',1,1),(2,E'BUCARAMANGA',E'MIAMI',E'2021-10-02 09:30:00',E'2021-11-02 11:25:00',2,3),(3,E'ARMENIA',E'BOGOTA',E'2021-05-07 05:30:00',E'2021-05-07 09:00:00',3,1),(4,E'ARMENIA',E'MEDELLIN',E'2021-04-07 05:30:00',E'2021-04-07 11:00:00',3,1),(5,E'BOGOTA',E'PARIS',E'2021-03-08 05:30:00',E'2021-03-09 10:00:00',1,3); 
/*!40000 ALTER TABLE vuelo ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table vuelo_azafata
--

CREATE TABLE  "vuelo_azafata" (
   "fk_id_vuelo" int CHECK ("fk_id_vuelo" >= 0) NOT NULL,
   "fk_id_azafata" int CHECK ("fk_id_azafata" >= 0) NOT NULL,
   "novedades_vuelo_azafata"   varchar(45) DEFAULT NULL, 
   primary key ("fk_id_vuelo", "fk_id_azafata")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE vuelo_azafata DISABLE KEYS */;

--
-- Dumping data for table vuelo_azafata
--

INSERT INTO "vuelo_azafata" VALUES (1,5,E'SUFRE DE VERTIGO'),(2,4,NULL),(3,3,NULL),(4,2,NULL),(5,1,NULL); 
/*!40000 ALTER TABLE vuelo_azafata ENABLE KEYS */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

--
-- Table structure for table vuelo_piloto
--

CREATE TABLE  "vuelo_piloto" (
   "fk_id_vuelo" int CHECK ("fk_id_vuelo" >= 0) NOT NULL,
   "fk_id_piloto" int CHECK ("fk_id_piloto" >= 0) NOT NULL,
   "novedades_vuelo_piloto"   varchar(45) DEFAULT NULL, 
   primary key ("fk_id_vuelo", "fk_id_piloto")
)   ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40000 ALTER TABLE vuelo_piloto DISABLE KEYS */;

--
-- Dumping data for table vuelo_piloto
--

INSERT INTO "vuelo_piloto" VALUES (1,5,NULL),(2,4,NULL),(3,3,NULL),(4,2,NULL),(5,1,NULL); 
/*!40000 ALTER TABLE vuelo_piloto ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
CREATE INDEX "aeropuerto_fk_id_ubicacion_idx" ON "aeropuerto" USING btree ("fk_id_ubicacion");
ALTER TABLE "aeropuerto" ADD FOREIGN KEY ("fk_id_ubicacion") REFERENCES "ubicacion" ("id_ubicacion");
CREATE INDEX "aeropuerto_aerolinea_fk_id_aerolinea_idx" ON "aeropuerto_aerolinea" USING btree ("fk_id_aerolinea");
ALTER TABLE "aeropuerto_aerolinea" ADD FOREIGN KEY ("fk_id_aerolinea") REFERENCES "aerolinea" ("id_aerolinea");
ALTER TABLE "aeropuerto_aerolinea" ADD FOREIGN KEY ("fk_id_aeropuerto") REFERENCES "aeropuerto" ("id_aeropuerto");
CREATE INDEX "azafata_fk_id_persona_idx" ON "azafata" USING btree ("fk_id_persona");
ALTER TABLE "azafata" ADD FOREIGN KEY ("fk_id_persona") REFERENCES "persona" ("id_persona");
CREATE INDEX "azafata_idioma_fk_id_idioma_idx" ON "azafata_idioma" USING btree ("fk_id_idioma");
ALTER TABLE "azafata_idioma" ADD FOREIGN KEY ("fk_id_azafata") REFERENCES "azafata" ("id_azafata");
ALTER TABLE "azafata_idioma" ADD FOREIGN KEY ("fk_id_idioma") REFERENCES "idioma" ("id_idioma");
CREATE INDEX "celular_fk_id_persona_idx" ON "celular" USING btree ("fk_id_persona");
ALTER TABLE "celular" ADD FOREIGN KEY ("fk_id_persona") REFERENCES "persona" ("id_persona");
CREATE INDEX "equipaje_fk_id_pasajero_idx" ON "equipaje" USING btree ("fk_id_pasajero");
CREATE INDEX "equipaje_fk_id_categoria_idx" ON "equipaje" USING btree ("fk_id_categoria");
ALTER TABLE "equipaje" ADD FOREIGN KEY ("fk_id_categoria") REFERENCES "categoria" ("id_categoria");
ALTER TABLE "equipaje" ADD FOREIGN KEY ("fk_id_pasajero") REFERENCES "pasajero" ("id_pasajero");
CREATE INDEX "pasajero_fk_id_persona_idx" ON "pasajero" USING btree ("fk_id_persona");
ALTER TABLE "pasajero" ADD FOREIGN KEY ("fk_id_persona") REFERENCES "persona" ("id_persona");
CREATE INDEX "persona_fk_id_tipodocumento_idx" ON "persona" USING btree ("fk_id_tipodocumento");
ALTER TABLE "persona" ADD FOREIGN KEY ("fk_id_tipodocumento") REFERENCES "tipodocumento" ("id_tipodocumento");
CREATE INDEX "piloto_fk_id_persona_idx" ON "piloto" USING btree ("fk_id_persona");
ALTER TABLE "piloto" ADD FOREIGN KEY ("fk_id_persona") REFERENCES "persona" ("id_persona");
CREATE INDEX "piloto_idioma_fk_id_idioma_idx" ON "piloto_idioma" USING btree ("fk_id_idioma");
ALTER TABLE "piloto_idioma" ADD FOREIGN KEY ("fk_id_idioma") REFERENCES "idioma" ("id_idioma");
ALTER TABLE "piloto_idioma" ADD FOREIGN KEY ("fk_id_piloto") REFERENCES "piloto" ("id_piloto");
CREATE INDEX "ticket_fk_id_pasajero_idx" ON "ticket" USING btree ("fk_id_pasajero");
CREATE INDEX "ticket_fk_id_vuelo_idx" ON "ticket" USING btree ("fk_id_vuelo");
CREATE INDEX "ticket_fk_id_clasepuesto_idx" ON "ticket" USING btree ("fk_id_clasepuesto");
ALTER TABLE "ticket" ADD FOREIGN KEY ("fk_id_clasepuesto") REFERENCES "clasepuesto" ("id_clasepuesto");
ALTER TABLE "ticket" ADD FOREIGN KEY ("fk_id_pasajero") REFERENCES "pasajero" ("id_pasajero");
ALTER TABLE "ticket" ADD FOREIGN KEY ("fk_id_vuelo") REFERENCES "vuelo" ("id_vuelo");
CREATE INDEX "vuelo_fk_id_aerolinea_idx" ON "vuelo" USING btree ("fk_id_aerolinea");
CREATE INDEX "vuelo_fk_id_avion_idx" ON "vuelo" USING btree ("fk_id_avion");
ALTER TABLE "vuelo" ADD FOREIGN KEY ("fk_id_aerolinea") REFERENCES "aerolinea" ("id_aerolinea");
ALTER TABLE "vuelo" ADD FOREIGN KEY ("fk_id_avion") REFERENCES "avion" ("id_avion");
CREATE INDEX "vuelo_azafata_fk_id_azafata_idx" ON "vuelo_azafata" USING btree ("fk_id_azafata");
ALTER TABLE "vuelo_azafata" ADD FOREIGN KEY ("fk_id_azafata") REFERENCES "azafata" ("id_azafata");
ALTER TABLE "vuelo_azafata" ADD FOREIGN KEY ("fk_id_vuelo") REFERENCES "vuelo" ("id_vuelo");
CREATE INDEX "vuelo_piloto_fk_id_piloto_idx" ON "vuelo_piloto" USING btree ("fk_id_piloto");
ALTER TABLE "vuelo_piloto" ADD FOREIGN KEY ("fk_id_piloto") REFERENCES "piloto" ("id_piloto");
ALTER TABLE "vuelo_piloto" ADD FOREIGN KEY ("fk_id_vuelo") REFERENCES "vuelo" ("id_vuelo");
