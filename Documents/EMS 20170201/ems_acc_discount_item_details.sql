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
-- Table structure for table `acc_discount_item_details`
--

DROP TABLE IF EXISTS `acc_discount_item_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_discount_item_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_discount_item_id` int(11) DEFAULT NULL,
  `is_allow_edit` tinyint(1) DEFAULT '0',
  `note` text,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `discount_unit` varchar(1) DEFAULT NULL,
  `discount_value` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_discount_item_details`
--

LOCK TABLES `acc_discount_item_details` WRITE;
/*!40000 ALTER TABLE `acc_discount_item_details` DISABLE KEYS */;
INSERT INTO `acc_discount_item_details` VALUES (1,1,0,'Discount 5%',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','P',5),(2,1,0,'Discount 10%',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','P',10),(3,1,0,'',1,'2015-05-29 17:06:55','2015-05-29 17:06:55','P',0),(4,1,0,'Discount $50',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','A',50),(5,1,1,'Custom Discount can be edit value on front line',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','A',0),(6,1,0,'',1,'2015-06-21 03:02:33','2015-06-21 03:02:33','A',0),(7,2,NULL,'',0,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',10),(8,2,NULL,'',0,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',15),(9,2,NULL,'',0,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',20),(10,2,1,'Custom Discount',1,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',0),(11,3,1,'',0,'2015-08-26 15:15:39','2015-08-26 15:15:39','A',0),(12,3,1,'',0,'2015-08-26 15:15:39','2015-08-26 15:15:39','P',0);
/*!40000 ALTER TABLE `acc_discount_item_details` ENABLE KEYS */;
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
