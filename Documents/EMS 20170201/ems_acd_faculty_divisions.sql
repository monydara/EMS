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
-- Table structure for table `acd_faculty_divisions`
--

DROP TABLE IF EXISTS `acd_faculty_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_faculty_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_faculty_divisions`
--

LOCK TABLES `acd_faculty_divisions` WRITE;
/*!40000 ALTER TABLE `acd_faculty_divisions` DISABLE KEYS */;
INSERT INTO `acd_faculty_divisions` VALUES (1,1,2,3,3),(2,2,2,3,3),(3,1,1,3,3),(4,2,1,3,3),(5,1,1,3,4),(6,2,1,3,4),(7,1,2,3,4),(8,2,2,3,4),(9,1,3,3,4),(10,2,3,3,4),(11,1,4,3,4),(12,2,4,3,4),(13,1,1,9,4),(14,2,1,9,4),(15,1,1,10,3),(16,2,1,10,3),(17,1,1,10,4),(18,2,1,10,4),(19,1,2,10,3),(20,1,1,9,3),(21,2,1,9,3),(22,1,2,9,3),(23,2,2,9,3),(24,1,2,9,4),(25,2,2,9,4);
/*!40000 ALTER TABLE `acd_faculty_divisions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:47
