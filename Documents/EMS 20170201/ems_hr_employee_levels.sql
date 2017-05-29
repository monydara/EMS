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
-- Table structure for table `hr_employee_levels`
--

DROP TABLE IF EXISTS `hr_employee_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_employee_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_level` varchar(50) DEFAULT NULL,
  `khr_emp_level` varchar(50) DEFAULT NULL,
  `description` text,
  `level_value` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_employee_levels`
--

LOCK TABLES `hr_employee_levels` WRITE;
/*!40000 ALTER TABLE `hr_employee_levels` DISABLE KEYS */;
INSERT INTO `hr_employee_levels` VALUES (1,'Director','អគ្គនាយក',NULL,1,0,NULL,NULL),(2,'Vice Rector','អគ្គនាយករង',NULL,2,0,NULL,NULL),(3,'Head of Department','ប្រធាននាយកដ្ជាន',NULL,3,0,NULL,NULL),(4,'Manager','អ្កកប្រគប់គ្រង',NULL,4,0,NULL,NULL),(5,'Supervisor',NULL,NULL,5,1,NULL,'2015-08-01 02:10:50'),(6,'Senior','បុគ្គលិកជំនាញ',NULL,6,1,NULL,'2015-08-01 02:10:44'),(7,'Officer','បុគ្គលិកការិយាល័យ',NULL,7,0,NULL,NULL),(8,'Volunteer',NULL,NULL,8,0,NULL,NULL),(9,'Trainer',NULL,NULL,9,1,NULL,'2015-08-01 02:10:54'),(10,'test','ដសថសដ','សដថសដ',9,1,'2015-08-01 02:08:02','2015-08-01 02:08:20');
/*!40000 ALTER TABLE `hr_employee_levels` ENABLE KEYS */;
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
