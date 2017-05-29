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
-- Table structure for table `sdn_city_states`
--

DROP TABLE IF EXISTS `sdn_city_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdn_city_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(6) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `city_name_khr` varchar(50) NOT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdn_city_states`
--

LOCK TABLES `sdn_city_states` WRITE;
/*!40000 ALTER TABLE `sdn_city_states` DISABLE KEYS */;
INSERT INTO `sdn_city_states` VALUES (1,'023','Phnom Pehn','ភ្តំពេញ','ភ្តំពេញ',0,'2015-08-18 09:47:17','2015-08-18 09:47:17'),(2,'SRP','Siem Reap','សៀមរាប','សៀមរាប',0,'2015-08-18 09:48:37','2015-08-18 09:48:37'),(3,'KRT','Kratie','Kratie','Kratie',0,'2015-08-18 09:50:54','2015-08-18 09:50:54'),(4,'KPC','Kam Pong Cham','Kam Pong Cham','Kam Pong Cham',0,'2015-08-18 09:54:06','2015-08-18 09:54:06'),(5,'SVR','Svay Reang','ស្វាយរៀង','ស្វាយរៀង',0,'2015-10-02 16:21:03','2015-10-02 16:21:03');
/*!40000 ALTER TABLE `sdn_city_states` ENABLE KEYS */;
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
