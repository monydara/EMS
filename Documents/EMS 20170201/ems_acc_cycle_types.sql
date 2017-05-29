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
-- Table structure for table `acc_cycle_types`
--

DROP TABLE IF EXISTS `acc_cycle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cycle_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_code` varchar(6) NOT NULL,
  `cycle_name` varchar(50) DEFAULT NULL,
  `cycle_value` int(11) DEFAULT '0',
  `cycle_per_class` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cycle_types`
--

LOCK TABLES `acc_cycle_types` WRITE;
/*!40000 ALTER TABLE `acc_cycle_types` DISABLE KEYS */;
INSERT INTO `acc_cycle_types` VALUES (1,'MON01','Monthly',1,10,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(2,'QAT03','Qaurterly',3,4,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(3,'SMT06','Semesterly',6,2,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(4,'YER12','Yearly',12,1,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(5,'FULFEE','Full Fee',0,0,'2015-04-19 03:19:40','2015-04-19 03:19:40');
/*!40000 ALTER TABLE `acc_cycle_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:33
