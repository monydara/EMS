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
-- Table structure for table `acc_account_masters`
--

DROP TABLE IF EXISTS `acc_account_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_account_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `key_account_id` int(11) DEFAULT NULL,
  `group_account_id` int(11) DEFAULT NULL,
  `credit_control_id` int(11) DEFAULT NULL,
  `fee_plan_detail_id` int(11) DEFAULT NULL,
  `fee_type` varchar(2) DEFAULT NULL,
  `vat_no` varchar(20) DEFAULT NULL,
  `cycle_type_id` int(11) DEFAULT NULL,
  `account_type` varchar(1) DEFAULT NULL,
  `fee_per_cycle` decimal(8,2) DEFAULT '0.00',
  `balance` decimal(8,2) DEFAULT '0.00',
  `status` varchar(1) DEFAULT 'A',
  `user_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_account_masters`
--

LOCK TABLES `acc_account_masters` WRITE;
/*!40000 ALTER TABLE `acc_account_masters` DISABLE KEYS */;
INSERT INTO `acc_account_masters` VALUES (1,NULL,3,1,NULL,3,NULL,'',NULL,NULL,'N',100.00,0.00,'',NULL,NULL,'2016-02-19 01:24:10','2016-02-19 01:24:10'),(3,3,3,1,NULL,3,19,'','',NULL,'I',100.00,0.00,'',NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(4,2,2,1,NULL,3,13,'','',NULL,'N',85.00,0.00,'',NULL,NULL,'2016-02-19 06:02:16','2016-02-19 06:02:16'),(5,3,3,1,NULL,3,19,'','',1,'N',100.00,0.00,'',NULL,NULL,'2016-02-19 06:36:46','2016-02-19 06:36:46'),(6,3,3,1,NULL,3,1,'','',1,'N',100.00,0.00,'A',NULL,NULL,'2016-02-19 06:45:08','2016-02-22 08:02:24'),(7,3,3,1,NULL,3,2,'','',2,'N',200.00,0.00,'A',NULL,NULL,'2016-02-22 08:00:17','2016-02-22 08:01:58'),(8,3,3,1,NULL,3,19,'','',1,'N',100.00,0.00,'A',NULL,NULL,'2016-02-23 00:20:50','2016-02-23 00:20:50'),(9,2,2,1,NULL,3,13,'','',NULL,'N',85.00,0.00,'A',NULL,NULL,'2016-02-24 00:52:01','2016-02-24 00:52:01'),(10,2,2,1,NULL,3,13,'','',NULL,'N',85.00,0.00,'A',NULL,NULL,'2016-02-24 00:52:21','2016-02-24 00:52:21'),(11,4,6,1,1,3,13,'','',NULL,'N',85.00,0.00,'A',NULL,NULL,'2016-02-24 01:07:05','2016-02-27 06:36:51'),(12,3,4,1,NULL,3,4,'','',4,'N',380.00,0.00,'A',NULL,NULL,'2016-02-24 01:10:09','2016-02-24 01:45:34');
/*!40000 ALTER TABLE `acc_account_masters` ENABLE KEYS */;
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
