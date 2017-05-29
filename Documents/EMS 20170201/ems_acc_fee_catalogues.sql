-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: ems
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acc_fee_catalogues`
--

DROP TABLE IF EXISTS `acc_fee_catalogues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fee_catalogues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogue_name` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(45) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `description` text,
  `is_active` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fee_catalogues`
--

LOCK TABLES `acc_fee_catalogues` WRITE;
/*!40000 ALTER TABLE `acc_fee_catalogues` DISABLE KEYS */;
INSERT INTO `acc_fee_catalogues` VALUES (1,'Fee Catalog','2015-2016','2016-02-12','2016-02-12','This is second catalog',0,1,1,1,'2016-02-12 01:42:26','2016-02-17 02:32:44'),(2,'Dara','SDf','2016-02-12',NULL,'',0,1,1,1,'2016-02-12 02:23:21','2016-02-17 02:32:40'),(3,'New Year','2015','2016-02-12','2016-02-12','',1,1,1,1,'2016-02-12 02:28:31','2016-02-17 02:32:16'),(4,'Dara','2015','2016-02-12',NULL,'',1,1,1,1,'2016-02-12 03:53:10','2016-02-17 02:32:10'),(5,'Toul Svay Prey','2014','2016-02-17',NULL,'',1,0,1,1,'2016-02-17 02:33:28','2016-02-17 02:33:28');
/*!40000 ALTER TABLE `acc_fee_catalogues` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:39
