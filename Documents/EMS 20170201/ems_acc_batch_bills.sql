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
-- Table structure for table `acc_batch_bills`
--

DROP TABLE IF EXISTS `acc_batch_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_batch_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_bill_code` varchar(6) DEFAULT NULL,
  `batch_bill_name` varchar(50) DEFAULT NULL,
  `batch_type` varchar(2) DEFAULT 'TC',
  `start_date` date DEFAULT NULL,
  `last_bill_date` date DEFAULT NULL,
  `next_bill_date` date DEFAULT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `cycle_type_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'P',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_batch_bills`
--

LOCK TABLES `acc_batch_bills` WRITE;
/*!40000 ALTER TABLE `acc_batch_bills` DISABLE KEYS */;
INSERT INTO `acc_batch_bills` VALUES (1,'B00001','Batch Invoices Semester 2015','TC','2015-09-10',NULL,NULL,1,3,1,'A',1,'2015-08-27 15:02:08','2015-08-27 16:58:39'),(2,'B00002','Batch Invoices Yearly 2015','TC','2015-09-10',NULL,NULL,1,4,1,'A',1,'2015-08-27 15:48:07','2015-08-27 16:58:33');
/*!40000 ALTER TABLE `acc_batch_bills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:36
