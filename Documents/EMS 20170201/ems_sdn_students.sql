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
-- Table structure for table `sdn_students`
--

DROP TABLE IF EXISTS `sdn_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdn_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `student_code` varchar(50) DEFAULT NULL,
  `student_no` varchar(13) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `khr_first_name` varchar(50) DEFAULT NULL,
  `khr_last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `date_of_birth` date DEFAULT NULL,
  `registered_date` date DEFAULT NULL,
  `place_of_birth` text,
  `phone_no` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `from_city_id` int(11) DEFAULT NULL,
  `occupation_id` int(11) DEFAULT NULL,
  `national_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `langauge_id` int(11) DEFAULT NULL,
  `ethnicity_id` int(11) DEFAULT NULL,
  `national_no` varchar(30) DEFAULT NULL,
  `passport_no` varchar(30) DEFAULT NULL,
  `note` text,
  `image_url` varchar(255) DEFAULT NULL,
  `handler` varchar(2) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `record_stat` varchar(1) DEFAULT 'O',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdn_students`
--

LOCK TABLES `sdn_students` WRITE;
/*!40000 ALTER TABLE `sdn_students` DISABLE KEYS */;
INSERT INTO `sdn_students` VALUES (1,NULL,NULL,NULL,NULL,'000106','Tak','Songly','តាក់','សុងលី','M','2016-11-29','2016-11-29','PP','093 454 971','','',1,NULL,NULL,NULL,NULL,NULL,'','','','resources/images/photo/no-picture.gif','WU',1,'2016-11-29 03:34:00','2016-11-29 03:34:35','A','O');
/*!40000 ALTER TABLE `sdn_students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:48
