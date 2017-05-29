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
-- Table structure for table `acc_fee_plans`
--

DROP TABLE IF EXISTS `acc_fee_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fee_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_cat_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `tuition_time_id` int(11) DEFAULT NULL,
  `plan_code` varchar(6) DEFAULT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_delleted` tinyint(1) DEFAULT NULL,
  `plan_type` varchar(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fee_plans`
--

LOCK TABLES `acc_fee_plans` WRITE;
/*!40000 ALTER TABLE `acc_fee_plans` DISABLE KEYS */;
INSERT INTO `acc_fee_plans` VALUES (11,1,NULL,2,'01','Children',1,1,'',1,0,'',1,1,'2016-02-15 18:00:32','2016-02-15 18:00:32'),(12,1,1,NULL,'002','Plan Name',3,3,'This description',1,0,'',1,1,'2016-02-16 10:29:20','2016-02-16 10:29:20'),(13,1,1,NULL,'004','Plan Name',4,3,'',1,0,'',1,1,'2016-02-16 11:10:53','2016-02-17 01:01:48'),(14,5,10,NULL,'123','Bussiness Administration',3,3,'',1,0,'',1,1,'2016-02-17 02:35:41','2016-02-17 02:35:41'),(15,5,10,NULL,'112','Hotel And Tourism Management',3,4,'',1,0,'',1,1,'2016-02-17 02:49:18','2016-02-17 02:49:18'),(16,5,NULL,1,'311','Children',1,1,'uytuytt6t76t',1,0,'',1,1,'2016-02-17 02:59:49','2016-02-23 01:20:50'),(17,5,NULL,1,'312','Foundation',1,1,'',1,0,'',1,1,'2016-02-17 03:01:31','2016-02-17 03:01:31'),(18,5,9,NULL,'111','sdf',4,3,'',1,0,'',1,1,'2016-02-18 04:08:14','2016-02-18 04:08:14'),(19,5,NULL,2,'222','sdfdsf',1,1,'',1,0,'',1,1,'2016-02-22 08:17:41','2016-02-24 00:47:27'),(20,5,9,NULL,'115','Computer Science',4,9,'',1,0,'',1,1,'2016-02-24 01:41:43','2016-02-24 01:41:43');
/*!40000 ALTER TABLE `acc_fee_plans` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:38
