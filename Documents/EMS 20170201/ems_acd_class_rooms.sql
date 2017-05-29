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
-- Table structure for table `acd_class_rooms`
--

DROP TABLE IF EXISTS `acd_class_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_class_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_seat` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_class_rooms`
--

LOCK TABLES `acd_class_rooms` WRITE;
/*!40000 ALTER TABLE `acd_class_rooms` DISABLE KEYS */;
INSERT INTO `acd_class_rooms` VALUES (1,'LAB01','Language Lab','',60,1,1,'2015-05-29 17:37:33','2016-06-09 03:07:20','Language Lab'),(2,'ROM01','Ireland','',30,1,0,'2015-09-14 08:15:01','2015-09-14 08:24:33','Ireland'),(3,'ROM02','England','',40,1,1,'2015-09-14 08:15:29','2016-06-09 03:07:28','England'),(4,'ROM03','Italy','',40,1,1,'2015-09-14 08:16:18','2016-06-09 03:07:32','Italy'),(5,'ROM04','Germany','',50,1,1,'2015-09-14 08:17:04','2016-06-09 03:07:39','Germany'),(6,'ROM05','Russia','',48,1,1,'2015-09-14 08:17:56','2016-06-09 03:07:43','Russia'),(7,'ROM06','Teacher Room 1st Floor','',10,1,0,'2015-09-14 08:24:09','2015-09-14 08:40:59','Teacher room'),(8,'LAB02','Computer Lab','',48,1,1,'2015-09-14 08:26:05','2016-06-09 03:07:49','Computer Lab'),(9,'ROM07','Australia','',80,1,1,'2015-09-14 08:27:53','2016-06-09 03:07:54','Australia'),(10,'ROM08','Laos','',48,1,0,'2015-09-14 08:28:38','2015-09-14 08:28:38','Laos'),(11,'ROM09','Meeting Room','',15,1,0,'2015-09-14 08:29:11','2015-09-14 08:29:11','Meeting Room'),(12,'ROM10','India','',48,1,1,'2015-09-14 08:29:47','2016-06-09 03:08:53','India'),(13,'ROM11','Japan','',50,1,1,'2015-09-14 08:30:21','2016-06-09 03:08:57','Japan'),(14,'ROM12','Cambodia','',48,1,1,'2015-09-14 08:30:46','2016-06-09 03:09:01','Cambodia'),(15,'ROM13','Malaysia','',24,1,0,'2015-09-14 08:32:07','2015-09-14 08:32:07','Malaysia'),(16,'ROM14','Korea','',72,1,1,'2015-09-14 08:32:36','2016-06-09 03:09:05','Korea'),(17,'ROM15','Singapore','',20,1,0,'2015-09-14 08:33:27','2015-09-14 08:33:27','Singapore'),(18,'ROM16','China','',50,1,1,'2015-09-14 08:34:11','2016-06-09 03:09:13','China'),(19,'ROM17','Research Room','',11,1,0,'2015-09-14 08:35:02','2015-09-14 08:35:02','Research Room'),(20,'ROM18','Agentina','',13,1,1,'2015-09-14 08:35:32','2016-06-09 03:09:32','Agentina'),(21,'ROM19','Costa Rica','',14,1,0,'2015-09-14 08:36:06','2015-09-14 08:36:06','Costa Rica'),(22,'ROM20','Paraguay','',24,1,0,'2015-09-14 08:36:36','2015-09-14 08:36:36','Paraguay'),(23,'ROM21','Peru','',42,1,0,'2015-09-14 08:37:08','2015-09-14 08:37:08','Peru'),(24,'ROM22','Brazil','',66,1,1,'2015-09-14 08:37:58','2016-06-09 03:09:43','Brazil'),(25,'ROM22','Columbia','',36,1,0,'2015-09-14 08:39:33','2016-06-11 01:52:46','Columbia'),(26,'ROM23','Teacher Room 3th Floor','',15,1,0,'2015-09-14 08:40:29','2016-06-11 01:52:57','Teacher Room 3th Floor'),(27,'ROM25','Ghana','',44,1,1,'2015-09-14 08:41:42','2016-06-09 03:09:48','Ghana'),(28,'ROM26','Kenya','',82,1,1,'2015-09-14 08:42:22','2016-06-09 03:09:53','Kenya'),(29,'ROM24','Nigeria','',30,1,0,'2015-09-14 08:44:19','2016-06-11 01:53:06','Nigeria'),(30,'ROM28','South Africa','',64,1,1,'2015-09-14 08:44:52','2016-06-09 03:09:57','South Africa'),(31,'ROM07','Italy','',25,1,0,'2016-06-11 01:41:57','2016-06-11 01:41:57','អ៊ីតាលី'),(32,'ROM02','Toronto','',20,1,0,'2016-06-11 01:44:39','2016-06-11 01:44:39','Toronto'),(33,'ROM03','Paris','',20,1,0,'2016-06-11 01:47:05','2016-06-11 01:47:05','Paris'),(34,'ROM04','Seoul','',20,1,0,'2016-06-11 01:47:49','2016-06-11 01:47:49','Seoul'),(35,'ROM05','Connecticut','',20,1,0,'2016-06-11 01:48:20','2016-06-11 01:48:20','Connecticut'),(36,'ROM10','Washington','',20,1,0,'2016-06-11 01:48:58','2016-06-11 01:48:58','Washington'),(37,'ROM11','Florida','',20,1,0,'2016-06-11 01:49:31','2016-06-11 01:49:31','Florida'),(38,'ROM12','California','',20,1,0,'2016-06-11 01:50:07','2016-06-11 01:50:07','California'),(39,'ROM14','Vanvouver','',20,1,0,'2016-06-11 01:50:46','2016-06-11 01:50:46','Vanvouver'),(40,'ROM16','Hawaii','',20,1,0,'2016-06-11 01:52:01','2016-06-11 01:52:01','Hawaii'),(41,'ROM18','Los Angeles','',20,1,0,'2016-06-11 01:52:33','2016-06-11 01:52:33','Los Angeles');
/*!40000 ALTER TABLE `acd_class_rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:36
