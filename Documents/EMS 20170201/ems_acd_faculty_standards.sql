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
-- Table structure for table `acd_faculty_standards`
--

DROP TABLE IF EXISTS `acd_faculty_standards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_faculty_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_faculty_standards`
--

LOCK TABLES `acd_faculty_standards` WRITE;
/*!40000 ALTER TABLE `acd_faculty_standards` DISABLE KEYS */;
INSERT INTO `acd_faculty_standards` VALUES (1,1,3,3),(2,2,3,3),(3,1,4,3),(4,2,4,3),(5,1,3,4),(6,2,3,4),(7,3,3,4),(8,4,3,4),(9,1,4,4),(10,2,4,4),(11,3,4,4),(12,4,4,4),(13,1,5,4),(14,2,5,4),(15,3,5,4),(16,4,5,4),(17,1,6,4),(18,2,6,4),(19,3,6,4),(20,4,6,4),(21,1,7,4),(22,2,7,4),(23,3,7,4),(24,4,7,4),(25,1,8,4),(26,2,8,4),(27,3,8,4),(28,4,8,4),(29,1,9,4),(30,2,9,4),(31,3,9,4),(32,4,9,4),(33,1,11,4),(34,2,11,4),(35,3,11,4),(36,4,11,4),(37,1,12,4),(38,2,12,4),(39,3,12,4),(40,4,12,4),(41,1,10,4),(42,2,10,4),(43,3,10,4),(44,4,10,4),(45,1,10,3),(46,2,10,3),(47,1,9,3),(48,2,9,3);
/*!40000 ALTER TABLE `acd_faculty_standards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:35
