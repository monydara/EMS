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
-- Table structure for table `acc_cash_drawer_trans`
--

DROP TABLE IF EXISTS `acc_cash_drawer_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cash_drawer_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_cash_drawer_id` int(11) DEFAULT NULL,
  `open_by` int(11) DEFAULT NULL,
  `open_amount` decimal(12,2) DEFAULT '0.00',
  `open_amount_khr` decimal(12,2) DEFAULT '0.00',
  `closed_by` int(11) DEFAULT NULL,
  `closed_amount` decimal(12,2) DEFAULT '0.00',
  `closed_amount_khr` decimal(12,2) DEFAULT '0.00',
  `open_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cash_drawer_trans`
--

LOCK TABLES `acc_cash_drawer_trans` WRITE;
/*!40000 ALTER TABLE `acc_cash_drawer_trans` DISABLE KEYS */;
INSERT INTO `acc_cash_drawer_trans` VALUES (1,1,1,100.00,1000.00,NULL,0.00,0.00,'2015-06-28',NULL,1,NULL,NULL),(2,5,1,100.00,0.00,NULL,0.00,0.00,'2016-02-26',NULL,1,'2016-02-26 07:17:42','2016-02-26 07:17:42');
/*!40000 ALTER TABLE `acc_cash_drawer_trans` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:32
