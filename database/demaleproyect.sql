CREATE DATABASE  IF NOT EXISTS `demaleproyect` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demaleproyect`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: demaleproyect
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IdCliente` int NOT NULL,
  `IdTipoCliente` int NOT NULL,
  `FechaRegistro` date NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdCliente`),
  KEY `fk_clientes_tipoCliente` (`IdTipoCliente`),
  CONSTRAINT `fk_clientes_persona` FOREIGN KEY (`IdCliente`) REFERENCES `persona` (`IdPersona`),
  CONSTRAINT `fk_clientes_tipoCliente` FOREIGN KEY (`IdTipoCliente`) REFERENCES `tipocliente` (`IdTipoCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,1,'2025-06-25',1),(48,1,'2025-07-10',1),(51,1,'2026-06-08',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductor`
--

DROP TABLE IF EXISTS `conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductor` (
  `IdConductor` int NOT NULL,
  `Licencia` varchar(20) NOT NULL,
  `IdRol` int NOT NULL,
  PRIMARY KEY (`IdConductor`),
  UNIQUE KEY `Licencia` (`Licencia`),
  KEY `fk_conductor_rol` (`IdRol`),
  CONSTRAINT `fk_conductor_persona` FOREIGN KEY (`IdConductor`) REFERENCES `persona` (`IdPersona`),
  CONSTRAINT `fk_conductor_rol` FOREIGN KEY (`IdRol`) REFERENCES `roles` (`IdRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor`
--

LOCK TABLES `conductor` WRITE;
/*!40000 ALTER TABLE `conductor` DISABLE KEYS */;
INSERT INTO `conductor` VALUES (51,'LIC000051',3);
/*!40000 ALTER TABLE `conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `IdDepartamento` int NOT NULL AUTO_INCREMENT,
  `Departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`IdDepartamento`),
  UNIQUE KEY `Departamento` (`Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Lima');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleenvios`
--

DROP TABLE IF EXISTS `detalleenvios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleenvios` (
  `IdEnvio` int NOT NULL,
  `IdProducto` int NOT NULL,
  PRIMARY KEY (`IdEnvio`,`IdProducto`),
  KEY `IdProducto` (`IdProducto`),
  CONSTRAINT `detalleenvios_ibfk_1` FOREIGN KEY (`IdEnvio`) REFERENCES `envios` (`IdEnvio`),
  CONSTRAINT `detalleenvios_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleenvios`
--

LOCK TABLES `detalleenvios` WRITE;
/*!40000 ALTER TABLE `detalleenvios` DISABLE KEYS */;
INSERT INTO `detalleenvios` VALUES (3,8);
/*!40000 ALTER TABLE `detalleenvios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distrito` (
  `IdDistrito` int NOT NULL AUTO_INCREMENT,
  `Distrito` varchar(100) NOT NULL,
  `IdProvincia` int NOT NULL,
  PRIMARY KEY (`IdDistrito`),
  KEY `fk_distrito_provincia` (`IdProvincia`),
  CONSTRAINT `fk_distrito_provincia` FOREIGN KEY (`IdProvincia`) REFERENCES `provincia` (`IdProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'Lima',1);
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `IdEnvio` int NOT NULL AUTO_INCREMENT,
  `IdConductor` int NOT NULL,
  `IdVehiculo` int NOT NULL,
  `IdRuta` int NOT NULL,
  `IdEstadoEnvio` int NOT NULL,
  `FechSalida` date NOT NULL,
  `FechLlegada` date DEFAULT NULL,
  `Observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdEnvio`),
  KEY `fk_envio_chofer` (`IdConductor`),
  KEY `fk_envio_vehiculo` (`IdVehiculo`),
  KEY `fk_envio_ruta` (`IdRuta`),
  KEY `fk_envio_estados` (`IdEstadoEnvio`),
  CONSTRAINT `fk_envio_chofer` FOREIGN KEY (`IdConductor`) REFERENCES `conductor` (`IdConductor`),
  CONSTRAINT `fk_envio_estados` FOREIGN KEY (`IdEstadoEnvio`) REFERENCES `estadosenvio` (`IdEstadoEnvio`),
  CONSTRAINT `fk_envio_ruta` FOREIGN KEY (`IdRuta`) REFERENCES `rutas` (`IdRuta`),
  CONSTRAINT `fk_envio_vehiculo` FOREIGN KEY (`IdVehiculo`) REFERENCES `vehiculos` (`IdVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (3,51,1,1,2,'2026-06-02',NULL,'PRUEBA FINAL');
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosenvio`
--

DROP TABLE IF EXISTS `estadosenvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosenvio` (
  `IdEstadoEnvio` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`IdEstadoEnvio`),
  UNIQUE KEY `Estado` (`Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosenvio`
--

LOCK TABLES `estadosenvio` WRITE;
/*!40000 ALTER TABLE `estadosenvio` DISABLE KEYS */;
INSERT INTO `estadosenvio` VALUES (1,'En Almacén'),(2,'En transito'),(3,'Entregado'),(4,'Temporal');
/*!40000 ALTER TABLE `estadosenvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_puntos_descanso`
--

DROP TABLE IF EXISTS `historial_puntos_descanso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_puntos_descanso` (
  `IdHistorialDescanso` int NOT NULL AUTO_INCREMENT,
  `IdEnvio` int NOT NULL,
  `IdPuntoDescanso` int NOT NULL,
  `FechaHoraRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdHistorialDescanso`),
  KEY `IdEnvio` (`IdEnvio`),
  KEY `IdPuntoDescanso` (`IdPuntoDescanso`),
  CONSTRAINT `historial_puntos_descanso_ibfk_1` FOREIGN KEY (`IdEnvio`) REFERENCES `envios` (`IdEnvio`),
  CONSTRAINT `historial_puntos_descanso_ibfk_2` FOREIGN KEY (`IdPuntoDescanso`) REFERENCES `puntosdescanso` (`IdPuntoDescanso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_puntos_descanso`
--

LOCK TABLES `historial_puntos_descanso` WRITE;
/*!40000 ALTER TABLE `historial_puntos_descanso` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_puntos_descanso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `IdPersona` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `IdDistrito` int DEFAULT NULL,
  `IdTipoDoc` int NOT NULL,
  `DocIdentidad` varchar(255) NOT NULL,
  `IdTipoVia` int DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `NMunicipal` varchar(50) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `RazonSocial` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`),
  UNIQUE KEY `DocIdentidad` (`DocIdentidad`),
  UNIQUE KEY `Correo` (`Correo`),
  KEY `fk_persona_distrito` (`IdDistrito`),
  KEY `fk_persona_tipoDoc` (`IdTipoDoc`),
  KEY `fk_persona_tipoVia` (`IdTipoVia`),
  CONSTRAINT `fk_persona_distrito` FOREIGN KEY (`IdDistrito`) REFERENCES `distrito` (`IdDistrito`),
  CONSTRAINT `fk_persona_tipoDoc` FOREIGN KEY (`IdTipoDoc`) REFERENCES `tipodoc` (`IdTipoDoc`),
  CONSTRAINT `fk_persona_tipoVia` FOREIGN KEY (`IdTipoVia`) REFERENCES `tipovia` (`IdTipoVia`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (3,'Juan','Pérez',NULL,1,'12345678',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Carlos','CONDE',1,1,'87654321',1,NULL,NULL,'12412123','asdas@gmail.com',NULL),(13,'Ana','López',1,1,'88888888',NULL,'Av. Prueba 123',NULL,'987654321','ana.lopez@email.com',NULL),(42,'Messi','asad',1,1,'87162123',1,'jiron',NULL,'412412312','jxjotit@gmail.co',''),(48,'Joaquin Ricardo','Conde Espiritu',1,1,'75386804',1,'Jiron Marcara 4951',NULL,'+51990878353','joaquin.05.02.2005@gmail.com',NULL),(49,'Alonsod','Messid',1,1,'512321212',1,'1232fasd','12334','51231212','jack@das1',NULL),(50,'Romeo','Santos',1,1,'51232124',1,'1232fasd4','123343','512312121','jack@das1da',NULL),(51,'Joaqui','Conde Espirit',1,1,'62151215',1,'Jiron Marcara 4951 Urb . Parque Naranja',NULL,'99087835','joaquin.05.02.2005@gmail.co',NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_movements`
--

DROP TABLE IF EXISTS `product_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_movements` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `collection_point` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `entry_date` datetime(6) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `vehicle_plate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_movements`
--

LOCK TABLES `product_movements` WRITE;
/*!40000 ALTER TABLE `product_movements` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `IdProducto` int NOT NULL AUTO_INCREMENT,
  `Producto` varchar(50) NOT NULL,
  `Alto` decimal(10,2) NOT NULL,
  `Ancho` decimal(10,2) NOT NULL,
  `Largo` decimal(10,2) NOT NULL,
  `Peso` decimal(10,2) NOT NULL,
  `FechIngreso` date NOT NULL,
  `FechLlegada` date DEFAULT NULL,
  `IdPuntoAcopio` int NOT NULL,
  `IdTipoProducto` int NOT NULL,
  `IdCliente` int NOT NULL,
  `IdEstadoEnvio` int NOT NULL,
  `IdDistrito` int NOT NULL,
  `guiaRemisión` tinyblob,
  `IdTrabajador` int NOT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `fk_producto_destino` (`IdDistrito`),
  KEY `fk_producto_cliente` (`IdCliente`),
  KEY `fk_producto_TipProducto` (`IdTipoProducto`),
  KEY `fk_producto_acopio` (`IdPuntoAcopio`),
  KEY `fk_producto_estado` (`IdEstadoEnvio`),
  KEY `fk_producto_trabajador` (`IdTrabajador`),
  CONSTRAINT `fk_producto_acopio` FOREIGN KEY (`IdPuntoAcopio`) REFERENCES `puntoacopio` (`IdPuntoAcopio`),
  CONSTRAINT `fk_producto_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `fk_producto_destino` FOREIGN KEY (`IdDistrito`) REFERENCES `distrito` (`IdDistrito`),
  CONSTRAINT `fk_producto_estado` FOREIGN KEY (`IdEstadoEnvio`) REFERENCES `estadosenvio` (`IdEstadoEnvio`),
  CONSTRAINT `fk_producto_TipProducto` FOREIGN KEY (`IdTipoProducto`) REFERENCES `tipoproductos` (`IdTipoProducto`),
  CONSTRAINT `fk_producto_trabajador` FOREIGN KEY (`IdTrabajador`) REFERENCES `trabajador` (`IdTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Caja de Libros',15.50,25.00,35.00,8.20,'2025-06-25',NULL,1,2,3,4,1,NULL,5),(2,'Laptop',5.00,30.00,20.00,2.50,'2025-06-25',NULL,1,1,3,4,1,NULL,5),(3,'Ropa Deportiva',10.00,25.00,15.00,1.20,'2025-06-25',NULL,2,3,3,4,1,NULL,5),(4,'Tablet',3.00,18.00,25.00,0.80,'2025-06-25',NULL,1,1,3,4,1,NULL,5),(5,'Zapatos',12.00,20.00,30.00,1.50,'2025-06-25',NULL,3,3,3,4,1,NULL,5),(6,'Caja de Libros',15.50,25.00,35.00,8.20,'2025-06-26',NULL,1,2,3,4,1,NULL,5),(7,'Caja de Libros',15.50,25.00,35.00,8.20,'2025-06-26',NULL,2,2,3,4,1,NULL,5),(8,'Caja de Libros',15.50,25.00,35.00,8.20,'2025-06-26',NULL,4,2,3,2,1,NULL,5),(9,'compu',12.00,21.00,412.00,12.00,'2026-06-06',NULL,3,2,48,1,1,NULL,49),(10,'Laptop',6.00,23.00,10.00,5.00,'2025-07-11',NULL,2,2,48,2,1,NULL,49),(13,'fasf',15.00,14.00,25.00,154.00,'2026-06-08',NULL,1,2,48,2,1,NULL,49),(14,'asd',25.00,12.00,25.00,15.00,'2026-06-08',NULL,1,3,51,1,1,NULL,50);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `IdProvincia` int NOT NULL AUTO_INCREMENT,
  `Provincia` varchar(100) NOT NULL,
  `IdDepartamento` int NOT NULL,
  PRIMARY KEY (`IdProvincia`),
  KEY `fk_provincia_departamento` (`IdDepartamento`),
  CONSTRAINT `fk_provincia_departamento` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamento` (`IdDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Lima',1);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntoacopio`
--

DROP TABLE IF EXISTS `puntoacopio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntoacopio` (
  `IdPuntoAcopio` int NOT NULL AUTO_INCREMENT,
  `NombreAcopio` varchar(100) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `NMunicipal` varchar(50) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `IdDistrito` int NOT NULL,
  PRIMARY KEY (`IdPuntoAcopio`),
  UNIQUE KEY `NombreAcopio` (`NombreAcopio`),
  KEY `fk_acopio_distrito` (`IdDistrito`),
  CONSTRAINT `fk_acopio_distrito` FOREIGN KEY (`IdDistrito`) REFERENCES `distrito` (`IdDistrito`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntoacopio`
--

LOCK TABLES `puntoacopio` WRITE;
/*!40000 ALTER TABLE `puntoacopio` DISABLE KEYS */;
INSERT INTO `puntoacopio` VALUES (1,'Lima','Dirección Lima',NULL,NULL,1),(2,'Trujillo','Dirección Trujillo',NULL,NULL,1),(3,'Arequipa','Dirección Arequipa',NULL,NULL,1),(4,'Cusco','Cusco av',' ',' ',1),(5,'Tumbes','tumbes av',' ',' ',1);
/*!40000 ALTER TABLE `puntoacopio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntosdescanso`
--

DROP TABLE IF EXISTS `puntosdescanso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntosdescanso` (
  `IdPuntoDescanso` int NOT NULL AUTO_INCREMENT,
  `PuntoDescanso` varchar(50) NOT NULL,
  `Observacion` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`IdPuntoDescanso`),
  UNIQUE KEY `PuntoDescanso` (`PuntoDescanso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntosdescanso`
--

LOCK TABLES `puntosdescanso` WRITE;
/*!40000 ALTER TABLE `puntosdescanso` DISABLE KEYS */;
INSERT INTO `puntosdescanso` VALUES (1,'Punto Lima-Ica','Punto medio autorizado entre Lima e Ica'),(2,'Punto Trujillo-Arequipa','Punto medio autorizado entre Trujillo y Arequipa'),(3,'Punto Ayacucho-Cuzco','Punto medio autorizado entre Ayacucho y Cuzco');
/*!40000 ALTER TABLE `puntosdescanso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `idRegistro` int NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`idRegistro`),
  UNIQUE KEY `correo` (`correo`),
  CONSTRAINT `fk_registro_persona` FOREIGN KEY (`idRegistro`) REFERENCES `persona` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `IdRol` int NOT NULL AUTO_INCREMENT,
  `Rol` varchar(50) NOT NULL,
  PRIMARY KEY (`IdRol`),
  UNIQUE KEY `Rol` (`Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Almacenero'),(4,'Atención al Cliente'),(3,'Conductor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutas`
--

DROP TABLE IF EXISTS `rutas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutas` (
  `IdRuta` int NOT NULL AUTO_INCREMENT,
  `SerialRuta` varchar(15) NOT NULL,
  `Ruta` varchar(50) NOT NULL,
  `Glosa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdRuta`),
  UNIQUE KEY `SerialRuta` (`SerialRuta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutas`
--

LOCK TABLES `rutas` WRITE;
/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;
INSERT INTO `rutas` VALUES (1,'R001','Lima - Cusco','Ruta principal');
/*!40000 ALTER TABLE `rutas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocliente`
--

DROP TABLE IF EXISTS `tipocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocliente` (
  `IdTipoCliente` int NOT NULL AUTO_INCREMENT,
  `TipoCliente` varchar(50) NOT NULL,
  `Glosa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdTipoCliente`),
  UNIQUE KEY `TipoCliente` (`TipoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocliente`
--

LOCK TABLES `tipocliente` WRITE;
/*!40000 ALTER TABLE `tipocliente` DISABLE KEYS */;
INSERT INTO `tipocliente` VALUES (1,'Regular',NULL);
/*!40000 ALTER TABLE `tipocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodoc`
--

DROP TABLE IF EXISTS `tipodoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodoc` (
  `IdTipoDoc` int NOT NULL AUTO_INCREMENT,
  `NombreDoc` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoDoc`),
  UNIQUE KEY `NombreDoc` (`NombreDoc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodoc`
--

LOCK TABLES `tipodoc` WRITE;
/*!40000 ALTER TABLE `tipodoc` DISABLE KEYS */;
INSERT INTO `tipodoc` VALUES (1,'DNI');
/*!40000 ALTER TABLE `tipodoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproductos`
--

DROP TABLE IF EXISTS `tipoproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoproductos` (
  `IdTipoProducto` int NOT NULL AUTO_INCREMENT,
  `TipoProducto` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoProducto`),
  UNIQUE KEY `TipoProducto` (`TipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproductos`
--

LOCK TABLES `tipoproductos` WRITE;
/*!40000 ALTER TABLE `tipoproductos` DISABLE KEYS */;
INSERT INTO `tipoproductos` VALUES (1,'Electrónica'),(2,'Libros'),(3,'Ropa');
/*!40000 ALTER TABLE `tipoproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipovia`
--

DROP TABLE IF EXISTS `tipovia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipovia` (
  `IdTipoVia` int NOT NULL AUTO_INCREMENT,
  `TipoVia` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoVia`),
  UNIQUE KEY `TipoVia` (`TipoVia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipovia`
--

LOCK TABLES `tipovia` WRITE;
/*!40000 ALTER TABLE `tipovia` DISABLE KEYS */;
INSERT INTO `tipovia` VALUES (1,'Pasaje');
/*!40000 ALTER TABLE `tipovia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajador` (
  `IdTrabajador` int NOT NULL,
  `FechNacimiento` date NOT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `IdRol` int NOT NULL,
  `IdPersona` int DEFAULT NULL,
  PRIMARY KEY (`IdTrabajador`),
  UNIQUE KEY `UKmk3fke6523hrkx6a84ygqdc72` (`IdPersona`),
  KEY `fk_trabajador_rol` (`IdRol`),
  CONSTRAINT `fk_trabajador_persona` FOREIGN KEY (`IdTrabajador`) REFERENCES `persona` (`IdPersona`),
  CONSTRAINT `fk_trabajador_rol` FOREIGN KEY (`IdRol`) REFERENCES `roles` (`IdRol`),
  CONSTRAINT `FKrc19vlfknvddp8od7myrsx6yl` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (5,'2005-02-05',NULL,1,NULL),(42,'2025-07-07',NULL,1,NULL),(49,'2025-07-08',NULL,4,NULL),(50,'2025-07-07',NULL,4,NULL);
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `IdVehiculo` int NOT NULL AUTO_INCREMENT,
  `Placa` varchar(20) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Capacidad` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdVehiculo`),
  UNIQUE KEY `Placa` (`Placa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,'ABC-123','Toyota','Hiace',1200.00);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'demaleproyect'
--

--
-- Dumping routines for database 'demaleproyect'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10 16:29:22
