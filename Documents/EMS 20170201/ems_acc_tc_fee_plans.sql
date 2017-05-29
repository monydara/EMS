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
-- Table structure for table `acc_tc_fee_plans`
--

DROP TABLE IF EXISTS `acc_tc_fee_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_tc_fee_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_plan_master_id` int(11) DEFAULT NULL,
  `plan_code` varchar(6) DEFAULT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `is_full_time` tinyint(1) DEFAULT '1',
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `term_one_fee` decimal(12,2) DEFAULT '0.00',
  `term_two_fee` decimal(12,2) DEFAULT '0.00',
  `term_three_fee` decimal(12,2) DEFAULT '0.00',
  `term_four_fee` decimal(12,2) DEFAULT '0.00',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_tc_fee_plans`
--

LOCK TABLES `acc_tc_fee_plans` WRITE;
/*!40000 ALTER TABLE `acc_tc_fee_plans` DISABLE KEYS */;
INSERT INTO `acc_tc_fee_plans` VALUES (1,2,'311','Children (1,2,3)',1,1,1,90.00,90.00,90.00,90.00,1,0,'2015-08-25 13:47:18','2015-08-25 13:47:18'),(2,2,'312','Foundation (1,2,3)',1,1,1,90.00,90.00,90.00,90.00,1,0,'2015-08-25 15:34:18','2015-08-25 15:39:27');
/*!40000 ALTER TABLE `acc_tc_fee_plans` ENABLE KEYS */;
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
