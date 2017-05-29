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
-- Table structure for table `hr_departments`
--

DROP TABLE IF EXISTS `hr_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_departments`
--

LOCK TABLES `hr_departments` WRITE;
/*!40000 ALTER TABLE `hr_departments` DISABLE KEYS */;
INSERT INTO `hr_departments` VALUES (1,'IT','Information Office',0,NULL,'2016-06-09 10:06:06'),(2,'Management',NULL,0,NULL,NULL),(3,'Registrar','Department of Registrar',1,NULL,'2015-08-01 02:00:15'),(4,'Foundation Year','Department of Foundation Year',0,NULL,'2015-05-29 15:12:27'),(5,'Marketing','Department of Marketing',0,NULL,'2015-05-29 15:12:44'),(6,'Accounting','Department of Accounting',0,NULL,'2015-05-29 15:12:56'),(7,'Human Resource','Department of HR',0,NULL,'2015-05-29 15:13:09'),(8,'GEP Office','GEP Office',0,NULL,'2015-05-29 15:13:49'),(9,'Graduate Office','Graduate Office',1,NULL,'2015-08-01 02:00:23'),(10,'Registrar Office','Office of Registrar ',0,'2015-12-03 03:01:58','2016-07-05 04:07:52'),(11,'Internal Audit','Internal Audit Department',0,'2015-12-06 06:16:54','2015-12-06 06:16:54'),(12,'Business-Eco and Tour','Faculty of Business-Eco and Tour',0,'2016-07-04 04:31:16','2016-07-05 04:06:23'),(13,'English','Faculty of Arts, Humanities and Languages',0,'2016-07-04 04:32:41','2016-07-05 04:06:56'),(14,'Computer Science ','Faculty of Technology  ',0,'2016-07-04 11:15:38','2016-07-05 04:07:13');
/*!40000 ALTER TABLE `hr_departments` ENABLE KEYS */;
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
