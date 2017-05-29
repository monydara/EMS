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
-- Table structure for table `acc_discount_items`
--

DROP TABLE IF EXISTS `acc_discount_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_discount_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(6) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `is_all_courses` tinyint(1) DEFAULT '0',
  `discount_type_id` int(11) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `Autherizer` varchar(100) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `note` text,
  `is_del` tinyint(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_discount_items`
--

LOCK TABLES `acc_discount_items` WRITE;
/*!40000 ALTER TABLE `acc_discount_items` DISABLE KEYS */;
INSERT INTO `acc_discount_items` VALUES (1,'100','Discount Promo. 2015',1,2,'2015-05-30','2016-05-30','H.E TE Laurent','50400','',0,1,'2015-05-29 17:06:55','2015-06-21 03:11:06'),(2,'PRO15','Discount BAC 2014 ',1,2,'2015-08-08','2015-12-31','123213','','',0,1,'2015-08-08 08:46:27','2015-08-08 08:46:27'),(3,'0001','None Fee Discount',1,1,'2015-08-26','2020-09-30','','','',0,1,'2015-08-26 15:15:39','2015-08-26 15:20:07');
/*!40000 ALTER TABLE `acc_discount_items` ENABLE KEYS */;
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
