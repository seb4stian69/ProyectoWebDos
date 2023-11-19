-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: chanoclothes
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `carritocompras`
--

DROP TABLE IF EXISTS `carritocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritocompras` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `Productos__id` varchar(100) NOT NULL,
  `Usuarios__id` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `fk_CarritoCompras_Productos1_idx` (`Productos__id`),
  KEY `fk_CarritoCompras_Usuarios1_idx` (`Usuarios__id`),
  CONSTRAINT `fk_CarritoCompras_Productos1` FOREIGN KEY (`Productos__id`) REFERENCES `productos` (`_id`),
  CONSTRAINT `fk_CarritoCompras_Usuarios1` FOREIGN KEY (`Usuarios__id`) REFERENCES `usuarios` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritocompras`
--

LOCK TABLES `carritocompras` WRITE;
/*!40000 ALTER TABLE `carritocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credenciales`
--

DROP TABLE IF EXISTS `credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credenciales` (
  `_id` varchar(100) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `Usuarios__id` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_Credenciales_Usuarios1_idx` (`Usuarios__id`),
  CONSTRAINT `fk_Credenciales_Usuarios1` FOREIGN KEY (`Usuarios__id`) REFERENCES `usuarios` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credenciales`
--

LOCK TABLES `credenciales` WRITE;
/*!40000 ALTER TABLE `credenciales` DISABLE KEYS */;
INSERT INTO `credenciales` VALUES ('CRED_0b58cb511fac21d','admin','123','0b58cb511fac21d'),('CRED_44a6a240078e835','gerente','123','44a6a240078e835'),('CRED_4c6d101d4f52cbe','serviciocliente','123','4c6d101d4f52cbe'),('CRED_efe1fad4af185e5','cliente','123','efe1fad4af185e5');
/*!40000 ALTER TABLE `credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesfactura`
--

DROP TABLE IF EXISTS `detallesfactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesfactura` (
  `_id` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float NOT NULL,
  `subtotal` float NOT NULL,
  `Facturas__id` varchar(100) NOT NULL,
  `Productos__id` varchar(100) NOT NULL,
  PRIMARY KEY (`_id`,`Facturas__id`),
  KEY `fk_DetallesFactura_Facturas1_idx` (`Facturas__id`),
  KEY `fk_DetallesFactura_Productos1_idx` (`Productos__id`),
  CONSTRAINT `fk_DetallesFactura_Facturas1` FOREIGN KEY (`Facturas__id`) REFERENCES `facturas` (`_id`),
  CONSTRAINT `fk_DetallesFactura_Productos1` FOREIGN KEY (`Productos__id`) REFERENCES `productos` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesfactura`
--

LOCK TABLES `detallesfactura` WRITE;
/*!40000 ALTER TABLE `detallesfactura` DISABLE KEYS */;
INSERT INTO `detallesfactura` VALUES ('DET-02ab6153b5121d64814d2093a140d707d1b1ef9afecb260fd649d7bf8b9bc6c8',4,59.99,239.96,'FACT-75f904af58da91a07290f6a2d40bff80d96075e70b6a07888e7def54f4fcf8da','PROD006'),('DET-1e370097c24627a4adbc40e1b81fe3c1cbe38d63acb89b521a2d84fb8d57e683',1,19.99,19.99,'FACT-a9616a8259abd4165fa1028c6d2d09ac17d9d954419b48e50d0da9911605d785','PROD003'),('DET-23a28cd944ccbe195fa24de3562e9aa8a75717e4d640c20f31d8850c765778d2',4,39.99,159.96,'FACT-166254891b6f7e6deb76f11ee11c65f45c7933bb24df008454f0771416ea0293','PROD002'),('DET-5fc923b758f9f3621a1cf6ed12867f4cece32d8bdf320fea898ae7aafa8f8b24',2,29.99,59.98,'FACT-843e9594ca451b35b78487060d66513242b0d38e07794b1e147ca96849501bb8','PROD001'),('DET-d5a9dc0cbc4e3953ad5b50a518d65989c0c457140c0fa1fc43546a5edf4d8315',3,29.99,89.97,'FACT-1bd32e958b41e4bcb3f21d3100bda4bfd29b35b7a8c1e200451792a63abc3ea9','PROD001'),('DET-d8a8e9f6b0e307b069381fd85ce117a589d5fbd9d1328507627de6533b0ceb02',5,39.99,199.95,'FACT-843e9594ca451b35b78487060d66513242b0d38e07794b1e147ca96849501bb8','PROD002'),('detail1_invoice1_april',3,29.99,89.97,'invoice1_april','PROD001'),('detail1_invoice1_august',10,29.99,299.9,'invoice1_august','PROD001'),('detail1_invoice1_february',2,29.99,59.98,'invoice1_february','PROD001'),('detail1_invoice1_january',2,29.99,59.98,'invoice1_january','PROD001'),('detail1_invoice1_july',8,29.99,239.92,'invoice1_july','PROD001'),('detail1_invoice1_june',7,29.99,209.93,'invoice1_june','PROD001'),('detail1_invoice1_march',2,29.99,59.98,'invoice1_march','PROD001'),('detail1_invoice1_may',3,29.99,89.97,'invoice1_may','PROD001'),('detail1_invoice1_october',15,29.99,449.85,'invoice1_october','PROD001'),('detail1_invoice1_september',12,29.99,359.88,'invoice1_september','PROD001'),('detail1_invoice2_april',2,59.99,119.98,'invoice2_april','PROD006'),('detail1_invoice2_august',15,59.99,899.85,'invoice2_august','PROD006'),('detail1_invoice2_february',3,59.99,179.97,'invoice2_february','PROD006'),('detail1_invoice2_january',2,59.99,119.98,'invoice2_january','PROD006'),('detail1_invoice2_july',10,59.99,599.9,'invoice2_july','PROD006'),('detail1_invoice2_june',9,59.99,539.91,'invoice2_june','PROD006'),('detail1_invoice2_march',3,59.99,179.97,'invoice2_march','PROD006'),('detail1_invoice2_may',2,59.99,119.98,'invoice2_may','PROD006'),('detail1_invoice2_october',20,59.99,1199.8,'invoice2_october','PROD006'),('detail1_invoice2_september',18,59.99,1079.82,'invoice2_september','PROD006'),('detail2_invoice1_april',2,39.99,79.98,'invoice1_april','PROD002'),('detail2_invoice1_august',15,39.99,599.85,'invoice1_august','PROD002'),('detail2_invoice1_february',4,39.99,159.96,'invoice1_february','PROD002'),('detail2_invoice1_january',3,39.99,119.97,'invoice1_january','PROD002'),('detail2_invoice1_july',12,39.99,479.88,'invoice1_july','PROD002'),('detail2_invoice1_june',10,39.99,399.9,'invoice1_june','PROD002'),('detail2_invoice1_march',5,39.99,199.95,'invoice1_march','PROD002'),('detail2_invoice1_may',5,39.99,199.95,'invoice1_may','PROD002'),('detail2_invoice1_october',20,39.99,799.8,'invoice1_october','PROD002'),('detail2_invoice1_september',18,39.99,719.82,'invoice1_september','PROD002'),('detail2_invoice2_april',3,34.99,104.97,'invoice2_april','PROD007'),('detail2_invoice2_august',10,34.99,349.9,'invoice2_august','PROD007'),('detail2_invoice2_february',1,34.99,34.99,'invoice2_february','PROD007'),('detail2_invoice2_january',1,34.99,34.99,'invoice2_january','PROD007'),('detail2_invoice2_july',7,34.99,244.93,'invoice2_july','PROD007'),('detail2_invoice2_june',6,34.99,209.94,'invoice2_june','PROD007'),('detail2_invoice2_march',2,34.99,69.98,'invoice2_march','PROD007'),('detail2_invoice2_may',3,34.99,104.97,'invoice2_may','PROD007'),('detail2_invoice2_october',15,34.99,524.85,'invoice2_october','PROD007'),('detail2_invoice2_september',12,34.99,419.88,'invoice2_september','PROD007'),('detail3_invoice1_april',4,19.99,79.96,'invoice1_april','PROD003'),('detail3_invoice1_august',8,19.99,159.92,'invoice1_august','PROD003'),('detail3_invoice1_february',1,19.99,19.99,'invoice1_february','PROD003'),('detail3_invoice1_january',1,19.99,19.99,'invoice1_january','PROD003'),('detail3_invoice1_july',6,19.99,119.94,'invoice1_july','PROD003'),('detail3_invoice1_june',5,19.99,99.95,'invoice1_june','PROD003'),('detail3_invoice1_march',3,19.99,59.97,'invoice1_march','PROD003'),('detail3_invoice1_may',2,19.99,39.98,'invoice1_may','PROD003'),('detail3_invoice1_october',12,19.99,239.88,'invoice1_october','PROD003'),('detail3_invoice1_september',10,19.99,199.9,'invoice1_september','PROD003'),('detail3_invoice2_april',5,22.99,114.95,'invoice2_april','PROD008'),('detail3_invoice2_august',18,22.99,413.82,'invoice2_august','PROD008'),('detail3_invoice2_february',4,22.99,91.96,'invoice2_february','PROD008'),('detail3_invoice2_january',3,22.99,68.97,'invoice2_january','PROD008'),('detail3_invoice2_july',13,22.99,298.87,'invoice2_july','PROD008'),('detail3_invoice2_june',11,22.99,252.89,'invoice2_june','PROD008'),('detail3_invoice2_march',1,22.99,22.99,'invoice2_march','PROD008'),('detail3_invoice2_may',5,22.99,114.95,'invoice2_may','PROD008'),('detail3_invoice2_october',25,22.99,574.75,'invoice2_october','PROD008'),('detail3_invoice2_september',22,22.99,505.78,'invoice2_september','PROD008'),('detail4_invoice1_april',1,49.99,49.99,'invoice1_april','PROD004'),('detail4_invoice1_august',12,49.99,599.88,'invoice1_august','PROD004'),('detail4_invoice1_february',3,49.99,149.97,'invoice1_february','PROD004'),('detail4_invoice1_january',4,49.99,199.96,'invoice1_january','PROD004'),('detail4_invoice1_july',10,49.99,499.9,'invoice1_july','PROD004'),('detail4_invoice1_june',8,49.99,399.92,'invoice1_june','PROD004'),('detail4_invoice1_march',1,49.99,49.99,'invoice1_march','PROD004'),('detail4_invoice1_may',4,49.99,199.96,'invoice1_may','PROD004'),('detail4_invoice1_october',18,49.99,899.82,'invoice1_october','PROD004'),('detail4_invoice1_september',15,49.99,749.85,'invoice1_september','PROD004'),('detail4_invoice2_april',1,64.99,64.99,'invoice2_april','PROD009'),('detail4_invoice2_august',6,64.99,389.94,'invoice2_august','PROD009'),('detail4_invoice2_february',2,64.99,129.98,'invoice2_february','PROD009'),('detail4_invoice2_january',2,64.99,129.98,'invoice2_january','PROD009'),('detail4_invoice2_july',5,64.99,324.95,'invoice2_july','PROD009'),('detail4_invoice2_june',4,64.99,259.96,'invoice2_june','PROD009'),('detail4_invoice2_march',4,64.99,259.96,'invoice2_march','PROD009'),('detail4_invoice2_may',1,64.99,64.99,'invoice2_may','PROD009'),('detail4_invoice2_october',10,64.99,649.9,'invoice2_october','PROD009'),('detail4_invoice2_september',8,64.99,519.92,'invoice2_september','PROD009'),('detail5_invoice1_april',5,14.99,74.95,'invoice1_april','PROD005'),('detail5_invoice1_august',20,14.99,299.8,'invoice1_august','PROD005'),('detail5_invoice1_february',2,14.99,29.98,'invoice1_february','PROD005'),('detail5_invoice1_january',1,14.99,14.99,'invoice1_january','PROD005'),('detail5_invoice1_july',15,14.99,224.85,'invoice1_july','PROD005'),('detail5_invoice1_june',12,14.99,179.88,'invoice1_june','PROD005'),('detail5_invoice1_march',4,14.99,59.96,'invoice1_march','PROD005'),('detail5_invoice1_may',1,14.99,14.99,'invoice1_may','PROD005'),('detail5_invoice1_october',25,14.99,374.75,'invoice1_october','PROD005'),('detail5_invoice1_september',25,14.99,374.75,'invoice1_september','PROD005'),('detail5_invoice2_april',4,9.99,39.96,'invoice2_april','PROD010'),('detail5_invoice2_august',25,9.99,249.75,'invoice2_august','PROD010'),('detail5_invoice2_february',5,9.99,49.95,'invoice2_february','PROD010'),('detail5_invoice2_january',1,9.99,9.99,'invoice2_january','PROD010'),('detail5_invoice2_july',20,9.99,199.8,'invoice2_july','PROD010'),('detail5_invoice2_june',15,9.99,149.85,'invoice2_june','PROD010'),('detail5_invoice2_march',5,9.99,49.95,'invoice2_march','PROD010'),('detail5_invoice2_may',4,9.99,39.96,'invoice2_may','PROD010'),('detail5_invoice2_october',30,9.99,299.7,'invoice2_october','PROD010'),('detail5_invoice2_september',30,9.99,299.7,'invoice2_september','PROD010');
/*!40000 ALTER TABLE `detallesfactura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarStockTrigger` AFTER INSERT ON `detallesfactura` FOR EACH ROW BEGIN
    DECLARE productoID_insertado VARCHAR(100);
    DECLARE cantidad_insertada INT;

    -- Obtener los valores que se están insertando
    SET productoID_insertado = NEW.Productos__id;
    SET cantidad_insertada = NEW.cantidad;

    -- Llamar al procedimiento almacenado con los valores obtenidos
    CALL chanoclothes.ActualizarStockProducto(productoID_insertado, cantidad_insertada);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `_id` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `estado` enum('EnProceso','Cancelado','Entregado') NOT NULL,
  `Usuarios__id` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL,
  `MetodoPagoCompra__id` varchar(100) NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `fk_Facturas_Usuarios1_idx` (`Usuarios__id`),
  KEY `fk_Facturas_MetodoPagoCompra1_idx` (`MetodoPagoCompra__id`),
  CONSTRAINT `fk_Facturas_MetodoPagoCompra1` FOREIGN KEY (`MetodoPagoCompra__id`) REFERENCES `metodopagocompra` (`_id`),
  CONSTRAINT `fk_Facturas_Usuarios1` FOREIGN KEY (`Usuarios__id`) REFERENCES `usuarios` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES ('FACT-166254891b6f7e6deb76f11ee11c65f45c7933bb24df008454f0771416ea0293','2023-11-18','EnProceso','efe1fad4af185e5','1'),('FACT-1bd32e958b41e4bcb3f21d3100bda4bfd29b35b7a8c1e200451792a63abc3ea9','2023-11-18','EnProceso','efe1fad4af185e5','2'),('FACT-75f904af58da91a07290f6a2d40bff80d96075e70b6a07888e7def54f4fcf8da','2023-11-18','EnProceso','efe1fad4af185e5','3'),('FACT-843e9594ca451b35b78487060d66513242b0d38e07794b1e147ca96849501bb8','2023-11-18','EnProceso','efe1fad4af185e5','3'),('FACT-a9616a8259abd4165fa1028c6d2d09ac17d9d954419b48e50d0da9911605d785','2023-11-18','EnProceso','efe1fad4af185e5','2'),('invoice1_april','2023-04-05','EnProceso','efe1fad4af185e5','1'),('invoice1_august','2023-08-05','Entregado','efe1fad4af185e5','3'),('invoice1_february','2023-02-05','Entregado','efe1fad4af185e5','3'),('invoice1_january','2023-01-01','EnProceso','efe1fad4af185e5','1'),('invoice1_july','2023-07-10','EnProceso','efe1fad4af185e5','1'),('invoice1_june','2023-06-05','Cancelado','efe1fad4af185e5','2'),('invoice1_march','2023-03-10','Cancelado','efe1fad4af185e5','2'),('invoice1_may','2023-05-10','Entregado','efe1fad4af185e5','3'),('invoice1_october','2023-10-05','EnProceso','efe1fad4af185e5','1'),('invoice1_september','2023-09-10','Cancelado','efe1fad4af185e5','2'),('invoice2_april','2023-04-20','Cancelado','efe1fad4af185e5','2'),('invoice2_august','2023-08-20','EnProceso','efe1fad4af185e5','1'),('invoice2_february','2023-02-20','EnProceso','efe1fad4af185e5','1'),('invoice2_january','2023-01-15','Cancelado','efe1fad4af185e5','2'),('invoice2_july','2023-07-25','Cancelado','efe1fad4af185e5','2'),('invoice2_june','2023-06-20','Entregado','efe1fad4af185e5','3'),('invoice2_march','2023-03-25','Entregado','efe1fad4af185e5','3'),('invoice2_may','2023-05-25','EnProceso','efe1fad4af185e5','1'),('invoice2_october','2023-10-20','Cancelado','efe1fad4af185e5','2'),('invoice2_september','2023-09-25','Entregado','efe1fad4af185e5','3');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodopagocompra`
--

DROP TABLE IF EXISTS `metodopagocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopagocompra` (
  `_id` varchar(100) NOT NULL,
  `medio` enum('TDebito','TCredito','Efectivo','Transferencia') NOT NULL,
  `detalles` varchar(45) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodopagocompra`
--

LOCK TABLES `metodopagocompra` WRITE;
/*!40000 ALTER TABLE `metodopagocompra` DISABLE KEYS */;
INSERT INTO `metodopagocompra` VALUES ('1','TDebito','Tarjeta de debito'),('2','TCredito','Tarjeta de credito'),('3','Transferencia','Nequi');
/*!40000 ALTER TABLE `metodopagocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pqrsusuarios`
--

DROP TABLE IF EXISTS `pqrsusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pqrsusuarios` (
  `_id` varchar(100) NOT NULL,
  `log` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `Usuarios__id` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `fk_PQRSUsuarios_Usuarios1_idx` (`Usuarios__id`),
  CONSTRAINT `fk_PQRSUsuarios_Usuarios1` FOREIGN KEY (`Usuarios__id`) REFERENCES `usuarios` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pqrsusuarios`
--

LOCK TABLES `pqrsusuarios` WRITE;
/*!40000 ALTER TABLE `pqrsusuarios` DISABLE KEYS */;
INSERT INTO `pqrsusuarios` VALUES ('31397048fdd7fdcecaa1f080220ff18ff30869cb2ad7b0a7e339b943f20e5aa9','Tengo problemas con mi logueo','2023-11-18 18:30:42','efe1fad4af185e5'),('6e958c16859cf2ea90c3b1811560b357d9e269c5906dd84ee669ffcd5b50af66','Problema al agregar al carrito','2023-11-18 19:10:23','efe1fad4af185e5');
/*!40000 ALTER TABLE `pqrsusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `_id` varchar(100) NOT NULL,
  `precio` float NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int NOT NULL,
  `valor_compra` float NOT NULL,
  `valor_venta` float NOT NULL,
  `imagen` varchar(45) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('PROD001',29.99,'Camiseta Negra','Camiseta básica de color negro',1830,15,29.99,'camiseta_negra.jpg'),('PROD002',39.99,'Jeans Azules','Jeans ajustados de color azul',890,25,39.99,'jeans_azules.jpg'),('PROD003',19.99,'Zapatillas Blancas','Zapatillas deportivas de color blanco',3445,10,19.99,'zapatillas_blancas.jpg'),('PROD004',49.99,'Chaqueta de Cuero','Chaqueta de cuero genuino',1917,35,49.99,'chaqueta_cuero.jpg'),('PROD005',14.99,'Gorra Negra','Gorra ajustable de color negro',7887,8,14.99,'gorra_negra.jpg'),('PROD006',59.99,'Vestido Floral','Vestido elegante con estampado floral',508,45,59.99,'vestido_floral.jpg'),('PROD007',34.99,'Cartera de Cuero','Cartera de cuero con múltiples compartimentos',1938,20,34.99,'cartera_cuero.jpg'),('PROD008',22.99,'Bufanda Gris','Bufanda suave de color gris',4886,12,22.99,'bufanda_gris.jpg'),('PROD009',64.99,'Abrigo de Invierno','Abrigo grueso para el invierno',6953,50,64.99,'abrigo_invierno.jpg'),('PROD010',9.99,'Calcetines Rayados','Calcetines cómodos con rayas',1289,5,9.99,'calcetines_rayados.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `_id` varchar(100) NOT NULL,
  `tipo` enum('cliente','admin','gerente','serviciocliente') NOT NULL,
  `Usuarios__id` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `fk_Roles_Usuarios1_idx` (`Usuarios__id`),
  CONSTRAINT `fk_Roles_Usuarios1` FOREIGN KEY (`Usuarios__id`) REFERENCES `usuarios` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ROL_0b58cb511fac21d','admin','0b58cb511fac21d'),('ROL_44a6a240078e835','gerente','44a6a240078e835'),('ROL_4c6d101d4f52cbe','serviciocliente','4c6d101d4f52cbe'),('ROL_efe1fad4af185e5','cliente','efe1fad4af185e5');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `_id` varchar(15) CHARACTER SET big5 COLLATE big5_chinese_ci NOT NULL,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('0b58cb511fac21d','Marcos','','Vasquez','','3001122123','Direccion admin','admin@mail.com'),('44a6a240078e835','Andres','','Marquez','','3001122123','Direccion gerente','gerente@mail.com'),('4c6d101d4f52cbe','Julian','','Martinez','','3001122123','Direccion serviciocliente','serviciocliente@mail.com'),('efe1fad4af185e5','Sebastian','','Cliente','','3001122123','Direccion cliente','sebastiancliente@mail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'chanoclothes'
--

--
-- Dumping routines for database 'chanoclothes'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarStockProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockProducto`(
    IN idProducto VARCHAR(100),
    IN cantidadQuitada INT
)
BEGIN
    DECLARE stockActual INT;

    -- Obtener el stock actual del producto
    SELECT `stock` INTO stockActual FROM `chanoclothes`.`productos` WHERE `_id` = idProducto;

    -- Verificar si hay suficiente stock para restar
    IF stockActual >= cantidadQuitada THEN
        -- Restar la cantidadQuitada al stock
        UPDATE `chanoclothes`.`productos` SET `stock` = stockActual - cantidadQuitada WHERE `_id` = idProducto;
    END IF;
    -- No se devuelve ningún mensaje, puedes agregar lógica adicional aquí si es necesario.
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AgregarAlCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarAlCarrito`(
    IN productoID VARCHAR(100),
    IN userID VARCHAR(15),
    IN cantidad INT
)
BEGIN
    DECLARE exit_handler BOOLEAN DEFAULT FALSE;
    DECLARE producto_existente INT DEFAULT 0;  -- Mueve la declaración aquí
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET exit_handler = TRUE;

    -- Inicia una transacción
    START TRANSACTION;

    -- Intenta realizar la inserción o actualización
    BEGIN
        -- Verifica si el usuario ya agregó el producto al carrito
        SELECT COUNT(*) INTO producto_existente
        FROM `ChanoClothes`.`CarritoCompras`
        WHERE `Productos__id` = productoID AND `Usuarios__id` = userID;

        IF producto_existente > 0 THEN
            -- Si el producto ya existe, actualiza la cantidad
            UPDATE `ChanoClothes`.`CarritoCompras`
            SET `cantidad` = cantidad
            WHERE `Productos__id` = productoID AND `Usuarios__id` = userID;
        ELSE
            -- Si el producto no existe, realiza la inserción
            INSERT INTO `ChanoClothes`.`CarritoCompras`(`_id`,`Productos__id`,`Usuarios__id`,`cantidad`)
            VALUES (0, productoID, userID, cantidad);
        END IF;

        SET exit_handler = FALSE; -- Indica que no hubo errores
    END;

    -- Manejar errores
    IF exit_handler THEN
        ROLLBACK; -- Deshace la transacción en caso de error
        SELECT "Error al agregar o actualizar el producto en el carrito" AS Mensaje;
    ELSE
        COMMIT; -- Confirma la transacción si no hubo errores
        SELECT "Producto agregado o actualizado con éxito" AS Mensaje;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrearDetalleFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearDetalleFactura`(IN id varchar(100), IN cantidad INT, IN precio FLOAT, IN subtotal FLOAT, IN facturaID varchar(100), IN productoID varchar(100))
BEGIN
	insert into chanoclothes.detallesfactura values (id,cantidad,precio,subtotal,facturaID,productoID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrearFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearFactura`(
    IN p_id VARCHAR(100),
    IN p_fecha DATE,
    IN p_Usuario_id VARCHAR(15),
    IN p_metodopagocompraid VARCHAR(100)
)
BEGIN
    INSERT INTO facturas (_id, fecha, estado, Usuarios__id, MetodoPagoCompra__id)
    VALUES (p_id, p_fecha, 'EnProceso', p_Usuario_id, p_metodopagocompraid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrearUsuarioRolCredencial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearUsuarioRolCredencial`(
    IN p_id  VARCHAR(15),
    IN p_primer_nombre VARCHAR(255),
    IN p_segundo_nombre VARCHAR(255),
    IN p_primer_apellido VARCHAR(255),
    IN p_segundo_apellido VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_tipo_rol VARCHAR(50),
    IN p_usuario VARCHAR(50),
    IN p_contrasena VARCHAR(50)
)
BEGIN
    -- Inicia una transacción
    START TRANSACTION;

    -- Insertar el usuario
    INSERT INTO Usuarios (_id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, direccion, correo)
    VALUES (p_id, p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido, p_telefono, p_direccion, p_correo);

    -- Insertar el rol
    INSERT INTO Roles (_id, tipo, Usuarios__id)
    VALUES (CONCAT('ROL_', p_id), p_tipo_rol, p_id);

    -- Insertar la credencial
    INSERT INTO Credenciales (_id, usuario, contrasena, Usuarios__id)
    VALUES (CONCAT('CRED_', p_id), p_usuario, p_contrasena, p_id);

    -- Confirmar la transacción
    COMMIT;

    SELECT "Usuario creado con éxito" AS Mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Credenciales_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Credenciales_CRUD`(
    IN p_operacion VARCHAR(10),
    IN p_id VARCHAR(100),
    IN p_usuario VARCHAR(45),
    IN p_contrasena VARCHAR(45),
    IN p_usuarios_id VARCHAR(15) CHARACTER SET 'big5'
)
BEGIN
    IF p_operacion = 'CREATE' THEN
        -- Crear Credencial
        INSERT INTO `ChanoClothes`.`Credenciales` (`_id`, `usuario`, `contrasena`, `Usuarios__id`)
        VALUES (p_id, p_usuario, p_contrasena, p_usuarios_id);

    ELSEIF p_operacion = 'READ' THEN
        -- Obtener Credencial por ID
        SELECT * FROM `ChanoClothes`.`Credenciales`;

    ELSEIF p_operacion = 'UPDATE' THEN
        -- Actualizar Credencial por ID
        UPDATE `ChanoClothes`.`Credenciales`
        SET
            `usuario` = p_usuario,
            `contrasena` = p_contrasena,
            `Usuarios__id` = p_usuarios_id
        WHERE `_id` = p_id;

    ELSEIF p_operacion = 'DELETE' THEN
        -- Eliminar Credencial por ID
        DELETE FROM `ChanoClothes`.`Credenciales` WHERE `_id` = p_id;

    ELSE
        -- Operación no válida
        SELECT 'Operación no válida' AS Mensaje;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetallesFactura_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DetallesFactura_CRUD`(
    IN p_operacion VARCHAR(10),
    IN p_id VARCHAR(100),
    IN p_cantidad INT,
    IN p_precio FLOAT,
    IN p_subtotal FLOAT,
    IN p_facturas_id VARCHAR(100),
    IN p_productos_id VARCHAR(100)
)
BEGIN
    IF p_operacion = 'CREATE' THEN
        -- Crear Detalle de Factura
        INSERT INTO `ChanoClothes`.`DetallesFactura` (`_id`, `cantidad`, `precio`, `subtotal`, `Facturas__id`, `Productos__id`)
        VALUES (p_id, p_cantidad, p_precio, p_subtotal, p_facturas_id, p_productos_id);

    ELSEIF p_operacion = 'READ' THEN
        -- Obtener Detalle de Factura por ID y Factura ID
        SELECT * FROM `ChanoClothes`.`DetallesFactura`;

    ELSEIF p_operacion = 'UPDATE' THEN
        -- Actualizar Detalle de Factura por ID y Factura ID
        UPDATE `ChanoClothes`.`DetallesFactura`
        SET
            `cantidad` = p_cantidad,
            `precio` = p_precio,
            `subtotal` = p_subtotal,
            `Productos__id` = p_productos_id
        WHERE `_id` = p_id AND `Facturas__id` = p_facturas_id;

    ELSEIF p_operacion = 'DELETE' THEN
        -- Eliminar Detalle de Factura por ID y Factura ID
        DELETE FROM `ChanoClothes`.`DetallesFactura` WHERE `_id` = p_id;

    ELSE
        -- Operación no válida
        SELECT 'Operación no válida' AS Mensaje;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Facturas_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Facturas_CRUD`(
    IN p_operacion VARCHAR(10),
    IN p_id VARCHAR(100),
    IN p_fecha DATE,
    IN p_estado ENUM('EnProceso', 'Cancelado', 'Entregado'),
    IN p_usuarios_id VARCHAR(15) CHARACTER SET 'big5',
    IN p_metodo_pago_id VARCHAR(100)
)
BEGIN
    IF p_operacion = 'CREATE' THEN
        -- Crear Factura
        INSERT INTO `ChanoClothes`.`Facturas` (`_id`, `fecha`, `estado`, `Usuarios__id`, `MetodoPagoCompra__id`)
        VALUES (p_id, p_fecha, p_estado, p_usuarios_id, p_metodo_pago_id);

    ELSEIF p_operacion = 'READ' THEN
        -- Obtener Factura por ID
        SELECT * FROM `ChanoClothes`.`Facturas`;

    ELSEIF p_operacion = 'UPDATE' THEN
        -- Actualizar Factura por ID
        UPDATE `ChanoClothes`.`Facturas`
        SET
            `fecha` = p_fecha,
            `estado` = p_estado,
            `Usuarios__id` = p_usuarios_id,
            `MetodoPagoCompra__id` = p_metodo_pago_id
        WHERE `_id` = p_id;

    ELSEIF p_operacion = 'DELETE' THEN
        -- Eliminar Factura por ID
        DELETE FROM `ChanoClothes`.`Facturas` WHERE `_id` = p_id;

    ELSE
        -- Operación no válida
        SELECT 'Operación no válida' AS Mensaje;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InicioSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InicioSesion`(IN p_usuario VARCHAR(45), IN p_contrasena VARCHAR(45))
BEGIN

    DECLARE usuario_id VARCHAR(15);
    DECLARE user_role ENUM('cliente', 'admin', 'gerente', 'serviciocliente');

    -- Buscar el ID de usuario que coincide con las credenciales
    SELECT Usuarios__id INTO usuario_id
    FROM Credenciales
    WHERE usuario = p_usuario AND contrasena = p_contrasena;

    -- Verificar si se encontró el usuario
    IF usuario_id IS NOT NULL THEN
    
        -- Consulta para obtener el rol del usuario
        SELECT tipo INTO user_role
        FROM Roles
        WHERE Usuarios__id = usuario_id;

        -- Devolver el rol del usuario 
        SELECT user_role AS RolUsuario, 'Inicio de sesion exitoso' AS Mensaje, usuario_id as UserID;
        
    ELSE
        SELECT 'Credenciales incorrectas' AS Mensaje;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MetodoPagoCompra_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MetodoPagoCompra_CRUD`(
    IN p_operacion VARCHAR(10),
    IN p_id VARCHAR(100),
    IN p_medio ENUM('TDebito', 'TCredito', 'Efectivo', 'Transferencia'),
    IN p_detalles VARCHAR(45)
)
BEGIN
    IF p_operacion = 'CREATE' THEN
        -- Crear Método de Pago
        INSERT INTO `ChanoClothes`.`MetodoPagoCompra` (`_id`, `medio`, `detalles`)
        VALUES (p_id, p_medio, p_detalles);

    ELSEIF p_operacion = 'READ' THEN
        -- Obtener Método de Pago por ID
        SELECT * FROM `ChanoClothes`.`MetodoPagoCompra`;

    ELSEIF p_operacion = 'UPDATE' THEN
        -- Actualizar Método de Pago por ID
        UPDATE `ChanoClothes`.`MetodoPagoCompra`
        SET
            `medio` = p_medio,
            `detalles` = p_detalles
        WHERE `_id` = p_id;

    ELSEIF p_operacion = 'DELETE' THEN
        -- Eliminar Método de Pago por ID
        DELETE FROM `ChanoClothes`.`MetodoPagoCompra` WHERE `_id` = p_id;

    ELSE
        -- Operación no válida
        SELECT 'Operación no válida' AS Mensaje;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCantidadProductosEnCarritoPorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCantidadProductosEnCarritoPorID`(IN userID varchar(100))
BEGIN
SELECT COUNT(*) as total_registros
FROM CarritoCompras
WHERE Usuarios__id = userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerGananciaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerGananciaProducto`(IN productID VARCHAR(15))
BEGIN
 select valor_venta from productos where _id = productID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerGananciasPorAnioMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerGananciasPorAnioMes`(IN mes INT, IN anio INT)
BEGIN
SELECT
  SUM(DetallesFactura.`subtotal`) AS SumaTotalVendido
FROM
  `ChanoClothes`.`Facturas`
JOIN
  `ChanoClothes`.`DetallesFactura` ON Facturas.`_id` = DetallesFactura.`Facturas__id`
WHERE
  MONTH(Facturas.`fecha`) = mes AND YEAR(Facturas.`fecha`) = anio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductosCarritoUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosCarritoUser`(IN UserID varchar(15))
BEGIN
select * from CarritoCompras where Usuarios__id = UserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductosVendidosPorMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosVendidosPorMes`(in mes INT, in anio INT)
BEGIN
    SELECT pro.nombre, SUM(det.cantidad) AS cantidad
    FROM detallesfactura AS det
    JOIN facturas AS fac ON det.Facturas__id = fac._id
    JOIN productos AS pro ON det.Productos__id = pro._id
    WHERE MONTH(fac.`fecha`) = mes AND YEAR(fac.`fecha`) = anio
    GROUP BY pro._id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Productos_CRUD`(
    IN p_operacion VARCHAR(10),
    IN p_id VARCHAR(100),
    IN p_precio FLOAT,
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(100),
    IN p_stock INT,
    IN p_valor_compra FLOAT,
    IN p_valor_venta FLOAT,
    IN p_imagen VARCHAR(45)
)
BEGIN
    IF p_operacion = 'CREATE' THEN
        -- Crear Producto
        INSERT INTO `ChanoClothes`.`Productos` (`_id`, `precio`, `nombre`, `descripcion`, `stock`, `valor_compra`, `valor_venta`, `imagen`)
        VALUES (p_id, p_precio, p_nombre, p_descripcion, p_stock, p_valor_compra, p_valor_venta, p_imagen);

    ELSEIF p_operacion = 'READ' THEN
        -- Obtener Producto por ID
        SELECT * FROM `ChanoClothes`.`Productos`;

    ELSEIF p_operacion = 'UPDATE' THEN
        -- Actualizar Producto por ID
        UPDATE `ChanoClothes`.`Productos`
        SET
            `precio` = p_precio,
            `nombre` = p_nombre,
            `descripcion` = p_descripcion,
            `stock` = p_stock,
            `valor_compra` = p_valor_compra,
            `valor_venta` = p_valor_venta,
            `imagen` = p_imagen
        WHERE `_id` = p_id;

    ELSEIF p_operacion = 'DELETE' THEN
        -- Eliminar Producto por ID
        DELETE FROM `ChanoClothes`.`Productos` WHERE `_id` = p_id;

    ELSE
        -- Operación no válida
        SELECT 'Operación no válida' AS Mensaje;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Roles_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Roles_CRUD`(
    IN p_operacion VARCHAR(10),
    IN p_id VARCHAR(100),
    IN p_tipo ENUM('cliente', 'admin', 'gerente', 'serviciocliente'),
    IN p_usuarios_id VARCHAR(15) CHARACTER SET 'big5'
)
BEGIN
    IF p_operacion = 'CREATE' THEN
        -- Crear Rol
        INSERT INTO `ChanoClothes`.`Roles` (`_id`, `tipo`, `Usuarios__id`)
        VALUES (p_id, p_tipo, p_usuarios_id);

    ELSEIF p_operacion = 'READ' THEN
        -- Obtener Rol por ID
        SELECT * FROM `ChanoClothes`.`Roles`;

    ELSEIF p_operacion = 'UPDATE' THEN
        -- Actualizar Rol por ID
        UPDATE `ChanoClothes`.`Roles`
        SET
            `tipo` = p_tipo,
            `Usuarios__id` = p_usuarios_id
        WHERE `_id` = p_id;

    ELSEIF p_operacion = 'DELETE' THEN
        -- Eliminar Rol por ID
        DELETE FROM `ChanoClothes`.`Roles` WHERE `_id` = p_id;

    ELSE
        -- Operación no válida
        SELECT 'Operación no válida' AS Mensaje;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_CRUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios_CRUD`(
    IN p_operacion VARCHAR(10),
    IN p_id VARCHAR(15),
    IN p_primer_nombre VARCHAR(45),
    IN p_segundo_nombre VARCHAR(45),
    IN p_primer_apellido VARCHAR(45),
    IN p_segundo_apellido VARCHAR(45),
    IN p_telefono VARCHAR(45),
    IN p_direccion VARCHAR(45),
    IN p_correo VARCHAR(100)
)
BEGIN
    IF p_operacion = 'CREATE' THEN
        -- Crear Usuario
        INSERT INTO `ChanoClothes`.`Usuarios` (
            `_id`, `primer_nombre`, `segundo_nombre`,
            `primer_apellido`, `segundo_apellido`,
            `telefono`, `direccion`, `correo`
        ) VALUES (
            p_id, p_primer_nombre, p_segundo_nombre,
            p_primer_apellido, p_segundo_apellido,
            p_telefono, p_direccion, p_correo
        );

    ELSEIF p_operacion = 'READ' THEN
        -- Obtener Usuario por ID
        SELECT * FROM `ChanoClothes`.`Usuarios`;

    ELSEIF p_operacion = 'UPDATE' THEN
        -- Actualizar Usuario por ID
        UPDATE `ChanoClothes`.`Usuarios`
        SET
            `primer_nombre` = p_primer_nombre,
            `segundo_nombre` = p_segundo_nombre,
            `primer_apellido` = p_primer_apellido,
            `segundo_apellido` = p_segundo_apellido,
            `telefono` = p_telefono,
            `direccion` = p_direccion,
            `correo` = p_correo
        WHERE `_id` = p_id;

    ELSEIF p_operacion = 'DELETE' THEN
        -- Eliminar Usuario por ID
        DELETE FROM `ChanoClothes`.`Usuarios` WHERE `_id` = p_id;

    ELSE
        -- Operación no válida
        SELECT 'Operación no válida' AS Mensaje;

    END IF;
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

-- Dump completed on 2023-11-18 23:10:31
