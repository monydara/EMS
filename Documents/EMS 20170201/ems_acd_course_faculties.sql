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
-- Table structure for table `acd_course_faculties`
--

DROP TABLE IF EXISTS `acd_course_faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acd_course_faculties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `abbr` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `course_type` varchar(2) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A',
  `description` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acd_course_faculties`
--

LOCK TABLES `acd_course_faculties` WRITE;
/*!40000 ALTER TABLE `acd_course_faculties` DISABLE KEYS */;
INSERT INTO `acd_course_faculties` VALUES (1,'ENGGEP','GEP','General English Program','TC',0,'A','',0,'2015-05-29 17:17:36','2015-10-30 07:26:39',1,'ភាសាអង់គ្លេសទូរទៅ'),(2,'ENGESP','ESP','English for Specific Purposes','TC',0,'A','',0,'2015-05-29 17:24:52','2015-10-30 07:27:03',1,'ជំនាញភាសាអង់គ្លេស'),(3,'C001','BSA','Business Administrator​ and Accountancy','WU',0,'A','',0,'2015-05-29 17:28:00','2016-06-10 07:43:28',1,'គ្រប់គ្រងពាណិជ្ជកម្ម និងគណនេយ្យ'),(4,'C002','HTM','Hotel and Tourist Management','WU',0,'A','',0,'2015-05-29 17:30:51','2015-08-22 15:04:19',1,'គ្រប់គ្រងសណ្ឋាគារ​ ទេសចរណ៍ និង បដិសណ្ឋារកិច្ច'),(5,'C003','PCA','Public Administration','WU',0,'A','',0,NULL,'2015-08-22 15:04:26',1,'គ្រប់គ្រងសាធារណៈ'),(6,'Ba004','SSE','Social Science and Economic','WU',0,'A','',0,NULL,'2016-06-10 08:11:10',1,'វិទ្យាសាស្រ្តសង្គម និងសេដ្ឋកិច្ច'),(7,'C005','AIE','Arts in English','WU',0,'A','',1,NULL,'2016-06-10 08:11:18',1,''),(8,'C006','SOS','Social Science','WU',0,'A','',0,NULL,'2015-08-22 15:09:09',1,'វិទ្យាសាស្រ្តសង្គម'),(9,'C007','SCT','Computer Science','WU',0,'A','',0,NULL,'2015-09-14 15:38:58',1,'វិទ្យាសាស្រ្តកំុព្យូទ័រ'),(10,'Ba008','AHL','Arts, Humanities and Languages','WU',0,'A','',0,NULL,'2016-06-10 08:15:02',1,'សិល្បៈ មនុស្សសាស្រ្ត និង ភាសា'),(11,'C009','ESC','Education Science','WU',0,'A','',0,NULL,'2015-08-22 15:09:39',1,'វិទ្យាសាស្រ្តអប់រំ'),(12,'C010','LAW','Faculty of Law','WU',0,'A','',0,NULL,'2015-08-22 15:10:12',1,'នីតិសាស្រ្ត'),(13,'COMOFF','MOF','Microsoft Office 2010','TC',0,'A','',0,'2015-08-17 14:20:43','2015-10-30 07:27:58',1,'វគ្គកំុព្យូទ័រសំរាប់ការិយាល'),(14,'ENGGMC','GMC','Grammar Class','TC',0,'A','',0,'2015-10-30 07:31:22','2015-10-30 07:31:22',1,'វគ្គវេយ្យាករណ៍');
/*!40000 ALTER TABLE `acd_course_faculties` ENABLE KEYS */;
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
