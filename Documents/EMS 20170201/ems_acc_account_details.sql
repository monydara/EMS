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
-- Table structure for table `acc_account_details`
--

DROP TABLE IF EXISTS `acc_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_account_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(1) DEFAULT NULL,
  `item_unit` varchar(1) DEFAULT NULL,
  `item_value` decimal(8,2) DEFAULT '0.00',
  `is_recurring` tinyint(1) DEFAULT NULL,
  `recurring_val` int(11) DEFAULT '0',
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `comments` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `status` varchar(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_account_details`
--

LOCK TABLES `acc_account_details` WRITE;
/*!40000 ALTER TABLE `acc_account_details` DISABLE KEYS */;
INSERT INTO `acc_account_details` VALUES (1,1,1,'D','P',5.00,1,2,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 01:24:10','2016-02-19 01:24:10'),(3,3,2,'D','P',10.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(4,3,1,'A',NULL,50.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(5,3,1,'T','P',10.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(6,4,1,'A','A',50.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 06:02:16','2016-02-19 06:02:16'),(7,7,1,'A','A',50.00,NULL,NULL,'2016-02-22',NULL,'',NULL,NULL,NULL,'2016-02-22 08:01:58','2016-02-22 08:01:58'),(8,6,1,'A','A',50.00,NULL,NULL,'2016-02-22',NULL,'',NULL,NULL,NULL,'2016-02-22 08:02:24','2016-02-22 08:02:24'),(9,7,1,'T','P',10.00,NULL,NULL,'2016-02-22',NULL,'',NULL,NULL,NULL,'2016-02-22 08:02:37','2016-02-22 08:02:37'),(10,8,1,'D','P',5.00,NULL,NULL,'2016-02-23',NULL,'',NULL,NULL,NULL,'2016-02-23 00:20:50','2016-02-23 00:20:50'),(11,8,2,'A','A',3.00,NULL,NULL,'2016-02-23',NULL,'',NULL,NULL,NULL,'2016-02-23 00:20:50','2016-02-23 00:20:50'),(12,12,5,'D','A',10.00,NULL,NULL,'2016-02-24',NULL,'',1,NULL,NULL,'2016-02-24 01:10:09','2016-02-24 01:45:09'),(13,12,1,'A','A',50.00,NULL,NULL,'2016-02-24',NULL,'',NULL,NULL,NULL,'2016-02-24 01:45:34','2016-02-24 01:45:34'),(14,12,1,'T','P',10.00,1,0,'2016-02-24',NULL,'',NULL,NULL,NULL,'2016-02-24 01:46:33','2016-02-24 01:46:33'),(15,11,3,'A','A',9.00,NULL,NULL,'2016-02-27',NULL,'',0,NULL,NULL,'2016-02-27 06:23:08','2016-02-27 06:23:08');
/*!40000 ALTER TABLE `acc_account_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:46
