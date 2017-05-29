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
-- Table structure for table `acc_cash_drawers`
--

DROP TABLE IF EXISTS `acc_cash_drawers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cash_drawers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cdg_id` int(11) DEFAULT NULL,
  `sys_user_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cash_drawers`
--

LOCK TABLES `acc_cash_drawers` WRITE;
/*!40000 ALTER TABLE `acc_cash_drawers` DISABLE KEYS */;
INSERT INTO `acc_cash_drawers` VALUES (1,1,1,1,0,1,'2015-06-27 08:30:51','2015-06-27 08:31:48'),(2,2,12,1,0,1,'2015-06-27 08:31:08','2015-06-27 08:31:29'),(3,2,1,1,0,1,'2015-07-14 09:41:44','2015-07-14 09:41:44'),(4,2,2,1,0,1,'2015-07-14 09:41:44','2015-07-14 09:41:44'),(5,1,3,1,0,1,'2016-02-26 06:43:37','2016-02-26 06:43:37'),(6,1,4,1,0,1,'2016-02-26 06:43:37','2016-02-26 06:43:37'),(7,1,5,1,0,1,'2016-02-26 06:43:37','2016-02-26 06:43:37'),(8,1,10,1,0,1,'2016-02-26 06:43:59','2016-02-26 06:43:59'),(9,1,11,1,0,1,'2016-02-26 06:43:59','2016-02-26 06:43:59'),(10,2,13,1,0,1,'2016-02-26 06:44:17','2016-02-26 06:44:17'),(11,2,14,1,0,1,'2016-02-26 06:44:17','2016-02-26 06:44:17');
/*!40000 ALTER TABLE `acc_cash_drawers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:33
