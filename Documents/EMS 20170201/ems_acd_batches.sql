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
-- Table structure for table `acd_batches`
--

DROP TABLE IF EXISTS `acd_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gen_campus_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_batches`
--

LOCK TABLES `acd_batches` WRITE;
/*!40000 ALTER TABLE `acd_batches` DISABLE KEYS */;
INSERT INTO `acd_batches` VALUES (1,'01','Batch 1',1,0,'2015-10-30 07:07:17','2015-10-30 07:07:17','ជំនាន់ទី១'),(2,'02','Batch 2',1,0,'2015-12-03 03:44:58','2015-12-03 03:44:58','ជំនាន់ទី២'),(3,'03','Batch 3',1,0,'2015-12-03 03:45:50','2015-12-03 03:45:50','ជំនាន់ទី៣'),(4,'04','Batch 4',1,0,'2015-12-03 03:46:27','2015-12-03 03:46:27','ជំនាន់ទី៤'),(5,'05','Batch 5',1,0,'2015-12-03 03:47:12','2015-12-03 03:47:12','ជំនាន់ទី៥'),(6,'10','Batch 10',1,0,'2015-12-03 03:47:54','2015-12-03 03:47:54','ជំនាន់ទី១០'),(7,'11','Batch 11',1,0,'2015-12-03 03:48:35','2015-12-03 03:48:35','ជំនាន់ទី១១'),(8,'12','Batch 12',1,0,'2015-12-03 03:49:10','2015-12-03 03:49:10','ជំនាន់ទី១២'),(9,'13','Batch 13',1,0,'2015-12-03 03:49:40','2015-12-03 03:49:40','ជំនាន់ទី១៣'),(10,'07','Batch 7',1,0,'2016-02-17 02:34:33','2016-02-17 02:34:33','ជំនាន់​ ៧'),(11,'14','Batch 14 ',1,0,'2016-06-07 23:28:04','2016-06-07 23:28:04','ជំនាន់ទី១៤'),(12,'15','Batch 15',1,0,'2016-06-07 23:28:47','2016-06-07 23:28:47','ជំនាន់ទី១៥');
/*!40000 ALTER TABLE `acd_batches` ENABLE KEYS */;
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
