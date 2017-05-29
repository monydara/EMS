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
-- Table structure for table `hr_positions`
--

DROP TABLE IF EXISTS `hr_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_positions`
--

LOCK TABLES `hr_positions` WRITE;
/*!40000 ALTER TABLE `hr_positions` DISABLE KEYS */;
INSERT INTO `hr_positions` VALUES (1,'System Administrator','',0,NULL,'2015-05-29 15:14:46'),(4,'Vice Rector','Vice Rector',0,'2015-05-29 15:15:00','2015-05-29 15:15:00'),(5,'Head of Marketing Office','Head of Marketing Office',0,'2015-05-29 15:15:11','2015-05-29 15:15:11'),(6,'Assistant of Marketing','Assistant of Marketing',1,'2015-05-29 15:15:20','2015-08-01 02:00:32'),(7,'Head of Foundation Year','Head of Department of Foundation Year',0,'2015-05-29 15:15:40','2015-05-29 15:15:40'),(8,'Assistant of Foundation Year','Assistant of Foundation Year',0,'2015-05-29 15:15:50','2015-05-29 15:15:50'),(9,'Head of Registrar Office','Head of Registrar Office',0,'2015-05-29 15:16:00','2015-05-29 15:16:00'),(10,'Assistant of Registrar','Assistant of Registrar',0,'2015-05-29 15:16:10','2015-05-29 15:16:10'),(11,'GEP Officer','GEP Officer',0,'2015-05-29 15:16:19','2015-05-29 15:16:19'),(12,'Vice Dean ot Graduate Office Director of IP','Vice Dean ot Graduate, Office Director of IP',0,'2015-05-29 15:16:30','2016-07-05 04:11:17'),(13,'Head of Accouting','Head of Accouting',0,'2015-05-29 15:16:55','2015-05-29 15:16:55'),(14,'Assistant of Accouting','Assistant of Accouting',1,'2015-05-29 15:17:04','2015-08-01 02:00:36'),(15,'Registrar Officer','',0,'2015-12-03 03:02:16','2015-12-03 03:02:16'),(16,'Head of Internal Audit','',0,'2015-12-06 06:14:07','2015-12-06 06:14:54'),(17,'Internal Audit Officer','',0,'2015-12-06 06:14:35','2015-12-06 06:15:09'),(18,'Director, GEP','',0,'2016-06-07 17:14:16','2016-06-07 17:14:16'),(19,'Assistant of GEP','Assistant of GEP',0,'2016-06-07 17:14:59','2016-06-07 17:14:59'),(20,'Rector','',0,'2016-06-07 17:31:02','2016-06-07 17:31:02'),(21,'IT Officer','Information Technology',0,'2016-06-09 09:55:01','2016-07-05 04:09:55'),(22,'Coordinator of English Department','Coordinator of English Department',0,'2016-07-04 04:34:19','2016-07-05 04:12:57'),(23,'Assistant of English Department','Assistant of English Department',0,'2016-07-04 04:34:41','2016-07-05 04:12:30'),(24,'Assistant of Business-Eco and Tour','Assistant of Business-Eco and Tour',0,'2016-07-04 04:35:16','2016-07-04 04:35:16'),(25,'Vice Dean of Faculty of Business-Eco and Tour','Faculty of Business-Eco and Tour',0,'2016-07-04 04:37:31','2016-07-04 04:37:31'),(26,'Dean of Faculty of Arts, Humanities and Languages','Dean of Faculty of Arts, Humanities and Languages',0,'2016-07-04 04:38:39','2016-07-05 04:14:06'),(27,'Dean of Faculty of Business-Eco and Tour','Dean of Faculty of Business-Eco and Tour',0,'2016-07-04 04:39:19','2016-07-05 04:14:16'),(28,'Dean of Faculty Computer Science','Dean of Faculty Computer Science',0,'2016-07-04 11:17:11','2016-07-05 04:13:52');
/*!40000 ALTER TABLE `hr_positions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:45
