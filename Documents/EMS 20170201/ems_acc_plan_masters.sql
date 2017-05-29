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
-- Table structure for table `acc_plan_masters`
--

DROP TABLE IF EXISTS `acc_plan_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_plan_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_master_name` varchar(50) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `khr_rate` decimal(10,4) DEFAULT NULL,
  `description` text,
  `is_tc` tinyint(1) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `acd_batche_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_plan_masters`
--

LOCK TABLES `acc_plan_masters` WRITE;
/*!40000 ALTER TABLE `acc_plan_masters` DISABLE KEYS */;
INSERT INTO `acc_plan_masters` VALUES (1,'WU Fee Plan 2015 Batch 4',2015,'2015-03-15','2016-03-15',4100.0000,'',0,1,1,0,'2015-08-25 13:25:00','2015-08-25 13:32:54',4),(2,'TC Tuition Fee 2015',2015,'2015-03-15','2016-03-15',4100.0000,'',1,1,1,0,'2015-08-25 13:35:44','2015-08-25 14:00:24',NULL),(3,'WU Fee Plan 2015 Batch 5',2015,'2015-03-15','2016-03-15',4100.0000,'',0,1,1,0,'2015-08-26 13:27:41','2015-08-26 13:30:02',5);
/*!40000 ALTER TABLE `acc_plan_masters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:41
