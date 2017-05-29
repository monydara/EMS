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
-- Table structure for table `hr_employees`
--

DROP TABLE IF EXISTS `hr_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `khr_name` varchar(100) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `place_of_birth` varchar(200) DEFAULT NULL,
  `emp_type` varchar(1) DEFAULT NULL,
  `working_time` varchar(2) DEFAULT 'FT',
  `emp_level_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `basic_salary` decimal(10,0) DEFAULT NULL,
  `id_card_no` varchar(30) DEFAULT NULL,
  `passport_no` varchar(30) DEFAULT NULL,
  `national_id` int(11) DEFAULT NULL,
  `ethnicity_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `langauge_id` int(11) DEFAULT NULL,
  `marital_status` varchar(1) DEFAULT NULL,
  `spouse_name` varchar(100) DEFAULT NULL,
  `no_of_child` int(11) DEFAULT NULL,
  `studied_child` int(11) DEFAULT NULL,
  `house_no` varchar(20) DEFAULT NULL,
  `street_no` varchar(50) DEFAULT NULL,
  `group_no` varchar(20) DEFAULT NULL,
  `village` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `commune` varchar(50) DEFAULT NULL,
  `phone_no` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `description` text,
  `status` varchar(2) DEFAULT NULL,
  `photo_path` text,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_employees`
--

LOCK TABLES `hr_employees` WRITE;
/*!40000 ALTER TABLE `hr_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_employees` ENABLE KEYS */;
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
