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
-- Table structure for table `sdn_fee_charges`
--

DROP TABLE IF EXISTS `sdn_fee_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdn_fee_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `key_account_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `cycle_type_id` int(11) DEFAULT NULL,
  `credit_control_id` int(11) DEFAULT NULL,
  `pay_type` varchar(1) DEFAULT NULL,
  `is_vat` tinyint(1) DEFAULT '0',
  `vat_number` varchar(30) DEFAULT NULL,
  `deposit_receipt_no` varchar(6) DEFAULT NULL,
  `deposit_fee` decimal(8,2) DEFAULT '0.00',
  `total_fee` decimal(8,2) DEFAULT '0.00',
  `fee_paid` decimal(8,2) DEFAULT '0.00',
  `credit_balance` decimal(8,2) DEFAULT '0.00',
  `cycle_fee` decimal(8,2) DEFAULT '0.00',
  `net_cycle_fee` decimal(8,2) DEFAULT '0.00',
  `note` text,
  `is_acitve` tinyint(1) DEFAULT '1',
  `end_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdn_fee_charges`
--

LOCK TABLES `sdn_fee_charges` WRITE;
/*!40000 ALTER TABLE `sdn_fee_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `sdn_fee_charges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:47
