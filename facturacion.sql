CREATE DATABASE  IF NOT EXISTS `facturacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `facturacion`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: facturacion
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente_proveedor`
--

DROP TABLE IF EXISTS `cliente_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(90) DEFAULT NULL,
  `tipo` char(1) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `telefono` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_proveedor`
--

LOCK TABLES `cliente_proveedor` WRITE;
/*!40000 ALTER TABLE `cliente_proveedor` DISABLE KEYS */;
INSERT INTO `cliente_proveedor` VALUES (1,'12345678A','Maria','san jose','c','mjh@hhh','12345678'),(2,'12345678B','Pedro','san Bartolo','p','mjnh@hygv','123456789');
/*!40000 ALTER TABLE `cliente_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `comision` double NOT NULL,
  `encargado_facturacion` char(1) NOT NULL,
  PRIMARY KEY (`id_contrato`),
  KEY `fk_contrato_cliente` (`id`),
  CONSTRAINT `fk_contrato_cliente` FOREIGN KEY (`id`) REFERENCES `cliente_proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,2,25,'p');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `facturas` (
  `id_facturas` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `importe` double NOT NULL,
  `id_forrma_pago` int(11) NOT NULL,
  `id_contrato` int(11) DEFAULT NULL,
  `concepto` varchar(90) DEFAULT NULL,
  `iva` double NOT NULL,
  PRIMARY KEY (`id_facturas`),
  KEY `fk_factura_cliente` (`id`),
  KEY `fk_factura_servicio` (`id_servicio`),
  KEY `fk_factura_pago` (`id_forrma_pago`),
  KEY `fk_factura_contrato` (`id_contrato`),
  KEY `fk_factura_pedido` (`id_pedido`),
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`id`) REFERENCES `cliente_proveedor` (`id`),
  CONSTRAINT `fk_factura_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`),
  CONSTRAINT `fk_factura_pago` FOREIGN KEY (`id_forrma_pago`) REFERENCES `forma_pago` (`id_forma_pago`),
  CONSTRAINT `fk_factura_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_factura_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios_productos` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `forma_pago` (
  `id_forma_pago` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(90) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'pago unico',0);
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `descripcion` varchar(90) NOT NULL,
  `id` int(11) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_contrato` int(11) DEFAULT NULL,
  `importe_facturado` double NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`id`),
  KEY `fk_pedido_formapago` (`id_forma_pago`),
  KEY `fk_pedido_servicios` (`id_servicio`),
  KEY `fk_pedido_contrato` (`id_contrato`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id`) REFERENCES `cliente_proveedor` (`id`),
  CONSTRAINT `fk_pedido_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`),
  CONSTRAINT `fk_pedido_formapago` FOREIGN KEY (`id_forma_pago`) REFERENCES `forma_pago` (`id_forma_pago`),
  CONSTRAINT `fk_pedido_servicios` FOREIGN KEY (`id_servicio`) REFERENCES `servicios_productos` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'pagina basica',1,1,120000,'2015-02-12',1,NULL,12000);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_productos`
--

DROP TABLE IF EXISTS `servicios_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `servicios_productos` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(90) NOT NULL,
  `coste` double NOT NULL,
  `id` int(11) DEFAULT NULL,
  `iva` double NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_servicios_cliente` (`id`),
  CONSTRAINT `fk_servicios_cliente` FOREIGN KEY (`id`) REFERENCES `cliente_proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_productos`
--

LOCK TABLES `servicios_productos` WRITE;
/*!40000 ALTER TABLE `servicios_productos` DISABLE KEYS */;
INSERT INTO `servicios_productos` VALUES (1,'pagina basica',12000,1,21);
/*!40000 ALTER TABLE `servicios_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'facturacion'
--

--
-- Dumping routines for database 'facturacion'
--
/*!50003 DROP PROCEDURE IF EXISTS `altaPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `altaPedido`(pid_pedido int,pdescripcion varchar(90),pid int(11), pid_forma_pago int(11),ptotal double,pfecha date,pid_servicio int(11),pid_contrato int(11),pimporte_facturado double)
BEGIN
insert into pedido
(id_pedido,descripcion,id,id_forma_pago,total,fecha,id_servicio,id_contrato,importe_facturado
)
values(pid_pedido,pdescripcion,pid , pid_forma_pago ,ptotal ,pfecha,pid_servicio ,pid_contrato ,pimporte_facturado

);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarPedido`(pid_pedido int)
BEGIN
delete from pedido
where id_pedido=pid_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrarUnoPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarUnoPedido`(pid int)
BEGIN
select id_pedido,descripcion,id,id_forma_pago,total,fecha,id_servicio,id_contrato,importe_facturado
from pedido
where id_pedido=pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-27 14:19:32
