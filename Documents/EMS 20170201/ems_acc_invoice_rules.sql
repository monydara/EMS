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
-- Table structure for table `acc_invoice_rules`
--

DROP TABLE IF EXISTS `acc_invoice_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_invoice_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(50) DEFAULT NULL,
  `from_days` int(11) DEFAULT '0',
  `to_days` int(11) DEFAULT '0',
  `credit_control_id` int(11) DEFAULT NULL,
  `alert_type_id` int(11) DEFAULT NULL,
  `action_type_id` int(11) DEFAULT NULL,
  `charge_per_day` decimal(8,2) DEFAULT '0.00',
  `description` text,
  `is_active` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_invoice_rules`
--

LOCK TABLES `acc_invoice_rules` WRITE;
/*!40000 ALTER TABLE `acc_invoice_rules` DISABLE KEYS */;
INSERT INTO `acc_invoice_rules` VALUES (1,'Reminder 1',10,30,1,1,2,0.00,NULL,1,1,NULL,'2015-08-08 06:57:12'),(2,'Reminder 1',10,15,2,1,2,0.00,'After issued date 10 to 15 days system warning',1,1,'2015-08-08 06:55:47','2015-08-08 06:57:07'),(3,'Reminder 1 time',3,30,3,1,2,0.00,'',1,0,'2015-08-08 07:52:09','2015-08-08 07:52:09'),(4,'Penalty',31,60,3,1,3,0.50,'',1,0,'2015-08-08 07:53:28','2016-02-26 07:16:21'),(5,'Lock Student',61,0,3,1,4,0.00,'',1,0,'2015-08-08 07:54:52','2015-08-08 07:54:52'),(6,'Reminder',30,0,4,1,2,0.00,'',1,0,'2015-08-08 07:58:04','2015-08-08 07:58:04');
/*!40000 ALTER TABLE `acc_invoice_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:34
