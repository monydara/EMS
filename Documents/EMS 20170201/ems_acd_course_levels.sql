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
-- Table structure for table `acd_course_levels`
--

DROP TABLE IF EXISTS `acd_course_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_course_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `level_type_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_course_levels`
--

LOCK TABLES `acd_course_levels` WRITE;
/*!40000 ALTER TABLE `acd_course_levels` DISABLE KEYS */;
INSERT INTO `acd_course_levels` VALUES (1,'CHDRL1','Children Level 1',1,1,1,'2015-09-14 04:12:09','2015-09-14 04:13:55'),(2,'CHDRL2','Children Level 2',1,1,2,'2015-09-14 04:12:36','2015-09-14 04:14:54'),(3,'CHDRL3','Children Level 3',1,1,3,'2015-09-14 04:13:21','2015-09-14 04:15:30'),(4,'FONDL1','Foundation Level 1',1,2,4,'2015-09-14 04:16:27','2015-09-14 04:16:27'),(5,'FONDL2','Foundation Level 2',1,2,5,'2015-09-14 04:16:51','2015-09-14 04:16:59'),(6,'FONDL3','Foundation Level 3',1,2,6,'2015-09-14 04:17:29','2015-09-14 04:17:29'),(7,'BEGNL1','Beginner Level 1',1,3,7,'2015-09-14 04:18:27','2015-09-14 04:18:27'),(8,'BEGNL2','Beginner Level 2',1,3,8,'2015-09-14 04:18:47','2015-09-14 04:18:47'),(9,'BEGNL3','Beginner Level 3',1,3,9,'2015-09-14 04:19:09','2015-09-14 04:19:09'),(10,'ELMTL4','Elementary Level 4',1,4,10,'2015-09-14 04:19:46','2015-09-14 04:22:25'),(11,'ELMTL5','Elementary Level 5',1,4,11,'2015-09-14 04:20:10','2015-09-14 04:22:15'),(12,'ELMTL6','Elementary Level 6',1,4,12,'2015-09-14 04:20:35','2015-09-14 04:21:58'),(13,'PREIND7','Pre-intermediate Level 7',1,5,13,'2015-09-14 04:21:47','2015-09-14 04:21:47'),(14,'PREIND8','Pre-imtermediate Level 8',1,5,14,'2015-09-14 04:24:57','2015-09-14 04:24:57'),(15,'PREIND9','Pre-intermediate Level 9',1,5,15,'2015-09-14 04:25:57','2015-09-14 04:26:07'),(16,'INTMD10','Intermediate Level 10',1,6,16,'2015-09-14 04:42:29','2015-09-14 04:42:29'),(17,'INTMD11','Intermediate Level 11',1,6,17,'2015-09-14 04:42:55','2015-09-14 04:42:55'),(18,'INTMD12','Intermediate Level 12',1,6,18,'2015-09-14 04:43:18','2015-09-14 04:43:18'),(19,'UPIN13','Upper-intermediate Level 13',1,7,19,'2015-09-14 04:44:41','2015-09-14 04:46:31'),(20,'UPIN14','Upper-intermediate Level 14',1,7,20,'2015-09-14 04:45:23','2015-09-14 04:46:44'),(21,'UPIN15','Upper-intermediate Level 15',1,7,21,'2015-09-14 04:45:42','2015-09-14 04:46:56'),(22,'ADVL16','Advanced Level 16',1,8,22,'2015-09-14 04:47:32','2015-09-14 04:47:32'),(23,'ADVL17','Advanced Level 17',1,8,23,'2015-09-14 04:48:06','2015-09-14 04:48:06'),(24,'ADVL18','Advanced Level 18',1,8,24,'2015-09-14 04:48:35','2015-09-14 04:48:35'),(25,'ESP1','ESP LEVEL 1',2,9,25,'2015-10-03 02:27:02','2015-10-03 02:27:02'),(26,'ESP2','ESP LEVEL 2',2,9,26,'2015-10-03 02:27:26','2015-10-03 02:27:26'),(27,'GMCPSP','Part of Speech',14,10,0,'2015-10-30 08:03:21','2015-10-30 08:03:59'),(28,'SPCTR1','Spectrum 1',14,10,0,'2015-10-30 08:06:45','2015-10-30 08:06:57'),(29,'SPCTR2','Spectrum 2',14,10,0,'2015-10-30 08:07:48','2015-10-30 08:08:24');
/*!40000 ALTER TABLE `acd_course_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:40
