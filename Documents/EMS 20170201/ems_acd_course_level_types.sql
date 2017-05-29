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
-- Table structure for table `acd_course_level_types`
--

DROP TABLE IF EXISTS `acd_course_level_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_course_level_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_course_level_types`
--

LOCK TABLES `acd_course_level_types` WRITE;
/*!40000 ALTER TABLE `acd_course_level_types` DISABLE KEYS */;
INSERT INTO `acd_course_level_types` VALUES (1,'CDL','Children Level',0,'2015-09-14 04:06:33','2015-09-14 04:06:33'),(2,'FDL','Foundation Level',0,'2015-09-14 04:07:02','2015-09-14 04:07:02'),(3,'BGL','Beginner Level',0,'2015-09-14 04:07:24','2015-09-14 04:07:24'),(4,'ELL','Elementary Level',0,'2015-09-14 04:07:47','2015-09-14 04:07:47'),(5,'PIL','Pre-intermediate Level',0,'2015-09-14 04:08:32','2015-09-14 04:08:32'),(6,'IDL','Intermediate Level',0,'2015-09-14 04:08:56','2015-09-14 04:08:56'),(7,'UPL','Upper-intermediate Level',0,'2015-09-14 04:09:44','2015-09-14 04:09:52'),(8,'ADL','Advanced Level',0,'2015-09-14 04:11:11','2015-09-14 04:11:11'),(9,'ESP','ESP',0,'2015-10-03 02:26:10','2015-10-03 02:26:10'),(10,'GMC','English Grammar',0,'2015-10-30 07:42:44','2015-10-30 07:42:44'),(11,'NPC','Newspaper',0,'2015-10-30 07:58:21','2015-10-30 07:58:21');
/*!40000 ALTER TABLE `acd_course_level_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:44
