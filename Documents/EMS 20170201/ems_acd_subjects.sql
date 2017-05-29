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
-- Table structure for table `acd_subjects`
--

DROP TABLE IF EXISTS `acd_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `subject_type_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `sessions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_subjects`
--

LOCK TABLES `acd_subjects` WRITE;
/*!40000 ALTER TABLE `acd_subjects` DISABLE KEYS */;
INSERT INTO `acd_subjects` VALUES (1,'S00001','Core English I A','','2015-05-29 17:48:28','2016-06-28 10:30:53',1,1,0,'ភាសាអង់គ្លេសស្នូល',3,30),(2,'S00002','Listening & Speaking','','2015-05-29 18:32:21','2016-06-28 10:29:01',1,1,0,'មុខវិជ្ចាស្តាប់ និង​ និយាយ',3,15),(3,'S00003','Basic English for Communication','','2015-05-30 00:05:36','2015-08-22 15:14:17',1,1,1,'មូលដ្ឌានគ្រឹះភាសាអង់គ្លេសសំរាប់ទំនាក់ទំនង',3,45),(4,'S0003','C++ Programming I','','2015-08-09 06:23:51','2015-08-09 06:23:51',3,1,0,'កម្មវិធី C++ វគ្គ១',3,45),(5,'S0004','English for Business','','2015-08-17 14:31:29','2015-08-17 14:31:29',1,1,0,'ភាសាអង់សំរាប់អាជីវកម្ម',3,45),(6,'LU01','Linux OS I','','2015-08-19 07:23:05','2015-08-19 07:23:05',3,1,0,'Linux OS I',3,15),(7,'LU02','Linux Admistration','','2015-08-19 07:23:45','2015-08-19 07:23:45',3,1,0,'Linux Admistration',3,15),(8,'MOFWD','Microsoft Word 2010','','2015-10-27 02:35:38','2016-06-28 10:29:57',3,1,0,'កម្មវិធី word 2010',3,30),(9,'MOFXC','Microsoft Excel 2010','','2015-10-27 02:36:44','2015-10-27 02:36:44',3,1,0,'កម្មវិធី Excel 2010',0,15),(10,'CEY1S2','Core English I B','','2016-06-28 10:28:07','2016-06-28 10:30:39',1,1,0,'ភាសាអង់គ្លេសស្នូល',3,30),(11,'ELY1S1','English Literature I A','','2016-06-28 10:32:00','2016-06-28 10:32:00',1,1,0,'អក្សរសិល្ប៍អង់គ្លេស',3,30),(12,'ELY1S2','English Literature I B','','2016-06-28 10:33:54','2016-06-28 10:33:54',1,1,0,'អក្សរសិល្ប៍អង់គ្លេស',3,30),(13,'FEGA','Fundamental English Grammar A','','2016-07-09 02:10:07','2016-07-09 02:10:07',1,1,0,'Fundamental English Grammar A',3,15),(14,'156','GKJHGKJGH','','2016-07-09 02:11:27','2016-07-11 07:52:05',1,1,1,' ហងថហថហហថហងថហង',1,15),(15,'MMMM','Math Application','','2016-07-09 02:53:24','2016-07-09 02:53:24',1,1,0,'គណិតវិទ្យាអនុវត្តន៏',3,15),(16,'PPPPP','Public Administration','','2016-07-09 04:23:28','2016-07-09 04:23:54',1,1,0,'រដ្ឋបាលសាធារណ:',3,15),(17,'PEEEE','Principles of Economics','','2016-07-09 04:51:00','2016-07-09 04:51:00',1,1,0,'មូលដ្ឋានគ្រឹះសេដ្ឋកិច្ច',3,15),(18,'PBBBB','Principles of Business','','2016-07-09 04:52:24','2016-07-09 04:52:24',1,1,0,'មូលដ្ឋានគ្រឹះអាជីវកម្ម',3,15),(19,'PBBBBB','Principles of Business','','2016-07-09 04:54:02','2016-07-09 04:54:02',1,1,0,'មូលដ្ឋានគ្រឹះអាជីវកម្ម',3,15),(20,'FDDDDD','Fundamental English Grammar B','','2016-07-09 04:55:30','2016-07-09 04:55:30',1,1,0,'  ',3,15),(21,'ECCCCC','Economics History of Cambodia','','2016-07-09 04:56:45','2016-07-09 04:56:45',1,1,0,'ប្រវត្តិសេដ្ឋកិច្ចប្រទេសកម្ពុជា',3,15),(22,'PMMMM','Principles of Marketing','','2016-07-09 04:59:08','2016-07-09 04:59:08',1,1,0,'មូលដ្ឋានគ្រឹះនៃទីផ្សារ',3,15),(23,'OFFFFF','Office Application','','2016-07-09 05:00:40','2016-07-09 05:00:40',1,1,0,'  ',1,15),(24,'FMMMM','Financial Mathematics','','2016-07-09 05:01:57','2016-07-09 05:01:57',1,1,0,'  ',3,15),(25,'ADDDDD','Academic English Writing','','2016-07-09 05:06:59','2016-07-09 05:06:59',1,1,0,'  ',3,15),(26,'FAAAAA','Financial Accounting','','2016-07-09 05:08:31','2016-07-09 05:08:31',1,1,0,'គណនេយ្យហិរញ្ញវត្ថុ',3,15),(27,'POMMM','Principles of Management','','2016-07-09 05:09:58','2016-07-09 05:09:58',1,1,0,'មូលដ្ឋានគ្រឹះនៃការគ្រប់គ្រង',3,15),(28,'CTTTTT','Cambodian Taxation','','2016-07-09 05:10:53','2016-07-09 05:10:53',1,1,0,'  ',3,15),(29,'PMEEEE','Principles of Microeconomics','','2016-07-09 05:11:45','2016-07-09 05:11:45',1,1,0,'  ',3,15),(30,'STTTTT','Statistics for Business & Economics I','','2016-07-09 05:12:34','2016-07-09 05:12:34',1,1,0,'  ',3,15),(31,'BLLLL','Business Law','','2016-07-09 05:13:56','2016-07-09 05:13:56',1,1,0,'នីតិធុរកិច្ច',3,15),(32,'FAAAA','Financial Accounting II','','2016-07-09 05:15:01','2016-07-13 11:21:34',3,1,0,'គណនេយ្យហិរញ្ញវត្ថុ ២',3,15),(33,'EEEEE','Entrepreneurship','','2016-07-09 05:15:49','2016-07-09 05:15:49',1,1,0,'សហគ្រិនភាព',3,15),(34,'POOMMM','Principles of Macroeconomics','','2016-07-09 07:52:49','2016-07-09 07:52:49',1,1,0,'  ',3,15),(35,'STBBBB','Statistics for Business & Economics II','','2016-07-09 07:53:34','2016-07-09 07:53:34',1,1,0,'  ',3,15),(36,'IMMMMM','Intermediate Accounting II','','2016-07-09 07:54:04','2016-07-09 07:54:04',1,1,0,'  ',3,15),(37,'ACCCCC','Accounting for Bank','','2016-07-09 07:54:47','2016-07-09 07:54:47',1,1,0,'  ',3,15),(38,'FMMMMM','Financial Market and Institution','','2016-07-09 07:55:20','2016-07-09 08:04:25',1,1,1,'  ',3,15),(39,'MNNNNN','Managerial Accounting ','','2016-07-09 07:55:48','2016-07-09 07:55:48',1,1,0,'  ',3,15),(40,'FMMMF','Financial Management II','','2016-07-09 07:56:44','2016-07-09 07:56:44',1,1,0,'ការគ្រប់គ្រងហិរញ្ញវត្ថុ ២',3,15),(41,'TTTTTT','Theory and Practice of Auditing','','2016-07-09 07:57:42','2016-07-09 07:57:42',3,1,0,'  ',3,15),(42,'QBBBBB','Quick Book','','2016-07-09 07:58:15','2016-07-09 07:58:15',3,1,0,'  ',3,15),(43,'RMMMMM','Research Methodology','','2016-07-09 07:59:12','2016-07-09 07:59:12',1,1,0,'  ',3,15),(44,'PPPMM','Project Management','','2016-07-09 08:00:14','2016-07-09 08:00:14',1,1,0,'ការគ្រប់គ្រងគំរោង',3,15),(45,'AAAADD','Auditing Problem','','2016-07-09 08:01:00','2016-07-09 08:01:00',1,1,0,'  ',3,15),(46,'FFFFFS','Financial Statement Analysis','','2016-07-09 08:01:34','2016-07-09 08:01:34',1,1,0,'  ',3,15),(47,'FMIIII','Financial Markets and Institutions','','2016-07-09 08:03:26','2016-07-09 08:03:26',1,1,0,'  ',3,15),(48,'IVVVV','Investment Management','','2016-07-09 08:06:01','2016-07-09 08:06:01',1,1,0,'  ',3,15),(49,'RPPPP','Real Estate and Property Management','','2016-07-09 08:06:37','2016-07-09 08:06:37',1,1,0,'  ',3,15),(50,'HRMM','Human Resource Management','','2016-07-09 08:08:09','2016-07-09 08:08:09',1,1,0,'ការគ្រប់គ្រងធនធានមនុស្ស',3,15),(51,'ODDDD','Organizational Development','','2016-07-09 08:08:42','2016-07-09 08:08:42',1,1,0,'  ',3,15),(52,'OOPPP','Operation Management','','2016-07-09 08:09:33','2016-07-09 08:09:33',1,1,0,'ការគ្រប់គ្រងប្រតិបត្តិការ',3,15),(53,'SPSS','SPSS','','2016-07-09 08:10:05','2016-07-09 08:10:05',3,1,0,'  ',3,15),(54,'ADVVV','Advertising and Sale Promotion','','2016-07-09 08:10:40','2016-07-09 08:10:40',1,1,0,'  ',3,15),(55,'OBBB','Organizational Behaviour','','2016-07-09 08:11:07','2016-07-09 08:11:07',1,1,0,'  ',3,15),(56,'SMMM','Strategic Management','','2016-07-09 08:11:49','2016-07-09 08:11:49',1,1,0,'យុទ្ធសាស្រ្តនៃការគ្រប់គ្រង',3,15),(57,'LLLLL','Leadership','','2016-07-09 08:12:34','2016-07-09 08:12:34',1,1,0,'ភាពជាអ្នកដឹកនាំ',3,15),(58,'MEEEE','Media Management','','2016-07-09 08:16:26','2016-07-09 08:16:26',1,1,0,'  ',3,15),(59,'IMMMM','Investment Management','','2016-07-09 08:18:47','2016-07-09 08:18:47',1,1,0,'ការគ្រប់គ្រងការវិនិយោគ',3,15),(60,'MTTTTT','Managing Management','','2016-07-09 08:19:28','2016-07-09 08:19:28',1,1,0,'  ',3,15),(61,'POOOOO','Portfolio Management','','2016-07-09 08:21:46','2016-07-09 08:21:46',1,1,0,'  ',3,15),(62,'BPLLL','Banking Practice and Law','','2016-07-09 08:22:17','2016-07-09 08:22:17',1,1,0,'  ',3,15),(63,'MCCCC','Money Banking and Law','','2016-07-09 08:23:13','2016-07-09 08:23:13',1,1,0,'  ',3,15),(64,'MCMMM','Money and Capital Market','','2016-07-09 08:24:25','2016-07-09 08:24:25',1,1,0,'  ',3,15),(65,'CCCMM','Credit Management','','2016-07-09 08:24:54','2016-07-09 08:24:54',1,1,0,'  ',3,15),(66,'IRMMM','Insurance and Risk Management','','2016-07-09 08:25:27','2016-07-09 08:25:27',1,1,0,'  ',3,15),(67,'ADVVT','Advertising and Theory Practice','','2016-07-09 08:29:45','2016-07-09 08:29:45',1,1,0,'  ',3,15),(68,'CBBBB','Consumer Behaviour','','2016-07-09 08:30:16','2016-07-09 08:30:16',1,1,0,'  ',3,15),(69,'SVMMM','Service Marketing','','2016-07-09 08:30:58','2016-07-09 08:30:58',1,1,0,'  ',3,15),(70,'BBMMM','Business to Business Marketing','','2016-07-09 08:31:27','2016-07-09 08:31:27',1,1,0,'  ',3,15),(71,'FFBBB','Food and Beverage','','2016-07-09 08:32:14','2016-07-09 08:32:14',1,1,0,'  ',3,15),(72,'BPTTT','Business Plan for Tourism','','2016-07-09 08:32:44','2016-07-09 08:32:44',1,1,0,'  ',3,15),(73,'KCCCC','Khmer Civilization','','2016-07-09 08:33:18','2016-07-09 08:33:18',1,1,0,'  ',3,15),(74,'TTOPPP','Travel and Tour Operation','','2016-07-09 08:33:58','2016-07-09 08:33:58',1,1,0,'  ',3,15),(75,'TGGGG','Tourism Geography','','2016-07-09 08:34:25','2016-07-09 08:34:25',1,1,0,'  ',3,15),(76,'TTTBBB','Tourist Behaviour','','2016-07-09 08:35:01','2016-07-09 08:35:01',1,1,0,'  ',3,15),(77,'FOFFF','Front Office Management','','2016-07-09 08:36:46','2016-07-09 08:36:46',1,1,0,'  ',3,15),(78,'HTTTTT','Heritage Tourism','','2016-07-09 08:37:21','2016-07-09 08:37:21',1,1,0,'  ',3,15),(79,'HMMMM','Hotel Management','','2016-07-09 08:38:15','2016-07-09 08:38:15',1,1,0,'  ',3,15),(80,'HKMMM','House Keeping Management','','2016-07-09 08:41:24','2016-07-09 08:41:24',1,1,0,'  ',3,15),(81,'MIMM','MICE Management','','2016-07-09 08:42:08','2016-07-09 08:42:08',1,1,0,'ការគ្រប់គ្រងពិធី',3,15),(82,'TOMMMM','Tourism Management','','2016-07-09 08:43:20','2016-07-09 08:43:20',1,1,0,'  ',3,15),(83,'ROPPP','Resort Operations and Management','','2016-07-09 08:44:07','2016-07-09 08:44:42',1,1,0,'  ',3,15),(84,'HKIII','History of Khmer Institutions','','2016-07-09 08:45:54','2016-07-09 08:45:54',1,1,0,'  ',3,15),(85,'ITLLL','Introduction to Law','','2016-07-09 08:46:24','2016-07-09 08:46:24',1,1,0,'  ',3,15),(86,'SSSSS','Statistics','','2016-07-09 08:46:56','2016-07-09 08:46:56',1,1,0,'  ',3,15),(87,'CSSSSS','Computer Science','','2016-07-09 08:47:49','2016-07-09 08:47:49',3,1,0,'វិទ្យាសាស្រ្តកុំព្យូទ័រ',3,15),(88,'CLLLL','Constitutional Law','','2016-07-09 08:48:31','2016-07-09 08:48:31',1,1,0,'  ',3,15),(89,'HPPPII','History of Political Ideas','','2016-07-09 08:49:05','2016-07-09 08:49:05',1,1,0,'  ',3,15),(90,'ASEAN','ASEAN Culture','','2016-07-09 08:49:37','2016-07-09 08:49:37',1,1,0,'  ',3,15),(91,'CLLLLC','Civil Law','','2016-07-09 08:53:12','2016-07-09 08:53:12',1,1,0,'  ',3,15),(92,'CVVVVL','Civil Law 2','','2016-07-09 08:53:43','2016-07-09 08:53:43',1,1,0,'  ',3,15),(93,'CMMLL','Criminal Law 1','','2016-07-09 08:54:09','2016-07-09 08:54:09',1,1,0,'  ',3,15),(94,'ALLLLL','Administrative Law','','2016-07-09 09:13:34','2016-07-09 09:13:34',1,1,0,'  ',3,15),(95,'COLLL','Contract Law','','2016-07-09 09:14:07','2016-07-09 09:14:07',1,1,0,'  ',3,15),(96,'LTTTT','Legal Terminology','','2016-07-09 09:14:39','2016-07-09 09:14:39',1,1,0,'  ',3,15),(97,'CMMML','Criminal Law 2','','2016-07-09 09:15:20','2016-07-09 09:15:20',1,1,0,'  ',3,15),(98,'IRRRR','International Relation','','2016-07-09 09:15:56','2016-07-09 09:15:56',1,1,0,'  ',3,15),(99,'CPLLL','Company Law','','2016-07-09 09:16:25','2016-07-09 09:16:25',1,1,0,'  ',3,15),(100,'OBLLL','Obligation Law','','2016-07-09 09:17:21','2016-07-09 09:17:21',1,1,0,'  ',3,15),(101,'CIPPP','Civil Procedure','','2016-07-09 09:17:55','2016-07-09 09:17:55',1,1,0,'  ',3,15),(102,'CMPD','Criminal Procedure','','2016-07-09 09:31:24','2016-07-09 09:31:24',1,1,0,'  ',3,15),(103,'PIL','Public Administration Law','','2016-07-09 09:31:57','2016-07-09 09:31:57',1,1,0,'  ',3,15),(104,'ADPP','Administration Procedure','','2016-07-09 09:32:51','2016-07-09 09:32:51',1,1,0,'  ',3,15),(105,'LLMM','Legal Methodology','','2016-07-09 09:33:27','2016-07-09 09:33:27',1,1,0,'  ',3,15),(106,'LLBB','Labor Law','','2016-07-09 09:33:49','2016-07-09 09:33:49',1,1,0,'  ',3,15),(107,'FPLL','Family Property Law','','2016-07-09 09:34:37','2016-07-09 09:34:37',1,1,0,'  ',3,15),(108,'PILL','Private International Law','','2016-07-09 09:35:24','2016-07-09 09:35:24',1,1,0,'  ',3,15),(109,'PFLL','Public Function Law','','2016-07-09 09:37:10','2016-07-09 09:37:10',1,1,0,'  ',3,15),(110,'LMMMM','Land Management & Urban Law','','2016-07-09 09:37:43','2016-07-09 09:37:43',1,1,0,'  ',3,15),(111,'ITLLLL','Intellectuals Property Law','','2016-07-09 09:38:29','2016-07-09 09:38:29',1,1,0,'  ',3,15),(112,'HMRL','Human Right Law','','2016-07-09 09:39:02','2016-07-09 09:39:02',1,1,0,'  ',3,15),(113,'MMMYY','Managerial Accounting II','','2016-07-16 09:38:38','2016-07-16 09:38:38',1,1,0,'  ',1,15);
/*!40000 ALTER TABLE `acd_subjects` ENABLE KEYS */;
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