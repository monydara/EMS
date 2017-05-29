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
-- Table structure for table `acc_charge_items`
--

DROP TABLE IF EXISTS `acc_charge_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_charge_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(6) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `item_type_id` int(11) DEFAULT NULL,
  `charge_amount` decimal(8,2) DEFAULT '0.00',
  `is_editable` tinyint(1) DEFAULT '0',
  `note` text,
  `status` varchar(1) DEFAULT 'A',
  `campus_id` int(11) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_charge_items`
--

LOCK TABLES `acc_charge_items` WRITE;
/*!40000 ALTER TABLE `acc_charge_items` DISABLE KEYS */;
INSERT INTO `acc_charge_items` VALUES (1,'000003','Official Charge',2,50.00,0,'','A',1,0,'2016-02-07 05:55:55','2016-02-26 05:08:43'),(2,'002','Item Allow Edit',1,0.00,1,'','A',1,1,'2016-02-18 18:16:19','2016-02-26 05:08:28'),(3,'000001','Pre-Payment',1,0.00,1,'','A',1,0,'2016-02-26 05:07:51','2016-02-26 05:07:51'),(4,'000002','Deposit',1,0.00,1,'','A',1,0,'2016-02-26 05:08:19','2016-02-26 05:08:19');
/*!40000 ALTER TABLE `acc_charge_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:42
