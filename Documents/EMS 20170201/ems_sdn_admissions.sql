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
-- Table structure for table `sdn_admissions`
--

DROP TABLE IF EXISTS `sdn_admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdn_admissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `admission_no` varchar(30) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `admission_by_id` int(11) DEFAULT NULL,
  `admission_type` varchar(1) DEFAULT 'N',
  `program_type` varchar(1) NOT NULL DEFAULT 'N',
  `tuition_time_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `s_level_id` int(11) DEFAULT NULL,
  `c_level_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_shift_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `start_acd_year_id` int(11) DEFAULT NULL,
  `end_acd_year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `note` text,
  `status` varchar(1) NOT NULL DEFAULT 'N',
  `record_stat` varchar(1) DEFAULT 'O',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reference_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdn_admissions`
--

LOCK TABLES `sdn_admissions` WRITE;
/*!40000 ALTER TABLE `sdn_admissions` DISABLE KEYS */;
INSERT INTO `sdn_admissions` VALUES (1,1,NULL,'12-B0020','2016-11-29',23,'T','N',NULL,NULL,NULL,NULL,8,4,10,3,10,4,NULL,NULL,'','A','O',1,'2016-11-29 03:34:00','2016-11-29 03:34:35',NULL);
/*!40000 ALTER TABLE `sdn_admissions` ENABLE KEYS */;
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
