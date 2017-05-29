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
-- Table structure for table `sys_menus`
--

DROP TABLE IF EXISTS `sys_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `order_val` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `shortcut_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menus`
--

LOCK TABLES `sys_menus` WRITE;
/*!40000 ALTER TABLE `sys_menus` DISABLE KEYS */;
INSERT INTO `sys_menus` VALUES (1,'Registration','Student Registration','Student','Admin','resources/images/icons/student/register.png','Lead',1,NULL,NULL,1),(2,'T.C Admission','Admission for Training Center','Student','Admin','resources/images/icons/student/add.png','Admission',2,NULL,NULL,1),(3,'W.U Admission','Admission for Western University','Student','Admin','resources/images/icons/student/add.png','AdmissionWU',3,NULL,NULL,1),(4,'Student Detail','Detail information of student','Student','Admin','resources/images/icons/student/detail.png','Student',4,NULL,NULL,1),(5,'W.U Promotion','Promote or Demote students to another class','Student','Admin','resources/images/icons/academic/book.png','StudentPromoteWU',6,NULL,NULL,1),(7,'T.C Class Members','FY Admission (High Diploma, Associate, Bachelor)','Student','Admin','resources/images/icons/student/Attendancereg.png','ClassEnrollment',4,NULL,NULL,1),(8,'T.C Promotion','Promote or Demote students to another class','Student','Admin','resources/images/icons/student/up.png','StudentPromote',5,NULL,NULL,1),(9,'Student Category','Student classification','Student','Admin','resources/images/icons/student/Attendancereg.png','StudentCategory',8,NULL,NULL,1),(10,'Drop Reason','Reason use when student drop','Student','Admin','resources/images/icons/student/Attendancereg.png','DropType',9,NULL,NULL,1),(11,'Supsend Reason','The reaseon use when student suspend','Student','Admin','resources/images/icons/student/Attendancereg.png','SuspendType',11,NULL,NULL,1),(16,'City',NULL,'Student',NULL,'resources/images/icons/setting/setup.png','CityState',12,NULL,NULL,1),(17,'W.U Class Members',NULL,'Student',NULL,'resources/images/icons/student/Attendancereg.png','ClassEnrollmentWU',4,NULL,NULL,1),(100,'Courses',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','Course',5,NULL,NULL,2),(101,'Faculties',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','Faculty',6,NULL,NULL,2),(102,'Majors',NULL,'Academic',NULL,'resources/images/icons/academic/skills.png','Major',3,NULL,NULL,2),(103,'Subjects',NULL,'Academic',NULL,'resources/images/icons/academic/subject.png','Subject',4,NULL,NULL,2),(104,'Batches',NULL,'Academic',NULL,'resources/images/icons/academic/batch.png','Batch',1,NULL,NULL,2),(105,'Academic Years',NULL,'Academic',NULL,'resources/images/icons/academic/year.png','AcademicYear',2,NULL,NULL,2),(106,'TC Classes',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','ClassTC',14,NULL,NULL,2),(107,'WU Classes',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','Class',15,NULL,NULL,2),(108,'Standards',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','Standard',8,NULL,NULL,2),(109,'Divisions',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','Division',9,NULL,NULL,2),(110,'Rooms',NULL,'Academic',NULL,'resources/images/icons/academic/room.png','Room',10,NULL,NULL,2),(112,'TC Level',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','LevelTC',11,NULL,NULL,2),(113,'TC Level Type',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','LevelType',12,NULL,NULL,2),(115,'Course Setup',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','CourseSetup',14,NULL,NULL,2),(116,'Faculty Setup',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','FacultySetup',7,NULL,NULL,2),(200,'Prepaid List',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Prepaid',1,NULL,NULL,3),(201,'Account Master',NULL,'Account',NULL,'resources/images/icons/account/cash.png','AccountMaster',2,NULL,NULL,3),(202,'Invoicing',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Invoicing',3,NULL,NULL,3),(203,'Open Cash Drawer',NULL,'Account',NULL,'resources/images/icons/account/cash.png','OpenCashDrawer',4,NULL,NULL,3),(204,'Payment',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Payment',5,NULL,NULL,3),(205,'Close Cash Drawer',NULL,'Account',NULL,'resources/images/icons/account/cash.png','CloseCashDrawer',6,NULL,NULL,3),(206,'AR Monitor',NULL,'Account',NULL,'resources/images/icons/account/monitor.png','ARMonitor',8,NULL,NULL,3),(207,'Group Accounts',NULL,'Account',NULL,'resources/images/icons/account/policy.png','GroupAccount',7,NULL,NULL,3),(208,'Receipt',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Receipt',6,NULL,NULL,3),(220,'Fee Plan Cataloque',NULL,'Account',NULL,'resources/images/icons/account/product.png','TuitionFee',11,NULL,NULL,3),(221,'Discount Items',NULL,'Account',NULL,'resources/images/icons/account/discount.png','DiscountItemC',12,NULL,NULL,3),(222,'Charge Items',NULL,'Account',NULL,'resources/images/icons/account/promotion.png','ChargeItemC',13,NULL,NULL,3),(223,'Tax Rate',NULL,'Account',NULL,'resources/images/icons/account/cash.png','TaxRate',14,NULL,NULL,3),(224,'Currencies',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Currency',15,NULL,NULL,3),(225,'Key Account',NULL,'Account',NULL,'resources/images/icons/hr/employee.png','KeyAccount',16,NULL,NULL,3),(226,'AR Policies',NULL,'Account',NULL,'resources/images/icons/account/policy.png','ArPolicy',17,NULL,NULL,3),(227,'Cash Drawer Rules',NULL,'Account',NULL,'resources/images/icons/account/cash.png','CashDrawerManager',18,NULL,NULL,3),(300,'Employee Profile',NULL,'HR',NULL,'resources/images/icons/hr/employee.png','Employee',1,NULL,NULL,6),(301,'Department',NULL,'HR',NULL,'resources/images/icons/hr/department.png','Department',2,NULL,NULL,6),(302,'Positon',NULL,'HR',NULL,'resources/images/icons/hr/position.png','Position',3,NULL,NULL,6),(303,'Employee Level',NULL,'HR',NULL,'resources/images/icons/hr/employee.png','EmployeeLevel',4,NULL,NULL,6),(305,'Holiday',NULL,'HR',NULL,'resources/images/icons/setting/holiday.png','Holiday',6,NULL,NULL,6),(306,'Employee Shift',NULL,'HR',NULL,'resources/images/icons/hr/shift.png','Shift',7,NULL,NULL,6),(400,'Lanuage',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Langauge',NULL,NULL,NULL,7),(401,'Ethnicity',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Ethnicity',NULL,NULL,NULL,7),(402,'Nationalty',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Nationality',NULL,NULL,NULL,7),(403,'Occupation',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Occupation',NULL,NULL,NULL,7),(404,'Religion',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Religion',NULL,NULL,NULL,7),(405,'User Manager',NULL,'Admin',NULL,'resources/images/icons/system/user.png','User',0,NULL,NULL,7),(406,'Roles',NULL,'Admin',NULL,'resources/images/icons/system/key.png','Role',1,NULL,NULL,7),(407,'Campuses',NULL,'Admin',NULL,'resources/images/icons/system/home.png','Campus',3,NULL,NULL,7),(408,'Login History',NULL,'Admin',NULL,'resources/images/icons/system/history.png',NULL,4,NULL,NULL,7),(409,'Users History',NULL,'Admin',NULL,'resources/images/icons/system/history.png',NULL,5,NULL,NULL,7),(410,'System History',NULL,'Admin',NULL,'resources/images/icons/system/history.png',NULL,6,NULL,NULL,7),(411,'Privileges',NULL,'Admin',NULL,'resources/images/icons/system/key.png','Privilege',2,NULL,NULL,7);
/*!40000 ALTER TABLE `sys_menus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:39
