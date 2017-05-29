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
-- Table structure for table `acc_receipts`
--

DROP TABLE IF EXISTS `acc_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_date` date DEFAULT NULL,
  `receipt_no` varchar(6) DEFAULT NULL,
  `receipt_type` varchar(3) DEFAULT 'OTR',
  `ref_type` varchar(1) DEFAULT 'O',
  `payer_name` varchar(100) DEFAULT NULL,
  `ref_id` int(11) DEFAULT '0',
  `usd_amount` decimal(10,4) DEFAULT '0.0000',
  `khr_amount` decimal(10,4) DEFAULT '0.0000',
  `charges_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `remark` text,
  `is_paid` tinyint(1) DEFAULT '0',
  `paid_date` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `receipt_by_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_receipts`
--

LOCK TABLES `acc_receipts` WRITE;
/*!40000 ALTER TABLE `acc_receipts` DISABLE KEYS */;
INSERT INTO `acc_receipts` VALUES (1,'2016-02-26','','','L','Monydara Sary',2,50.0000,0.0000,50.00,0.00,'',0,NULL,1,1,1,'2016-02-26 04:55:09','2016-02-26 05:03:28'),(2,'2016-02-26','','','L','SOPHAT HENG',1,100.0000,0.0000,100.00,0.00,'',0,NULL,0,1,1,'2016-02-26 05:10:10','2016-02-26 05:10:10');
/*!40000 ALTER TABLE `acc_receipts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:48
