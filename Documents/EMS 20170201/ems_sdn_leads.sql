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
-- Table structure for table `sdn_leads`
--

DROP TABLE IF EXISTS `sdn_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdn_leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `khr_first_name` varchar(50) NOT NULL DEFAULT '',
  `khr_last_name` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `date_of_birth` date DEFAULT NULL,
  `registered_date` date DEFAULT NULL,
  `place_of_birth` varchar(255) NOT NULL DEFAULT '',
  `phone_no` varchar(35) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `note` text,
  `image_url` text,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_shift_id` int(11) DEFAULT NULL,
  `is_canceled` tinyint(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdn_leads`
--

LOCK TABLES `sdn_leads` WRITE;
/*!40000 ALTER TABLE `sdn_leads` DISABLE KEYS */;
INSERT INTO `sdn_leads` VALUES (1,NULL,'Chamroeun','Sopiphop','ចំរើន','សូរ្យពិភព','M','1989-09-01','2016-11-29','','069999227','','Kampongcham','','resources/images/photo/no-picture.gif',4,6,1,0,1,'2016-11-29 02:04:14','2016-11-29 02:04:14',NULL,NULL,NULL,NULL),(2,NULL,'Set','Sul','សេត','ស៊ុល','M','1994-05-06','2016-11-29','Kompongcham','098 550 906','','PP','','resources/images/photo/no-picture.gif',4,9,3,0,1,'2016-11-29 02:05:53','2016-11-29 02:05:53',NULL,NULL,NULL,NULL),(3,NULL,'Oum','Meas','អ៊ុំ','មាស','M','1981-12-12','2016-11-29','PP','012 836 845','','PP','','resources/images/photo/no-picture.gif',4,8,3,0,1,'2016-11-29 02:07:34','2016-11-29 02:07:34',NULL,NULL,NULL,NULL),(4,NULL,'Yean','Chanthea','យាន','ចន្ធា','F','1994-08-03','2016-11-29','Porsat','86989890','','PP','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-11-29 02:31:43','2016-11-29 02:31:43',NULL,NULL,NULL,NULL),(5,NULL,'Kak','Sinet','កាក់','ស៊ីណែត','F','1993-04-21','2016-11-29','Porsat','096 471 6985','','PP','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-11-29 02:33:41','2016-11-29 02:33:41',NULL,NULL,NULL,NULL),(6,NULL,'Mot','Sreyneth','មុត','ស្រីណែត','F','1994-04-12','2016-11-29','Kampongcham','098 535 347','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-11-29 02:35:27','2016-11-29 02:35:27',NULL,NULL,NULL,NULL),(7,NULL,'Chorn','Chhorpoan','ចន','ឆព្វណ្ណ','M','1994-07-09','2016-11-29','Porsat','096 619 5300','','PP','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-11-29 03:06:59','2016-11-29 03:06:59',NULL,NULL,NULL,NULL),(8,NULL,'Van','Polene','វ៉ាន់','ប៉ូឡែន','F','1996-08-19','2016-11-29','PP','081 332 686','','','','resources/images/photo/no-picture.gif',4,10,1,0,1,'2016-11-29 03:08:40','2016-11-29 03:08:40',NULL,NULL,NULL,NULL),(9,NULL,'Chhay','Somaly','ឆាយ','សុមាលី','F','1994-04-03','2016-11-29','PP','015 293 036','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-11-29 03:21:34','2016-11-29 03:21:34',NULL,NULL,NULL,NULL),(10,NULL,'Tum','Veasna','ទុំ','វាសនា','M','1975-03-18','2016-11-29','','012 200 325','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-11-29 03:23:30','2016-11-29 03:23:30',NULL,NULL,NULL,NULL),(11,NULL,'Kim','channin','គីម','ចាន់នីន','F','1995-05-05','2016-10-04','Kampongthom','086695525','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-11-30 06:43:52','2016-11-30 06:43:52',NULL,NULL,NULL,NULL),(12,NULL,'Chhay','Sambathnita','ឆាយ','សម្បត្តិនីតា','F','1997-10-18','2016-12-01','Phnom Penh','0966573896','','Phnom Penh','','resources/images/photo/no-picture.gif',4,4,1,0,1,'2016-12-01 02:46:23','2016-12-01 02:46:23',NULL,NULL,NULL,NULL),(13,NULL,'Neng','Sreypich','នាង','ស្រីពេជ្រ','F','1997-03-15','2016-12-01','Phnom Penh','0966232170','','Phnom Penh','','resources/images/photo/no-picture.gif',4,6,2,0,1,'2016-12-01 02:48:23','2016-12-01 02:48:23',NULL,NULL,NULL,NULL),(14,NULL,'Song','Dalin','សុង','ដាលីន','M','1997-11-09','2016-12-01','PP','086699444','','PP','','resources/images/photo/no-picture.gif',4,3,3,0,1,'2016-12-01 02:50:33','2016-12-01 02:50:33',NULL,NULL,NULL,NULL),(15,NULL,'Hem','Chendamony','ហែយ','ចិន្តាមុន្នី','M','1990-10-01','2016-12-01','PP','092619272','','PP','','resources/images/photo/no-picture.gif',4,3,3,0,1,'2016-12-01 02:52:16','2016-12-01 02:52:16',NULL,NULL,NULL,NULL),(16,NULL,'Meas','Sameth','មាស','សាម៉េត','M','1981-03-15','2016-12-01','PP','012556258/016755114','','PP','','resources/images/photo/no-picture.gif',4,3,3,0,1,'2016-12-01 02:59:03','2016-12-01 02:59:03',NULL,NULL,NULL,NULL),(17,NULL,'Nuon','Vuthyro','នួន','វុទ្ទីរ៉ូ','M','1996-01-26','2016-12-01','PP','093565811','','PP','','resources/images/photo/no-picture.gif',4,3,1,0,1,'2016-12-01 03:00:22','2016-12-01 03:00:22',NULL,NULL,NULL,NULL),(18,NULL,'Khorn','Kimsang','ឃន','គឹមសាង','F','1992-08-30','2016-12-01','PP','090866269','','PP','','resources/images/photo/no-picture.gif',4,3,3,0,1,'2016-12-01 03:01:43','2016-12-01 03:01:43',NULL,NULL,NULL,NULL),(19,NULL,'Sin','Tola','ស៊ិន','តុលា','M','1997-10-08','2016-12-01','','0966664844','','PP','','resources/images/photo/no-picture.gif',4,3,1,0,1,'2016-12-01 03:02:45','2016-12-01 03:02:45',NULL,NULL,NULL,NULL),(20,NULL,'Eng','Mika','អៀង','មិកា','M','1994-06-27','2016-12-01','','069537327','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 03:09:24','2016-12-01 03:09:24',NULL,NULL,NULL,NULL),(21,NULL,'Ly','Sopheaksonita','លី','សុភ័ក្រ្តសូនីតា','F','1998-02-18','2016-12-01','PP','078340032','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 03:10:54','2016-12-01 03:10:54',NULL,NULL,NULL,NULL),(22,NULL,'Mith','Seavfong','មិត្ត','សៀវហុង','F','1996-02-07','2016-12-01','','069766607','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 03:12:46','2016-12-01 03:12:46',NULL,NULL,NULL,NULL),(23,NULL,'Hap','Sreychom','ហាប់','ស្រីចម','F','1994-02-12','2016-12-01','','069666005','','PP','','resources/images/photo/no-picture.gif',4,10,1,0,1,'2016-12-01 03:15:13','2016-12-01 03:15:13',NULL,NULL,NULL,NULL),(24,NULL,'Lun','Sarorn','លុន','សារ៉ន','M','1990-01-05','2016-12-01','','0965434227','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 04:02:35','2016-12-01 04:02:35',NULL,NULL,NULL,NULL),(25,NULL,'Sim','Chenglim','ស៊ឹម','ឆេងលីម','M','1991-12-13','2016-12-01','','069918841','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 04:03:49','2016-12-01 04:03:49',NULL,NULL,NULL,NULL),(26,NULL,'Ma','Socheat','ម៉ា','សុជាតិ','M','1989-10-10','2016-12-01','','010916590','','','','resources/images/photo/no-picture.gif',4,10,1,0,1,'2016-12-01 04:23:43','2016-12-01 04:23:43',NULL,NULL,NULL,NULL),(27,NULL,'Kit','Dara','គិត','តារា','M','1996-07-12','2016-12-01','','077926925','','','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-12-01 04:24:47','2016-12-01 04:24:47',NULL,NULL,NULL,NULL),(28,NULL,'Ros','Ratine','រស់','រ៉ាទីន','F','1984-10-06','2016-12-01','','017688296','','','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-12-01 04:26:46','2016-12-01 04:26:46',NULL,NULL,NULL,NULL),(29,NULL,'Loek','Chansopheaktra','ឡឹក','ច័ន្ទសុភ័ត្រា','M','1995-05-15','2016-12-01','','067485999/0978262377','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 04:28:26','2016-12-01 04:28:26',NULL,NULL,NULL,NULL),(30,NULL,'Srin','Thavin','ស៊ិ្រន','ថាវិន','F','1994-10-06','2016-12-01','','069228907','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 04:29:45','2016-12-01 04:29:45',NULL,NULL,NULL,NULL),(31,NULL,'Im','Yanuth','អ៊ឹម','យ៉ានុត','F','1996-11-02','2016-12-01','','070411716','','','','resources/images/photo/no-picture.gif',4,10,2,0,1,'2016-12-01 04:30:42','2016-12-01 04:30:42',NULL,NULL,NULL,NULL),(32,NULL,'Ma','Khamphon','ម៉ា','ខាំផុន','M','1995-03-13','2016-12-01','','0969113586','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 04:40:13','2016-12-01 04:40:13',NULL,NULL,NULL,NULL),(33,NULL,'Chuob','Bunsreynich','ជួប','បុនស្រីនិច','M','1998-04-05','2016-12-01','','015614465','','','','resources/images/photo/no-picture.gif',4,10,1,0,1,'2016-12-01 04:50:03','2016-12-01 04:50:03',NULL,NULL,NULL,NULL),(34,NULL,'Kalan','Menghong','កាឡាន','ម៉េងហុង','M','1988-06-03','2016-12-01','','016596459','','','','resources/images/photo/no-picture.gif',4,10,2,0,1,'2016-12-01 04:51:32','2016-12-01 04:51:32',NULL,NULL,NULL,NULL),(35,NULL,'Ly','Muoykheng','លី','មួយខេង','F','1995-05-23','2016-12-01','','077854249','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 04:52:47','2016-12-01 04:52:47',NULL,NULL,NULL,NULL),(36,NULL,'Chan','Kamary','ចាន់','ខេមរី','F','1986-06-06','2016-12-01','','012452126','','','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-12-01 04:54:26','2016-12-01 04:54:26',NULL,NULL,NULL,NULL),(37,NULL,'Soeun','Piseng','សឿន','ពិស្សី','M','1997-05-23','2016-12-01','','010464807','','','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-12-01 04:55:17','2016-12-01 04:55:17',NULL,NULL,NULL,NULL),(38,NULL,'Pheth','Phearom','ភេត','ភារម្យ','M','1995-09-18','2016-12-01','','098992107','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 04:56:21','2016-12-01 04:56:21',NULL,NULL,NULL,NULL),(39,NULL,'Danh','Somanita','ដាញ់','សុម៉ានីតា','F','1997-05-19','2016-12-01','','081957008','','','','resources/images/photo/no-picture.gif',4,10,2,0,1,'2016-12-01 05:02:26','2016-12-01 05:02:26',NULL,NULL,NULL,NULL),(40,NULL,'Srey','Dany','ស្រី','ដានី','F','1997-05-03','2016-12-01','','077949371','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 05:03:40','2016-12-01 05:03:40',NULL,NULL,NULL,NULL),(41,NULL,'Lin','Chakriya','លីន','ចរិយា','F','1996-07-21','2016-12-01','','0964593704','','PP','','resources/images/photo/no-picture.gif',4,10,4,0,1,'2016-12-01 06:56:27','2016-12-01 06:56:27',NULL,NULL,NULL,NULL),(42,NULL,'Thai','Sthera','ថៃ','ស្ថេរ៉ា','F','1995-01-09','2016-12-01','','069534635','','PP','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 06:57:36','2016-12-01 06:57:36',NULL,NULL,NULL,NULL),(43,NULL,'Sarin','Rida','សារិន','រីដា','F','1996-05-21','2016-12-01','','010326276','','PP','','resources/images/photo/no-picture.gif',4,10,NULL,0,1,'2016-12-01 06:59:54','2016-12-01 06:59:54',NULL,NULL,NULL,NULL),(44,NULL,'Samdy','Sereiroth','សំឌី','សិរីរ័ត្ន','F','1995-07-31','2016-12-01','','010701166','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 07:08:30','2016-12-01 07:08:30',NULL,NULL,NULL,NULL),(45,NULL,'Chiv','Lyhor','ជីវ','លីហ័រ','F','1994-01-13','2016-12-01','','069569613','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 07:09:53','2016-12-01 07:09:53',NULL,NULL,NULL,NULL),(46,NULL,'Ouk','Somary','អ៊ុក','សុម៉ារី','F','1989-09-18','2016-12-01','','070 / 089791369','','','','resources/images/photo/no-picture.gif',4,10,3,0,1,'2016-12-01 07:12:42','2016-12-01 07:12:42',NULL,NULL,NULL,NULL),(47,NULL,'Son','Sothea','សុន','សុទ្ធា','M','1995-05-09','2016-12-01','','015500306','','','','resources/images/photo/no-picture.gif',4,9,1,0,1,'2016-12-01 08:01:43','2016-12-01 08:01:43',NULL,NULL,NULL,NULL),(48,NULL,'Pov','Sokly','ពៅ','សុខលី','F','1996-03-02','2016-12-01','','0977089025','','','','resources/images/photo/no-picture.gif',4,6,1,0,1,'2016-12-01 08:05:01','2016-12-01 08:05:01',NULL,NULL,NULL,NULL),(49,NULL,'Lim','SokKeang','លីម','សុខគាង','F','1989-05-03','2016-12-01','','098788580','','','','resources/images/photo/no-picture.gif',4,3,1,0,1,'2016-12-01 08:11:36','2016-12-01 08:11:36',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sdn_leads` ENABLE KEYS */;
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
