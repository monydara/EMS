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
-- Table structure for table `sys_users`
--

DROP TABLE IF EXISTS `sys_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `encrypted_password` varchar(255) DEFAULT NULL,
  `hr_position_id` int(11) DEFAULT NULL,
  `hr_department_id` int(11) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_type` varchar(10) DEFAULT 'Staff',
  `start_date` date DEFAULT NULL,
  `home_campus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users`
--

LOCK TABLES `sys_users` WRITE;
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;
INSERT INTO `sys_users` VALUES (1,'admin','administrator','8KY6bMQ4LxxAwb5XQOWvyg==\n',1,1,NULL,'07888561565','mdarait@gmail.com','test description',29,'2015-06-07 15:23:03','2016-06-09 09:53:33','Admin','2015-06-07',1),(17,'CKV001','Chhin Khavisal','YlcdjnT+BsaWI/nIxhQjjA==\n',18,8,'','016335133','khanvisalchhin@yahoo.com','',29,'2016-06-07 17:16:20','2016-11-29 08:46:02','Staff','2016-06-09',1),(18,'MCT002','Mao Chanthorn','YlcdjnT+BsaWI/nIxhQjjA==\n',19,8,'','015707188','maochanthorn@gmail.com','',29,'2016-06-07 17:17:36','2016-11-29 08:46:22','Staff','2016-06-09',1),(19,'SSL003','San Sili','YlcdjnT+BsaWI/nIxhQjjA==\n',19,8,'','093831783','silisan83@gmail.com','',29,'2016-06-07 17:18:39','2016-11-29 08:46:40','Staff','2016-06-09',1),(20,'HSM004','Han Sreymouy','YlcdjnT+BsaWI/nIxhQjjA==\n',19,8,'','098776181','sreymouyhan@gmail.com','',29,'2016-06-07 17:20:04','2016-11-29 08:46:56','Staff','2016-06-09',1),(21,'YSR005','Yem Sophearith','lC+HI813oC0JPEVWB73TgQ==\n',15,10,'','012299544','rsth.info@gmail.com','',29,'2016-06-07 17:21:20','2016-06-07 17:21:20','Staff','2016-06-09',1),(22,'CMR006','Chan Mary','lC+HI813oC0JPEVWB73TgQ==\n',15,10,'','0963421321','chyanmary03@gmail.com','',29,'2016-06-07 17:22:13','2016-06-07 17:22:13','Staff','2016-06-09',1),(23,'SYH007','Start Yihad','lC+HI813oC0JPEVWB73TgQ==\n',10,10,'','0765262789','startyihad.95@gmail.com','',29,'2016-06-07 17:23:30','2016-06-07 17:23:30','Staff','2016-06-09',1),(24,'VSP008','Uy Sreypov','lC+HI813oC0JPEVWB73TgQ==\n',10,10,'','086658401','uysreypov168@gmail.com','',29,'2016-06-07 17:25:02','2016-07-12 10:26:54','Staff','2016-06-09',1),(25,'LCD009','Lay Chinda','lC+HI813oC0JPEVWB73TgQ==\n',10,10,'','011668684','chindalay@gmail.com','',29,'2016-06-07 17:26:00','2016-06-07 17:26:00','Staff','2016-06-09',1),(26,'KCT010','Kim chanrattana','lC+HI813oC0JPEVWB73TgQ==\n',7,4,'','012730072','kimchanrottana@gmail.com','',29,'2016-06-07 17:27:00','2016-06-07 17:27:00','Staff','2016-06-09',1),(27,'TSM011','Te Sokmouy','lC+HI813oC0JPEVWB73TgQ==\n',8,4,'','069500815','tesokmuoy@yahoo.com','',29,'2016-06-07 17:27:59','2016-06-07 17:27:59','Staff','2016-06-09',1),(28,'PCN012','Prum Channy','lC+HI813oC0JPEVWB73TgQ==\n',7,4,'','010242228','channyprum69@gmail.com','',29,'2016-06-07 17:28:52','2016-06-07 17:28:52','Staff','2016-06-09',1),(29,'SSY013','Sar Satya','lC+HI813oC0JPEVWB73TgQ==\n',4,2,'','099600446','sar_satya@yahoo.com','',29,'2016-06-07 17:29:48','2016-06-07 17:29:48','Staff','2016-06-09',1),(30,'PSV014','Pok Savet','lC+HI813oC0JPEVWB73TgQ==\n',4,2,'','012400108','saveth167@yahoo.com','',29,'2016-06-07 17:30:35','2016-06-07 17:30:35','Staff','2016-06-09',1),(31,'LRT015','Laurent Te','lC+HI813oC0JPEVWB73TgQ==\n',20,2,'','012912129','','',29,'2016-06-07 17:32:04','2016-06-07 17:32:04','Staff','2016-06-09',1),(32,'NRT016','Ny Ratha','YlcdjnT+BsaWI/nIxhQjjA==\n',21,1,'','0962426178','ny.ratha11@gmail.com','',29,'2016-06-09 09:57:49','2016-11-28 10:31:52','Admin','2016-06-09',1),(33,'CSP017','Chun Sopheak','lC+HI813oC0JPEVWB73TgQ==\n',21,1,'','015242228','chunsopheak168@gmail.com','',29,'2016-06-09 10:07:21','2016-06-09 10:07:21','Admin','2016-06-09',1),(34,'vmr010','Vann Muniroth','lC+HI813oC0JPEVWB73TgQ==\n',24,12,'Phnom Penh','','','',29,'2016-07-04 04:47:43','2016-07-04 04:47:43','Staff','2016-07-01',1),(35,'tsp025','Thann Sreypov','lC+HI813oC0JPEVWB73TgQ==\n',23,13,'Phnom Penh','','','',29,'2016-07-04 04:49:54','2016-07-04 11:18:03','Staff','2016-07-01',1),(36,'SPS081','Sem Piseth','lC+HI813oC0JPEVWB73TgQ==\n',22,13,'Phnom Penh','','','',29,'2016-07-04 11:23:36','2016-07-04 11:23:36','Staff','2016-07-01',1),(37,'TMK011','Tep Mongkul','lC+HI813oC0JPEVWB73TgQ==\n',26,13,'Phnom Penh','','','',29,'2016-07-04 11:25:08','2016-07-04 11:25:08','Staff','2016-07-01',1),(38,'CPS093','Chiv Panha Savary','lC+HI813oC0JPEVWB73TgQ==\n',28,14,'Phnom Penh','','','',29,'2016-07-04 11:26:32','2016-07-04 11:26:32','Admin','2016-07-01',1);
/*!40000 ALTER TABLE `sys_users` ENABLE KEYS */;
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
