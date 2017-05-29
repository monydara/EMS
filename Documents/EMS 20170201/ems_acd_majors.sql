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
-- Table structure for table `acd_majors`
--

DROP TABLE IF EXISTS `acd_majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_majors`
--

LOCK TABLES `acd_majors` WRITE;
/*!40000 ALTER TABLE `acd_majors` DISABLE KEYS */;
INSERT INTO `acd_majors` VALUES (1,'DEFAULT','Default',0,'2015-09-14 15:37:41','2015-12-03 03:49:55','ជំនាញដំបូង',1),(2,'ENGGEP','General English Program',0,'2015-09-14 08:47:35','2015-10-30 07:23:50','ភាសាអង់គ្លេសទូរទៅ',1),(3,'COMPRO','Computer Programming',0,'2015-10-30 07:10:41','2015-10-30 07:23:43','សរសេរកម្មវិធីកំុព្យូទ័រ',1),(4,'COMNET','Computer Networking',0,'2015-10-30 07:12:18','2015-10-30 07:23:36','បណ្តាញកំុព្យូទ័រ',1),(5,'COMDB','Database Management',0,'2015-10-30 07:14:43','2015-10-30 07:23:29','គ្រប់គ្រងទិន្ន័យកំុព្យូទ័រ',1),(6,'ENGSP','English for Specific Purposes',0,'2015-10-30 07:20:09','2015-10-30 07:22:58','ភាសាអង់គ្លេសសំរាប់ជំនាញជាក់លាក់',1),(7,'COMOFF','Microsoft Office 2013',0,'2015-10-30 07:21:42','2016-07-06 09:25:23','កំុព្យូទ័រការិយាល័យ',1),(8,'ENGGMC','English Grammar',0,'2015-10-30 07:32:51','2015-10-30 07:32:51','អង់គ្លេសវេយ្យាករណ៍',1),(9,'En001_Comm','English for Communication',0,'2016-06-10 07:47:31','2016-06-10 07:47:31','អង់គ្លេសសម្រាប់ទំនាក់ទំនង',1),(10,'En002_TEFL','Teaching English as a Foreign Language',0,'2016-06-10 07:48:28','2016-06-28 10:34:47','អប់រំភាសាអង់គ្លេស',1),(11,'SSE001_FB','Finance and Banking',0,'2016-06-10 07:52:07','2016-06-10 07:52:07','ហិរញ្ញវត្ថុ​ និងធនាគារ',1),(12,'SSE002_DE','Development Economic',0,'2016-06-10 07:53:24','2016-06-10 07:53:24','សេដ្ឋកិច្ចអភិវឌ្ឍន៍',1),(13,'SSE003_ISM','Investment and stock Market',0,'2016-06-10 07:54:11','2016-06-10 07:54:11','វិនិយោគ និងផ្សារភាគហ៊ុន',1),(14,'BAA001_MC','Marketing and Communication',0,'2016-06-10 07:55:13','2016-06-10 07:55:13','ទីផ្សារ និងទំនាក់ទំនង',1),(15,'BAA002_Mgt','Management and Leadership',0,'2016-06-10 07:56:03','2016-06-10 07:56:03','គ្រប់គ្រង និងភាពជាអ្នកដឹកនាំ',1),(16,'BAA003_Acc','Accounting and Auditing',0,'2016-06-10 07:56:40','2016-06-10 07:56:40','គណនេយ្យ និងសវនកម្ម',1),(17,'HTM001_HTM','Hospitality and Tourism Management',0,'2016-06-10 07:58:12','2016-06-10 07:58:12','គ្រប់គ្រងបដិសណ្ឋារកិច្ច និងទេសចរណ៍',1),(18,'HTM002_MICE','International Hospitality and MICE management',0,'2016-06-10 07:59:44','2016-06-10 07:59:44','គ្រប់គ្រងបដិសណ្ឋារកិច្ចអន្តជាតិ និងព្រឹត្តិការណ៍ផ្សេងៗ',1),(19,'HTM003_PRT','Parks, Recreation and Tourism Management',0,'2016-06-10 08:01:28','2016-06-10 08:01:28','គ្រប់គ្រងឧទ្យាន ការកំសាន្ត និងទេសចរណ៍',1),(20,'','General Law',0,'2016-07-09 02:01:23','2016-07-09 02:01:23','ច្បាប់ទូទៅ',1);
/*!40000 ALTER TABLE `acd_majors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:42
