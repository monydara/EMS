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
-- Table structure for table `acd_faculty_subject_details`
--

DROP TABLE IF EXISTS `acd_faculty_subject_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_faculty_subject_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `total_credits` int(11) DEFAULT '0',
  `sessions_per_week` int(11) DEFAULT '0',
  `total_sessions` int(11) DEFAULT '0',
  `durations_per_session` int(11) DEFAULT '0',
  `total_durations` int(11) DEFAULT '0',
  `description` text,
  `is_deleted` tinyint(4) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_faculty_subject_details`
--

LOCK TABLES `acd_faculty_subject_details` WRITE;
/*!40000 ALTER TABLE `acd_faculty_subject_details` DISABLE KEYS */;
INSERT INTO `acd_faculty_subject_details` VALUES (1,1,1,3,3,3,0,0,0,0,0,'',1,1,'2015-10-31 00:22:42','2016-07-06 08:33:56'),(2,1,1,9,4,1,0,0,0,0,0,'',0,1,'2016-07-04 02:21:22','2016-07-04 02:21:22'),(3,1,1,9,4,11,0,0,0,0,0,'',0,1,'2016-07-04 02:22:03','2016-07-04 02:22:03'),(4,1,1,10,3,1,3,2,15,1,45,'',0,1,'2016-07-06 08:33:35','2016-07-06 08:42:33'),(5,1,1,10,3,2,3,30,30,45,45,'',0,1,'2016-07-06 08:35:21','2016-07-06 08:35:21'),(6,1,1,10,4,1,3,2,15,1,45,'',0,1,'2016-07-06 08:45:27','2016-07-06 08:45:27'),(7,1,1,3,3,5,3,2,30,1,45,'',0,1,'2016-07-06 08:45:35','2016-07-06 08:45:35'),(8,1,1,10,4,11,3,2,30,1,45,'',0,1,'2016-07-06 09:28:05','2016-07-06 09:28:05'),(9,1,1,10,4,3,0,0,0,0,0,'',0,1,'2016-07-06 09:28:23','2016-07-06 09:28:23');
/*!40000 ALTER TABLE `acd_faculty_subject_details` ENABLE KEYS */;
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
