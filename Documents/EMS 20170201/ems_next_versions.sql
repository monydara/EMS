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
-- Table structure for table `next_versions`
--

DROP TABLE IF EXISTS `next_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `next_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `next_code` int(11) DEFAULT NULL,
  `degit` int(11) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_versions`
--

LOCK TABLES `next_versions` WRITE;
/*!40000 ALTER TABLE `next_versions` DISABLE KEYS */;
INSERT INTO `next_versions` VALUES (1,'STUDENT CODE TC','Campus Abbr-Batch Code-Degree-Course Abbr-DDMMYY-R000 ',1,3,NULL,1,'2015-05-29 14:23:30','2015-09-19 10:22:33'),(2,'STUDENT_NO','',107,6,NULL,1,'2015-05-29 14:23:30','2016-11-29 03:34:35'),(5,'RECEIPT','',1,6,'',1,'2015-07-30 12:42:48','2016-02-27 07:41:37'),(6,'ACCOUNT NO','',257,8,'',1,'2015-08-06 16:26:38','2016-12-01 08:11:36'),(9,'ADMISSION NO. TC','',87,6,'',1,'2015-10-02 15:09:36','2016-06-23 04:54:51'),(10,'ADMISSION NO. WU','',21,4,'',1,'2015-10-02 15:09:36','2016-11-29 03:34:35'),(11,'INVOICE NO',NULL,1,6,NULL,1,'2015-10-02 15:09:36','2016-02-27 01:26:56');
/*!40000 ALTER TABLE `next_versions` ENABLE KEYS */;
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
