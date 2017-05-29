/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.26-log : Database - ems
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ems` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ems`;

/*Table structure for table `acc_account_details` */

DROP TABLE IF EXISTS `acc_account_details`;

CREATE TABLE `acc_account_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(1) DEFAULT NULL,
  `item_unit` varchar(1) DEFAULT NULL,
  `item_value` decimal(8,2) DEFAULT '0.00',
  `is_recurring` tinyint(1) DEFAULT NULL,
  `recurring_val` int(11) DEFAULT '0',
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `comments` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `status` varchar(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `acc_account_details` */

insert  into `acc_account_details`(`id`,`account_id`,`item_id`,`item_type`,`item_unit`,`item_value`,`is_recurring`,`recurring_val`,`effective_date`,`expired_date`,`comments`,`is_deleted`,`status`,`user_id`,`created_at`,`updated_at`) values (1,1,1,'D','P',5.00,1,2,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 01:24:10','2016-02-19 01:24:10'),(3,3,2,'D','P',10.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(4,3,1,'A',NULL,50.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(5,3,1,'T','P',10.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(6,4,1,'A','A',50.00,NULL,NULL,'2016-02-19',NULL,'',NULL,NULL,NULL,'2016-02-19 06:02:16','2016-02-19 06:02:16'),(7,7,1,'A','A',50.00,NULL,NULL,'2016-02-22',NULL,'',NULL,NULL,NULL,'2016-02-22 08:01:58','2016-02-22 08:01:58'),(8,6,1,'A','A',50.00,NULL,NULL,'2016-02-22',NULL,'',NULL,NULL,NULL,'2016-02-22 08:02:24','2016-02-22 08:02:24'),(9,7,1,'T','P',10.00,NULL,NULL,'2016-02-22',NULL,'',NULL,NULL,NULL,'2016-02-22 08:02:37','2016-02-22 08:02:37'),(10,8,1,'D','P',5.00,NULL,NULL,'2016-02-23',NULL,'',NULL,NULL,NULL,'2016-02-23 00:20:50','2016-02-23 00:20:50'),(11,8,2,'A','A',3.00,NULL,NULL,'2016-02-23',NULL,'',NULL,NULL,NULL,'2016-02-23 00:20:50','2016-02-23 00:20:50'),(12,12,5,'D','A',10.00,NULL,NULL,'2016-02-24',NULL,'',1,NULL,NULL,'2016-02-24 01:10:09','2016-02-24 01:45:09'),(13,12,1,'A','A',50.00,NULL,NULL,'2016-02-24',NULL,'',NULL,NULL,NULL,'2016-02-24 01:45:34','2016-02-24 01:45:34'),(14,12,1,'T','P',10.00,1,0,'2016-02-24',NULL,'',NULL,NULL,NULL,'2016-02-24 01:46:33','2016-02-24 01:46:33'),(15,11,3,'A','A',9.00,NULL,NULL,'2016-02-27',NULL,'',0,NULL,NULL,'2016-02-27 06:23:08','2016-02-27 06:23:08');

/*Table structure for table `acc_account_masters` */

DROP TABLE IF EXISTS `acc_account_masters`;

CREATE TABLE `acc_account_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `key_account_id` int(11) DEFAULT NULL,
  `group_account_id` int(11) DEFAULT NULL,
  `credit_control_id` int(11) DEFAULT NULL,
  `fee_plan_detail_id` int(11) DEFAULT NULL,
  `fee_type` varchar(2) DEFAULT NULL,
  `vat_no` varchar(20) DEFAULT NULL,
  `cycle_type_id` int(11) DEFAULT NULL,
  `account_type` varchar(1) DEFAULT NULL,
  `fee_per_cycle` decimal(8,2) DEFAULT '0.00',
  `balance` decimal(8,2) DEFAULT '0.00',
  `status` varchar(1) DEFAULT 'A',
  `user_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `acc_account_masters` */

insert  into `acc_account_masters`(`id`,`student_id`,`admission_id`,`key_account_id`,`group_account_id`,`credit_control_id`,`fee_plan_detail_id`,`fee_type`,`vat_no`,`cycle_type_id`,`account_type`,`fee_per_cycle`,`balance`,`status`,`user_id`,`is_deleted`,`created_at`,`updated_at`) values (1,NULL,3,1,NULL,3,NULL,'',NULL,NULL,'N',100.00,0.00,'',NULL,NULL,'2016-02-19 01:24:10','2016-02-19 01:24:10'),(3,3,3,1,NULL,3,19,'','',NULL,'I',100.00,0.00,'',NULL,NULL,'2016-02-19 05:32:29','2016-02-19 05:32:29'),(4,2,2,1,NULL,3,13,'','',NULL,'N',85.00,0.00,'',NULL,NULL,'2016-02-19 06:02:16','2016-02-19 06:02:16'),(5,3,3,1,NULL,3,19,'','',1,'N',100.00,0.00,'',NULL,NULL,'2016-02-19 06:36:46','2016-02-19 06:36:46'),(6,3,3,1,NULL,3,1,'','',1,'N',100.00,0.00,'A',NULL,NULL,'2016-02-19 06:45:08','2016-02-22 08:02:24'),(7,3,3,1,NULL,3,2,'','',2,'N',200.00,0.00,'A',NULL,NULL,'2016-02-22 08:00:17','2016-02-22 08:01:58'),(8,3,3,1,NULL,3,19,'','',1,'N',100.00,0.00,'A',NULL,NULL,'2016-02-23 00:20:50','2016-02-23 00:20:50'),(9,2,2,1,NULL,3,13,'','',NULL,'N',85.00,0.00,'A',NULL,NULL,'2016-02-24 00:52:01','2016-02-24 00:52:01'),(10,2,2,1,NULL,3,13,'','',NULL,'N',85.00,0.00,'A',NULL,NULL,'2016-02-24 00:52:21','2016-02-24 00:52:21'),(11,4,6,1,1,3,13,'','',NULL,'N',85.00,0.00,'A',NULL,NULL,'2016-02-24 01:07:05','2016-02-27 06:36:51'),(12,3,4,1,NULL,3,4,'','',4,'N',380.00,0.00,'A',NULL,NULL,'2016-02-24 01:10:09','2016-02-24 01:45:34');

/*Table structure for table `acc_batch_processes` */

DROP TABLE IF EXISTS `acc_batch_processes`;

CREATE TABLE `acc_batch_processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_account_id` int(11) DEFAULT NULL,
  `batch_proc_code` varchar(10) DEFAULT NULL,
  `batch_proc_name` varchar(100) DEFAULT NULL,
  `proc_date` date DEFAULT NULL,
  `total_invoices` int(11) DEFAULT '0',
  `status` varchar(1) DEFAULT NULL COMMENT 'N=New, P=Processed, S=Success, F=Fail, R=Rollback',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acc_batch_processes` */

insert  into `acc_batch_processes`(`id`,`group_account_id`,`batch_proc_code`,`batch_proc_name`,`proc_date`,`total_invoices`,`status`,`campus_id`,`created_at`,`updated_at`) values (1,1,'001','Batch Name',NULL,NULL,'N',1,'2016-02-27 06:42:01','2016-02-27 06:42:01');

/*Table structure for table `acc_cash_drawer_groups` */

DROP TABLE IF EXISTS `acc_cash_drawer_groups`;

CREATE TABLE `acc_cash_drawer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `acc_cash_drawer_groups` */

insert  into `acc_cash_drawer_groups`(`id`,`group_name`,`description`,`is_active`,`is_deleted`,`campus_id`,`created_by`,`created_at`,`updated_at`) values (1,'Receiption','Description',1,0,1,1,'2015-03-02 13:10:04','2015-03-03 13:45:41'),(2,'Accounting','sdfs',1,0,1,1,'2015-06-03 15:20:37','2015-06-03 15:20:37');

/*Table structure for table `acc_cash_drawer_trans` */

DROP TABLE IF EXISTS `acc_cash_drawer_trans`;

CREATE TABLE `acc_cash_drawer_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_cash_drawer_id` int(11) DEFAULT NULL,
  `open_by` int(11) DEFAULT NULL,
  `open_amount` decimal(12,2) DEFAULT '0.00',
  `open_amount_khr` decimal(12,2) DEFAULT '0.00',
  `closed_by` int(11) DEFAULT NULL,
  `closed_amount` decimal(12,2) DEFAULT '0.00',
  `closed_amount_khr` decimal(12,2) DEFAULT '0.00',
  `open_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `acc_cash_drawer_trans` */

insert  into `acc_cash_drawer_trans`(`id`,`acc_cash_drawer_id`,`open_by`,`open_amount`,`open_amount_khr`,`closed_by`,`closed_amount`,`closed_amount_khr`,`open_date`,`closed_date`,`campus_id`,`created_at`,`updated_at`) values (1,1,1,100.00,1000.00,NULL,0.00,0.00,'2015-06-28',NULL,1,NULL,NULL),(2,5,1,100.00,0.00,NULL,0.00,0.00,'2016-02-26',NULL,1,'2016-02-26 07:17:42','2016-02-26 07:17:42');

/*Table structure for table `acc_cash_drawers` */

DROP TABLE IF EXISTS `acc_cash_drawers`;

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

/*Data for the table `acc_cash_drawers` */

insert  into `acc_cash_drawers`(`id`,`cdg_id`,`sys_user_id`,`is_active`,`is_deleted`,`create_by`,`created_at`,`updated_at`) values (1,1,1,1,0,1,'2015-06-27 08:30:51','2015-06-27 08:31:48'),(2,2,12,1,0,1,'2015-06-27 08:31:08','2015-06-27 08:31:29'),(3,2,1,1,0,1,'2015-07-14 09:41:44','2015-07-14 09:41:44'),(4,2,2,1,0,1,'2015-07-14 09:41:44','2015-07-14 09:41:44'),(5,1,3,1,0,1,'2016-02-26 06:43:37','2016-02-26 06:43:37'),(6,1,4,1,0,1,'2016-02-26 06:43:37','2016-02-26 06:43:37'),(7,1,5,1,0,1,'2016-02-26 06:43:37','2016-02-26 06:43:37'),(8,1,10,1,0,1,'2016-02-26 06:43:59','2016-02-26 06:43:59'),(9,1,11,1,0,1,'2016-02-26 06:43:59','2016-02-26 06:43:59'),(10,2,13,1,0,1,'2016-02-26 06:44:17','2016-02-26 06:44:17'),(11,2,14,1,0,1,'2016-02-26 06:44:17','2016-02-26 06:44:17');

/*Table structure for table `acc_ccy_rate_histories` */

DROP TABLE IF EXISTS `acc_ccy_rate_histories`;

CREATE TABLE `acc_ccy_rate_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccy_id` int(11) DEFAULT NULL,
  `old_rate` decimal(8,2) DEFAULT '0.00',
  `new_rate` decimal(8,2) DEFAULT '0.00',
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acc_ccy_rate_histories` */

/*Table structure for table `acc_charge_item_types` */

DROP TABLE IF EXISTS `acc_charge_item_types`;

CREATE TABLE `acc_charge_item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_code` varchar(6) NOT NULL,
  `item_type_name` varchar(50) NOT NULL,
  `note` text,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `acc_charge_item_types` */

insert  into `acc_charge_item_types`(`id`,`item_type_code`,`item_type_name`,`note`,`is_del`,`created_at`,`updated_at`) values (1,'100','Advance Payment',NULL,0,NULL,NULL),(2,'200','Additional Charge',NULL,0,NULL,NULL),(3,'300','Student Book',NULL,0,NULL,NULL),(4,'400','Student Request',NULL,0,NULL,NULL),(10,'500','Student Uniform',NULL,0,NULL,NULL),(11,'600','Transportation',NULL,0,NULL,NULL),(12,'700','Ticket',NULL,0,NULL,NULL),(13,'800','Others',NULL,0,NULL,NULL);

/*Table structure for table `acc_charge_items` */

DROP TABLE IF EXISTS `acc_charge_items`;

CREATE TABLE `acc_charge_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(6) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `item_type_id` int(11) DEFAULT NULL,
  `charge_amount` decimal(8,2) DEFAULT '0.00',
  `is_editable` tinyint(1) DEFAULT '0',
  `note` text,
  `status` varchar(1) DEFAULT 'A',
  `campus_id` int(11) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `acc_charge_items` */

insert  into `acc_charge_items`(`id`,`item_code`,`item_name`,`item_type_id`,`charge_amount`,`is_editable`,`note`,`status`,`campus_id`,`is_del`,`created_at`,`updated_at`) values (1,'000003','Official Charge',2,50.00,0,'','A',1,0,'2016-02-07 05:55:55','2016-02-26 05:08:43'),(2,'002','Item Allow Edit',1,0.00,1,'','A',1,1,'2016-02-18 18:16:19','2016-02-26 05:08:28'),(3,'000001','Pre-Payment',1,0.00,1,'','A',1,0,'2016-02-26 05:07:51','2016-02-26 05:07:51'),(4,'000002','Deposit',1,0.00,1,'','A',1,0,'2016-02-26 05:08:19','2016-02-26 05:08:19');

/*Table structure for table `acc_credit_controls` */

DROP TABLE IF EXISTS `acc_credit_controls`;

CREATE TABLE `acc_credit_controls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_name` varchar(50) DEFAULT NULL,
  `due_days` int(11) DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) DEFAULT '0',
  `is_del` tinyint(1) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `acc_credit_controls` */

insert  into `acc_credit_controls`(`id`,`policy_name`,`due_days`,`description`,`is_active`,`is_del`,`campus_id`,`created_at`,`updated_at`) values (1,'Normal',3,'Credit Control for Normal Student',1,1,1,NULL,'2015-08-08 06:57:19'),(2,'VIP',7,'Credit Control for VIP Student',1,1,1,'2015-08-08 06:53:34','2015-08-08 06:57:24'),(3,'Normal Student',3,'Credit Control Policy for normal student',1,0,1,'2015-08-08 07:49:51','2015-08-08 07:49:51'),(4,'VIP Student',0,'',1,0,1,'2015-08-08 07:56:47','2015-08-08 07:56:47');

/*Table structure for table `acc_currencies` */

DROP TABLE IF EXISTS `acc_currencies`;

CREATE TABLE `acc_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccy_code` varchar(3) NOT NULL,
  `ccy_name` varchar(50) DEFAULT NULL,
  `ccy_rate` decimal(8,2) DEFAULT '0.00',
  `status` varchar(1) DEFAULT 'O',
  `campus_id` int(11) DEFAULT NULL,
  `maker_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acc_currencies` */

insert  into `acc_currencies`(`id`,`ccy_code`,`ccy_name`,`ccy_rate`,`status`,`campus_id`,`maker_id`,`created_at`,`updated_at`) values (1,'USD','Dollar',1.00,'O',1,1,NULL,NULL),(2,'KHR','Khmer Riel',4200.00,'O',1,1,NULL,NULL);

/*Table structure for table `acc_cycle_types` */

DROP TABLE IF EXISTS `acc_cycle_types`;

CREATE TABLE `acc_cycle_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_code` varchar(6) NOT NULL,
  `cycle_name` varchar(50) DEFAULT NULL,
  `cycle_value` int(11) DEFAULT '0',
  `cycle_per_class` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `acc_cycle_types` */

insert  into `acc_cycle_types`(`id`,`cycle_code`,`cycle_name`,`cycle_value`,`cycle_per_class`,`created_at`,`updated_at`) values (1,'MON01','Monthly',1,10,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(2,'QAT03','Qaurterly',3,4,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(3,'SMT06','Semesterly',6,2,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(4,'YER12','Yearly',12,1,'2015-04-19 03:19:40','2015-04-19 03:19:40'),(5,'FULFEE','Full Fee',0,0,'2015-04-19 03:19:40','2015-04-19 03:19:40');

/*Table structure for table `acc_discount_courses` */

DROP TABLE IF EXISTS `acc_discount_courses`;

CREATE TABLE `acc_discount_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_item_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acc_discount_courses` */

insert  into `acc_discount_courses`(`id`,`discount_item_id`,`course_id`,`created_at`,`updated_at`) values (1,1,3,'2015-06-21 03:02:33','2015-06-21 03:02:33');

/*Table structure for table `acc_discount_item_details` */

DROP TABLE IF EXISTS `acc_discount_item_details`;

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

/*Data for the table `acc_discount_item_details` */

insert  into `acc_discount_item_details`(`id`,`acc_discount_item_id`,`is_allow_edit`,`note`,`is_del`,`created_at`,`updated_at`,`discount_unit`,`discount_value`) values (1,1,0,'Discount 5%',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','P',5),(2,1,0,'Discount 10%',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','P',10),(3,1,0,'',1,'2015-05-29 17:06:55','2015-05-29 17:06:55','P',0),(4,1,0,'Discount $50',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','A',50),(5,1,1,'Custom Discount can be edit value on front line',0,'2015-05-29 17:06:55','2015-05-29 17:06:55','A',0),(6,1,0,'',1,'2015-06-21 03:02:33','2015-06-21 03:02:33','A',0),(7,2,NULL,'',0,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',10),(8,2,NULL,'',0,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',15),(9,2,NULL,'',0,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',20),(10,2,1,'Custom Discount',1,'2015-08-08 08:46:27','2015-08-08 08:46:27','P',0),(11,3,1,'',0,'2015-08-26 15:15:39','2015-08-26 15:15:39','A',0),(12,3,1,'',0,'2015-08-26 15:15:39','2015-08-26 15:15:39','P',0);

/*Table structure for table `acc_discount_items` */

DROP TABLE IF EXISTS `acc_discount_items`;

CREATE TABLE `acc_discount_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(6) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `is_all_courses` tinyint(1) DEFAULT '0',
  `discount_type_id` int(11) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `Autherizer` varchar(100) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `note` text,
  `is_del` tinyint(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `acc_discount_items` */

insert  into `acc_discount_items`(`id`,`item_code`,`item_name`,`is_all_courses`,`discount_type_id`,`effective_date`,`expired_date`,`Autherizer`,`reference_no`,`note`,`is_del`,`campus_id`,`created_at`,`updated_at`) values (1,'100','Discount Promo. 2015',1,2,'2015-05-30','2016-05-30','H.E TE Laurent','50400','',0,1,'2015-05-29 17:06:55','2015-06-21 03:11:06'),(2,'PRO15','Discount BAC 2014 ',1,2,'2015-08-08','2015-12-31','123213','','',0,1,'2015-08-08 08:46:27','2015-08-08 08:46:27'),(3,'0001','None Fee Discount',1,1,'2015-08-26','2020-09-30','','','',0,1,'2015-08-26 15:15:39','2015-08-26 15:20:07');

/*Table structure for table `acc_discount_types` */

DROP TABLE IF EXISTS `acc_discount_types`;

CREATE TABLE `acc_discount_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `acc_discount_types` */

insert  into `acc_discount_types`(`id`,`code`,`name`,`is_del`,`created_at`,`updated_at`) values (1,'NOR','Normal',0,'2015-04-19 04:18:37','2015-04-19 04:18:37'),(2,'PRO','Promotion',0,'2015-04-19 04:18:37','2015-04-19 04:18:37'),(3,'SCL','Scholarship',0,'2015-04-19 04:18:37','2015-04-19 04:18:37'),(4,'GOV','Goverment',0,'2015-04-19 04:18:37','2015-04-19 04:18:37'),(5,'PAT','Partnership',0,'2015-04-19 04:18:37','2015-04-19 04:18:37'),(6,'SPC','Special',0,'2015-04-19 04:18:37','2015-04-19 04:18:37'),(7,'ORG','Organization',0,'2015-04-19 04:18:37','2015-04-19 04:18:37'),(8,'OTH','Other',0,'2015-04-19 04:18:37','2015-04-19 04:18:37');

/*Table structure for table `acc_fee_cat_detail_wus` */

DROP TABLE IF EXISTS `acc_fee_cat_detail_wus`;

CREATE TABLE `acc_fee_cat_detail_wus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_cat_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `plan_num` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `cycle_type_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `fee_amount` decimal(16,4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acc_fee_cat_detail_wus` */

insert  into `acc_fee_cat_detail_wus`(`id`,`plan_cat_id`,`plan_id`,`plan_num`,`batch_id`,`cycle_type_id`,`currency_id`,`fee_amount`,`is_active`,`is_deleted`,`user_id`,`created_at`,`updated_at`) values (1,2,1,2,2,1,2,5.0000,1,0,1,'2016-02-12 04:13:33','2016-02-12 04:13:33'),(2,2,1,3,5,1,1,10.0000,1,0,1,'2016-02-12 04:13:57','2016-02-12 04:14:01');

/*Table structure for table `acc_fee_catalogues` */

DROP TABLE IF EXISTS `acc_fee_catalogues`;

CREATE TABLE `acc_fee_catalogues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogue_name` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(45) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `description` text,
  `is_active` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `acc_fee_catalogues` */

insert  into `acc_fee_catalogues`(`id`,`catalogue_name`,`fiscal_year`,`effective_date`,`expired_date`,`description`,`is_active`,`is_deleted`,`user_id`,`campus_id`,`created_at`,`updated_at`) values (1,'Fee Catalog','2015-2016','2016-02-12','2016-02-12','This is second catalog',0,1,1,1,'2016-02-12 01:42:26','2016-02-17 02:32:44'),(2,'Dara','SDf','2016-02-12',NULL,'',0,1,1,1,'2016-02-12 02:23:21','2016-02-17 02:32:40'),(3,'New Year','2015','2016-02-12','2016-02-12','',1,1,1,1,'2016-02-12 02:28:31','2016-02-17 02:32:16'),(4,'Dara','2015','2016-02-12',NULL,'',1,1,1,1,'2016-02-12 03:53:10','2016-02-17 02:32:10'),(5,'Toul Svay Prey','2014','2016-02-17',NULL,'',1,0,1,1,'2016-02-17 02:33:28','2016-02-17 02:33:28');

/*Table structure for table `acc_fee_plan_details` */

DROP TABLE IF EXISTS `acc_fee_plan_details`;

CREATE TABLE `acc_fee_plan_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `plan_num` int(11) DEFAULT NULL,
  `description` text,
  `cycle_type_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `fee_amount` decimal(16,4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `acc_fee_plan_details` */

insert  into `acc_fee_plan_details`(`id`,`plan_id`,`plan_num`,`description`,`cycle_type_id`,`term_id`,`currency_id`,`fee_amount`,`is_active`,`is_deleted`,`user_id`,`created_at`,`updated_at`) values (1,11,1,NULL,NULL,NULL,NULL,200.0000,1,NULL,1,'2016-02-16 02:05:24','2016-02-16 02:05:24'),(2,11,1,'Children (1,2,3)',4,NULL,NULL,222.0000,1,0,1,'2016-02-16 02:09:54','2016-02-16 02:33:40'),(3,11,2,'testing',2,NULL,NULL,200.0000,0,1,1,'2016-02-16 02:18:32','2016-02-16 02:44:50'),(4,11,2,'dsara',1,NULL,NULL,0.0000,0,0,1,'2016-02-16 02:22:23','2016-02-16 02:43:35'),(5,12,1,'description',1,NULL,NULL,0.0000,1,NULL,1,'2016-02-17 01:11:08','2016-02-17 01:11:08'),(6,12,12,'d',3,NULL,NULL,0.0000,1,NULL,1,'2016-02-17 01:13:11','2016-02-17 01:13:11'),(7,12,2,'d',2,NULL,NULL,0.0000,1,0,1,'2016-02-17 01:14:20','2016-02-17 01:14:20'),(8,12,2,'sdf',1,NULL,NULL,123.0000,1,0,1,'2016-02-17 01:17:18','2016-02-17 01:17:18'),(9,14,111,'Business Administration',3,NULL,NULL,155.0000,1,0,1,'2016-02-17 02:37:10','2016-02-17 02:37:10'),(10,14,111,'Business Administration',4,NULL,NULL,300.0000,1,0,1,'2016-02-17 02:37:10','2016-02-17 02:37:10'),(11,15,112,'Hotel And Tourism Managemnet- Year',4,NULL,NULL,300.0000,1,0,1,'2016-02-17 02:50:52','2016-02-17 02:50:52'),(12,15,112,'Hotel And Tourism Management- Semester',3,NULL,NULL,155.0000,1,0,1,'2016-02-17 02:50:53','2016-02-17 02:50:53'),(13,16,311,'GEP - Term 1',NULL,1,NULL,85.0000,1,0,1,'2016-02-17 03:01:13','2016-02-18 05:43:56'),(14,16,311,'GEP- Term 2',NULL,2,NULL,85.0000,1,0,1,'2016-02-17 03:01:13','2016-02-18 05:43:56'),(15,16,311,'GEP-term3',NULL,3,NULL,85.0000,1,1,1,'2016-02-17 03:01:13','2016-02-23 00:26:13'),(16,17,311,'',NULL,1,NULL,85.0000,1,0,1,'2016-02-17 03:02:10','2016-02-17 03:02:10'),(17,17,311,'',NULL,2,NULL,85.0000,1,1,1,'2016-02-17 03:02:11','2016-02-24 00:50:08'),(18,17,311,'',NULL,3,NULL,85.0000,1,0,1,'2016-02-17 03:02:11','2016-02-17 03:02:11'),(19,18,1,'Bussiness Admin',1,NULL,NULL,100.0000,1,0,1,'2016-02-18 04:09:09','2016-02-18 04:09:09'),(20,18,2,'Bussiness Admin',2,NULL,NULL,200.0000,1,0,1,'2016-02-18 04:09:09','2016-02-18 04:09:09'),(21,15,112,'Hotel And Tourism Management - Monthly',1,NULL,NULL,50.0000,1,0,1,'2016-02-21 12:05:42','2016-02-21 12:05:42'),(22,17,311,'',NULL,1,NULL,90.0000,1,0,1,'2016-02-23 00:27:54','2016-02-23 00:27:54'),(23,20,115,'Grade A',4,NULL,NULL,380.0000,1,0,1,'2016-02-24 01:42:37','2016-02-24 01:42:37');

/*Table structure for table `acc_fee_plans` */

DROP TABLE IF EXISTS `acc_fee_plans`;

CREATE TABLE `acc_fee_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_cat_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `tuition_time_id` int(11) DEFAULT NULL,
  `plan_code` varchar(6) DEFAULT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_delleted` tinyint(1) DEFAULT NULL,
  `plan_type` varchar(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `acc_fee_plans` */

insert  into `acc_fee_plans`(`id`,`plan_cat_id`,`batch_id`,`tuition_time_id`,`plan_code`,`plan_name`,`degree_id`,`course_id`,`description`,`is_active`,`is_delleted`,`plan_type`,`user_id`,`campus_id`,`created_at`,`updated_at`) values (11,1,NULL,2,'01','Children',1,1,'',1,0,'',1,1,'2016-02-15 18:00:32','2016-02-15 18:00:32'),(12,1,1,NULL,'002','Plan Name',3,3,'This description',1,0,'',1,1,'2016-02-16 10:29:20','2016-02-16 10:29:20'),(13,1,1,NULL,'004','Plan Name',4,3,'',1,0,'',1,1,'2016-02-16 11:10:53','2016-02-17 01:01:48'),(14,5,10,NULL,'123','Bussiness Administration',3,3,'',1,0,'',1,1,'2016-02-17 02:35:41','2016-02-17 02:35:41'),(15,5,10,NULL,'112','Hotel And Tourism Management',3,4,'',1,0,'',1,1,'2016-02-17 02:49:18','2016-02-17 02:49:18'),(16,5,NULL,1,'311','Children',1,1,'uytuytt6t76t',1,0,'',1,1,'2016-02-17 02:59:49','2016-02-23 01:20:50'),(17,5,NULL,1,'312','Foundation',1,1,'',1,0,'',1,1,'2016-02-17 03:01:31','2016-02-17 03:01:31'),(18,5,9,NULL,'111','sdf',4,3,'',1,0,'',1,1,'2016-02-18 04:08:14','2016-02-18 04:08:14'),(19,5,NULL,2,'222','sdfdsf',1,1,'',1,0,'',1,1,'2016-02-22 08:17:41','2016-02-24 00:47:27'),(20,5,9,NULL,'115','Computer Science',4,9,'',1,0,'',1,1,'2016-02-24 01:41:43','2016-02-24 01:41:43');

/*Table structure for table `acc_finance_trans` */

DROP TABLE IF EXISTS `acc_finance_trans`;

CREATE TABLE `acc_finance_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `receipt_no` varchar(6) DEFAULT NULL,
  `acc_tran_type_id` int(11) DEFAULT NULL,
  `acc_reason_type_id` int(11) DEFAULT NULL,
  `acc_cash_drawer_tran_id` int(11) DEFAULT NULL,
  `acc_payment_method_id` int(11) DEFAULT NULL,
  `ref_no` varchar(30) DEFAULT NULL,
  `tran_date` date DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `amount_usd` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `amount_khr` decimal(10,4) DEFAULT '0.0000',
  `commited_date` date DEFAULT NULL,
  `rollback_date` date DEFAULT NULL,
  `remark` text,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `acc_finance_trans` */

insert  into `acc_finance_trans`(`id`,`account_id`,`receipt_no`,`acc_tran_type_id`,`acc_reason_type_id`,`acc_cash_drawer_tran_id`,`acc_payment_method_id`,`ref_no`,`tran_date`,`currency_code`,`amount_usd`,`amount_khr`,`commited_date`,`rollback_date`,`remark`,`campus_id`,`created_at`,`updated_at`,`user_id`) values (1,NULL,'000001',6,NULL,1,1,'','2015-11-15',NULL,100.0000,0.0000,NULL,NULL,'',1,'2015-11-15 13:34:32','2015-11-15 13:34:32',1),(2,NULL,'000002',6,NULL,1,1,'','2015-11-20',NULL,1000.0000,0.0000,NULL,NULL,'',1,'2015-11-20 07:31:19','2015-11-20 07:31:19',1),(3,NULL,'000001',6,NULL,1,1,'','2015-12-02',NULL,150.0000,0.0000,NULL,NULL,'',1,'2015-12-02 07:14:29','2015-12-02 07:14:29',1),(4,NULL,'000002',6,NULL,1,1,'','2015-12-02',NULL,200.0000,0.0000,NULL,NULL,'',1,'2015-12-02 07:18:56','2015-12-02 07:18:56',1),(5,NULL,'000003',6,NULL,1,1,'','2015-12-02',NULL,1000.0000,0.0000,NULL,NULL,'',1,'2015-12-02 07:19:22','2015-12-02 07:19:22',1),(6,NULL,'000004',6,NULL,1,1,'','2015-12-02',NULL,200.0000,0.0000,NULL,NULL,'',1,'2015-12-02 11:42:08','2015-12-02 11:42:08',1),(7,NULL,'000005',6,NULL,1,1,'','2015-12-02',NULL,1000.0000,0.0000,NULL,NULL,'',1,'2015-12-02 11:45:27','2015-12-02 11:45:27',1),(8,NULL,'000006',6,NULL,1,1,'','2015-12-02',NULL,100.0000,0.0000,NULL,NULL,'',1,'2015-12-02 11:46:11','2015-12-02 11:46:11',1),(9,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,0.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 04:34:45','2016-02-27 04:34:45',NULL),(10,11,'000001',NULL,NULL,NULL,NULL,'',NULL,NULL,0.0000,NULL,NULL,NULL,'remark',NULL,'2016-02-27 04:43:05','2016-02-27 04:43:05',NULL),(12,11,'000002',NULL,NULL,NULL,NULL,'','2016-02-27','KHR',0.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 04:52:48','2016-02-27 04:52:48',NULL),(13,11,'000003',NULL,NULL,NULL,NULL,'','2016-02-27','KHR',47.6190,200000.0000,NULL,NULL,'',NULL,'2016-02-27 04:57:28','2016-02-27 04:57:28',NULL),(14,11,'000004',NULL,NULL,NULL,NULL,'','2016-02-27','USD',100.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 04:58:34','2016-02-27 04:58:34',NULL),(15,11,'000005',NULL,NULL,NULL,1,'','2016-02-27','USD',25.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 05:14:34','2016-02-27 05:14:34',1),(16,11,'000006',NULL,NULL,NULL,1,'','2016-02-27','USD',2000.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 07:35:16','2016-02-27 07:35:16',1),(17,11,'000007',NULL,NULL,NULL,1,'','2016-02-27','USD',22.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 07:35:42','2016-02-27 07:35:42',1),(18,11,'000008',NULL,NULL,NULL,1,'','2016-02-27','USD',6.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 07:40:31','2016-02-27 07:40:31',1),(19,11,'000009',NULL,NULL,NULL,1,'','2016-02-27','USD',10.0000,NULL,NULL,NULL,'',NULL,'2016-02-27 07:41:37','2016-02-27 07:41:37',1);

/*Table structure for table `acc_group_accounts` */

DROP TABLE IF EXISTS `acc_group_accounts`;

CREATE TABLE `acc_group_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_code` varchar(10) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `group_type` varchar(2) DEFAULT 'TC' COMMENT 'TC, WU',
  `account_type` varchar(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_invoices` int(11) DEFAULT NULL,
  `remain_invoices` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT 'O' COMMENT 'O=Open, C=Closed',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acc_group_accounts` */

insert  into `acc_group_accounts`(`id`,`group_code`,`group_name`,`group_type`,`account_type`,`start_date`,`end_date`,`total_invoices`,`remain_invoices`,`status`,`campus_id`,`created_at`,`updated_at`) values (1,'001','Group Finance ','TC',NULL,NULL,NULL,NULL,NULL,'O',1,NULL,NULL);

/*Table structure for table `acc_invoice_details` */

DROP TABLE IF EXISTS `acc_invoice_details`;

CREATE TABLE `acc_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `item_type` varchar(2) DEFAULT 'F' COMMENT 'F=Fee Plan,D=Discount, C=Charge, T=Tax',
  `item_id` int(11) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT '0.00',
  `description` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acc_invoice_details` */

insert  into `acc_invoice_details`(`id`,`invoice_id`,`item_type`,`item_id`,`amount`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,1,'F',13,85.00,'Tuition Fee (Start From 27-Feb-2016 to 27-Feb-2016)',0,'2016-02-27 01:26:56','2016-02-27 01:26:56');

/*Table structure for table `acc_invoice_rules` */

DROP TABLE IF EXISTS `acc_invoice_rules`;

CREATE TABLE `acc_invoice_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(50) DEFAULT NULL,
  `from_days` int(11) DEFAULT '0',
  `to_days` int(11) DEFAULT '0',
  `credit_control_id` int(11) DEFAULT NULL,
  `alert_type_id` int(11) DEFAULT NULL,
  `action_type_id` int(11) DEFAULT NULL,
  `charge_per_day` decimal(8,2) DEFAULT '0.00',
  `description` text,
  `is_active` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `acc_invoice_rules` */

insert  into `acc_invoice_rules`(`id`,`rule_name`,`from_days`,`to_days`,`credit_control_id`,`alert_type_id`,`action_type_id`,`charge_per_day`,`description`,`is_active`,`is_del`,`created_at`,`updated_at`) values (1,'Reminder 1',10,30,1,1,2,0.00,NULL,1,1,NULL,'2015-08-08 06:57:12'),(2,'Reminder 1',10,15,2,1,2,0.00,'After issued date 10 to 15 days system warning',1,1,'2015-08-08 06:55:47','2015-08-08 06:57:07'),(3,'Reminder 1 time',3,30,3,1,2,0.00,'',1,0,'2015-08-08 07:52:09','2015-08-08 07:52:09'),(4,'Penalty',31,60,3,1,3,0.50,'',1,0,'2015-08-08 07:53:28','2016-02-26 07:16:21'),(5,'Lock Student',61,0,3,1,4,0.00,'',1,0,'2015-08-08 07:54:52','2015-08-08 07:54:52'),(6,'Reminder',30,0,4,1,2,0.00,'',1,0,'2015-08-08 07:58:04','2015-08-08 07:58:04');

/*Table structure for table `acc_invoice_settle` */

DROP TABLE IF EXISTS `acc_invoice_settle`;

CREATE TABLE `acc_invoice_settle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `tran_id` int(11) DEFAULT NULL,
  `settle_amount` decimal(10,4) DEFAULT NULL,
  `settle_date` date DEFAULT NULL,
  `settle_by_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acc_invoice_settle` */

/*Table structure for table `acc_invoices` */

DROP TABLE IF EXISTS `acc_invoices`;

CREATE TABLE `acc_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(10) DEFAULT NULL,
  `invoice_type` varchar(2) DEFAULT 'TC' COMMENT 'TC, WU',
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `course_level_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `cycle_type_id` int(11) DEFAULT NULL,
  `vat_number` varchar(20) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `total_amount` decimal(22,2) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `billing_process_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acc_invoices` */

insert  into `acc_invoices`(`id`,`account_id`,`invoice_no`,`invoice_type`,`degree_id`,`course_id`,`batch_id`,`standard_id`,`division_id`,`course_level_id`,`term_id`,`cycle_type_id`,`vat_number`,`issue_date`,`due_date`,`from_date`,`to_date`,`total_amount`,`is_paid`,`billing_process_id`,`campus_id`,`created_at`,`updated_at`) values (1,11,'000001','TC',1,1,NULL,NULL,NULL,NULL,NULL,NULL,'','2016-02-27',NULL,'2016-02-27','2016-02-27',85.00,0,NULL,1,'2016-02-27 01:26:56','2016-02-27 01:26:56');

/*Table structure for table `acc_payment_methods` */

DROP TABLE IF EXISTS `acc_payment_methods`;

CREATE TABLE `acc_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `method_type` varchar(1) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `acc_payment_methods` */

insert  into `acc_payment_methods`(`id`,`code`,`name`,`method_type`,`is_del`,`created_at`,`updated_at`) values (1,'001','Cash','C',0,NULL,NULL),(2,'002','Cheque','N',0,NULL,NULL),(3,'003','Bank','N',0,NULL,NULL),(4,'004','Wing','N',0,NULL,NULL),(5,'005','Credit Card','N',0,NULL,NULL);

/*Table structure for table `acc_plan_masters` */

DROP TABLE IF EXISTS `acc_plan_masters`;

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

/*Data for the table `acc_plan_masters` */

insert  into `acc_plan_masters`(`id`,`plan_master_name`,`fiscal_year`,`effective_date`,`expired_date`,`khr_rate`,`description`,`is_tc`,`campus_id`,`is_active`,`is_del`,`created_at`,`updated_at`,`acd_batche_id`) values (1,'WU Fee Plan 2015 Batch 4',2015,'2015-03-15','2016-03-15',4100.0000,'',0,1,1,0,'2015-08-25 13:25:00','2015-08-25 13:32:54',4),(2,'TC Tuition Fee 2015',2015,'2015-03-15','2016-03-15',4100.0000,'',1,1,1,0,'2015-08-25 13:35:44','2015-08-25 14:00:24',NULL),(3,'WU Fee Plan 2015 Batch 5',2015,'2015-03-15','2016-03-15',4100.0000,'',0,1,1,0,'2015-08-26 13:27:41','2015-08-26 13:30:02',5);

/*Table structure for table `acc_pre_payments` */

DROP TABLE IF EXISTS `acc_pre_payments`;

CREATE TABLE `acc_pre_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) DEFAULT NULL,
  `fin_tran_id` int(11) DEFAULT NULL,
  `trn_date` date DEFAULT NULL,
  `currency` varchar(3) DEFAULT 'USD',
  `trn_amount` decimal(18,4) DEFAULT '0.0000',
  `ex_rate` decimal(8,4) DEFAULT '0.0000',
  `lcy_amount` decimal(18,4) DEFAULT '0.0000',
  `remark` text,
  `status` varchar(1) DEFAULT 'B',
  `maker_id` int(11) DEFAULT NULL,
  `checker_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acc_pre_payments` */

/*Table structure for table `acc_receipt_details` */

DROP TABLE IF EXISTS `acc_receipt_details`;

CREATE TABLE `acc_receipt_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) DEFAULT NULL,
  `item_type` varchar(1) NOT NULL DEFAULT 'C',
  `item_id` int(11) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_unit` varchar(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acc_receipt_details` */

insert  into `acc_receipt_details`(`id`,`receipt_id`,`item_type`,`item_id`,`amount`,`description`,`created_at`,`updated_at`,`item_name`,`item_unit`) values (1,1,'C',1,50.0000,'','2016-02-26 04:55:09','2016-02-26 04:55:09','Official Charge','A'),(2,2,'C',3,100.0000,'','2016-02-26 05:10:10','2016-02-26 05:10:10','Pre-Payment','A');

/*Table structure for table `acc_receipts` */

DROP TABLE IF EXISTS `acc_receipts`;

CREATE TABLE `acc_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_date` date DEFAULT NULL,
  `receipt_no` varchar(6) DEFAULT NULL,
  `receipt_type` varchar(3) DEFAULT 'OTR',
  `ref_type` varchar(1) DEFAULT 'O',
  `payer_name` varchar(100) DEFAULT NULL,
  `ref_id` int(11) DEFAULT '0',
  `usd_amount` decimal(10,4) DEFAULT '0.0000',
  `khr_amount` decimal(10,4) DEFAULT '0.0000',
  `charges_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `remark` text,
  `is_paid` tinyint(1) DEFAULT '0',
  `paid_date` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `receipt_by_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acc_receipts` */

insert  into `acc_receipts`(`id`,`receipt_date`,`receipt_no`,`receipt_type`,`ref_type`,`payer_name`,`ref_id`,`usd_amount`,`khr_amount`,`charges_amount`,`discount_amount`,`remark`,`is_paid`,`paid_date`,`is_del`,`receipt_by_id`,`campus_id`,`created_at`,`updated_at`) values (1,'2016-02-26','','','L','Monydara Sary',2,50.0000,0.0000,50.00,0.00,'',0,NULL,1,1,1,'2016-02-26 04:55:09','2016-02-26 05:03:28'),(2,'2016-02-26','','','L','SOPHAT HENG',1,100.0000,0.0000,100.00,0.00,'',0,NULL,0,1,1,'2016-02-26 05:10:10','2016-02-26 05:10:10');

/*Table structure for table `acc_receipts_settlements` */

DROP TABLE IF EXISTS `acc_receipts_settlements`;

CREATE TABLE `acc_receipts_settlements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_receipt_id` int(11) DEFAULT NULL,
  `acc_finance_tran_id` int(11) DEFAULT NULL,
  `settl_amount` decimal(10,0) DEFAULT NULL,
  `settl_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acc_receipts_settlements` */

/*Table structure for table `acc_student_accounts` */

DROP TABLE IF EXISTS `acc_student_accounts`;

CREATE TABLE `acc_student_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(8) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `key_account_id` int(11) DEFAULT NULL,
  `credit_control_id` int(11) DEFAULT NULL,
  `account_type` varchar(1) DEFAULT 'N',
  `vat_number` varchar(20) DEFAULT NULL,
  `deposit_amount` decimal(8,2) DEFAULT '0.00',
  `balance` decimal(12,2) DEFAULT '0.00',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `remark` text,
  `status` varchar(1) DEFAULT 'N',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `acc_student_accounts` */

insert  into `acc_student_accounts`(`id`,`account_no`,`lead_id`,`student_id`,`key_account_id`,`credit_control_id`,`account_type`,`vat_number`,`deposit_amount`,`balance`,`start_date`,`end_date`,`remark`,`status`,`campus_id`,`created_at`,`updated_at`) values (1,'00000001',1,2,NULL,NULL,'N',NULL,0.00,0.00,NULL,NULL,NULL,'N',1,'2016-02-03 07:03:28','2016-02-06 11:09:32'),(2,'00000002',2,3,NULL,NULL,'N',NULL,0.00,0.00,NULL,NULL,NULL,'N',1,'2016-02-03 07:29:24','2016-02-06 11:25:13'),(3,'00000003',3,4,NULL,NULL,'N',NULL,0.00,0.00,NULL,NULL,NULL,'N',1,'2016-02-24 00:54:48','2016-02-24 01:03:57');

/*Table structure for table `acc_sub_accounts` */

DROP TABLE IF EXISTS `acc_sub_accounts`;

CREATE TABLE `acc_sub_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_account_id` int(11) DEFAULT NULL,
  `tuition_time` int(11) DEFAULT '1',
  `cycle_type_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `cycle_fee` decimal(8,2) DEFAULT '0.00',
  `plan_type` varchar(2) DEFAULT 'TC',
  `plan_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(1) DEFAULT 'A',
  `is_deleted` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acc_sub_accounts` */

/*Table structure for table `acc_tax_rates` */

DROP TABLE IF EXISTS `acc_tax_rates`;

CREATE TABLE `acc_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `description` text,
  `tax_type_id` int(11) DEFAULT NULL,
  `tax_rate` decimal(6,2) DEFAULT '0.00',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `acc_tax_rates` */

insert  into `acc_tax_rates`(`id`,`code`,`description`,`tax_type_id`,`tax_rate`,`is_active`,`is_deleted`,`created_at`,`updated_at`) values (1,'VAT10','VAT Tax 10%',1,10.00,1,0,NULL,NULL),(2,'VAT7','VAT Tax 7%',1,7.00,1,1,NULL,'2015-08-01 08:40:10'),(3,'INCT01','Income Tax 0.1 percent',2,0.10,0,0,'2015-08-01 08:40:46','2015-08-01 08:41:43');

/*Table structure for table `acc_tax_types` */

DROP TABLE IF EXISTS `acc_tax_types`;

CREATE TABLE `acc_tax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acc_tax_types` */

insert  into `acc_tax_types`(`id`,`code`,`name`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'VAT','VATTIN',NULL,0,NULL,NULL),(2,'INC','INCOME TAX','Income Tax',0,NULL,NULL);

/*Table structure for table `acc_tc_fee_plans` */

DROP TABLE IF EXISTS `acc_tc_fee_plans`;

CREATE TABLE `acc_tc_fee_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_plan_master_id` int(11) DEFAULT NULL,
  `plan_code` varchar(6) DEFAULT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `is_full_time` tinyint(1) DEFAULT '1',
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `term_one_fee` decimal(12,2) DEFAULT '0.00',
  `term_two_fee` decimal(12,2) DEFAULT '0.00',
  `term_three_fee` decimal(12,2) DEFAULT '0.00',
  `term_four_fee` decimal(12,2) DEFAULT '0.00',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acc_tc_fee_plans` */

insert  into `acc_tc_fee_plans`(`id`,`acc_plan_master_id`,`plan_code`,`plan_name`,`is_full_time`,`degree_id`,`course_id`,`term_one_fee`,`term_two_fee`,`term_three_fee`,`term_four_fee`,`is_active`,`is_deleted`,`created_at`,`updated_at`) values (1,2,'311','Children (1,2,3)',1,1,1,90.00,90.00,90.00,90.00,1,0,'2015-08-25 13:47:18','2015-08-25 13:47:18'),(2,2,'312','Foundation (1,2,3)',1,1,1,90.00,90.00,90.00,90.00,1,0,'2015-08-25 15:34:18','2015-08-25 15:39:27');

/*Table structure for table `acc_tc_level_plans` */

DROP TABLE IF EXISTS `acc_tc_level_plans`;

CREATE TABLE `acc_tc_level_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_level_id` int(11) DEFAULT NULL,
  `tc_fee_plan_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acc_tc_level_plans` */

/*Table structure for table `acc_tran_types` */

DROP TABLE IF EXISTS `acc_tran_types`;

CREATE TABLE `acc_tran_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `tran_type_desc` varchar(50) DEFAULT NULL,
  `is_negative` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `acc_tran_types` */

insert  into `acc_tran_types`(`id`,`code`,`tran_type_desc`,`is_negative`,`created_at`,`updated_at`) values (1,'001','Receipt Paid',0,NULL,NULL),(2,'002','Invoice Paid',0,NULL,NULL),(3,'003','Credit Note',1,NULL,NULL),(4,'004','Write Off',1,NULL,NULL),(5,'005','Refund',1,NULL,NULL),(6,'006','Deposit',0,NULL,NULL),(7,'007','Void',1,NULL,NULL),(8,'008','Pre-payment',0,NULL,NULL);

/*Table structure for table `acd_batch_courses` */

DROP TABLE IF EXISTS `acd_batch_courses`;

CREATE TABLE `acd_batch_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `acd_batch_courses` */

insert  into `acd_batch_courses`(`id`,`batch_id`,`course_id`,`created_at`,`updated_at`) values (1,1,1,'2015-05-29 17:21:14','2015-05-29 17:21:14'),(2,1,2,'2015-05-29 17:25:29','2015-05-29 17:25:29'),(3,1,3,'2015-05-29 17:28:00','2015-05-29 17:28:00'),(4,1,4,'2015-05-29 17:31:31','2015-05-29 17:31:31');

/*Table structure for table `acd_batches` */

DROP TABLE IF EXISTS `acd_batches`;

CREATE TABLE `acd_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gen_campus_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `acd_batches` */

insert  into `acd_batches`(`id`,`code`,`name`,`gen_campus_id`,`is_deleted`,`created_at`,`updated_at`,`khr_name`) values (1,'01','Batch 1',1,0,'2015-10-30 07:07:17','2015-10-30 07:07:17','ជំនាន់ទី១'),(2,'02','Batch 2',1,0,'2015-12-03 03:44:58','2015-12-03 03:44:58','ជំនាន់ទី២'),(3,'03','Batch 3',1,0,'2015-12-03 03:45:50','2015-12-03 03:45:50','ជំនាន់ទី៣'),(4,'04','Batch 4',1,0,'2015-12-03 03:46:27','2015-12-03 03:46:27','ជំនាន់ទី៤'),(5,'05','Batch 5',1,0,'2015-12-03 03:47:12','2015-12-03 03:47:12','ជំនាន់ទី៥'),(6,'10','Batch 10',1,0,'2015-12-03 03:47:54','2015-12-03 03:47:54','ជំនាន់ទី១០'),(7,'11','Batch 11',1,0,'2015-12-03 03:48:35','2015-12-03 03:48:35','ជំនាន់ទី១១'),(8,'12','Batch 12',1,0,'2015-12-03 03:49:10','2015-12-03 03:49:10','ជំនាន់ទី១២'),(9,'13','Batch 13',1,0,'2015-12-03 03:49:40','2015-12-03 03:49:40','ជំនាន់ទី១៣'),(10,'07','Batch 7',1,0,'2016-02-17 02:34:33','2016-02-17 02:34:33','ជំនាន់​ ៧');

/*Table structure for table `acd_class_divisions` */

DROP TABLE IF EXISTS `acd_class_divisions`;

CREATE TABLE `acd_class_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_divisions` */

insert  into `acd_class_divisions`(`id`,`code`,`name`,`sequence`,`is_deleted`,`created_at`,`updated_at`,`khr_name`) values (1,'S1','Semester 1',1,0,'2015-05-29 17:35:28','2015-05-29 17:35:28','ឆមាសទីមួយ'),(2,'S2','Semester 2',2,0,'2015-05-29 17:36:07','2015-05-29 17:36:19','ឆមាសទីពីរ');

/*Table structure for table `acd_class_groups` */

DROP TABLE IF EXISTS `acd_class_groups`;

CREATE TABLE `acd_class_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_groups` */

insert  into `acd_class_groups`(`id`,`code`,`name`,`value`,`created_at`,`updated_at`) values (1,'001','A',4,'2015-03-22 09:53:48','2015-03-22 09:57:25');

/*Table structure for table `acd_class_rooms` */

DROP TABLE IF EXISTS `acd_class_rooms`;

CREATE TABLE `acd_class_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_seat` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_rooms` */

insert  into `acd_class_rooms`(`id`,`code`,`name`,`description`,`max_seat`,`campus_id`,`is_deleted`,`created_at`,`updated_at`,`khr_name`) values (1,'LAB01','Language Lab','',60,1,0,'2015-05-29 17:37:33','2015-09-14 08:14:18','Language Lab'),(2,'ROM01','Ireland','',30,1,0,'2015-09-14 08:15:01','2015-09-14 08:24:33','Ireland'),(3,'ROM02','England','',40,1,0,'2015-09-14 08:15:29','2015-09-14 08:24:44','England'),(4,'ROM03','Italy','',40,1,0,'2015-09-14 08:16:18','2015-09-14 08:24:53','Italy'),(5,'ROM04','Germany','',50,1,0,'2015-09-14 08:17:04','2015-09-14 08:25:03','Germany'),(6,'ROM05','Russia','',48,1,0,'2015-09-14 08:17:56','2015-09-14 08:25:13','Russia'),(7,'ROM06','Teacher Room 1st Floor','',10,1,0,'2015-09-14 08:24:09','2015-09-14 08:40:59','Teacher room'),(8,'LAB02','Computer Lab','',48,1,0,'2015-09-14 08:26:05','2015-09-14 08:26:05','Computer Lab'),(9,'ROM07','Australia','',80,1,0,'2015-09-14 08:27:53','2015-09-14 08:27:53','Australia'),(10,'ROM08','Laos','',48,1,0,'2015-09-14 08:28:38','2015-09-14 08:28:38','Laos'),(11,'ROM09','Meeting Room','',15,1,0,'2015-09-14 08:29:11','2015-09-14 08:29:11','Meeting Room'),(12,'ROM10','India','',48,1,0,'2015-09-14 08:29:47','2015-09-14 08:29:47','India'),(13,'ROM11','Japan','',50,1,0,'2015-09-14 08:30:21','2015-09-14 08:30:21','Japan'),(14,'ROM12','Cambodia','',48,1,0,'2015-09-14 08:30:46','2015-09-14 08:30:46','Cambodia'),(15,'ROM13','Malaysia','',24,1,0,'2015-09-14 08:32:07','2015-09-14 08:32:07','Malaysia'),(16,'ROM14','Korea','',72,1,0,'2015-09-14 08:32:36','2015-09-14 08:32:36','Korea'),(17,'ROM15','Singapore','',20,1,0,'2015-09-14 08:33:27','2015-09-14 08:33:27','Singapore'),(18,'ROM16','China','',50,1,0,'2015-09-14 08:34:11','2015-09-14 08:34:11','China'),(19,'ROM17','Research Room','',11,1,0,'2015-09-14 08:35:02','2015-09-14 08:35:02','Research Room'),(20,'ROM18','Agentina','',13,1,0,'2015-09-14 08:35:32','2015-09-14 08:35:32','Agentina'),(21,'ROM19','Costa Rica','',14,1,0,'2015-09-14 08:36:06','2015-09-14 08:36:06','Costa Rica'),(22,'ROM20','Paraguay','',24,1,0,'2015-09-14 08:36:36','2015-09-14 08:36:36','Paraguay'),(23,'ROM21','Peru','',42,1,0,'2015-09-14 08:37:08','2015-09-14 08:37:08','Peru'),(24,'ROM22','Brazil','',66,1,0,'2015-09-14 08:37:58','2015-09-14 08:37:58','Brazil'),(25,'ROM23','Columbia','',36,1,0,'2015-09-14 08:39:33','2015-09-14 08:39:33','Columbia'),(26,'ROM24','Teacher Room 3th Floor','',15,1,0,'2015-09-14 08:40:29','2015-09-14 08:40:29','Teacher Room 3th Floor'),(27,'ROM25','Ghana','',44,1,0,'2015-09-14 08:41:42','2015-09-14 08:41:42','Ghana'),(28,'ROM26','Kenya','',82,1,0,'2015-09-14 08:42:22','2015-09-14 08:42:22','Kenya'),(29,'ROM27','Nigeria','',30,1,0,'2015-09-14 08:44:19','2015-09-14 08:44:19','Nigeria'),(30,'ROM28','South Africa','',64,1,0,'2015-09-14 08:44:52','2015-09-14 08:44:52','South Africa');

/*Table structure for table `acd_class_sessions` */

DROP TABLE IF EXISTS `acd_class_sessions`;

CREATE TABLE `acd_class_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `acd_class_sessions` */

insert  into `acd_class_sessions`(`id`,`code`,`name`,`created_at`,`updated_at`) values (1,'M','Morning','2015-06-12 15:20:30','2015-06-12 15:20:30'),(2,'A','Afternoon','2015-06-12 15:20:30','2015-06-12 15:20:30'),(3,'E','Evening','2015-06-12 15:20:30','2015-06-12 15:20:30'),(4,'N','Night','2015-06-12 15:20:30','2015-06-12 15:20:30'),(5,'W','Weekend','2015-06-12 15:20:30','2015-06-12 15:20:30');

/*Table structure for table `acd_class_shifts` */

DROP TABLE IF EXISTS `acd_class_shifts`;

CREATE TABLE `acd_class_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `khr_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_shifts` */

insert  into `acd_class_shifts`(`id`,`code`,`name`,`khr_name`,`created_at`,`updated_at`) values (1,'MORN','Morning','ពេលព្រឹក',NULL,NULL),(2,'AFTN','Afternoon','ពេលថ្ងៃ',NULL,NULL),(3,'EVEN','Evening','ពេលល្ងាច',NULL,NULL),(4,'WKND','Weekend','ចុងសប្តាហ៍',NULL,NULL);

/*Table structure for table `acd_class_tc_details` */

DROP TABLE IF EXISTS `acd_class_tc_details`;

CREATE TABLE `acd_class_tc_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_tc_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `total_session` int(11) DEFAULT NULL,
  `pass_score` int(11) DEFAULT NULL,
  `max_score` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_tc_details` */

/*Table structure for table `acd_class_tcs` */

DROP TABLE IF EXISTS `acd_class_tcs`;

CREATE TABLE `acd_class_tcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(15) DEFAULT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `academic_year_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `course_level_id` int(11) DEFAULT NULL,
  `tuition_time_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `study_start_time` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_tcs` */

insert  into `acd_class_tcs`(`id`,`class_code`,`class_name`,`degree_id`,`course_id`,`academic_year_id`,`term_id`,`room_id`,`course_level_id`,`tuition_time_id`,`session_id`,`start_date`,`end_date`,`study_start_time`,`description`,`status`,`campus_id`,`created_at`,`updated_at`) values (1,'CLS001','GEP Elementary, L2 Morning Malaysia',1,1,1,1,15,10,2,1,'2015-01-02','2015-03-07','6:30 AM','','S',1,'2015-10-02 16:03:12','2015-10-02 16:03:12');

/*Table structure for table `acd_class_wu_details` */

DROP TABLE IF EXISTS `acd_class_wu_details`;

CREATE TABLE `acd_class_wu_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_wu_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `total_session` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `pass_score` int(11) DEFAULT NULL,
  `max_score` int(11) DEFAULT NULL,
  `no_exam` tinyint(1) DEFAULT NULL,
  `is_exam` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_wu_details` */

/*Table structure for table `acd_class_wus` */

DROP TABLE IF EXISTS `acd_class_wus`;

CREATE TABLE `acd_class_wus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(15) DEFAULT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `program_type` varchar(1) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `academic_year_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `class_shift_id` int(11) DEFAULT NULL,
  `is_gpa` tinyint(1) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  `status` varchar(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acd_class_wus` */

insert  into `acd_class_wus`(`id`,`class_code`,`class_name`,`program_type`,`degree_id`,`course_id`,`standard_id`,`division_id`,`academic_year_id`,`room_id`,`class_shift_id`,`is_gpa`,`credit`,`start_date`,`end_date`,`description`,`status`,`campus_id`,`created_at`,`updated_at`) values (1,'U0001','English Associate 2014 Year 1 Morning','N',NULL,NULL,1,1,1,18,1,0,NULL,'2014-10-02','2015-10-02','','S',1,'2015-10-02 16:33:27','2015-10-02 16:33:27');

/*Table structure for table `acd_course_books` */

DROP TABLE IF EXISTS `acd_course_books`;

CREATE TABLE `acd_course_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(6) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `description` text,
  `status` varchar(1) DEFAULT 'A',
  `is_deleted` tinyint(1) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acd_course_books` */

insert  into `acd_course_books`(`id`,`book_code`,`book_name`,`author`,`description`,`status`,`is_deleted`,`campus_id`,`created_at`,`updated_at`) values (1,'SGRT','Sound Great ','',NULL,'A',0,NULL,NULL,NULL),(2,'TOFF','Taking Off',NULL,NULL,'A',0,NULL,NULL,NULL);

/*Table structure for table `acd_course_faculties` */

DROP TABLE IF EXISTS `acd_course_faculties`;

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

/*Data for the table `acd_course_faculties` */

insert  into `acd_course_faculties`(`id`,`code`,`abbr`,`name`,`course_type`,`credit`,`status`,`description`,`is_deleted`,`created_at`,`updated_at`,`campus_id`,`khr_name`) values (1,'ENGGEP','GEP','General English Program','TC',0,'A','',0,'2015-05-29 17:17:36','2015-10-30 07:26:39',1,'ភាសាអង់គ្លេសទូរទៅ'),(2,'ENGESP','ESP','English for Specific Purposes','TC',0,'A','',0,'2015-05-29 17:24:52','2015-10-30 07:27:03',1,'ជំនាញភាសាអង់គ្លេស'),(3,'C001','BSA','Business Administrator','WU',0,'A','',0,'2015-05-29 17:28:00','2015-08-22 14:58:32',1,'គ្រប់គ្រងពាណិជ្ជកម្ម និង វិទ្យាសាស្រ្តសេដ្ឋកិច្ច'),(4,'C002','HTM','Hotel and Tourist Management','WU',0,'A','',0,'2015-05-29 17:30:51','2015-08-22 15:04:19',1,'គ្រប់គ្រងសណ្ឋាគារ​ ទេសចរណ៍ និង បដិសណ្ឋារកិច្ច'),(5,'C003','PCA','Public Administration','WU',0,'A','',0,NULL,'2015-08-22 15:04:26',1,'គ្រប់គ្រងសាធារណៈ'),(6,'C004','FNB','Finance & Banking','WU',0,'A','',0,NULL,'2015-08-22 15:05:41',1,'គ្រប់គ្រងហិរញ្ញវត្ថុ និង ធនាគារ'),(7,'C005','AIE','Arts in English','WU',0,'A','',0,NULL,'2015-10-30 07:37:04',1,''),(8,'C006','SOS','Social Science','WU',0,'A','',0,NULL,'2015-08-22 15:09:09',1,'វិទ្យាសាស្រ្តសង្គម'),(9,'C007','SCT','Computer Science','WU',0,'A','',0,NULL,'2015-09-14 15:38:58',1,'វិទ្យាសាស្រ្តកំុព្យូទ័រ'),(10,'C008','AHL','Arts, Humanities and Languages','WU',0,'A','',0,NULL,'2015-08-22 15:09:26',1,'សិល្បៈ មនុស្សសាស្រ្ត និង ភាសា'),(11,'C009','ESC','Education Science','WU',0,'A','',0,NULL,'2015-08-22 15:09:39',1,'វិទ្យាសាស្រ្តអប់រំ'),(12,'C010','LAW','Faculty of Law','WU',0,'A','',0,NULL,'2015-08-22 15:10:12',1,'នីតិសាស្រ្ត'),(13,'COMOFF','MOF','Microsoft Office 2010','TC',0,'A','',0,'2015-08-17 14:20:43','2015-10-30 07:27:58',1,'វគ្គកំុព្យូទ័រសំរាប់ការិយាល'),(14,'ENGGMC','GMC','Grammar Class','TC',0,'A','',0,'2015-10-30 07:31:22','2015-10-30 07:31:22',1,'វគ្គវេយ្យាករណ៍');

/*Table structure for table `acd_course_level_types` */

DROP TABLE IF EXISTS `acd_course_level_types`;

CREATE TABLE `acd_course_level_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `acd_course_level_types` */

insert  into `acd_course_level_types`(`id`,`code`,`name`,`is_deleted`,`created_at`,`updated_at`) values (1,'CDL','Children Level',0,'2015-09-14 04:06:33','2015-09-14 04:06:33'),(2,'FDL','Foundation Level',0,'2015-09-14 04:07:02','2015-09-14 04:07:02'),(3,'BGL','Beginner Level',0,'2015-09-14 04:07:24','2015-09-14 04:07:24'),(4,'ELL','Elementary Level',0,'2015-09-14 04:07:47','2015-09-14 04:07:47'),(5,'PIL','Pre-intermediate Level',0,'2015-09-14 04:08:32','2015-09-14 04:08:32'),(6,'IDL','Intermediate Level',0,'2015-09-14 04:08:56','2015-09-14 04:08:56'),(7,'UPL','Upper-intermediate Level',0,'2015-09-14 04:09:44','2015-09-14 04:09:52'),(8,'ADL','Advanced Level',0,'2015-09-14 04:11:11','2015-09-14 04:11:11'),(9,'ESP','ESP',0,'2015-10-03 02:26:10','2015-10-03 02:26:10'),(10,'GMC','English Grammar',0,'2015-10-30 07:42:44','2015-10-30 07:42:44'),(11,'NPC','Newspaper',0,'2015-10-30 07:58:21','2015-10-30 07:58:21');

/*Table structure for table `acd_course_levels` */

DROP TABLE IF EXISTS `acd_course_levels`;

CREATE TABLE `acd_course_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `level_type_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `acd_course_levels` */

insert  into `acd_course_levels`(`id`,`code`,`name`,`course_id`,`level_type_id`,`sequence`,`created_at`,`updated_at`) values (1,'CHDRL1','Children Level 1',1,1,1,'2015-09-14 04:12:09','2015-09-14 04:13:55'),(2,'CHDRL2','Children Level 2',1,1,2,'2015-09-14 04:12:36','2015-09-14 04:14:54'),(3,'CHDRL3','Children Level 3',1,1,3,'2015-09-14 04:13:21','2015-09-14 04:15:30'),(4,'FONDL1','Foundation Level 1',1,2,4,'2015-09-14 04:16:27','2015-09-14 04:16:27'),(5,'FONDL2','Foundation Level 2',1,2,5,'2015-09-14 04:16:51','2015-09-14 04:16:59'),(6,'FONDL3','Foundation Level 3',1,2,6,'2015-09-14 04:17:29','2015-09-14 04:17:29'),(7,'BEGNL1','Beginner Level 1',1,3,7,'2015-09-14 04:18:27','2015-09-14 04:18:27'),(8,'BEGNL2','Beginner Level 2',1,3,8,'2015-09-14 04:18:47','2015-09-14 04:18:47'),(9,'BEGNL3','Beginner Level 3',1,3,9,'2015-09-14 04:19:09','2015-09-14 04:19:09'),(10,'ELMTL4','Elementary Level 4',1,4,10,'2015-09-14 04:19:46','2015-09-14 04:22:25'),(11,'ELMTL5','Elementary Level 5',1,4,11,'2015-09-14 04:20:10','2015-09-14 04:22:15'),(12,'ELMTL6','Elementary Level 6',1,4,12,'2015-09-14 04:20:35','2015-09-14 04:21:58'),(13,'PREIND7','Pre-intermediate Level 7',1,5,13,'2015-09-14 04:21:47','2015-09-14 04:21:47'),(14,'PREIND8','Pre-imtermediate Level 8',1,5,14,'2015-09-14 04:24:57','2015-09-14 04:24:57'),(15,'PREIND9','Pre-intermediate Level 9',1,5,15,'2015-09-14 04:25:57','2015-09-14 04:26:07'),(16,'INTMD10','Intermediate Level 10',1,6,16,'2015-09-14 04:42:29','2015-09-14 04:42:29'),(17,'INTMD11','Intermediate Level 11',1,6,17,'2015-09-14 04:42:55','2015-09-14 04:42:55'),(18,'INTMD12','Intermediate Level 12',1,6,18,'2015-09-14 04:43:18','2015-09-14 04:43:18'),(19,'UPIN13','Upper-intermediate Level 13',1,7,19,'2015-09-14 04:44:41','2015-09-14 04:46:31'),(20,'UPIN14','Upper-intermediate Level 14',1,7,20,'2015-09-14 04:45:23','2015-09-14 04:46:44'),(21,'UPIN15','Upper-intermediate Level 15',1,7,21,'2015-09-14 04:45:42','2015-09-14 04:46:56'),(22,'ADVL16','Advanced Level 16',1,8,22,'2015-09-14 04:47:32','2015-09-14 04:47:32'),(23,'ADVL17','Advanced Level 17',1,8,23,'2015-09-14 04:48:06','2015-09-14 04:48:06'),(24,'ADVL18','Advanced Level 18',1,8,24,'2015-09-14 04:48:35','2015-09-14 04:48:35'),(25,'ESP1','ESP LEVEL 1',2,9,25,'2015-10-03 02:27:02','2015-10-03 02:27:02'),(26,'ESP2','ESP LEVEL 2',2,9,26,'2015-10-03 02:27:26','2015-10-03 02:27:26'),(27,'GMCPSP','Part of Speech',14,10,0,'2015-10-30 08:03:21','2015-10-30 08:03:59'),(28,'SPCTR1','Spectrum 1',14,10,0,'2015-10-30 08:06:45','2015-10-30 08:06:57'),(29,'SPCTR2','Spectrum 2',14,10,0,'2015-10-30 08:07:48','2015-10-30 08:08:24');

/*Table structure for table `acd_course_majors` */

DROP TABLE IF EXISTS `acd_course_majors`;

CREATE TABLE `acd_course_majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `acd_course_majors` */

insert  into `acd_course_majors`(`id`,`major_id`,`course_id`,`is_default`,`created_at`,`updated_at`) values (1,2,1,NULL,'2015-10-30 07:19:09','2015-10-30 07:19:09'),(2,6,2,NULL,'2015-10-30 07:27:03','2015-10-30 07:27:03'),(3,7,13,NULL,'2015-10-30 07:27:58','2015-10-30 07:27:58'),(4,8,14,NULL,'2015-10-30 07:33:00','2015-10-30 07:33:00'),(5,1,9,NULL,'2015-10-30 07:34:33','2015-10-30 07:34:33'),(6,3,9,NULL,'2015-10-30 07:34:33','2015-10-30 07:34:33'),(7,4,9,NULL,'2015-10-30 07:34:33','2015-10-30 07:34:33'),(8,5,9,NULL,'2015-10-30 07:34:33','2015-10-30 07:34:33'),(9,1,3,NULL,'2015-10-30 07:36:35','2015-10-30 07:36:35'),(10,1,4,NULL,'2015-10-30 07:36:42','2015-10-30 07:36:42'),(11,1,5,NULL,'2015-10-30 07:36:52','2015-10-30 07:36:52'),(12,1,6,NULL,'2015-10-30 07:37:00','2015-10-30 07:37:00'),(13,1,7,NULL,'2015-10-30 07:38:08','2015-10-30 07:38:08'),(14,1,8,NULL,'2015-10-30 07:38:41','2015-10-30 07:38:41'),(15,1,10,NULL,'2015-10-30 07:38:56','2015-10-30 07:38:56'),(16,1,11,NULL,'2015-10-30 07:39:08','2015-10-30 07:39:08'),(17,1,12,NULL,'2015-10-30 07:39:25','2015-10-30 07:39:25');

/*Table structure for table `acd_course_subjects` */

DROP TABLE IF EXISTS `acd_course_subjects`;

CREATE TABLE `acd_course_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acd_course_id` int(11) DEFAULT NULL,
  `acd_subject_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `degree_course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acd_course_subjects` */

/*Table structure for table `acd_degree_courses` */

DROP TABLE IF EXISTS `acd_degree_courses`;

CREATE TABLE `acd_degree_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `acd_degree_courses` */

insert  into `acd_degree_courses`(`id`,`degree_id`,`course_id`,`created_at`,`updated_at`) values (2,1,1,'2015-10-30 08:11:57','2015-10-30 08:11:57'),(3,2,13,'2015-10-30 08:12:08','2015-10-30 08:12:08'),(4,1,2,'2015-10-30 08:12:21','2015-10-30 08:12:21'),(5,1,14,'2015-10-30 08:12:24','2015-10-30 08:12:24'),(6,3,3,'2015-10-31 00:09:50','2015-10-31 00:09:50'),(7,3,4,'2015-11-15 11:42:59','2015-11-15 11:42:59'),(8,3,9,'2015-11-15 11:43:07','2015-11-15 11:43:07'),(9,3,6,'2015-11-15 11:43:13','2015-11-15 11:43:13'),(10,3,10,'2015-11-15 11:43:28','2015-11-15 11:43:28'),(11,4,3,'2015-12-03 03:40:14','2015-12-03 03:40:14'),(12,4,4,'2015-12-03 03:40:17','2015-12-03 03:40:17'),(13,4,5,'2015-12-03 03:40:19','2015-12-03 03:40:19'),(14,4,6,'2015-12-03 03:40:22','2015-12-03 03:40:22'),(15,4,7,'2015-12-03 03:40:25','2015-12-03 03:40:25'),(16,4,8,'2015-12-03 03:40:28','2015-12-03 03:40:28'),(17,4,9,'2015-12-03 03:40:31','2015-12-03 03:40:31'),(18,4,11,'2015-12-03 03:40:38','2015-12-03 03:40:38'),(19,4,12,'2015-12-03 03:40:40','2015-12-03 03:40:40'),(20,4,10,'2015-12-03 03:40:43','2015-12-03 03:40:43');

/*Table structure for table `acd_degrees` */

DROP TABLE IF EXISTS `acd_degrees`;

CREATE TABLE `acd_degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `degree_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `acd_degrees` */

insert  into `acd_degrees`(`id`,`name`,`abbr`,`degree_type`,`created_at`,`updated_at`) values (1,'English Course','E','TC','2015-03-08 04:27:54','2015-03-08 04:27:54'),(2,'Short Course','S','TC','2015-03-08 04:27:54','2015-03-08 04:27:54'),(3,'Associate','A','WU','2015-03-08 04:27:55','2015-03-08 04:27:55'),(4,'Bachelor','B','WU','2015-03-08 04:27:55','2015-03-08 04:27:55'),(5,'Master','M','WU','2015-03-08 04:27:55','2015-03-08 04:27:55'),(6,'Doctor','D','WU','2015-03-08 04:27:55','2015-03-08 04:27:55');

/*Table structure for table `acd_faculty_divisions` */

DROP TABLE IF EXISTS `acd_faculty_divisions`;

CREATE TABLE `acd_faculty_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `acd_faculty_divisions` */

insert  into `acd_faculty_divisions`(`id`,`division_id`,`standard_id`,`course_id`,`degree_id`) values (1,1,2,3,3),(2,2,2,3,3),(3,1,1,3,3),(4,2,1,3,3),(5,1,1,3,4),(6,2,1,3,4),(7,1,2,3,4),(8,2,2,3,4),(9,1,3,3,4),(10,2,3,3,4),(11,1,4,3,4),(12,2,4,3,4);

/*Table structure for table `acd_faculty_standards` */

DROP TABLE IF EXISTS `acd_faculty_standards`;

CREATE TABLE `acd_faculty_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `acd_faculty_standards` */

insert  into `acd_faculty_standards`(`id`,`standard_id`,`course_id`,`degree_id`) values (1,1,3,3),(2,2,3,3),(3,1,4,3),(4,2,4,3),(5,1,3,4),(6,2,3,4),(7,3,3,4),(8,4,3,4),(9,1,4,4),(10,2,4,4),(11,3,4,4),(12,4,4,4),(13,1,5,4),(14,2,5,4),(15,3,5,4),(16,4,5,4),(17,1,6,4),(18,2,6,4),(19,3,6,4),(20,4,6,4),(21,1,7,4),(22,2,7,4),(23,3,7,4),(24,4,7,4),(25,1,8,4),(26,2,8,4),(27,3,8,4),(28,4,8,4),(29,1,9,4),(30,2,9,4),(31,3,9,4),(32,4,9,4),(33,1,11,4),(34,2,11,4),(35,3,11,4),(36,4,11,4),(37,1,12,4),(38,2,12,4),(39,3,12,4),(40,4,12,4),(41,1,10,4),(42,2,10,4),(43,3,10,4),(44,4,10,4);

/*Table structure for table `acd_faculty_subject_details` */

DROP TABLE IF EXISTS `acd_faculty_subject_details`;

CREATE TABLE `acd_faculty_subject_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `total_credits` int(11) DEFAULT '0',
  `sessions_per_week` int(11) DEFAULT '0',
  `total_sessions` int(11) DEFAULT '0',
  `durations_per_session` int(11) DEFAULT '0',
  `total_durations` int(11) DEFAULT '0',
  `description` text,
  `is_deleted` tinyint(4) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acd_faculty_subject_details` */

insert  into `acd_faculty_subject_details`(`id`,`division_id`,`standard_id`,`course_id`,`degree_id`,`subject_id`,`total_credits`,`sessions_per_week`,`total_sessions`,`durations_per_session`,`total_durations`,`description`,`is_deleted`,`campus_id`,`created_at`,`updated_at`) values (1,1,1,3,3,3,0,0,0,0,0,'',0,1,'2015-10-31 00:22:42','2015-10-31 00:22:42');

/*Table structure for table `acd_majors` */

DROP TABLE IF EXISTS `acd_majors`;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `acd_majors` */

insert  into `acd_majors`(`id`,`code`,`name`,`is_deleted`,`created_at`,`updated_at`,`khr_name`,`campus_id`) values (1,'DEFAULT','Default',0,'2015-09-14 15:37:41','2015-12-03 03:49:55','ជំនាញដំបូង',1),(2,'ENGGEP','General English Program',0,'2015-09-14 08:47:35','2015-10-30 07:23:50','ភាសាអង់គ្លេសទូរទៅ',1),(3,'COMPRO','Computer Programming',0,'2015-10-30 07:10:41','2015-10-30 07:23:43','សរសេរកម្មវិធីកំុព្យូទ័រ',1),(4,'COMNET','Computer Networking',0,'2015-10-30 07:12:18','2015-10-30 07:23:36','បណ្តាញកំុព្យូទ័រ',1),(5,'COMDB','Database Management',0,'2015-10-30 07:14:43','2015-10-30 07:23:29','គ្រប់គ្រងទិន្ន័យកំុព្យូទ័រ',1),(6,'ENGSP','English for Specific Purposes',0,'2015-10-30 07:20:09','2015-10-30 07:22:58','ភាសាអង់គ្លេសសំរាប់ជំនាញជាក់លាក់',1),(7,'COMOFF','Microsoft Office',0,'2015-10-30 07:21:42','2015-10-30 07:21:42','កំុព្យូទ័រការិយាល័យ',1),(8,'ENGGMC','English Grammar',0,'2015-10-30 07:32:51','2015-10-30 07:32:51','អង់គ្លេសវេយ្យាករណ៍',1);

/*Table structure for table `acd_rel_courses_subjects` */

DROP TABLE IF EXISTS `acd_rel_courses_subjects`;

CREATE TABLE `acd_rel_courses_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acd_rel_courses_subjects` */

/*Table structure for table `acd_room_items` */

DROP TABLE IF EXISTS `acd_room_items`;

CREATE TABLE `acd_room_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT '0',
  `stock_type` varchar(255) DEFAULT 'I',
  `stock_by_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acd_room_items` */

/*Table structure for table `acd_standard_divisions` */

DROP TABLE IF EXISTS `acd_standard_divisions`;

CREATE TABLE `acd_standard_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `stand_degree_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acd_standard_divisions` */

/*Table structure for table `acd_standards` */

DROP TABLE IF EXISTS `acd_standards`;

CREATE TABLE `acd_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `khr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `acd_standards` */

insert  into `acd_standards`(`id`,`code`,`name`,`sequence`,`is_deleted`,`created_at`,`updated_at`,`khr_name`) values (1,'Y1','Year 1',1,0,'2015-05-29 17:33:58','2015-05-29 17:33:58','ឆ្នាំទីមួយ'),(2,'Y2','Year 2',2,0,'2015-05-29 17:34:38','2015-05-29 17:36:32','ឆ្នាំទីពីរ'),(3,'Y3','Year 3',3,0,'2015-08-09 07:39:58','2015-08-09 07:39:58','ឆ្មាំទី៣'),(4,'Y4','Year 4',4,0,'2015-08-09 07:40:46','2015-08-09 07:40:46','ឆ្មាំទី៤');

/*Table structure for table `acd_subject_types` */

DROP TABLE IF EXISTS `acd_subject_types`;

CREATE TABLE `acd_subject_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `khr_name` varchar(50) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `acd_subject_types` */

insert  into `acd_subject_types`(`id`,`name`,`khr_name`,`code`,`created_at`,`updated_at`) values (1,'Theory','ទឹ្រស្តី','001',NULL,NULL),(2,'Practical','អនុវត្ត','002',NULL,NULL),(3,'Theory and Practical','ទឹ្រស្តី​ និង​ អនុវត្ត','003',NULL,NULL),(4,'Others','ផេ្សងៗ','004',NULL,NULL);

/*Table structure for table `acd_subjects` */

DROP TABLE IF EXISTS `acd_subjects`;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `acd_subjects` */

insert  into `acd_subjects`(`id`,`code`,`name`,`description`,`created_at`,`updated_at`,`subject_type_id`,`campus_id`,`is_deleted`,`khr_name`,`credit`,`sessions`) values (1,'S00001','Core English','','2015-05-29 17:48:28','2015-05-29 18:32:40',1,1,0,'ភាសាអង់គ្លេសស្នូល',0,15),(2,'S00002','Listening & Speaking','','2015-05-29 18:32:21','2015-05-29 18:32:30',1,1,0,'មុខវិជ្ចាស្តាប់ និង​ និយាយ',0,15),(3,'S00003','Basic English for Communication','','2015-05-30 00:05:36','2015-08-22 15:14:17',1,1,1,'មូលដ្ឌានគ្រឹះភាសាអង់គ្លេសសំរាប់ទំនាក់ទំនង',3,45),(4,'S0003','C++ Programming I','','2015-08-09 06:23:51','2015-08-09 06:23:51',3,1,0,'កម្មវិធី C++ វគ្គ១',3,45),(5,'S0004','English for Business','','2015-08-17 14:31:29','2015-08-17 14:31:29',1,1,0,'ភាសាអង់សំរាប់អាជីវកម្ម',3,45),(6,'LU01','Linux OS I','','2015-08-19 07:23:05','2015-08-19 07:23:05',3,1,0,'Linux OS I',3,15),(7,'LU02','Linux Admistration','','2015-08-19 07:23:45','2015-08-19 07:23:45',3,1,0,'Linux Admistration',3,15),(8,'MOFWD','Microsoft Word 2010','','2015-10-27 02:35:38','2015-10-27 02:35:38',3,1,0,'កម្មវិធី word 2010',0,45),(9,'MOFXC','Microsoft Excel 2010','','2015-10-27 02:36:44','2015-10-27 02:36:44',3,1,0,'កម្មវិធី Excel 2010',0,15);

/*Table structure for table `acd_terms` */

DROP TABLE IF EXISTS `acd_terms`;

CREATE TABLE `acd_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `term_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `acd_terms` */

insert  into `acd_terms`(`id`,`code`,`term_name`,`is_deleted`,`created_at`,`updated_at`) values (1,'T01','Term 1',0,NULL,NULL),(2,'T02','Term 2',0,NULL,NULL),(3,'T03','Term 3',0,NULL,NULL),(4,'T04','Term 4',0,NULL,NULL);

/*Table structure for table `acd_tm_courses` */

DROP TABLE IF EXISTS `acd_tm_courses`;

CREATE TABLE `acd_tm_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `khr_name` varchar(100) DEFAULT NULL,
  `abbr` varchar(3) NOT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `description` text,
  `status` varchar(1) DEFAULT 'A',
  `is_deleted` tinyint(1) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acd_tm_courses` */

/*Table structure for table `acd_tuition_times` */

DROP TABLE IF EXISTS `acd_tuition_times`;

CREATE TABLE `acd_tuition_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tuition_name` varchar(255) DEFAULT NULL,
  `tuition_hours` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acd_tuition_times` */

insert  into `acd_tuition_times`(`id`,`tuition_name`,`tuition_hours`,`created_at`,`updated_at`) values (1,'Full Time',3,NULL,NULL),(2,'Part Time',1,NULL,NULL);

/*Table structure for table `auditrials` */

DROP TABLE IF EXISTS `auditrials`;

CREATE TABLE `auditrials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ad_type` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `description` text,
  `data_detail` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8;

/*Data for the table `auditrials` */

insert  into `auditrials`(`id`,`user_id`,`ad_type`,`module`,`description`,`data_detail`,`created_at`,`updated_at`,`table_name`,`reference_id`) values (1,1,'Create','SdnLead','create new name =   Seameng','','2015-10-02 15:52:58','2015-10-02 15:52:58',NULL,NULL),(2,1,'Create','Student','create Student =   Seameng Meth',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Seameng\", \"last_name\"=>\"Meth\", \"khr_first_name\"=>\"មិត\", \"khr_last_name\"=>\"សីុម៉េង\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"012111000\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/020/original/images_%281%29.jpg?1443801258\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>10, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443801288723\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-02 15:54:49','2015-10-02 15:54:49',NULL,NULL),(3,1,'Update','SdnLead','udpate name =   Seameng',' ','2015-10-02 15:55:20','2015-10-02 15:55:20',NULL,NULL),(4,1,'Ative','Student','Ative Student =   Seameng Meth',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-02 15:55:30','2015-10-02 15:55:30',NULL,NULL),(5,1,'Create','SdnLead','create new name =   Lyting','','2015-10-02 15:57:04','2015-10-02 15:57:04',NULL,NULL),(6,1,'Create','Student','create Student =   Lyting Taing',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"2\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Lyting\", \"last_name\"=>\"Taing\", \"khr_first_name\"=>\"តាំង\", \"khr_last_name\"=>\"លីទីញ\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"012298882\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/sdn_leads/avatars/000/000/002/thumb/images_%283%29.jpg?1443801422\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>10, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443801472020\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-02 15:57:52','2015-10-02 15:57:52',NULL,NULL),(7,1,'Ative','Student','Ative Student =   Lyting Taing',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-02 15:58:48','2015-10-02 15:58:48',NULL,NULL),(8,1,'Create','AcdClassTc','create new name =   GEP Elementary, L2 Morning Malaysia','{\"data\"=>{\"classId\"=>\"\", \"className\"=>\"\", \"classType\"=>\"\", \"degree\"=>\"\", \"course\"=>\"\", \"term\"=>\"\", \"faculty\"=>\"\", \"shift_name\"=>\"\", \"classRoom\"=>\"\", \"description\"=>\"\", \"startDate\"=>\"\", \"endDate\"=>\"\", \"status\"=>\"S\", \"statusId\"=>\"\", \"acd_class_tc_detail_attributes\"=>nil, \"class_code\"=>\"CLS001\", \"degree_id\"=>1, \"class_name\"=>\"GEP Elementary, L2 Morning Malaysia\", \"course_id\"=>1, \"academic_year_id\"=>2, \"course_level_id\"=>10, \"room_id\"=>15, \"term_id\"=>1, \"tuition_time_id\"=>2, \"session_id\"=>1, \"start_date\"=>\"2015-01-02\", \"end_date\"=>\"2015-03-07\", \"study_start_time\"=>\"6:30 AM\"}, \"_dc\"=>\"1443801792026\", \"action\"=>\"create\", \"controller\"=>\"acd_class_tc\", \"acd_class_tc\"=>{}}','2015-10-02 16:03:12','2015-10-02 16:03:12',NULL,NULL),(9,1,'Create','SdnLead','create new name =   Pheakdey','','2015-10-02 16:17:59','2015-10-02 16:17:59',NULL,NULL),(10,1,'Update','SdnLead','udpate name =   Pheakdey',' ','2015-10-02 16:18:14','2015-10-02 16:18:14',NULL,NULL),(11,1,'Create','Student','create Student =   Pheakdey Bou',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"3\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Pheakdey\", \"last_name\"=>\"Bou\", \"khr_first_name\"=>\"ប៊ូ\", \"khr_last_name\"=>\"ភក្តី\", \"gender\"=>\"M\", \"date_of_birth\"=>\"1993-04-14\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"070756852\", \"email\"=>\"\", \"address\"=>\"123\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/021/original/goodphotofinal.png?1443803061\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>5, \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>11, \"degree_id\"=>3, \"course_id\"=>10, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\"}, \"_dc\"=>\"1443803115540\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-02 16:25:16','2015-10-02 16:25:16',NULL,NULL),(12,1,'Ative','Student','Ative Student =   Pheakdey Bou',' {\"student_id\"=>\"3\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-02 16:25:22','2015-10-02 16:25:22',NULL,NULL),(13,1,'Create','Student','create Student =   Sophanhava Chea',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophanhava\", \"last_name\"=>\"Chea\", \"khr_first_name\"=>\"ជា\", \"khr_last_name\"=>\"សុបញ្ញាវ៉ា\", \"gender\"=>\"F\", \"date_of_birth\"=>\"1994-05-07\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"089906227\", \"email\"=>\"\", \"address\"=>\"Phnom Penh\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/022/original/images_%284%29.jpg?1443803405\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>1, \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"012928129\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"012232214\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>11, \"degree_id\"=>3, \"course_id\"=>10, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\"}, \"_dc\"=>\"1443803408803\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-02 16:30:09','2015-10-02 16:30:09',NULL,NULL),(14,1,'Ative','Student','Ative Student =   Sophanhava Chea',' {\"student_id\"=>\"4\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-02 16:30:18','2015-10-02 16:30:18',NULL,NULL),(15,1,'Create','AcdClassWu','create new name =   English Associate 2014 Year 1 Morning','{\"class_code\"=>\"U0001\", \"class_name\"=>\"English Associate 2014 Year 1 Morning\", \"program_type\"=>\"N\", \"degree_id\"=>\"\", \"course_id\"=>\"\", \"standard_id\"=>1, \"division_id\"=>1, \"academic_year_id\"=>1, \"room_id\"=>18, \"class_shift_id\"=>1, \"is_gpa\"=>false, \"credit\"=>\"\", \"start_date\"=>\"2014-10-02\", \"end_date\"=>\"2015-10-02\", \"description\"=>\"\", \"status\"=>\"S\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"acd_class_wu_detail_attributes\"=>nil, \"degree\"=>\"\", \"course\"=>\"\", \"term\"=>\"\", \"session\"=>\"\", \"class_room\"=>\"\"}','2015-10-02 16:33:27','2015-10-02 16:33:27',NULL,NULL),(16,1,'Login','System','Login System','','2015-10-03 00:17:26','2015-10-03 00:17:26',NULL,NULL),(17,1,'Create','Student','create Student =   Pheakdey Bou',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"3\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Pheakdey\", \"last_name\"=>\"Bou\", \"khr_first_name\"=>\"ប៊ូ\", \"khr_last_name\"=>\"ភក្តី\", \"gender\"=>\"M\", \"date_of_birth\"=>\"1993-04-14\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"070756852\", \"email\"=>\"\", \"address\"=>\"123\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/sdn_leads/avatars/000/000/003/thumb/images_%282%29.jpg?1443802692\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>7, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\"}, \"_dc\"=>\"1443831752656\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 00:22:33','2015-10-03 00:22:33',NULL,NULL),(18,1,'Cancel','Student','Cancel Student =   Pheakdey Bou',' {\"admission_id\"=>\"5\", \"controller\"=>\"sdn_student\", \"action\"=>\"cancel_student\"}','2015-10-03 00:23:28','2015-10-03 00:23:28',NULL,NULL),(19,1,'Create','Student','create Student =   Lyting Taing',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"2\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Lyting\", \"last_name\"=>\"Taing\", \"khr_first_name\"=>\"តាំង\", \"khr_last_name\"=>\"លីទីញ\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"012298882\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/sdn_leads/avatars/000/000/002/thumb/images_%283%29.jpg?1443801422\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>2, \"s_level_id\"=>16, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443832296933\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 00:31:37','2015-10-03 00:31:37',NULL,NULL),(20,1,'Ative','Student','Ative Student =   Lyting Taing',' {\"student_id\"=>\"6\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-03 00:31:45','2015-10-03 00:31:45',NULL,NULL),(21,1,'Create','Student','create Student =   Pheakdey Bou',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"3\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Pheakdey\", \"last_name\"=>\"Bou\", \"khr_first_name\"=>\"ប៊ូ\", \"khr_last_name\"=>\"ភក្តី\", \"gender\"=>\"M\", \"date_of_birth\"=>\"1993-04-14\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"070756852\", \"email\"=>\"\", \"address\"=>\"123\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/023/original/images_%281%29.jpg?1443832350\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"na\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"na\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>12, \"degree_id\"=>3, \"course_id\"=>10, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\"}, \"_dc\"=>\"1443832403449\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 00:33:23','2015-10-03 00:33:23',NULL,NULL),(22,1,'Ative','Student','Ative Student =   Pheakdey Bou',' {\"student_id\"=>\"7\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-03 00:33:35','2015-10-03 00:33:35',NULL,NULL),(23,1,'Create','SdnLead','create new name =   Sophat','','2015-10-03 02:04:17','2015-10-03 02:04:17',NULL,NULL),(24,1,'Create','Student','create Student =   Sophat Heng',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophat\", \"last_name\"=>\"Heng\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443837905949\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 02:05:06','2015-10-03 02:05:06',NULL,NULL),(25,1,'Ative','Student','Ative Student =   Sophat Heng',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-03 02:05:12','2015-10-03 02:05:12',NULL,NULL),(26,1,'Update','AcdCourseFaculty','udpate name =   English for Specific Purposes',' {\"id\"=>2, \"code\"=>\"C002\", \"abbr\"=>\"ESP\", \"name\"=>\"English for Specific Purposes\", \"course_type\"=>\"TC\", \"khr_name\"=>\"ជំនាញភាសាអង់គ្លេស\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-05-29 17:24:52\", \"updated_at\"=>\"2015-05-29 17:24:52\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default\", \"is_default\"=>\"\", \"major_id\"=>2, \"id\"=>nil}]}','2015-10-03 02:06:16','2015-10-03 02:06:16',NULL,NULL),(27,1,'Create','Student','create Student =   Sophat Heng',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophat\", \"last_name\"=>\"Heng\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/024/original/images_%284%29.jpg?1443838030\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>2, \"s_level_id\"=>10, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443838046521\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 02:07:26','2015-10-03 02:07:26',NULL,NULL),(28,1,'Ative','Student','Ative Student =   Sophat Heng',' {\"student_id\"=>\"3\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-03 02:07:33','2015-10-03 02:07:33',NULL,NULL),(29,1,'Create','Student','create Student =   Sophat Heng',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophat\", \"last_name\"=>\"Heng\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"123\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>1, \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>3, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\"}, \"_dc\"=>\"1443838110473\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 02:08:30','2015-10-03 02:08:30',NULL,NULL),(30,1,'Update','Student','update Student =   Sophat Heng',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophat\", \"last_name\"=>\"Heng\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"123\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"TC\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/025/original/images_%281%29.jpg?1443838515\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>3, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"id\"=>4}, \"_dc\"=>\"1443838542619\", \"action\"=>\"update\", \"controller\"=>\"sdn_student\", \"id\"=>\"4\", \"sdn_student\"=>{}}','2015-10-03 02:15:43','2015-10-03 02:15:43',NULL,NULL),(31,1,'Create','AcdCourseLevelType','create new level type =   ESP','{\"data\"=>{\"code\"=>\"ESP\", \"name\"=>\"ESP\"}, \"_dc\"=>\"1443839169701\", \"action\"=>\"create\", \"controller\"=>\"acd_tc_level_types\", \"acd_tc_level_type\"=>{\"data\"=>{\"code\"=>\"ESP\", \"name\"=>\"ESP\"}}}','2015-10-03 02:26:10','2015-10-03 02:26:10',NULL,NULL),(32,1,'Create','AcdCourseLevel','create new name =   ESP LEVEL 1','{\"data\"=>{\"code\"=>\"ESP1\", \"name\"=>\"ESP LEVEL 1\", \"course_id\"=>\"2\", \"level_type_id\"=>9, \"level_type\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1443839222608\", \"action\"=>\"create\", \"controller\"=>\"acd_course_levels\", \"acd_course_level\"=>{}}','2015-10-03 02:27:03','2015-10-03 02:27:03',NULL,NULL),(33,1,'Create','AcdCourseLevel','create new name =   ESP LEVEL 2','{\"data\"=>{\"code\"=>\"ESP2\", \"name\"=>\"ESP LEVEL 2\", \"course_id\"=>\"2\", \"level_type_id\"=>9, \"level_type\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1443839246209\", \"action\"=>\"create\", \"controller\"=>\"acd_course_levels\", \"acd_course_level\"=>{}}','2015-10-03 02:27:26','2015-10-03 02:27:26',NULL,NULL),(34,1,'Create','Student','create Student =   Sophat Heng',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophat\", \"last_name\"=>\"Heng\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/026/original/images_%284%29.jpg?1443839479\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>10, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443839512444\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 02:31:53','2015-10-03 02:31:53',NULL,NULL),(35,1,'Update','Student','update Student =   Sophat Heng',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophat\", \"last_name\"=>\"Heng\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"TC\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/027/original/images_%281%29.jpg?1443839528\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>10, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"id\"=>5}, \"_dc\"=>\"1443839529819\", \"action\"=>\"update\", \"controller\"=>\"sdn_student\", \"id\"=>\"5\", \"sdn_student\"=>{}}','2015-10-03 02:32:10','2015-10-03 02:32:10',NULL,NULL),(36,1,'Ative','Student','Ative Student =   Sophat Heng',' {\"student_id\"=>\"5\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-03 02:32:16','2015-10-03 02:32:16',NULL,NULL),(37,1,'Create','Student','create Student =   Sophat Heng',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sophat\", \"last_name\"=>\"Heng\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/028/original/images_%281%29.jpg?1443839579\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>2, \"s_level_id\"=>25, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>2, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443839598543\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 02:33:19','2015-10-03 02:33:19',NULL,NULL),(38,1,'Ative','Student','Ative Student =   Sophat Heng',' {\"student_id\"=>\"6\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-03 02:33:28','2015-10-03 02:33:28',NULL,NULL),(39,1,'Ative','Student','Ative Student =   Sophat Heng',' {\"student_id\"=>\"4\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-03 02:34:00','2015-10-03 02:34:00',NULL,NULL),(40,1,'Create','SdnLead','create new name =   test','','2015-10-03 02:35:27','2015-10-03 02:35:27',NULL,NULL),(41,1,'Create','Student','create Student =   test test',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"2\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"test\", \"last_name\"=>\"test\", \"khr_first_name\"=>\"test\", \"khr_last_name\"=>\"test\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"19181716\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443839754445\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 02:35:55','2015-10-03 02:35:55',NULL,NULL),(42,1,'Update','Student','update Student =   test test',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"test\", \"last_name\"=>\"test\", \"khr_first_name\"=>\"test\", \"khr_last_name\"=>\"test\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"19181716\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"TC\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/029/original/images.jpg?1443839774\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"id\"=>7}, \"_dc\"=>\"1443839775560\", \"action\"=>\"update\", \"controller\"=>\"sdn_student\", \"id\"=>\"7\", \"sdn_student\"=>{}}','2015-10-03 02:36:15','2015-10-03 02:36:15',NULL,NULL),(43,1,'Ative','Student','Ative Student =   test test',' {\"student_id\"=>\"7\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-03 02:36:22','2015-10-03 02:36:22',NULL,NULL),(44,1,'Create','Student','create Student =   test test',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"2\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"test\", \"last_name\"=>\"test\", \"khr_first_name\"=>\"test\", \"khr_last_name\"=>\"test\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-03\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"19181716\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-03\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>25, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>2, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>2, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\"}, \"_dc\"=>\"1443839880893\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-03 02:38:01','2015-10-03 02:38:01',NULL,NULL),(45,1,'Ative','Student','Ative Student =   test test',' {\"student_id\"=>\"8\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-03 02:38:08','2015-10-03 02:38:08',NULL,NULL),(46,1,'Login','System','Login System','','2015-10-09 02:29:10','2015-10-09 02:29:10',NULL,NULL),(47,1,'Login','System','Login System','','2015-10-09 06:10:23','2015-10-09 06:10:23',NULL,NULL),(48,1,'Login','System','Login System','','2015-10-09 08:03:47','2015-10-09 08:03:47',NULL,NULL),(49,1,'Login','System','Login System','','2015-10-13 00:19:10','2015-10-13 00:19:10',NULL,NULL),(50,1,'Update','SdnLead','udpate name =   Sophat',' ','2015-10-13 02:41:27','2015-10-13 02:41:27',NULL,NULL),(51,1,'Login','System','Login System','','2015-10-14 03:05:48','2015-10-14 03:05:48',NULL,NULL),(52,1,'Login','System','Login System','','2015-10-14 03:24:58','2015-10-14 03:24:58',NULL,NULL),(53,1,'Login','System','Login System','','2015-10-16 01:35:07','2015-10-16 01:35:07',NULL,NULL),(54,1,'Login','System','Login System','','2015-10-16 03:54:47','2015-10-16 03:54:47',NULL,NULL),(55,1,'Login','System','Login System','','2015-10-17 13:23:54','2015-10-17 13:23:54',NULL,NULL),(56,1,'Login','System','Login System','','2015-10-18 03:19:40','2015-10-18 03:19:40',NULL,NULL),(57,1,'Login','System','Login System','','2015-10-18 04:11:36','2015-10-18 04:11:36',NULL,NULL),(58,1,'Login','System','Login System','','2015-10-18 06:10:33','2015-10-18 06:10:33',NULL,NULL),(59,1,'Login','System','Login System','','2015-10-18 08:51:13','2015-10-18 08:51:13',NULL,NULL),(60,1,'Login','System','Login System','','2015-10-21 03:53:07','2015-10-21 03:53:07',NULL,NULL),(61,1,'Login','System','Login System','','2015-10-21 05:38:32','2015-10-21 05:38:32',NULL,NULL),(62,1,'Login','System','Login System','','2015-10-21 06:11:37','2015-10-21 06:11:37',NULL,NULL),(63,1,'Login','System','Login System','','2015-10-21 11:20:16','2015-10-21 11:20:16',NULL,NULL),(64,1,'Login','System','Login System','','2015-10-22 02:15:26','2015-10-22 02:15:26',NULL,NULL),(65,1,'Login','System','Login System','','2015-10-22 05:43:30','2015-10-22 05:43:30',NULL,NULL),(66,1,'Login','System','Login System','','2015-10-22 07:14:35','2015-10-22 07:14:35',NULL,NULL),(67,1,'Login','System','Login System','','2015-10-22 08:49:38','2015-10-22 08:49:38',NULL,NULL),(68,1,'Login','System','Login System','','2015-10-22 09:44:48','2015-10-22 09:44:48',NULL,NULL),(69,1,'Login','System','Login System','','2015-10-23 01:29:40','2015-10-23 01:29:40',NULL,NULL),(70,1,'Login','System','Login System','','2015-10-23 08:02:08','2015-10-23 08:02:08',NULL,NULL),(71,1,'Login','System','Login System','','2015-10-23 14:53:12','2015-10-23 14:53:12',NULL,NULL),(72,1,'Login','System','Login System','','2015-10-23 15:50:24','2015-10-23 15:50:24',NULL,NULL),(73,1,'Login','System','Login System','','2015-10-24 03:09:47','2015-10-24 03:09:47',NULL,NULL),(74,1,'Login','System','Login System','','2015-10-25 05:14:56','2015-10-25 05:14:56',NULL,NULL),(75,1,'Login','System','Login System','','2015-10-26 03:01:02','2015-10-26 03:01:02',NULL,NULL),(76,1,'Login','System','Login System','','2015-10-26 06:44:38','2015-10-26 06:44:38',NULL,NULL),(77,1,'Login','System','Login System','','2015-10-26 08:04:03','2015-10-26 08:04:03',NULL,NULL),(78,1,'Login','System','Login System','','2015-10-27 01:39:26','2015-10-27 01:39:26',NULL,NULL),(79,1,'Create','AcdSubject','create new subject name =   Microsoft Word 2010','{\"data\"=>{\"code\"=>\"MOFWD\", \"name\"=>\"Microsoft Word 2010\", \"description\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"subject_type_id\"=>3, \"khr_name\"=>\"កម្មវិធី word 2010\", \"campus_id\"=>\"\", \"is_deleted\"=>\"\", \"subject_type\"=>\"\", \"subject_id\"=>\"\", \"credit\"=>\"0\", \"sessions\"=>\"45\"}, \"_dc\"=>\"1445913338029\", \"action\"=>\"create\", \"controller\"=>\"acd_subjects\", \"acd_subject\"=>{}}','2015-10-27 02:35:38','2015-10-27 02:35:38',NULL,NULL),(80,1,'Create','AcdSubject','create new subject name =   Microsoft Excel 2010','{\"data\"=>{\"code\"=>\"MOFXC\", \"name\"=>\"Microsoft Excel 2010\", \"description\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"subject_type_id\"=>3, \"khr_name\"=>\"កម្មវិធី Excel 2010\", \"campus_id\"=>\"\", \"is_deleted\"=>\"\", \"subject_type\"=>\"\", \"subject_id\"=>\"\", \"credit\"=>\"0\", \"sessions\"=>\"15\"}, \"_dc\"=>\"1445913404085\", \"action\"=>\"create\", \"controller\"=>\"acd_subjects\", \"acd_subject\"=>{}}','2015-10-27 02:36:44','2015-10-27 02:36:44',NULL,NULL),(81,1,'Login','System','Login System','','2015-10-27 03:11:43','2015-10-27 03:11:43',NULL,NULL),(82,1,'Login','System','Login System','','2015-10-27 07:30:19','2015-10-27 07:30:19',NULL,NULL),(83,1,'Login','System','Login System','','2015-10-27 12:06:15','2015-10-27 12:06:15',NULL,NULL),(84,1,'Login','System','Login System','','2015-10-28 02:38:06','2015-10-28 02:38:06',NULL,NULL),(85,1,'Update','Student','Close  Student =   test test',' {\"student_id\"=>\"6\", \"controller\"=>\"sdn_student\", \"action\"=>\"close_student\"}','2015-10-28 02:46:12','2015-10-28 02:46:12',NULL,NULL),(86,1,'Update','Student','Re-open Student =   test test',' {\"student_id\"=>\"6\", \"controller\"=>\"sdn_student\", \"action\"=>\"open_student\"}','2015-10-28 02:46:26','2015-10-28 02:46:26',NULL,NULL),(87,1,'Login','System','Login System','','2015-10-28 03:23:54','2015-10-28 03:23:54',NULL,NULL),(88,1,'Login','System','Login System','','2015-10-28 03:50:28','2015-10-28 03:50:28',NULL,NULL),(89,1,'Login','System','Login System','','2015-10-28 03:53:04','2015-10-28 03:53:04',NULL,NULL),(90,1,'Login','System','Login System','','2015-10-28 05:40:09','2015-10-28 05:40:09',NULL,NULL),(91,1,'Login','System','Login System','','2015-10-28 07:11:34','2015-10-28 07:11:34',NULL,NULL),(92,1,'Login','System','Login System','','2015-10-28 08:04:43','2015-10-28 08:04:43',NULL,NULL),(93,1,'Login','System','Login System','','2015-10-29 03:06:36','2015-10-29 03:06:36',NULL,NULL),(94,1,'Login','System','Login System','','2015-10-29 11:21:14','2015-10-29 11:21:14',NULL,NULL),(95,1,'Login','System','Login System','','2015-10-29 11:21:14','2015-10-29 11:21:14',NULL,NULL),(96,1,'Update','AcdCourseLevel','udpate name =   Beginner Level 1',' {\"data\"=>{\"id\"=>7, \"code\"=>\"BEGNL1\", \"name\"=>\"Beginner Level 1\", \"course_id\"=>\"1\", \"level_type_id\"=>3, \"level_type\"=>\"Beginner Level\", \"sequence\"=>\"7\", \"created_at\"=>\"2015-09-14 04:18:27\", \"updated_at\"=>\"2015-09-14 04:18:27\"}, \"_dc\"=>\"1446119851362\", \"action\"=>\"update\", \"controller\"=>\"acd_course_levels\", \"id\"=>\"7\", \"acd_course_level\"=>{}}','2015-10-29 11:57:31','2015-10-29 11:57:31',NULL,NULL),(97,1,'Login','System','Login System','','2015-10-30 07:02:41','2015-10-30 07:02:41',NULL,NULL),(98,1,'Update','AcdBatch','Update batch type =   Batch 01',' {\"data\"=>{\"id\"=>1, \"code\"=>\"B01\", \"name\"=>\"Batch 01\", \"campus\"=>\"Head Office\", \"gen_campus_id\"=>1, \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាន់ទី១666\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1446188720443\", \"action\"=>\"update\", \"controller\"=>\"acd_batchs\", \"id\"=>\"1\", \"acd_batch\"=>{}}','2015-10-30 07:05:20','2015-10-30 07:05:20',NULL,NULL),(99,1,'Delete','AcdBatch','delete batch name =   #{@data.name} ','{\"data\"=>{\"id\"=>1, \"code\"=>\"B01\", \"name\"=>\"Batch 01\", \"campus\"=>\"Head Office\", \"gen_campus_id\"=>1, \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាន់ទី១666\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1446188726552\", \"action\"=>\"destroy\", \"controller\"=>\"acd_batchs\", \"id\"=>\"1\", \"acd_batch\"=>{}}','2015-10-30 07:05:26','2015-10-30 07:05:26',NULL,NULL),(100,1,'Create','AcdBatch','create new batch name=   Batch 1','{\"data\"=>{\"code\"=>\"B01\", \"name\"=>\"Batch 1\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី១\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1446188836788\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-10-30 07:07:17','2015-10-30 07:07:17',NULL,NULL),(101,1,'Create','CfgAcademicYear','create new academic year=2015 - 2016','{\"data\"=>{\"code\"=>\"Y1516\", \"name\"=>\"2015 - 2016\", \"start_date\"=>\"2015-11-01\", \"end_date\"=>\"2016-11-01\"}, \"_dc\"=>\"1446188946134\", \"action\"=>\"create\", \"controller\"=>\"cfg_academic_years\", \"cfg_academic_year\"=>{}}','2015-10-30 07:09:06','2015-10-30 07:09:06',NULL,NULL),(102,1,'Update','AcdMajor','update major name =   Default Skill',' {\"data\"=>{\"id\"=>1, \"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាញដំបូង\", \"campus_id\"=>1}, \"_dc\"=>\"1446188973348\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"1\", \"acd_major\"=>{}}','2015-10-30 07:09:33','2015-10-30 07:09:33',NULL,NULL),(103,1,'Create','AcdMajor','create new major name =   Programming','{\"data\"=>{\"code\"=>\"PROG\", \"name\"=>\"Programming\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាញសរសេរកម្មវិធីកំុព្យូទ័រ\", \"campus_id\"=>\"\"}, \"_dc\"=>\"1446189040967\", \"action\"=>\"create\", \"controller\"=>\"acd_majors\", \"acd_major\"=>{}}','2015-10-30 07:10:41','2015-10-30 07:10:41',NULL,NULL),(104,1,'Create','AcdMajor','create new major name =   Computer Networking','{\"data\"=>{\"code\"=>\"COMNET\", \"name\"=>\"Computer Networking\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាញបណ្តាញកំុព្យូទ័រ\", \"campus_id\"=>\"\"}, \"_dc\"=>\"1446189137801\", \"action\"=>\"create\", \"controller\"=>\"acd_majors\", \"acd_major\"=>{}}','2015-10-30 07:12:18','2015-10-30 07:12:18',NULL,NULL),(105,1,'Update','AcdMajor','update major name =   Computer Programming',' {\"data\"=>{\"id\"=>3, \"code\"=>\"COMPRO\", \"name\"=>\"Computer Programming\", \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាញសរសេរកម្មវិធីកំុព្យូទ័រ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189155901\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"3\", \"acd_major\"=>{}}','2015-10-30 07:12:36','2015-10-30 07:12:36',NULL,NULL),(106,1,'Create','AcdMajor','create new major name =   Database Management','{\"data\"=>{\"code\"=>\"COMDB\", \"name\"=>\"Database Management\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាញគ្រប់គ្រងទិន្ន័យកំុព្យូទ័រ\", \"campus_id\"=>\"\"}, \"_dc\"=>\"1446189283501\", \"action\"=>\"create\", \"controller\"=>\"acd_majors\", \"acd_major\"=>{}}','2015-10-30 07:14:44','2015-10-30 07:14:44',NULL,NULL),(107,1,'Update','AcdMajor','update major name =   General English',' {\"data\"=>{\"id\"=>2, \"code\"=>\"MGEP01\", \"name\"=>\"General English\", \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាញកំុព្យូទ័រទូរទៅ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189327250\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"2\", \"acd_major\"=>{}}','2015-10-30 07:15:27','2015-10-30 07:15:27',NULL,NULL),(108,1,'Update','AcdMajor','update major name =   General English',' {\"data\"=>{\"id\"=>2, \"code\"=>\"MGEP01\", \"name\"=>\"General English\", \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាញភាសាអង់គ្លេសទូរទៅ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189396396\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"2\", \"acd_major\"=>{}}','2015-10-30 07:16:36','2015-10-30 07:16:36',NULL,NULL),(109,1,'Update','AcdCourseFaculty','udpate name =   General English Program',' {\"id\"=>1, \"code\"=>\"C001\", \"abbr\"=>\"GEP\", \"name\"=>\"General English Program\", \"course_type\"=>\"TC\", \"khr_name\"=>\"ភាសាអង់គ្លេសទូរទៅ\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-05-29 17:17:36\", \"updated_at\"=>\"2015-08-18 14:05:21\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"MGEP01\", \"name\"=>\"General English\", \"is_default\"=>\"\", \"major_id\"=>2, \"id\"=>nil}]}','2015-10-30 07:19:09','2015-10-30 07:19:09',NULL,NULL),(110,1,'Create','AcdMajor','create new major name =   English for Specific Purposes','{\"data\"=>{\"code\"=>\"ENGSP\", \"name\"=>\"English for Specific Purposes\", \"is_deleted\"=>\"\", \"khr_name\"=>\"\", \"campus_id\"=>\"\"}, \"_dc\"=>\"1446189609137\", \"action\"=>\"create\", \"controller\"=>\"acd_majors\", \"acd_major\"=>{}}','2015-10-30 07:20:09','2015-10-30 07:20:09',NULL,NULL),(111,1,'Update','AcdMajor','update major name =   General English Program',' {\"data\"=>{\"id\"=>2, \"code\"=>\"ENGGEP\", \"name\"=>\"General English Program\", \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាញភាសាអង់គ្លេសទូរទៅ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189639943\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"2\", \"acd_major\"=>{}}','2015-10-30 07:20:40','2015-10-30 07:20:40',NULL,NULL),(112,1,'Create','AcdMajor','create new major name =   Microsoft Office','{\"data\"=>{\"code\"=>\"COMOFF\", \"name\"=>\"Microsoft Office\", \"is_deleted\"=>\"\", \"khr_name\"=>\"កំុព្យូទ័រការិយាល័យ\", \"campus_id\"=>\"\"}, \"_dc\"=>\"1446189701701\", \"action\"=>\"create\", \"controller\"=>\"acd_majors\", \"acd_major\"=>{}}','2015-10-30 07:21:42','2015-10-30 07:21:42',NULL,NULL),(113,1,'Update','AcdMajor','update major name =   English for Specific Purposes',' {\"data\"=>{\"id\"=>6, \"code\"=>\"ENGSP\", \"name\"=>\"English for Specific Purposes\", \"is_deleted\"=>false, \"khr_name\"=>\"ភាសាអង់គ្លេសសំរាប់ជំនាញជាក់លាក់\", \"campus_id\"=>1}, \"_dc\"=>\"1446189777925\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"6\", \"acd_major\"=>{}}','2015-10-30 07:22:58','2015-10-30 07:22:58',NULL,NULL),(114,1,'Update','AcdMajor','update major name =   Database Management',' {\"data\"=>{\"id\"=>5, \"code\"=>\"COMDB\", \"name\"=>\"Database Management\", \"is_deleted\"=>false, \"khr_name\"=>\"គ្រប់គ្រងទិន្ន័យកំុព្យូទ័រ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189808854\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"5\", \"acd_major\"=>{}}','2015-10-30 07:23:29','2015-10-30 07:23:29',NULL,NULL),(115,1,'Update','AcdMajor','update major name =   Computer Networking',' {\"data\"=>{\"id\"=>4, \"code\"=>\"COMNET\", \"name\"=>\"Computer Networking\", \"is_deleted\"=>false, \"khr_name\"=>\"បណ្តាញកំុព្យូទ័រ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189816355\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"4\", \"acd_major\"=>{}}','2015-10-30 07:23:36','2015-10-30 07:23:36',NULL,NULL),(116,1,'Update','AcdMajor','update major name =   Computer Programming',' {\"data\"=>{\"id\"=>3, \"code\"=>\"COMPRO\", \"name\"=>\"Computer Programming\", \"is_deleted\"=>false, \"khr_name\"=>\"សរសេរកម្មវិធីកំុព្យូទ័រ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189823205\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"3\", \"acd_major\"=>{}}','2015-10-30 07:23:43','2015-10-30 07:23:43',NULL,NULL),(117,1,'Update','AcdMajor','update major name =   General English Program',' {\"data\"=>{\"id\"=>2, \"code\"=>\"ENGGEP\", \"name\"=>\"General English Program\", \"is_deleted\"=>false, \"khr_name\"=>\"ភាសាអង់គ្លេសទូរទៅ\", \"campus_id\"=>1}, \"_dc\"=>\"1446189830566\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"2\", \"acd_major\"=>{}}','2015-10-30 07:23:50','2015-10-30 07:23:50',NULL,NULL),(118,1,'Update','AcdCourseFaculty','udpate name =   General English Program',' {\"id\"=>1, \"code\"=>\"ENGGEP\", \"abbr\"=>\"GEP\", \"name\"=>\"General English Program\", \"course_type\"=>\"TC\", \"khr_name\"=>\"ភាសាអង់គ្លេសទូរទៅ\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-05-29 17:17:36\", \"updated_at\"=>\"2015-08-18 14:05:21\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"id\"=>1, \"code\"=>\"ENGGEP\", \"name\"=>\"General English Program\", \"is_default\"=>nil, \"major_id\"=>2}]}','2015-10-30 07:26:40','2015-10-30 07:26:40',NULL,NULL),(119,1,'Update','AcdCourseFaculty','udpate name =   English for Specific Purposes',' {\"id\"=>2, \"code\"=>\"ENGESP\", \"abbr\"=>\"ESP\", \"name\"=>\"English for Specific Purposes\", \"course_type\"=>\"TC\", \"khr_name\"=>\"ជំនាញភាសាអង់គ្លេស\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-05-29 17:24:52\", \"updated_at\"=>\"2015-10-03 02:06:16\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"ENGSP\", \"name\"=>\"English for Specific Purposes\", \"is_default\"=>\"\", \"major_id\"=>6, \"id\"=>nil}]}','2015-10-30 07:27:03','2015-10-30 07:27:03',NULL,NULL),(120,1,'Update','AcdCourseFaculty','udpate name =   Microsoft Office 2010',' {\"id\"=>13, \"code\"=>\"COMOFF\", \"abbr\"=>\"MOF\", \"name\"=>\"Microsoft Office 2010\", \"course_type\"=>\"TC\", \"khr_name\"=>\"វគ្គកំុព្យូទ័រសំរាប់ការិយាល\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-08-17 14:20:43\", \"updated_at\"=>\"2015-08-17 14:20:43\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"COMOFF\", \"name\"=>\"Microsoft Office\", \"is_default\"=>\"\", \"major_id\"=>7, \"id\"=>nil}]}','2015-10-30 07:27:59','2015-10-30 07:27:59',NULL,NULL),(121,1,'Create','AcdCourseFaculty','create new name =   Grammar Class','{\"code\"=>\"ENGGMC\", \"abbr\"=>\"GMC\", \"name\"=>\"Grammar Class\", \"course_type\"=>\"TC\", \"khr_name\"=>\"វគ្គវេយ្យាករណ៍\", \"credit\"=>\"0\", \"is_deleted\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"campus_id\"=>\"\", \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>nil}','2015-10-30 07:31:23','2015-10-30 07:31:23',NULL,NULL),(122,1,'Create','AcdMajor','create new major name =   English Grammar','{\"data\"=>{\"code\"=>\"ENGGMC\", \"name\"=>\"English Grammar\", \"is_deleted\"=>\"\", \"khr_name\"=>\"អង់គ្លេសវេយ្យាករណ៍\", \"campus_id\"=>\"\"}, \"_dc\"=>\"1446190370692\", \"action\"=>\"create\", \"controller\"=>\"acd_majors\", \"acd_major\"=>{}}','2015-10-30 07:32:51','2015-10-30 07:32:51',NULL,NULL),(123,1,'Update','AcdCourseFaculty','udpate name =   Grammar Class',' {\"id\"=>14, \"code\"=>\"ENGGMC\", \"abbr\"=>\"GMC\", \"name\"=>\"Grammar Class\", \"course_type\"=>\"TC\", \"khr_name\"=>\"វគ្គវេយ្យាករណ៍\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-10-30 07:31:22\", \"updated_at\"=>\"2015-10-30 07:31:22\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"ENGGMC\", \"name\"=>\"English Grammar\", \"is_default\"=>\"\", \"major_id\"=>8, \"id\"=>nil}]}','2015-10-30 07:33:01','2015-10-30 07:33:01',NULL,NULL),(124,1,'Update','AcdCourseFaculty','udpate name =   Computer Science',' {\"id\"=>9, \"code\"=>\"C007\", \"abbr\"=>\"SCT\", \"name\"=>\"Computer Science\", \"course_type\"=>\"WU\", \"khr_name\"=>\"វិទ្យាសាស្រ្តកំុព្យូទ័រ\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-09-14 15:38:58\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}, {\"code\"=>\"COMPRO\", \"name\"=>\"Computer Programming\", \"is_default\"=>\"\", \"major_id\"=>3, \"id\"=>nil}, {\"code\"=>\"COMNET\", \"name\"=>\"Computer Networking\", \"is_default\"=>\"\", \"major_id\"=>4, \"id\"=>nil}, {\"code\"=>\"COMDB\", \"name\"=>\"Database Management\", \"is_default\"=>\"\", \"major_id\"=>5, \"id\"=>nil}]}','2015-10-30 07:34:33','2015-10-30 07:34:33',NULL,NULL),(125,1,'Update','AcdCourseFaculty','udpate name =   Business Administrator',' {\"id\"=>3, \"code\"=>\"C001\", \"abbr\"=>\"BSA\", \"name\"=>\"Business Administrator\", \"course_type\"=>\"WU\", \"khr_name\"=>\"គ្រប់គ្រងពាណិជ្ជកម្ម និង វិទ្យាសាស្រ្តសេដ្ឋកិច្ច\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-05-29 17:28:00\", \"updated_at\"=>\"2015-08-22 14:58:32\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:36:35','2015-10-30 07:36:35',NULL,NULL),(126,1,'Update','AcdCourseFaculty','udpate name =   Hotel and Tourist Management',' {\"id\"=>4, \"code\"=>\"C002\", \"abbr\"=>\"HTM\", \"name\"=>\"Hotel and Tourist Management\", \"course_type\"=>\"WU\", \"khr_name\"=>\"គ្រប់គ្រងសណ្ឋាគារ​ ទេសចរណ៍ និង បដិសណ្ឋារកិច្ច\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>\"2015-05-29 17:30:51\", \"updated_at\"=>\"2015-08-22 15:04:19\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:36:43','2015-10-30 07:36:43',NULL,NULL),(127,1,'Update','AcdCourseFaculty','udpate name =   Public Administration',' {\"id\"=>5, \"code\"=>\"C003\", \"abbr\"=>\"PCA\", \"name\"=>\"Public Administration\", \"course_type\"=>\"WU\", \"khr_name\"=>\"គ្រប់គ្រងសាធារណៈ\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-08-22 15:04:26\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:36:52','2015-10-30 07:36:52',NULL,NULL),(128,1,'Update','AcdCourseFaculty','udpate name =   Finance & Banking',' {\"id\"=>6, \"code\"=>\"C004\", \"abbr\"=>\"FNB\", \"name\"=>\"Finance & Banking\", \"course_type\"=>\"WU\", \"khr_name\"=>\"គ្រប់គ្រងហិរញ្ញវត្ថុ និង ធនាគារ\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-08-22 15:05:41\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:37:00','2015-10-30 07:37:00',NULL,NULL),(129,1,'Delete','AcdCourseFaculty','delete name =   #{@data.name} ','{\"id\"=>7, \"code\"=>\"C005\", \"abbr\"=>\"AIE\", \"name\"=>\"Arts in English\", \"course_type\"=>\"WU\", \"khr_name\"=>\"\", \"credit\"=>0, \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-08-22 15:09:02\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>\"\"}','2015-10-30 07:37:04','2015-10-30 07:37:04',NULL,NULL),(130,1,'Update','AcdCourseFaculty','udpate name =   Arts in English',' {\"id\"=>7, \"code\"=>\"C005\", \"abbr\"=>\"AIE\", \"name\"=>\"Arts in English\", \"course_type\"=>\"WU\", \"khr_name\"=>\"\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-10-30 07:37:04\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:38:09','2015-10-30 07:38:09',NULL,NULL),(131,1,'Update','AcdCourseFaculty','udpate name =   Social Science',' {\"id\"=>8, \"code\"=>\"C006\", \"abbr\"=>\"SOS\", \"name\"=>\"Social Science\", \"course_type\"=>\"WU\", \"khr_name\"=>\"វិទ្យាសាស្រ្តសង្គម\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-08-22 15:09:09\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:38:41','2015-10-30 07:38:41',NULL,NULL),(132,1,'Update','AcdCourseFaculty','udpate name =   Arts, Humanities and Languages',' {\"id\"=>10, \"code\"=>\"C008\", \"abbr\"=>\"AHL\", \"name\"=>\"Arts, Humanities and Languages\", \"course_type\"=>\"WU\", \"khr_name\"=>\"សិល្បៈ មនុស្សសាស្រ្ត និង ភាសា\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-08-22 15:09:26\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:38:56','2015-10-30 07:38:56',NULL,NULL),(133,1,'Update','AcdCourseFaculty','udpate name =   Education Science',' {\"id\"=>11, \"code\"=>\"C009\", \"abbr\"=>\"ESC\", \"name\"=>\"Education Science\", \"course_type\"=>\"WU\", \"khr_name\"=>\"វិទ្យាសាស្រ្តអប់រំ\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-08-22 15:09:39\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:39:08','2015-10-30 07:39:08',NULL,NULL),(134,1,'Update','AcdCourseFaculty','udpate name =   Faculty of Law',' {\"id\"=>12, \"code\"=>\"C010\", \"abbr\"=>\"LAW\", \"name\"=>\"Faculty of Law\", \"course_type\"=>\"WU\", \"khr_name\"=>\"នីតិសាស្រ្ត\", \"credit\"=>\"0\", \"is_deleted\"=>false, \"created_at\"=>nil, \"updated_at\"=>\"2015-08-22 15:10:12\", \"campus_id\"=>1, \"status\"=>\"A\", \"description\"=>\"\", \"acd_course_subject_attributes\"=>\"\", \"acd_course_major_attributes\"=>[{\"code\"=>\"DEFAULT\", \"name\"=>\"Default Skill\", \"is_default\"=>\"\", \"major_id\"=>1, \"id\"=>nil}]}','2015-10-30 07:39:25','2015-10-30 07:39:25',NULL,NULL),(135,1,'Create','AcdCourseLevelType','create new level type =   English Grammar','{\"data\"=>{\"code\"=>\"GMC\", \"name\"=>\"English Grammar\"}, \"_dc\"=>\"1446190964132\", \"action\"=>\"create\", \"controller\"=>\"acd_tc_level_types\", \"acd_tc_level_type\"=>{\"data\"=>{\"code\"=>\"GMC\", \"name\"=>\"English Grammar\"}}}','2015-10-30 07:42:44','2015-10-30 07:42:44',NULL,NULL),(136,1,'Create','AcdCourseLevelType','create new level type =   Newspaper','{\"data\"=>{\"code\"=>\"NPC\", \"name\"=>\"Newspaper\"}, \"_dc\"=>\"1446191900736\", \"action\"=>\"create\", \"controller\"=>\"acd_tc_level_types\", \"acd_tc_level_type\"=>{\"data\"=>{\"code\"=>\"NPC\", \"name\"=>\"Newspaper\"}}}','2015-10-30 07:58:21','2015-10-30 07:58:21',NULL,NULL),(137,1,'Update','CfgAcademicYear','Update academic year =20152016',' {\"data\"=>{\"id\"=>1, \"code\"=>\"Y1516\", \"name\"=>\"20152016\", \"start_date\"=>\"2015-11-01\", \"end_date\"=>\"2016-11-01\"}, \"_dc\"=>\"1446191971761\", \"action\"=>\"update\", \"controller\"=>\"cfg_academic_years\", \"id\"=>\"1\", \"cfg_academic_year\"=>{}}','2015-10-30 07:59:32','2015-10-30 07:59:32',NULL,NULL),(138,1,'Create','AcdCourseLevel','create new name =   Part of Speech','{\"data\"=>{\"code\"=>\"GMCPSP\", \"name\"=>\"Part of Speech\", \"course_id\"=>\"14\", \"level_type_id\"=>10, \"level_type\"=>\"\", \"sequence\"=>\"1\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1446192200643\", \"action\"=>\"create\", \"controller\"=>\"acd_course_levels\", \"acd_course_level\"=>{}}','2015-10-30 08:03:21','2015-10-30 08:03:21',NULL,NULL),(139,1,'Update','AcdCourseLevel','udpate name =   Part of Spee',' {\"data\"=>{\"id\"=>27, \"code\"=>\"GMCPSP\", \"name\"=>\"Part of Spee\", \"course_id\"=>\"14\", \"level_type_id\"=>10, \"level_type\"=>\"English Grammar\", \"sequence\"=>\"0\", \"created_at\"=>\"2015-10-30 08:03:21\", \"updated_at\"=>\"2015-10-30 08:03:21\"}, \"_dc\"=>\"1446192214098\", \"action\"=>\"update\", \"controller\"=>\"acd_course_levels\", \"id\"=>\"27\", \"acd_course_level\"=>{}}','2015-10-30 08:03:34','2015-10-30 08:03:34',NULL,NULL),(140,1,'Update','AcdCourseLevel','udpate name =   Part of Speech',' {\"data\"=>{\"id\"=>27, \"code\"=>\"GMCPSP\", \"name\"=>\"Part of Speech\", \"course_id\"=>\"14\", \"level_type_id\"=>10, \"level_type\"=>\"English Grammar\", \"sequence\"=>\"1\", \"created_at\"=>\"2015-10-30 08:03:21\", \"updated_at\"=>\"2015-10-30 08:03:34\"}, \"_dc\"=>\"1446192238953\", \"action\"=>\"update\", \"controller\"=>\"acd_course_levels\", \"id\"=>\"27\", \"acd_course_level\"=>{}}','2015-10-30 08:03:59','2015-10-30 08:03:59',NULL,NULL),(141,1,'Create','AcdCourseLevel','create new name =   Spectrum','{\"data\"=>{\"code\"=>\"SPCTR1\", \"name\"=>\"Spectrum\", \"course_id\"=>\"14\", \"level_type_id\"=>10, \"level_type\"=>\"\", \"sequence\"=>\"1\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1446192405279\", \"action\"=>\"create\", \"controller\"=>\"acd_course_levels\", \"acd_course_level\"=>{}}','2015-10-30 08:06:45','2015-10-30 08:06:45',NULL,NULL),(142,1,'Update','AcdCourseLevel','udpate name =   Spectrum 1',' {\"data\"=>{\"id\"=>28, \"code\"=>\"SPCTR1\", \"name\"=>\"Spectrum 1\", \"course_id\"=>\"14\", \"level_type_id\"=>10, \"level_type\"=>\"English Grammar\", \"sequence\"=>\"0\", \"created_at\"=>\"2015-10-30 08:06:45\", \"updated_at\"=>\"2015-10-30 08:06:45\"}, \"_dc\"=>\"1446192417429\", \"action\"=>\"update\", \"controller\"=>\"acd_course_levels\", \"id\"=>\"28\", \"acd_course_level\"=>{}}','2015-10-30 08:06:57','2015-10-30 08:06:57',NULL,NULL),(143,1,'Create','AcdCourseLevel','create new name =   SPCTR2','{\"data\"=>{\"code\"=>\"SPCTR2\", \"name\"=>\"SPCTR2\", \"course_id\"=>\"14\", \"level_type_id\"=>10, \"level_type\"=>\"\", \"sequence\"=>\"1\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1446192468426\", \"action\"=>\"create\", \"controller\"=>\"acd_course_levels\", \"acd_course_level\"=>{}}','2015-10-30 08:07:48','2015-10-30 08:07:48',NULL,NULL),(144,1,'Update','AcdCourseLevel','udpate name =   Spectrum 2',' {\"data\"=>{\"id\"=>29, \"code\"=>\"SPCTR2\", \"name\"=>\"Spectrum 2\", \"course_id\"=>\"14\", \"level_type_id\"=>10, \"level_type\"=>\"English Grammar\", \"sequence\"=>\"0\", \"created_at\"=>\"2015-10-30 08:07:48\", \"updated_at\"=>\"2015-10-30 08:07:48\"}, \"_dc\"=>\"1446192504593\", \"action\"=>\"update\", \"controller\"=>\"acd_course_levels\", \"id\"=>\"29\", \"acd_course_level\"=>{}}','2015-10-30 08:08:25','2015-10-30 08:08:25',NULL,NULL),(145,1,'Login','System','Login System','','2015-10-30 09:20:47','2015-10-30 09:20:47',NULL,NULL),(146,1,'Create','SdnLead','create new name =   Heng','','2015-10-30 09:23:54','2015-10-30 09:23:54',NULL,NULL),(147,1,'Login','System','Login System','','2015-10-30 09:33:55','2015-10-30 09:33:55',NULL,NULL),(148,1,'Login','System','Login System','','2015-10-30 12:29:01','2015-10-30 12:29:01',NULL,NULL),(149,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/053/original/Student-Academic.png?1446208587\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446209759327\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 12:56:10','2015-10-30 12:56:10',NULL,NULL),(150,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-30 12:56:24','2015-10-30 12:56:24',NULL,NULL),(151,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/054/original/Student-Academic.png?1446209799\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446209829473\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 12:57:09','2015-10-30 12:57:09',NULL,NULL),(152,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"3\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 12:59:59','2015-10-30 12:59:59',NULL,NULL),(153,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/056/original/Student-Academic.png?1446211402\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446211585979\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 13:26:27','2015-10-30 13:26:27',NULL,NULL),(154,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 13:26:33','2015-10-30 13:26:33',NULL,NULL),(155,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/057/original/Student_List.png?1446211606\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"N/A\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"N/A\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446211639660\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 13:27:20','2015-10-30 13:27:20',NULL,NULL),(156,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-30 13:27:24','2015-10-30 13:27:24',NULL,NULL),(157,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/058/original/Student_List.png?1446212167\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446212169178\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 13:36:09','2015-10-30 13:36:09',NULL,NULL),(158,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 13:36:14','2015-10-30 13:36:14',NULL,NULL),(159,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/059/original/Student-Academic.png?1446212185\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446212265401\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 13:37:46','2015-10-30 13:37:46',NULL,NULL),(160,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-30 13:37:51','2015-10-30 13:37:51',NULL,NULL),(161,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/060/original/Student_List.png?1446213511\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446213525400\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 13:58:45','2015-10-30 13:58:45',NULL,NULL),(162,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 13:58:56','2015-10-30 13:58:56',NULL,NULL),(163,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446213733380\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 14:02:13','2015-10-30 14:02:13',NULL,NULL),(164,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 14:02:18','2015-10-30 14:02:18',NULL,NULL),(165,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446213782192\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 14:03:02','2015-10-30 14:03:02',NULL,NULL),(166,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446214009867\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 14:06:49','2015-10-30 14:06:49',NULL,NULL),(167,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446214142833\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 14:09:02','2015-10-30 14:09:02',NULL,NULL),(168,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 14:09:09','2015-10-30 14:09:09',NULL,NULL),(169,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446214202832\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 14:10:02','2015-10-30 14:10:02',NULL,NULL),(170,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/061/original/Student_List.png?1446214497\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>7, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446214516494\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 14:15:16','2015-10-30 14:15:16',NULL,NULL),(171,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 14:15:23','2015-10-30 14:15:23',NULL,NULL),(172,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-10-30\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/062/original/Student-Academic.png?1446214547\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-30\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446214568488\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 14:16:08','2015-10-30 14:16:08',NULL,NULL),(173,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-10-30 14:16:16','2015-10-30 14:16:16',NULL,NULL),(174,1,'Login','System','Login System','','2015-10-30 23:17:38','2015-10-30 23:17:38',NULL,NULL),(175,1,'Create','SdnLead','create new name =   Sary','','2015-10-30 23:20:10','2015-10-30 23:20:10',NULL,NULL),(176,1,'Create','Student','create Student =   Sary Monydara',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"2\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sary\", \"last_name\"=>\"Monydara\", \"khr_first_name\"=>\"សារី\", \"khr_last_name\"=>\"មុនីដារ៉ា\", \"gender\"=>\"M\", \"date_of_birth\"=>\"1990-03-08\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"016161515\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images/000/000/063/original/Student_List.png?1446247237\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-10-31\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>8, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1446247267672\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-10-30 23:21:07','2015-10-30 23:21:07',NULL,NULL),(177,1,'Ative','Student','Ative Student =   Sary Monydara',' {\"student_id\"=>\"3\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-10-30 23:21:14','2015-10-30 23:21:14',NULL,NULL),(178,1,'Login','System','Login System','','2015-10-31 02:19:49','2015-10-31 02:19:49',NULL,NULL),(179,1,'Login','System','Login System','','2015-10-31 06:52:25','2015-10-31 06:52:25',NULL,NULL),(180,1,'Login','System','Login System','','2015-11-02 02:51:34','2015-11-02 02:51:34',NULL,NULL),(181,1,'Update','SysUser','Update user name =   GEP User 1',' {\"data\"=>{\"id\"=>\"3\", \"user_id\"=>\"G001\", \"user_name\"=>\"GEP User 1\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>11, \"position\"=>\"GEP Officer\", \"hr_department_id\"=>8, \"department\"=>\"GEP Office\", \"address\"=>\"#123, St E, PP\", \"phone\"=>\"011716785\", \"email\"=>\"sophat.live@gmail.com\", \"description\"=>\"\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"14-Sep-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-09-14 06:41:32\", \"sys_role_user_attributes\"=>[{\"id\"=>12, \"user_id\"=>3, \"role_id\"=>15, \"name\"=>\"GEP Manager\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>nil}, \"_dc\"=>\"1446433313946\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"3\", \"sys_user\"=>{}}','2015-11-02 03:01:54','2015-11-02 03:01:54',NULL,NULL),(182,1,'Update','SysUser','Update user name =   GEP User 1',' {\"data\"=>{\"id\"=>\"3\", \"user_id\"=>\"G001\", \"user_name\"=>\"GEP User 1\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>11, \"position\"=>\"GEP Officer\", \"hr_department_id\"=>8, \"department\"=>\"GEP Office\", \"address\"=>\"#123, St E, PP\", \"phone\"=>\"011716785\", \"email\"=>\"sophat.live@gmail.com\", \"description\"=>\"\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"14-Sep-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-11-02 03:01:54\", \"sys_role_user_attributes\"=>[{\"id\"=>12, \"user_id\"=>3, \"role_id\"=>15, \"name\"=>\"GEP Manager\", \"_destroy\"=>\"\"}, {\"user_id\"=>\"\", \"role_id\"=>1, \"name\"=>\"Admin\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>nil}, \"_dc\"=>\"1446433324606\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"3\", \"sys_user\"=>{}}','2015-11-02 03:02:05','2015-11-02 03:02:05',NULL,NULL),(183,1,'Update','SysUser','Update user name =   administrator',' {\"data\"=>{\"id\"=>\"1\", \"user_id\"=>\"admin\", \"user_name\"=>\"administrator\", \"password\"=>\"123456\", \"confirmPassword\"=>\"123456\", \"hr_position_id\"=>1, \"position\"=>\"System Administrator\", \"hr_department_id\"=>1, \"department\"=>\"IT\", \"address\"=>\"sfdsfsdfds\", \"phone\"=>\"07888561565\", \"email\"=>\"mdarait@gmail.com\", \"description\"=>\"test description\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>30, \"start_date\"=>\"07-Jun-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-06-12 14:44:37\", \"sys_role_user_attributes\"=>[{\"id\"=>1, \"user_id\"=>1, \"role_id\"=>1, \"name\"=>\"Admin\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>[{\"id\"=>2, \"user_id\"=>1, \"campus_id\"=>2, \"name\"=>\"Toul Svay Prey\", \"_destroy\"=>\"\"}], \"sys_user_degree_attributes\"=>[{\"id\"=>2, \"user_id\"=>1, \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\"}]}, \"_dc\"=>\"1446433349155\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"1\", \"sys_user\"=>{}}','2015-11-02 03:02:29','2015-11-02 03:02:29',NULL,NULL),(184,1,'Update','SysUser','Update user name =   administrator',' {\"data\"=>{\"id\"=>\"1\", \"user_id\"=>\"admin\", \"user_name\"=>\"administrator\", \"password\"=>\"123456\", \"confirmPassword\"=>\"123456\", \"hr_position_id\"=>1, \"position\"=>\"System Administrator\", \"hr_department_id\"=>1, \"department\"=>\"IT\", \"address\"=>\"sfdsfsdfds\", \"phone\"=>\"07888561565\", \"email\"=>\"mdarait@gmail.com\", \"description\"=>\"test description\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"07-Jun-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Locked\\t\", \"updated_at\"=>\"2015-11-02 03:02:29\", \"sys_role_user_attributes\"=>[{\"id\"=>1, \"user_id\"=>1, \"role_id\"=>1, \"name\"=>\"Admin\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>[{\"id\"=>2, \"user_id\"=>1, \"campus_id\"=>2, \"name\"=>\"Toul Svay Prey\", \"_destroy\"=>\"\"}], \"sys_user_degree_attributes\"=>[{\"id\"=>2, \"user_id\"=>1, \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\"}]}, \"_dc\"=>\"1446433357710\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"1\", \"sys_user\"=>{}}','2015-11-02 03:02:37','2015-11-02 03:02:37',NULL,NULL),(185,NULL,'Update','SysRole','Update role name =   Admin',' {\"data\"=>{\"id\"=>\"1\", \"code\"=>\"R001\", \"name\"=>\"Admin\", \"description\"=>\"Role \", \"createdDate\"=>nil, \"sys_role_user_attributes\"=>[{\"id\"=>1, \"user_id\"=>1, \"role_id\"=>1, \"user_id_str\"=>\"admin\", \"name\"=>\"administrator\", \"_destroy\"=>\"\"}, {\"id\"=>15, \"user_id\"=>3, \"role_id\"=>1, \"user_id_str\"=>\"G001\", \"name\"=>\"GEP User 1\", \"_destroy\"=>\"\"}], \"sys_role_shortcut_attributes\"=>[{\"id\"=>1, \"shortcut_id\"=>1, \"role_id\"=>1, \"name\"=>\"Student\", \"_destroy\"=>\"\"}, {\"id\"=>2, \"shortcut_id\"=>2, \"role_id\"=>1, \"name\"=>\"Academic\", \"_destroy\"=>\"\"}, {\"id\"=>3, \"shortcut_id\"=>3, \"role_id\"=>1, \"name\"=>\"Accounting\", \"_destroy\"=>\"\"}, {\"id\"=>5, \"shortcut_id\"=>5, \"role_id\"=>1, \"name\"=>\"Human Resource\", \"_destroy\"=>\"\"}, {\"id\"=>6, \"shortcut_id\"=>6, \"role_id\"=>1, \"name\"=>\"Examination\", \"_destroy\"=>\"\"}, {\"id\"=>7, \"shortcut_id\"=>7, \"role_id\"=>1, \"name\"=>\"Setting\", \"_destroy\"=>\"\"}]}, \"_dc\"=>\"1446433602280\", \"action\"=>\"update\", \"controller\"=>\"sys_roles\", \"id\"=>\"1\", \"sys_role\"=>{}}','2015-11-02 03:06:42','2015-11-02 03:06:42',NULL,NULL),(186,1,'Login','System','Login System','','2015-11-02 04:17:52','2015-11-02 04:17:52',NULL,NULL),(187,1,'Login','System','Login System','','2015-11-02 04:18:25','2015-11-02 04:18:25',NULL,NULL),(188,3,'Login','System','Login System','','2015-11-02 04:19:01','2015-11-02 04:19:01',NULL,NULL),(189,1,'Login','System','Login System','','2015-11-02 04:19:18','2015-11-02 04:19:18',NULL,NULL),(190,NULL,'Update','SysRole','Update role name =   Foundation Year Officer',' {\"data\"=>{\"id\"=>\"14\", \"code\"=>\"FYOFF\", \"name\"=>\"Foundation Year Officer\", \"description\"=>\"Role for officer of foundation year\", \"createdDate\"=>nil, \"sys_role_user_attributes\"=>nil, \"sys_role_shortcut_attributes\"=>[{\"id\"=>8, \"shortcut_id\"=>1, \"role_id\"=>14, \"name\"=>\"Student\", \"_destroy\"=>\"\"}, {\"id\"=>9, \"shortcut_id\"=>2, \"role_id\"=>14, \"name\"=>\"Academic\", \"_destroy\"=>\"\"}, {\"shortcut_id\"=>7, \"role_id\"=>\"\", \"name\"=>\"Setting\", \"_destroy\"=>\"\", \"id\"=>nil}]}, \"_dc\"=>\"1446439232676\", \"action\"=>\"update\", \"controller\"=>\"sys_roles\", \"id\"=>\"14\", \"sys_role\"=>{}}','2015-11-02 04:40:33','2015-11-02 04:40:33',NULL,NULL),(191,1,'Login','System','Login System','','2015-11-03 08:13:29','2015-11-03 08:13:29',NULL,NULL),(192,1,'Login','System','Login System','','2015-11-03 09:29:33','2015-11-03 09:29:33',NULL,NULL),(193,1,'Login','System','Login System','','2015-11-04 06:55:24','2015-11-04 06:55:24',NULL,NULL),(194,1,'Update','SysUser','Update user name =   GEP User 3',' {\"data\"=>{\"id\"=>\"5\", \"user_id\"=>\"G003\", \"user_name\"=>\"GEP User 3\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>11, \"position\"=>\"GEP Officer\", \"hr_department_id\"=>8, \"department\"=>\"GEP Office\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"14-Sep-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-09-14 06:43:30\", \"sys_role_user_attributes\"=>[{\"id\"=>14, \"user_id\"=>5, \"role_id\"=>15, \"name\"=>\"GEP Manager\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>[{\"user_id\"=>\"\", \"campus_id\"=>2, \"name\"=>\"Toul Svay Prey\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_degree_attributes\"=>nil}, \"_dc\"=>\"1446620480262\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"5\", \"sys_user\"=>{}}','2015-11-04 07:01:20','2015-11-04 07:01:20',NULL,NULL),(195,1,'Update','SysUser','Update user name =   administrator',' {\"data\"=>{\"id\"=>\"1\", \"user_id\"=>\"admin\", \"user_name\"=>\"administrator\", \"password\"=>\"123456\", \"confirmPassword\"=>\"123456\", \"hr_position_id\"=>1, \"position\"=>\"System Administrator\", \"hr_department_id\"=>1, \"department\"=>\"IT\", \"address\"=>\"sfdsfsdfds\", \"phone\"=>\"07888561565\", \"email\"=>\"mdarait@gmail.com\", \"description\"=>\"test description\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"07-Jun-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-11-02 03:02:37\", \"sys_role_user_attributes\"=>[{\"id\"=>1, \"user_id\"=>1, \"role_id\"=>1, \"name\"=>\"Admin\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>[{\"id\"=>2, \"user_id\"=>1, \"campus_id\"=>2, \"name\"=>\"Toul Svay Prey\", \"_destroy\"=>\"\"}], \"sys_user_degree_attributes\"=>[{\"id\"=>2, \"user_id\"=>1, \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\"}, {\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}]}, \"_dc\"=>\"1446620500413\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"1\", \"sys_user\"=>{}}','2015-11-04 07:01:41','2015-11-04 07:01:41',NULL,NULL),(196,1,'Login','System','Login System','','2015-11-04 07:56:32','2015-11-04 07:56:32',NULL,NULL),(197,1,'Login','System','Login System','','2015-11-15 08:49:46','2015-11-15 08:49:46',NULL,NULL),(198,1,'Login','System','Login System','','2015-11-15 11:40:51','2015-11-15 11:40:51',NULL,NULL),(199,1,'Login','System','Login System','','2015-11-15 13:07:08','2015-11-15 13:07:08',NULL,NULL),(200,1,'Login','System','Login System','','2015-11-15 13:08:25','2015-11-15 13:08:25',NULL,NULL),(201,1,'Login','System','Login System','','2015-11-15 13:25:59','2015-11-15 13:25:59',NULL,NULL),(202,1,'Login','System','Login System','','2015-11-15 13:32:18','2015-11-15 13:32:18',NULL,NULL),(203,1,'Create','SdnLead','create new name =   Sary ','','2015-11-15 13:34:25','2015-11-15 13:34:25',NULL,NULL),(204,1,'Update','Student','update Student =   Sary  MOndyara',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Sary \", \"last_name\"=>\"MOndyara\", \"khr_first_name\"=>\"123\", \"khr_last_name\"=>\"123\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-11-15\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"0\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"TC\", \"campus_id\"=>\"\", \"image_url\"=>\"/images/thumb/missing.png\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>1}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"1\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"1\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"1\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-11-15\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>2, \"term_id\"=>1, \"s_level_id\"=>9, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\", \"id\"=>4}, \"_dc\"=>\"1447594528299\", \"action\"=>\"update\", \"controller\"=>\"sdn_student\", \"id\"=>\"4\", \"sdn_student\"=>{}}','2015-11-15 13:35:28','2015-11-15 13:35:28',NULL,NULL),(205,1,'Ative','Student','Ative Student =   Sary  MOndyara',' {\"admission_id\"=>\"4\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-11-15 13:35:32','2015-11-15 13:35:32',NULL,NULL),(206,1,'Login','System','Login System','','2015-11-16 14:05:12','2015-11-16 14:05:12',NULL,NULL),(207,1,'Login','System','Login System','','2015-11-20 05:01:43','2015-11-20 05:01:43',NULL,NULL),(208,1,'Login','System','Login System','','2015-11-20 05:46:52','2015-11-20 05:46:52',NULL,NULL),(209,1,'Create','SdnLead','create new name =   Heng','','2015-11-20 05:47:35','2015-11-20 05:47:35',NULL,NULL),(210,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-11-20\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-11-20\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1447998530276\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-11-20 05:48:50','2015-11-20 05:48:50',NULL,NULL),(211,1,'Update','Student','update Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-11-20\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"TC\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images//original/Student-Academic.png?1447998549\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-11-20\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\", \"id\"=>1}, \"_dc\"=>\"1447998584793\", \"action\"=>\"update\", \"controller\"=>\"sdn_student\", \"id\"=>\"1\", \"sdn_student\"=>{}}','2015-11-20 05:49:44','2015-11-20 05:49:44',NULL,NULL),(212,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"admission_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-11-20 05:49:58','2015-11-20 05:49:58',NULL,NULL),(213,1,'Create','Student','create Student =   Heng Sophat',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Heng\", \"last_name\"=>\"Sophat\", \"khr_first_name\"=>\"ហេង\", \"khr_last_name\"=>\"សុផាត\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-11-20\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>1, \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"N/A\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"N/A\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-11-20\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>3, \"class_shift_id\"=>1, \"major_id\"=>1, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1448000011713\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-11-20 06:13:32','2015-11-20 06:13:32',NULL,NULL),(214,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-11-20 06:13:51','2015-11-20 06:13:51',NULL,NULL),(215,1,'Update','Student','Close  Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"close_student\"}','2015-11-20 06:38:12','2015-11-20 06:38:12',NULL,NULL),(216,1,'Update','Student','Re-open Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"open_student\"}','2015-11-20 06:44:04','2015-11-20 06:44:04',NULL,NULL),(217,1,'Update','Student','Close  Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"close_student\"}','2015-11-20 06:44:11','2015-11-20 06:44:11',NULL,NULL),(218,1,'Update','Student','Re-open Student =   Heng Sophat',' {\"student_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"open_student\"}','2015-11-20 06:44:17','2015-11-20 06:44:17',NULL,NULL),(219,1,'Update','Student','Close  Student =   Heng Sophat',' {\"student_id\"=>\"1\", \"controller\"=>\"sdn_student\", \"action\"=>\"close_student\"}','2015-11-20 06:44:49','2015-11-20 06:44:49',NULL,NULL),(220,1,'Ative','Student','Ative Student =   Heng Sophat',' {\"admission_id\"=>\"3\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-11-20 07:32:14','2015-11-20 07:32:14',NULL,NULL),(221,1,'Login','System','Login System','','2015-11-20 08:41:46','2015-11-20 08:41:46',NULL,NULL),(222,1,'Login','System','Login System','','2015-11-20 12:59:22','2015-11-20 12:59:22',NULL,NULL),(223,1,'Create','SdnLead','create new name =   Heng','','2015-11-20 12:59:47','2015-11-20 12:59:47',NULL,NULL),(224,1,'Login','System','Login System','','2015-11-25 03:14:02','2015-11-25 03:14:02',NULL,NULL),(225,1,'Login','System','Login System','','2015-12-02 07:10:43','2015-12-02 07:10:43',NULL,NULL),(226,1,'Create','SdnLead','create new name =   test','','2015-12-02 07:11:32','2015-12-02 07:11:32',NULL,NULL),(227,1,'Create','Student','create Student =   test test',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"3\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"test\", \"last_name\"=>\"test\", \"khr_first_name\"=>\"test\", \"khr_last_name\"=>\"test\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011615674\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-12-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1449040326307\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-12-02 07:12:06','2015-12-02 07:12:06',NULL,NULL),(228,1,'Ative','Student','Ative Student =   test test',' {\"admission_id\"=>\"4\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-12-02 07:12:13','2015-12-02 07:12:13',NULL,NULL),(229,1,'Create','Student','create Student =   test test',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"3\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"test\", \"last_name\"=>\"test\", \"khr_first_name\"=>\"test\", \"khr_last_name\"=>\"test\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011615674\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-12-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>3, \"course_id\"=>3, \"class_shift_id\"=>1, \"major_id\"=>1, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1449040400385\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-12-02 07:13:20','2015-12-02 07:13:20',NULL,NULL),(230,1,'Ative','Student','Ative Student =   test test',' {\"student_id\"=>\"5\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-12-02 07:13:25','2015-12-02 07:13:25',NULL,NULL),(231,1,'Create','SdnLead','create new name =   Test1','','2015-12-02 07:14:17','2015-12-02 07:14:17',NULL,NULL),(232,1,'Update','Student','update Student =   Test1 Test11',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Test1\", \"last_name\"=>\"Test11\", \"khr_first_name\"=>\"test1\", \"khr_last_name\"=>\"test11\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"TC\", \"campus_id\"=>\"\", \"image_url\"=>\"/resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-12-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\", \"id\"=>6}, \"_dc\"=>\"1449040524341\", \"action\"=>\"update\", \"controller\"=>\"sdn_student\", \"id\"=>\"6\", \"sdn_student\"=>{}}','2015-12-02 07:15:24','2015-12-02 07:15:24',NULL,NULL),(233,1,'Ative','Student','Ative Student =   Test1 Test11',' {\"admission_id\"=>\"6\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-12-02 07:15:30','2015-12-02 07:15:30',NULL,NULL),(234,1,'Create','Student','create Student =   Test1 Test11',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"4\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Test1\", \"last_name\"=>\"Test11\", \"khr_first_name\"=>\"test1\", \"khr_last_name\"=>\"test11\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-12-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>3, \"course_id\"=>4, \"class_shift_id\"=>1, \"major_id\"=>1, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1449040568096\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-12-02 07:16:08','2015-12-02 07:16:08',NULL,NULL),(235,1,'Ative','Student','Ative Student =   Test1 Test11',' {\"student_id\"=>\"7\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-12-02 07:16:14','2015-12-02 07:16:14',NULL,NULL),(236,1,'Update','Student','update Student =   test test',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"test\", \"last_name\"=>\"test\", \"khr_first_name\"=>\"test\", \"khr_last_name\"=>\"test\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011615674\", \"email\"=>\"sdasd@gmail.com\", \"address\"=>\"sadsad\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"system/images/images//original/Student-Academic.png?1449040900\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>1}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>\"\", \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\", \"id\"=>3}, \"_dc\"=>\"1449040902822\", \"action\"=>\"update\", \"controller\"=>\"sdn_student\", \"id\"=>\"3\", \"sdn_student\"=>{}}','2015-12-02 07:21:42','2015-12-02 07:21:42',NULL,NULL),(237,1,'Login','System','Login System','','2015-12-02 11:41:07','2015-12-02 11:41:07',NULL,NULL),(238,1,'Create','SdnLead','create new name =   sradadsa','','2015-12-02 11:41:52','2015-12-02 11:41:52',NULL,NULL),(239,1,'Ative','Student','Ative Student =   sradadsa asdasda',' {\"admission_id\"=>\"10\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-12-02 11:42:35','2015-12-02 11:42:35',NULL,NULL),(240,1,'Create','Student','create Student =   sradadsa asdasda',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"5\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"sradadsa\", \"last_name\"=>\"asdasda\", \"khr_first_name\"=>\"dsfsdf\", \"khr_last_name\"=>\"dsfsdfs\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"42342342\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"dfrwer\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"dsfsdf\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-12-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>3, \"course_id\"=>3, \"class_shift_id\"=>1, \"major_id\"=>1, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1449056877660\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-12-02 11:47:57','2015-12-02 11:47:57',NULL,NULL),(241,1,'Create','SdnLead','create new name =   orturoetuero','','2015-12-02 11:49:18','2015-12-02 11:49:18',NULL,NULL),(242,1,'Create','Student','create Student =   orturoetuero ereworu',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"6\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"orturoetuero\", \"last_name\"=>\"ereworu\", \"khr_first_name\"=>\"ldfjs\", \"khr_last_name\"=>\"fklsjfsl\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"324324\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-12-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>25, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>2, \"class_shift_id\"=>1, \"major_id\"=>6, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1449056988214\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-12-02 11:49:48','2015-12-02 11:49:48',NULL,NULL),(243,1,'Ative','Student','Ative Student =   orturoetuero ereworu',' {\"admission_id\"=>\"14\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2015-12-02 11:49:58','2015-12-02 11:49:58',NULL,NULL),(244,1,'Create','Student','create Student =   orturoetuero ereworu',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"6\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"orturoetuero\", \"last_name\"=>\"ereworu\", \"khr_first_name\"=>\"ldfjs\", \"khr_last_name\"=>\"fklsjfsl\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2015-12-02\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"324324\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"324234\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"2324\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2015-12-02\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>1, \"degree_id\"=>4, \"course_id\"=>3, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1449057051965\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2015-12-02 11:50:52','2015-12-02 11:50:52',NULL,NULL),(245,1,'Ative','Student','Ative Student =   orturoetuero ereworu',' {\"student_id\"=>\"15\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2015-12-02 11:51:02','2015-12-02 11:51:02',NULL,NULL),(246,1,'Login','System','Login System','','2015-12-03 02:36:07','2015-12-03 02:36:07',NULL,NULL),(247,1,'Create','SysRole','create new role name =   T.C. Role','{\"data\"=>{\"code\"=>\"TCROLE\", \"name\"=>\"T.C. Role\", \"description\"=>\"Role for training center (GEP)\", \"createdDate\"=>nil, \"id\"=>\"\", \"sys_role_user_attributes\"=>nil, \"sys_role_shortcut_attributes\"=>[{\"shortcut_id\"=>1, \"role_id\"=>\"\", \"name\"=>\"Student\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>2, \"role_id\"=>\"\", \"name\"=>\"Academic\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>7, \"role_id\"=>\"\", \"name\"=>\"Setting\", \"_destroy\"=>\"\", \"id\"=>nil}]}, \"_dc\"=>\"1449110282249\", \"action\"=>\"create\", \"controller\"=>\"sys_roles\", \"sys_role\"=>{}}','2015-12-03 02:38:02','2015-12-03 02:38:02',NULL,NULL),(248,1,'Create','SysUser','create new user name =   TC 01','{\"data\"=>{\"user_id\"=>\"TC01\", \"user_name\"=>\"TC 01\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>11, \"position\"=>\"\", \"hr_department_id\"=>8, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"03-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>16, \"name\"=>\"T.C. Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449110891760\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-03 02:48:12','2015-12-03 02:48:12',NULL,NULL),(249,6,'Login','System','Login System','','2015-12-03 02:49:23','2015-12-03 02:49:23',NULL,NULL),(250,1,'Login','System','Login System','','2015-12-03 02:52:02','2015-12-03 02:52:02',NULL,NULL),(251,1,'Create','SysRole','create new role name =   University Role for Head Department','{\"data\"=>{\"code\"=>\"RGE01\", \"name\"=>\"University Role for Head Department\", \"description\"=>\"\", \"createdDate\"=>nil, \"id\"=>\"\", \"sys_role_user_attributes\"=>nil, \"sys_role_shortcut_attributes\"=>[{\"shortcut_id\"=>1, \"role_id\"=>\"\", \"name\"=>\"Student\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>2, \"role_id\"=>\"\", \"name\"=>\"Academic\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>7, \"role_id\"=>\"\", \"name\"=>\"Setting\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>5, \"role_id\"=>\"\", \"name\"=>\"Human Resource\", \"_destroy\"=>\"\", \"id\"=>nil}]}, \"_dc\"=>\"1449111283639\", \"action\"=>\"create\", \"controller\"=>\"sys_roles\", \"sys_role\"=>{}}','2015-12-03 02:54:44','2015-12-03 02:54:44',NULL,NULL),(252,NULL,'Update','SysRole','Update role name =   University Role for Head Department',' {\"data\"=>{\"id\"=>\"17\", \"code\"=>\"WU01\", \"name\"=>\"University Role for Head Department\", \"description\"=>\"\", \"createdDate\"=>nil, \"sys_role_user_attributes\"=>nil, \"sys_role_shortcut_attributes\"=>[{\"id\"=>18, \"shortcut_id\"=>1, \"role_id\"=>17, \"name\"=>\"Student\", \"_destroy\"=>\"\"}, {\"id\"=>19, \"shortcut_id\"=>2, \"role_id\"=>17, \"name\"=>\"Academic\", \"_destroy\"=>\"\"}, {\"id\"=>20, \"shortcut_id\"=>7, \"role_id\"=>17, \"name\"=>\"Setting\", \"_destroy\"=>\"\"}, {\"id\"=>21, \"shortcut_id\"=>5, \"role_id\"=>17, \"name\"=>\"Human Resource\", \"_destroy\"=>\"\"}]}, \"_dc\"=>\"1449111305479\", \"action\"=>\"update\", \"controller\"=>\"sys_roles\", \"id\"=>\"17\", \"sys_role\"=>{}}','2015-12-03 02:55:06','2015-12-03 02:55:06',NULL,NULL),(253,1,'Create','HrDepartment','create new department =   Registrar Office','{\"data\"=>{\"departmentId\"=>\"\", \"department\"=>\"Registrar Office\", \"description\"=>\"\", \"isDeleted\"=>\"\"}, \"_dc\"=>\"1449111717999\", \"action\"=>\"create\", \"controller\"=>\"hr_department\", \"hr_department\"=>{}}','2015-12-03 03:01:58','2015-12-03 03:01:58',NULL,NULL),(254,1,'Create','HrPosition','create new position =   Registrar Officer','{\"data\"=>{\"position\"=>\"Registrar Officer\", \"description\"=>\"\", \"isDeleted\"=>\"\"}, \"_dc\"=>\"1449111735899\", \"action\"=>\"create\", \"controller\"=>\"hr_positions\", \"hr_position\"=>{}}','2015-12-03 03:02:16','2015-12-03 03:02:16',NULL,NULL),(255,1,'Create','SysUser','create new user name =   WU01','{\"data\"=>{\"user_id\"=>\"RG001\", \"user_name\"=>\"WU01\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>15, \"position\"=>\"\", \"hr_department_id\"=>10, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"04-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>17, \"name\"=>\"University Role for Head Department\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>nil, \"id\"=>\"\"}, \"_dc\"=>\"1449111907795\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-03 03:05:08','2015-12-03 03:05:08',NULL,NULL),(256,7,'Login','System','Login System','','2015-12-03 03:05:50','2015-12-03 03:05:50',NULL,NULL),(257,1,'Login','System','Login System','','2015-12-03 03:27:46','2015-12-03 03:27:46',NULL,NULL),(258,NULL,'Update','SysRole','Update role name =   University Role for Head Department',' {\"data\"=>{\"id\"=>\"17\", \"code\"=>\"WU01\", \"name\"=>\"University Role for Head Department\", \"description\"=>\"\", \"createdDate\"=>nil, \"sys_role_user_attributes\"=>[{\"id\"=>17, \"user_id\"=>7, \"role_id\"=>17, \"user_id_str\"=>\"RG001\", \"name\"=>\"WU01\", \"_destroy\"=>\"\"}], \"sys_role_shortcut_attributes\"=>[{\"id\"=>18, \"shortcut_id\"=>1, \"role_id\"=>17, \"name\"=>\"Student\", \"_destroy\"=>\"\"}, {\"id\"=>19, \"shortcut_id\"=>2, \"role_id\"=>17, \"name\"=>\"Academic\", \"_destroy\"=>\"\"}, {\"id\"=>20, \"shortcut_id\"=>7, \"role_id\"=>17, \"name\"=>\"Setting\", \"_destroy\"=>\"\"}, {\"shortcut_id\"=>6, \"role_id\"=>\"\", \"name\"=>\"Human Resource\", \"_destroy\"=>\"\", \"id\"=>nil}]}, \"_dc\"=>\"1449113303832\", \"action\"=>\"update\", \"controller\"=>\"sys_roles\", \"id\"=>\"17\", \"sys_role\"=>{}}','2015-12-03 03:28:24','2015-12-03 03:28:24',NULL,NULL),(259,NULL,'Update','SysRole','Update role name =   T.C. Role',' {\"data\"=>{\"id\"=>\"16\", \"code\"=>\"TCROLE\", \"name\"=>\"T.C. Role\", \"description\"=>\"Role for training center (GEP)\", \"createdDate\"=>nil, \"sys_role_user_attributes\"=>[{\"id\"=>16, \"user_id\"=>6, \"role_id\"=>16, \"user_id_str\"=>\"TC01\", \"name\"=>\"TC 01\", \"_destroy\"=>\"\"}], \"sys_role_shortcut_attributes\"=>[{\"id\"=>15, \"shortcut_id\"=>1, \"role_id\"=>16, \"name\"=>\"Student\", \"_destroy\"=>\"\"}, {\"id\"=>16, \"shortcut_id\"=>2, \"role_id\"=>16, \"name\"=>\"Academic\", \"_destroy\"=>\"\"}, {\"id\"=>17, \"shortcut_id\"=>7, \"role_id\"=>16, \"name\"=>\"Setting\", \"_destroy\"=>\"\"}, {\"shortcut_id\"=>6, \"role_id\"=>\"\", \"name\"=>\"Human Resource\", \"_destroy\"=>\"\", \"id\"=>nil}]}, \"_dc\"=>\"1449113379813\", \"action\"=>\"update\", \"controller\"=>\"sys_roles\", \"id\"=>\"16\", \"sys_role\"=>{}}','2015-12-03 03:29:39','2015-12-03 03:29:39',NULL,NULL),(260,1,'Update','CfgAcademicYear','Update academic year =2015-2016',' {\"data\"=>{\"id\"=>1, \"code\"=>\"Y1516\", \"name\"=>\"2015-2016\", \"start_date\"=>\"2015-11-01\", \"end_date\"=>\"2016-11-01\"}, \"_dc\"=>\"1449114216976\", \"action\"=>\"update\", \"controller\"=>\"cfg_academic_years\", \"id\"=>\"1\", \"cfg_academic_year\"=>{}}','2015-12-03 03:43:37','2015-12-03 03:43:37',NULL,NULL),(261,1,'Create','CfgAcademicYear','create new academic year=2014 - 2015','{\"data\"=>{\"code\"=>\"Y1415\", \"name\"=>\"2014 - 2015\", \"start_date\"=>\"2014-11-01\", \"end_date\"=>\"2015-11-30\"}, \"_dc\"=>\"1449114256809\", \"action\"=>\"create\", \"controller\"=>\"cfg_academic_years\", \"cfg_academic_year\"=>{}}','2015-12-03 03:44:17','2015-12-03 03:44:17',NULL,NULL),(262,1,'Create','AcdBatch','create new batch name=   Batch 2','{\"data\"=>{\"code\"=>\"B02\", \"name\"=>\"Batch 2\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី២\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114298356\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:44:58','2015-12-03 03:44:58',NULL,NULL),(263,1,'Create','AcdBatch','create new batch name=   Batch 3','{\"data\"=>{\"code\"=>\"B03\", \"name\"=>\"Batch 3\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី៣\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114349988\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:45:50','2015-12-03 03:45:50',NULL,NULL),(264,1,'Create','AcdBatch','create new batch name=   Batch 4','{\"data\"=>{\"code\"=>\"B04\", \"name\"=>\"Batch 4\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី៤\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114386876\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:46:27','2015-12-03 03:46:27',NULL,NULL),(265,1,'Create','AcdBatch','create new batch name=   Batch 5','{\"data\"=>{\"code\"=>\"B05\", \"name\"=>\"Batch 5\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី៥\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114431980\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:47:12','2015-12-03 03:47:12',NULL,NULL),(266,1,'Create','AcdBatch','create new batch name=   Batch 10','{\"data\"=>{\"code\"=>\"B10\", \"name\"=>\"Batch 10\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី១០\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114474307\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:47:54','2015-12-03 03:47:54',NULL,NULL),(267,1,'Create','AcdBatch','create new batch name=   Batch 11','{\"data\"=>{\"code\"=>\"B11\", \"name\"=>\"Batch 11\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី១១\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114514899\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:48:35','2015-12-03 03:48:35',NULL,NULL),(268,1,'Create','AcdBatch','create new batch name=   Batch 12','{\"data\"=>{\"code\"=>\"B12\", \"name\"=>\"Batch 12\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី១២\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114549563\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:49:10','2015-12-03 03:49:10',NULL,NULL),(269,1,'Create','AcdBatch','create new batch name=   Batch 13','{\"data\"=>{\"code\"=>\"B13\", \"name\"=>\"Batch 13\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់ទី១៣\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1449114579763\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2015-12-03 03:49:40','2015-12-03 03:49:40',NULL,NULL),(270,1,'Update','AcdMajor','update major name =   Default',' {\"data\"=>{\"id\"=>1, \"code\"=>\"DEFAULT\", \"name\"=>\"Default\", \"is_deleted\"=>false, \"khr_name\"=>\"ជំនាញដំបូង\", \"campus_id\"=>1}, \"_dc\"=>\"1449114594755\", \"action\"=>\"update\", \"controller\"=>\"acd_majors\", \"id\"=>\"1\", \"acd_major\"=>{}}','2015-12-03 03:49:55','2015-12-03 03:49:55',NULL,NULL),(271,1,'Update','CfgAcademicYear','Update academic year =2015​ -​​ 2016',' {\"data\"=>{\"id\"=>1, \"code\"=>\"Y1516\", \"name\"=>\"2015​ -​​ 2016\", \"start_date\"=>\"2015-11-01\", \"end_date\"=>\"2016-11-01\"}, \"_dc\"=>\"1449114615151\", \"action\"=>\"update\", \"controller\"=>\"cfg_academic_years\", \"id\"=>\"1\", \"cfg_academic_year\"=>{}}','2015-12-03 03:50:15','2015-12-03 03:50:15',NULL,NULL),(272,1,'Create','SysUser','create new user name =   RG002','{\"data\"=>{\"user_id\"=>\"WU02\", \"user_name\"=>\"RG002\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>9, \"position\"=>\"\", \"hr_department_id\"=>10, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"03-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>17, \"name\"=>\"University Role for Head Department\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449114834771\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-03 03:53:55','2015-12-03 03:53:55',NULL,NULL),(273,1,'Create','SysUser','create new user name =   WU01','{\"data\"=>{\"user_id\"=>\"WU01\", \"user_name\"=>\"WU01\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>9, \"position\"=>\"\", \"hr_department_id\"=>10, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"03-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>17, \"name\"=>\"University Role for Head Department\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>nil, \"id\"=>\"\"}, \"_dc\"=>\"1449114929015\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-03 03:55:29','2015-12-03 03:55:29',NULL,NULL),(274,1,'Create','SysUser','create new user name =   TC02','{\"data\"=>{\"user_id\"=>\"TC02\", \"user_name\"=>\"TC02\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>11, \"position\"=>\"\", \"hr_department_id\"=>8, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"03-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>16, \"name\"=>\"T.C. Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449115003607\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-03 03:56:43','2015-12-03 03:56:43',NULL,NULL),(275,6,'Login','System','Login System','','2015-12-03 04:14:24','2015-12-03 04:14:24',NULL,NULL),(276,9,'Login','System','Login System','','2015-12-03 04:18:40','2015-12-03 04:18:40',NULL,NULL),(277,1,'Login','System','Login System','','2015-12-03 04:18:59','2015-12-03 04:18:59',NULL,NULL),(278,1,'Login','System','Login System','','2015-12-06 06:09:42','2015-12-06 06:09:42',NULL,NULL),(279,1,'Create','SysRole','create new role name =   Auditor Role','{\"data\"=>{\"code\"=>\"AUDT01\", \"name\"=>\"Auditor Role\", \"description\"=>\"Role for Auditor team\", \"createdDate\"=>nil, \"id\"=>\"\", \"sys_role_user_attributes\"=>nil, \"sys_role_shortcut_attributes\"=>[{\"shortcut_id\"=>1, \"role_id\"=>\"\", \"name\"=>\"Student\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>3, \"role_id\"=>\"\", \"name\"=>\"Accounting\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>2, \"role_id\"=>\"\", \"name\"=>\"Academic\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>6, \"role_id\"=>\"\", \"name\"=>\"Human Resource\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"shortcut_id\"=>7, \"role_id\"=>\"\", \"name\"=>\"Setting\", \"_destroy\"=>\"\", \"id\"=>nil}]}, \"_dc\"=>\"1449382263842\", \"action\"=>\"create\", \"controller\"=>\"sys_roles\", \"sys_role\"=>{}}','2015-12-06 06:11:04','2015-12-06 06:11:04',NULL,NULL),(280,1,'Create','HrPosition','create new position =   Head of Auditor','{\"data\"=>{\"position\"=>\"Head of Auditor\", \"description\"=>\"\", \"isDeleted\"=>\"\"}, \"_dc\"=>\"1449382447434\", \"action\"=>\"create\", \"controller\"=>\"hr_positions\", \"hr_position\"=>{}}','2015-12-06 06:14:07','2015-12-06 06:14:07',NULL,NULL),(281,1,'Create','HrPosition','create new position =   Audit Officer','{\"data\"=>{\"position\"=>\"Audit Officer\", \"description\"=>\"\", \"isDeleted\"=>\"\"}, \"_dc\"=>\"1449382475338\", \"action\"=>\"create\", \"controller\"=>\"hr_positions\", \"hr_position\"=>{}}','2015-12-06 06:14:35','2015-12-06 06:14:35',NULL,NULL),(282,1,'Update','HrPosition','udpate position =   Head of Internal Audit',' {\"data\"=>{\"id\"=>16, \"position\"=>\"Head of Internal Audit\", \"description\"=>\"\", \"isDeleted\"=>\"\"}, \"_dc\"=>\"1449382493610\", \"action\"=>\"update\", \"controller\"=>\"hr_positions\", \"id\"=>\"16\", \"hr_position\"=>{}}','2015-12-06 06:14:54','2015-12-06 06:14:54',NULL,NULL),(283,1,'Update','HrPosition','udpate position =   Internal Audit Officer',' {\"data\"=>{\"id\"=>17, \"position\"=>\"Internal Audit Officer\", \"description\"=>\"\", \"isDeleted\"=>\"\"}, \"_dc\"=>\"1449382509434\", \"action\"=>\"update\", \"controller\"=>\"hr_positions\", \"id\"=>\"17\", \"hr_position\"=>{}}','2015-12-06 06:15:09','2015-12-06 06:15:09',NULL,NULL),(284,1,'Create','HrDepartment','create new department =   Internal Audit','{\"data\"=>{\"departmentId\"=>\"\", \"department\"=>\"Internal Audit\", \"description\"=>\"Internal Audit Department\", \"isDeleted\"=>\"\"}, \"_dc\"=>\"1449382613567\", \"action\"=>\"create\", \"controller\"=>\"hr_department\", \"hr_department\"=>{}}','2015-12-06 06:16:54','2015-12-06 06:16:54',NULL,NULL),(285,1,'Create','SysUser','create new user name =   Head Auditor','{\"data\"=>{\"user_id\"=>\"AU01\", \"user_name\"=>\"Head Auditor\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>16, \"position\"=>\"\", \"hr_department_id\"=>11, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449382710526\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-06 06:18:30','2015-12-06 06:18:30',NULL,NULL),(286,1,'Create','SysUser','create new user name =   Auditor 1','{\"data\"=>{\"user_id\"=>\"AU02\", \"user_name\"=>\"Auditor 1\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>17, \"position\"=>\"\", \"hr_department_id\"=>11, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449382793725\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-06 06:19:54','2015-12-06 06:19:54',NULL,NULL),(287,1,'Create','SysUser','create new user name =   Auditor 3','{\"data\"=>{\"user_id\"=>\"AU03\", \"user_name\"=>\"Auditor 3\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>17, \"position\"=>\"\", \"hr_department_id\"=>11, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449382874377\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-06 06:21:14','2015-12-06 06:21:14',NULL,NULL),(288,1,'Login','System','Login System','','2015-12-06 07:07:30','2015-12-06 07:07:30',NULL,NULL),(289,1,'Update','SysUser','Update user name =   Meas Phidochampa',' {\"data\"=>{\"id\"=>\"11\", \"user_id\"=>\"AU01\", \"user_name\"=>\"Meas Phidochampa\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>16, \"position\"=>\"Head of Internal Audit\", \"hr_department_id\"=>11, \"department\"=>\"Internal Audit\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Admin\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-12-06 06:18:30\", \"sys_role_user_attributes\"=>[{\"id\"=>21, \"user_id\"=>11, \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"id\"=>12, \"user_id\"=>11, \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\"}, {\"id\"=>13, \"user_id\"=>11, \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\"}, {\"id\"=>14, \"user_id\"=>11, \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\"}, {\"id\"=>15, \"user_id\"=>11, \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\"}, {\"id\"=>16, \"user_id\"=>11, \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\"}, {\"id\"=>17, \"user_id\"=>11, \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\"}]}, \"_dc\"=>\"1449385935374\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"11\", \"sys_user\"=>{}}','2015-12-06 07:12:15','2015-12-06 07:12:15',NULL,NULL),(290,1,'Update','SysUser','Update user name =   HORM SITHA',' {\"data\"=>{\"id\"=>\"12\", \"user_id\"=>\"AU02\", \"user_name\"=>\"HORM SITHA\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>17, \"position\"=>\"Internal Audit Officer\", \"hr_department_id\"=>11, \"department\"=>\"Internal Audit\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-12-06 06:19:54\", \"sys_role_user_attributes\"=>[{\"id\"=>22, \"user_id\"=>12, \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"id\"=>18, \"user_id\"=>12, \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\"}, {\"id\"=>19, \"user_id\"=>12, \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\"}, {\"id\"=>20, \"user_id\"=>12, \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\"}, {\"id\"=>21, \"user_id\"=>12, \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\"}, {\"id\"=>22, \"user_id\"=>12, \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\"}, {\"id\"=>23, \"user_id\"=>12, \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\"}]}, \"_dc\"=>\"1449385953782\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"12\", \"sys_user\"=>{}}','2015-12-06 07:12:34','2015-12-06 07:12:34',NULL,NULL),(291,1,'Update','SysUser','Update user name =   CHHENG CHANDY',' {\"data\"=>{\"id\"=>\"13\", \"user_id\"=>\"AU03\", \"user_name\"=>\"CHHENG CHANDY\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>17, \"position\"=>\"Internal Audit Officer\", \"hr_department_id\"=>11, \"department\"=>\"Internal Audit\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"Head Office\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"Active\\t\", \"updated_at\"=>\"2015-12-06 06:21:14\", \"sys_role_user_attributes\"=>[{\"id\"=>23, \"user_id\"=>13, \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\"}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"id\"=>24, \"user_id\"=>13, \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\"}, {\"id\"=>25, \"user_id\"=>13, \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\"}, {\"id\"=>26, \"user_id\"=>13, \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\"}, {\"id\"=>27, \"user_id\"=>13, \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\"}, {\"id\"=>28, \"user_id\"=>13, \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\"}, {\"id\"=>29, \"user_id\"=>13, \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\"}]}, \"_dc\"=>\"1449385972294\", \"action\"=>\"update\", \"controller\"=>\"sys_users\", \"id\"=>\"13\", \"sys_user\"=>{}}','2015-12-06 07:12:52','2015-12-06 07:12:52',NULL,NULL),(292,1,'Create','SysUser','create new user name =   YAN SOKHOUCH','{\"data\"=>{\"user_id\"=>\"AU04\", \"user_name\"=>\"YAN SOKHOUCH\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>17, \"position\"=>\"\", \"hr_department_id\"=>11, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449386038266\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-06 07:13:58','2015-12-06 07:13:58',NULL,NULL),(293,1,'Create','SysUser','create new user name =   LIM SIVOUCH','{\"data\"=>{\"user_id\"=>\"AU05\", \"user_name\"=>\"LIM SIVOUCH\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>17, \"position\"=>\"\", \"hr_department_id\"=>11, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449386149301\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-06 07:15:49','2015-12-06 07:15:49',NULL,NULL),(294,1,'Create','SysUser','create new user name =   POV RATHA','{\"data\"=>{\"user_id\"=>\"AU06\", \"user_name\"=>\"POV RATHA\", \"password\"=>\"123\", \"confirmPassword\"=>\"123\", \"hr_position_id\"=>17, \"position\"=>\"\", \"hr_department_id\"=>11, \"department\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"email\"=>\"\", \"description\"=>\"\", \"user_type\"=>\"Staff\", \"home_campus_id\"=>1, \"home_campus\"=>\"\", \"status_id\"=>29, \"start_date\"=>\"06-Dec-2015\", \"is_force_pass\"=>\"\", \"status\"=>\"\", \"updated_at\"=>\"\", \"sys_role_user_attributes\"=>[{\"user_id\"=>\"\", \"role_id\"=>18, \"name\"=>\"Auditor Role\", \"_destroy\"=>\"\", \"id\"=>nil}], \"sys_user_location_attributes\"=>nil, \"sys_user_degree_attributes\"=>[{\"user_id\"=>\"\", \"degree_id\"=>6, \"name\"=>\"Doctor\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>5, \"name\"=>\"Master\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>4, \"name\"=>\"Bachelor\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>3, \"name\"=>\"Associate\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>2, \"name\"=>\"Short Course\", \"_destroy\"=>\"\", \"id\"=>nil}, {\"user_id\"=>\"\", \"degree_id\"=>1, \"name\"=>\"English Course\", \"_destroy\"=>\"\", \"id\"=>nil}], \"id\"=>\"\"}, \"_dc\"=>\"1449386250085\", \"action\"=>\"create\", \"controller\"=>\"sys_users\", \"sys_user\"=>{}}','2015-12-06 07:17:30','2015-12-06 07:17:30',NULL,NULL),(295,11,'Login','System','Login System','','2015-12-06 07:18:09','2015-12-06 07:18:09',NULL,NULL),(296,1,'Login','System','Login System','','2015-12-06 15:13:08','2015-12-06 15:13:08',NULL,NULL),(297,1,'Login','System','Login System','','2016-01-24 08:22:24','2016-01-24 08:22:24',NULL,NULL),(298,1,'Login','System','Login System','','2016-01-24 09:15:30','2016-01-24 09:15:30',NULL,NULL),(299,1,'Login','System','Login System','','2016-01-24 09:40:48','2016-01-24 09:40:48',NULL,NULL),(300,1,'Login','System','Login System','','2016-01-24 11:54:01','2016-01-24 11:54:01',NULL,NULL),(301,1,'Login','System','Login System','','2016-01-27 07:25:15','2016-01-27 07:25:15',NULL,NULL),(302,1,'Login','System','Login System','','2016-01-28 07:58:19','2016-01-28 07:58:19',NULL,NULL),(303,1,'Login','System','Login System','','2016-02-01 09:13:08','2016-02-01 09:13:08',NULL,NULL),(304,1,'Login','System','Login System','','2016-02-03 07:02:14','2016-02-03 07:02:14',NULL,NULL),(305,1,'Create','SdnLead','create new name =   SOPHAT','','2016-02-03 07:03:28','2016-02-03 07:03:28',NULL,NULL),(306,1,'Create','SdnLead','create new name =   Monydara','','2016-02-03 07:29:24','2016-02-03 07:29:24',NULL,NULL),(307,1,'Login','System','Login System','','2016-02-06 11:02:02','2016-02-06 11:02:02',NULL,NULL),(308,1,'Create','Student','create Student =   SOPHAT HENG',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"1\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"SOPHAT\", \"last_name\"=>\"HENG\", \"khr_first_name\"=>\"សុផាត\", \"khr_last_name\"=>\"ហេង\", \"gender\"=>\"M\", \"date_of_birth\"=>\"1983-03-08\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"011716785\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2016-02-06\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>1, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1454756971917\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2016-02-06 11:09:32','2016-02-06 11:09:32',NULL,NULL),(309,1,'Ative','Student','Ative Student =   SOPHAT HENG',' {\"admission_id\"=>\"2\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2016-02-06 11:09:41','2016-02-06 11:09:41',NULL,NULL),(310,1,'Update','SdnLead','udpate name =   Monydara',' ','2016-02-06 11:16:35','2016-02-06 11:16:35',NULL,NULL),(311,1,'Create','Student','create Student =   Monydara Sary',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"2\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Monydara\", \"last_name\"=>\"Sary\", \"khr_first_name\"=>\"មុនីដារ៉ា\", \"khr_last_name\"=>\"សារី\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2016-02-06\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"234234\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"NA\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2016-02-06\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>9, \"degree_id\"=>4, \"course_id\"=>3, \"class_shift_id\"=>1, \"major_id\"=>1, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"diploma_exam_place\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1454757913619\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2016-02-06 11:25:13','2016-02-06 11:25:13',NULL,NULL),(312,1,'Ative','Student','Ative Student =   Monydara Sary',' {\"student_id\"=>\"3\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2016-02-06 11:26:48','2016-02-06 11:26:48',NULL,NULL),(313,1,'Login','System','Login System','','2016-02-07 05:52:08','2016-02-07 05:52:08',NULL,NULL),(314,1,'Login','System','Login System','','2016-02-07 05:52:09','2016-02-07 05:52:09',NULL,NULL),(315,1,'Create','AccChargeItem','create new ChargeItem =   Official Charge','{\"data\"=>{\"item_code\"=>\"OFCCHG\", \"item_name\"=>\"Official Charge\", \"item_type_id\"=>2, \"item_type_name\"=>\"\", \"charge_amount\"=>\"50\", \"note\"=>\"\", \"campus_id\"=>\"\", \"is_del\"=>\"\", \"is_editable\"=>\"on\", \"status\"=>\"A\", \"charge_item\"=>\"undefined\"}, \"_dc\"=>\"1454824554772\", \"action\"=>\"create\", \"controller\"=>\"acc_charge_items\", \"acc_charge_item\"=>{}}','2016-02-07 05:55:55','2016-02-07 05:55:55',NULL,NULL),(316,1,'Login','System','Login System','','2016-02-07 12:10:34','2016-02-07 12:10:34',NULL,NULL),(317,1,'Login','System','Login System','','2016-02-10 04:42:58','2016-02-10 04:42:58',NULL,NULL),(318,1,'Login','System','Login System','','2016-02-10 06:42:50','2016-02-10 06:42:50',NULL,NULL),(319,1,'Login','System','Login System','','2016-02-11 23:59:39','2016-02-11 23:59:39',NULL,NULL),(320,1,'Login','System','Login System','','2016-02-12 01:20:22','2016-02-12 01:20:22',NULL,NULL),(321,1,'Login','System','Login System','','2016-02-12 01:20:22','2016-02-12 01:20:22',NULL,NULL),(322,1,'Create','AccFeeCatalogue','create new Catalogue =   Fee Catalog','{\"data\"=>{\"catalogue_name\"=>\"Fee Catalog\", \"fiscal_year\"=>\"2015-2016\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"2016-02-12\", \"description\"=>\"This is second catalog\", \"is_active\"=>0, \"is_deleted\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1455241345475\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_catalogues\", \"acc_fee_catalogue\"=>{}}','2016-02-12 01:42:26','2016-02-12 01:42:26',NULL,NULL),(323,1,'Update','AccFeeCatalogue','udpate Catalogue =   Fee Catalog',' {\"data\"=>{\"id\"=>1, \"catalogue_name\"=>\"Fee Catalog\", \"fiscal_year\"=>\"2015-2016\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"2016-02-12\", \"description\"=>\"This is second catalog\", \"is_active\"=>1, \"is_deleted\"=>0, \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-12 01:42:26\", \"updated_at\"=>\"2016-02-12 01:42:26\"}, \"_dc\"=>\"1455241361584\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_catalogues\", \"id\"=>\"1\", \"acc_fee_catalogue\"=>{}}','2016-02-12 01:42:41','2016-02-12 01:42:41',NULL,NULL),(324,1,'Update','AccFeeCatalogue','udpate Catalogue =   Fee Catalog',' {\"data\"=>{\"id\"=>1, \"catalogue_name\"=>\"Fee Catalog\", \"fiscal_year\"=>\"2015-2016\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"2016-02-12\", \"description\"=>\"This is second catalog\", \"is_active\"=>0, \"is_deleted\"=>0, \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-12 01:42:26\", \"updated_at\"=>\"2016-02-12 01:42:41\"}, \"_dc\"=>\"1455241373477\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_catalogues\", \"id\"=>\"1\", \"acc_fee_catalogue\"=>{}}','2016-02-12 01:42:53','2016-02-12 01:42:53',NULL,NULL),(325,1,'Create','AccFeeCatalogue','create new Catalogue =   Dara','{\"data\"=>{\"catalogue_name\"=>\"Dara\", \"fiscal_year\"=>\"SDf\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"\", \"description\"=>\"\", \"is_active\"=>0, \"is_deleted\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1455243801574\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_catalogues\", \"acc_fee_catalogue\"=>{}}','2016-02-12 02:23:21','2016-02-12 02:23:21',NULL,NULL),(326,1,'Create','AccFeeCatalogue','create new Catalogue =   New Year','{\"data\"=>{\"catalogue_name\"=>\"New Year\", \"fiscal_year\"=>\"2015\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"2016-02-12\", \"description\"=>\"\", \"is_active\"=>1, \"is_deleted\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1455244110947\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_catalogues\", \"acc_fee_catalogue\"=>{}}','2016-02-12 02:28:31','2016-02-12 02:28:31',NULL,NULL),(327,1,'Create','AccFeeCatalogue','create new Catalogue =   Dara','{\"data\"=>{\"catalogue_name\"=>\"Dara\", \"fiscal_year\"=>\"sdfs\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"\", \"description\"=>\"\", \"is_active\"=>1, \"is_deleted\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\"}, \"_dc\"=>\"1455249190880\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_catalogues\", \"acc_fee_catalogue\"=>{}}','2016-02-12 03:53:11','2016-02-12 03:53:11',NULL,NULL),(328,1,'Update','AccFeeCatalogue','udpate Catalogue =   Dara',' {\"data\"=>{\"id\"=>4, \"catalogue_name\"=>\"Dara\", \"fiscal_year\"=>\"2015\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"\", \"description\"=>\"\", \"is_active\"=>1, \"is_deleted\"=>0, \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-12 03:53:10\", \"updated_at\"=>\"2016-02-12 03:53:10\"}, \"_dc\"=>\"1455249202538\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_catalogues\", \"id\"=>\"4\", \"acc_fee_catalogue\"=>{}}','2016-02-12 03:53:22','2016-02-12 03:53:22',NULL,NULL),(329,1,'Login','System','Login System','','2016-02-12 08:53:28','2016-02-12 08:53:28',NULL,NULL),(330,1,'Login','System','Login System','','2016-02-12 12:47:45','2016-02-12 12:47:45',NULL,NULL),(331,1,'Login','System','Login System','','2016-02-12 23:46:27','2016-02-12 23:46:27',NULL,NULL),(332,1,'Login','System','Login System','','2016-02-13 02:13:11','2016-02-13 02:13:11',NULL,NULL),(333,1,'Login','System','Login System','','2016-02-13 06:59:34','2016-02-13 06:59:34',NULL,NULL),(334,1,'Login','System','Login System','','2016-02-13 08:17:03','2016-02-13 08:17:03',NULL,NULL),(335,1,'Login','System','Login System','','2016-02-13 08:17:03','2016-02-13 08:17:03',NULL,NULL),(336,1,'Login','System','Login System','','2016-02-13 08:21:20','2016-02-13 08:21:20',NULL,NULL),(337,1,'Login','System','Login System','','2016-02-13 12:13:41','2016-02-13 12:13:41',NULL,NULL),(338,1,'Login','System','Login System','','2016-02-13 14:14:10','2016-02-13 14:14:10',NULL,NULL),(339,1,'Login','System','Login System','','2016-02-13 15:02:12','2016-02-13 15:02:12',NULL,NULL),(340,1,'Login','System','Login System','','2016-02-13 15:02:17','2016-02-13 15:02:17',NULL,NULL),(341,1,'Login','System','Login System','','2016-02-14 14:12:55','2016-02-14 14:12:55',NULL,NULL),(342,1,'Login','System','Login System','','2016-02-14 15:01:38','2016-02-14 15:01:38',NULL,NULL),(343,1,'Create','AccFeePlan','create new AccFeePlan =   Plan Code ','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"011\", \"plan_name\"=>\"Plan Code \", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"Description\", \"is_activetiny\"=>\"\", \"is_delletedtiny\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"term_id\"=>\"1\", \"term_name\"=>\"Term 1\", \"is_active\"=>1}, \"_dc\"=>\"1455466261367\", \"plan_type\"=>\"TC\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-14 16:11:03','2016-02-14 16:11:03',NULL,NULL),(344,1,'Create','AccFeePlan','create new AccFeePlan =   Plan','{\"data\"=>{\"plan_cat_id\"=>\"3\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"002\", \"plan_name\"=>\"Plan\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"dara\\n\", \"is_activetiny\"=>\"\", \"is_delletedtiny\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"term_id\"=>\"1\", \"term_name\"=>\"Term 1\", \"is_active\"=>1}, \"_dc\"=>\"1455467526163\", \"plan_type\"=>\"TC\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-14 16:32:06','2016-02-14 16:32:06',NULL,NULL),(345,1,'Create','AccFeePlan','create new AccFeePlan =   name','{\"data\"=>{\"plan_cat_id\"=>\"2\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"00\", \"plan_name\"=>\"name\", \"degree_id\"=>2, \"course_id\"=>13, \"description\"=>\"\", \"is_activetiny\"=>\"\", \"is_delletedtiny\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"term_id\"=>\"1\", \"term_name\"=>\"Term 1\", \"is_active\"=>1}, \"_dc\"=>\"1455468521969\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"2\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-14 16:48:42','2016-02-14 16:48:42',NULL,NULL),(346,1,'Create','AccFeePlan','create new AccFeePlan =   Plan Name','{\"data\"=>{\"plan_cat_id\"=>\"2\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"003\", \"plan_name\"=>\"Plan Name\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"Description\", \"is_activetiny\"=>\"\", \"is_delletedtiny\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"term_id\"=>\"2\", \"term_name\"=>\"Term 2\", \"is_active\"=>1}, \"_dc\"=>\"1455468604780\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"2\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-14 16:50:05','2016-02-14 16:50:05',NULL,NULL),(347,1,'Login','System','Login System','','2016-02-15 05:30:11','2016-02-15 05:30:11',NULL,NULL),(348,1,'Login','System','Login System','','2016-02-15 11:30:02','2016-02-15 11:30:02',NULL,NULL),(349,1,'Create','AccFeePlan','create new AccFeePlan =   Plan Code','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"009\", \"plan_name\"=>\"Plan Code\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"\", \"is_activetiny\"=>\"\", \"is_delletedtiny\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"term_id\"=>\"2\", \"term_name\"=>\"Term 2\", \"is_active\"=>1}, \"_dc\"=>\"1455535882938\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-15 11:31:23','2016-02-15 11:31:23',NULL,NULL),(350,1,'Create','AccFeePlan','create new AccFeePlan =   Name','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"10\", \"plan_name\"=>\"Name\", \"degree_id\"=>2, \"course_id\"=>13, \"description\"=>\"\", \"is_activetiny\"=>\"\", \"is_delletedtiny\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"term_id\"=>\"2\", \"term_name\"=>\"Term 2\", \"is_active\"=>1}, \"_dc\"=>\"1455535923904\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-15 11:32:04','2016-02-15 11:32:04',NULL,NULL),(351,1,'Update','AccFeePlan','udpate AccFeePlan =   Name',' {\"data\"=>{\"id\"=>7, \"plan_cat_id\"=>1, \"batch_id\"=>nil, \"tuition_time_id\"=>nil, \"plan_code\"=>\"10\", \"plan_name\"=>\"Name\", \"degree_id\"=>2, \"course_id\"=>13, \"description\"=>\"\", \"is_active\"=>false, \"is_delleted\"=>false, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-15 11:32:03\", \"updated_at\"=>\"2016-02-15 11:32:03\", \"degree_name\"=>\"Short Course\", \"course_name\"=>\"Microsoft Office 2010\"}, \"_dc\"=>\"1455538303130\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"7\", \"acc_fee_plan\"=>{}}','2016-02-15 12:11:43','2016-02-15 12:11:43',NULL,NULL),(352,1,'Login','System','Login System','','2016-02-15 17:31:28','2016-02-15 17:31:28',NULL,NULL),(353,1,'Update','AccFeePlan','udpate AccFeePlan =   Name',' {\"data\"=>{\"id\"=>7, \"plan_cat_id\"=>1, \"batch_id\"=>nil, \"tuition_time_id\"=>nil, \"plan_code\"=>\"10\", \"plan_name\"=>\"Name\", \"degree_id\"=>2, \"course_id\"=>13, \"description\"=>\"\", \"is_active\"=>true, \"is_delleted\"=>false, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-15 11:32:03\", \"updated_at\"=>\"2016-02-15 12:11:43\", \"degree_name\"=>\"Short Course\", \"course_name\"=>\"Microsoft Office 2010\"}, \"_dc\"=>\"1455557514144\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"7\", \"acc_fee_plan\"=>{}}','2016-02-15 17:31:54','2016-02-15 17:31:54',NULL,NULL),(354,1,'Update','AccFeePlan','udpate AccFeePlan =   Name',' {\"data\"=>{\"id\"=>7, \"plan_cat_id\"=>1, \"batch_id\"=>nil, \"tuition_time_id\"=>nil, \"plan_code\"=>\"10\", \"plan_name\"=>\"Name\", \"degree_id\"=>2, \"course_id\"=>13, \"description\"=>\"\", \"is_active\"=>true, \"is_delleted\"=>true, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-15 11:32:03\", \"updated_at\"=>\"2016-02-15 17:31:54\", \"degree_name\"=>\"Short Course\", \"course_name\"=>\"Microsoft Office 2010\"}, \"_dc\"=>\"1455557751563\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"7\", \"acc_fee_plan\"=>{}}','2016-02-15 17:35:52','2016-02-15 17:35:52',NULL,NULL),(355,1,'Create','AccFeePlan','create new AccFeePlan =   Plan Name','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"002\", \"plan_name\"=>\"Plan Name\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"Description\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"term_id\"=>\"2\", \"term_name\"=>\"Term 2\"}, \"_dc\"=>\"1455558108814\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-15 17:41:49','2016-02-15 17:41:49',NULL,NULL),(356,1,'Update','AccFeePlan','udpate AccFeePlan =   Plan Name',' {\"data\"=>{\"id\"=>8, \"plan_cat_id\"=>1, \"batch_id\"=>nil, \"tuition_time_id\"=>nil, \"plan_code\"=>\"002\", \"plan_name\"=>\"Plan Name\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"Description\", \"is_active\"=>true, \"is_delleted\"=>true, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-15 17:41:49\", \"updated_at\"=>\"2016-02-15 17:41:49\", \"degree_name\"=>\"English Course\", \"course_name\"=>\"General English Program\"}, \"_dc\"=>\"1455558120750\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"8\", \"acc_fee_plan\"=>{}}','2016-02-15 17:42:01','2016-02-15 17:42:01',NULL,NULL),(357,1,'Create','AccFeePlan','create new AccFeePlan =   Plan name','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"0055\", \"plan_name\"=>\"Plan name\", \"degree_id\"=>2, \"course_id\"=>13, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"term_id\"=>\"2\", \"term_name\"=>\"Term 2\"}, \"_dc\"=>\"1455558236503\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-15 17:43:56','2016-02-15 17:43:56',NULL,NULL),(358,1,'Create','AccFeePlan','create new AccFeePlan =   sadf','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"asdf\", \"plan_name\"=>\"sadf\", \"degree_id\"=>1, \"course_id\"=>2, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"term_id\"=>\"2\", \"term_name\"=>\"Term 2\"}, \"_dc\"=>\"1455558246298\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-15 17:44:06','2016-02-15 17:44:06',NULL,NULL),(359,1,'Create','AccFeePlan','create new AccFeePlan =   Children','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"2\", \"plan_code\"=>\"01\", \"plan_name\"=>\"Children\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"tuition_time_name\"=>\"Part Time\"}, \"_dc\"=>\"1455559232500\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-15 18:00:32','2016-02-15 18:00:32',NULL,NULL),(360,1,'Login','System','Login System','','2016-02-16 00:51:13','2016-02-16 00:51:13',NULL,NULL),(361,1,'Login','System','Login System','','2016-02-16 02:04:44','2016-02-16 02:04:44',NULL,NULL),(362,1,'Login','System','Login System','','2016-02-16 09:06:16','2016-02-16 09:06:16',NULL,NULL),(363,1,'Login','System','Login System','','2016-02-16 09:49:18','2016-02-16 09:49:18',NULL,NULL),(364,1,'Create','AccFeePlan','create new AccFeePlan =   Plan Name','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"1\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"002\", \"plan_name\"=>\"Plan Name\", \"degree_id\"=>3, \"course_id\"=>3, \"description\"=>\"This description\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"batch_name\"=>\"Batch 1\"}, \"_dc\"=>\"1455618560632\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-16 10:29:20','2016-02-16 10:29:20',NULL,NULL),(365,1,'Login','System','Login System','','2016-02-16 11:09:38','2016-02-16 11:09:38',NULL,NULL),(366,1,'Create','AccFeePlan','create new AccFeePlan =   Plan Name','{\"data\"=>{\"plan_cat_id\"=>\"1\", \"batch_id\"=>\"1\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"004\", \"plan_name\"=>\"Plan Name\", \"degree_id\"=>4, \"course_id\"=>3, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"batch_name\"=>\"Batch 1\"}, \"_dc\"=>\"1455621053425\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-16 11:10:53','2016-02-16 11:10:53',NULL,NULL),(367,1,'Login','System','Login System','','2016-02-17 00:58:21','2016-02-17 00:58:21',NULL,NULL),(368,1,'Update','AccFeePlan','udpate AccFeePlan =   Plan Name',' {\"data\"=>{\"id\"=>13, \"plan_cat_id\"=>1, \"batch_id\"=>1, \"tuition_time_id\"=>nil, \"plan_code\"=>\"004\", \"plan_name\"=>\"Plan Name\", \"degree_id\"=>4, \"course_id\"=>3, \"description\"=>\"\", \"is_active\"=>false, \"is_delleted\"=>false, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-16 11:10:53\", \"updated_at\"=>\"2016-02-16 11:10:53\", \"degree_name\"=>\"Bachelor\", \"course_name\"=>\"Business Administrator\"}, \"_dc\"=>\"1455670904116\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"batch_id\"=>\"1\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"13\", \"acc_fee_plan\"=>{}}','2016-02-17 01:01:44','2016-02-17 01:01:44',NULL,NULL),(369,1,'Update','AccFeePlan','udpate AccFeePlan =   Plan Name',' {\"data\"=>{\"id\"=>13, \"plan_cat_id\"=>1, \"batch_id\"=>1, \"tuition_time_id\"=>nil, \"plan_code\"=>\"004\", \"plan_name\"=>\"Plan Name\", \"degree_id\"=>4, \"course_id\"=>3, \"description\"=>\"\", \"is_active\"=>true, \"is_delleted\"=>false, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-16 11:10:53\", \"updated_at\"=>\"2016-02-17 01:01:44\", \"degree_name\"=>\"Bachelor\", \"course_name\"=>\"Business Administrator\"}, \"_dc\"=>\"1455670908050\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"1\", \"batch_id\"=>\"1\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"13\", \"acc_fee_plan\"=>{}}','2016-02-17 01:01:48','2016-02-17 01:01:48',NULL,NULL),(370,1,'Delete','AccFeeCatalogue','delete Catalogue =   #{@data.catalogue_name} ','{\"data\"=>{\"id\"=>4, \"catalogue_name\"=>\"Dara\", \"fiscal_year\"=>\"2015\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>nil, \"description\"=>\"\", \"is_active\"=>1, \"is_deleted\"=>0, \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-12 03:53:10\", \"updated_at\"=>\"2016-02-12 03:53:22\"}, \"_dc\"=>\"1455676329654\", \"action\"=>\"destroy\", \"controller\"=>\"acc_fee_catalogues\", \"id\"=>\"4\", \"acc_fee_catalogue\"=>{}}','2016-02-17 02:32:10','2016-02-17 02:32:10',NULL,NULL),(371,1,'Delete','AccFeeCatalogue','delete Catalogue =   #{@data.catalogue_name} ','{\"data\"=>{\"id\"=>3, \"catalogue_name\"=>\"New Year\", \"fiscal_year\"=>\"2015\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"2016-02-12\", \"description\"=>\"\", \"is_active\"=>1, \"is_deleted\"=>0, \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-12 02:28:31\", \"updated_at\"=>\"2016-02-12 02:28:31\"}, \"_dc\"=>\"1455676336509\", \"action\"=>\"destroy\", \"controller\"=>\"acc_fee_catalogues\", \"id\"=>\"3\", \"acc_fee_catalogue\"=>{}}','2016-02-17 02:32:16','2016-02-17 02:32:16',NULL,NULL),(372,1,'Delete','AccFeeCatalogue','delete Catalogue =   #{@data.catalogue_name} ','{\"data\"=>{\"id\"=>2, \"catalogue_name\"=>\"Dara\", \"fiscal_year\"=>\"SDf\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>nil, \"description\"=>\"\", \"is_active\"=>0, \"is_deleted\"=>0, \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-12 02:23:21\", \"updated_at\"=>\"2016-02-12 02:23:21\"}, \"_dc\"=>\"1455676360461\", \"action\"=>\"destroy\", \"controller\"=>\"acc_fee_catalogues\", \"id\"=>\"2\", \"acc_fee_catalogue\"=>{}}','2016-02-17 02:32:40','2016-02-17 02:32:40',NULL,NULL),(373,1,'Delete','AccFeeCatalogue','delete Catalogue =   #{@data.catalogue_name} ','{\"data\"=>{\"id\"=>1, \"catalogue_name\"=>\"Fee Catalog\", \"fiscal_year\"=>\"2015-2016\", \"effective_date\"=>\"2016-02-12\", \"expired_date\"=>\"2016-02-12\", \"description\"=>\"This is second catalog\", \"is_active\"=>0, \"is_deleted\"=>0, \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-12 01:42:26\", \"updated_at\"=>\"2016-02-12 01:42:53\"}, \"_dc\"=>\"1455676364472\", \"action\"=>\"destroy\", \"controller\"=>\"acc_fee_catalogues\", \"id\"=>\"1\", \"acc_fee_catalogue\"=>{}}','2016-02-17 02:32:44','2016-02-17 02:32:44',NULL,NULL),(374,1,'Create','AccFeeCatalogue','create new Catalogue =   Toul Svay Prey','{\"data\"=>{\"catalogue_name\"=>\"Toul Svay Prey\", \"fiscal_year\"=>\"2014\", \"effective_date\"=>\"2016-02-17\", \"expired_date\"=>\"\", \"description\"=>\"\", \"is_active\"=>1, \"is_deleted\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"catalogue_id\"=>\"\"}, \"_dc\"=>\"1455676407689\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_catalogues\", \"acc_fee_catalogue\"=>{}}','2016-02-17 02:33:28','2016-02-17 02:33:28',NULL,NULL),(375,1,'Create','AcdBatch','create new batch name=   Batch 7','{\"data\"=>{\"code\"=>\"07\", \"name\"=>\"Batch 7\", \"campus\"=>\"\", \"gen_campus_id\"=>\"\", \"is_deleted\"=>\"\", \"khr_name\"=>\"ជំនាន់​ ៧\", \"batch_id\"=>\"\"}, \"_dc\"=>\"1455676473067\", \"action\"=>\"create\", \"controller\"=>\"acd_batchs\", \"acd_batch\"=>{}}','2016-02-17 02:34:33','2016-02-17 02:34:33',NULL,NULL),(376,1,'Create','AccFeePlan','create new AccFeePlan =   Bussiness Administration','{\"data\"=>{\"plan_cat_id\"=>\"5\", \"batch_id\"=>\"10\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"123\", \"plan_name\"=>\"Bussiness Administration\", \"degree_id\"=>3, \"course_id\"=>3, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"batch_name\"=>\"Batch 7\"}, \"_dc\"=>\"1455676540724\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-17 02:35:41','2016-02-17 02:35:41',NULL,NULL),(377,1,'Create','AccFeePlan','create new AccFeePlan =   Hotel And Tourism Management','{\"data\"=>{\"plan_cat_id\"=>\"5\", \"batch_id\"=>\"10\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"112\", \"plan_name\"=>\"Hotel And Tourism Management\", \"degree_id\"=>3, \"course_id\"=>4, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"batch_name\"=>\"Batch 7\"}, \"_dc\"=>\"1455677358084\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-17 02:49:18','2016-02-17 02:49:18',NULL,NULL),(378,1,'Create','AccFeePlan','create new AccFeePlan =   Children','{\"data\"=>{\"plan_cat_id\"=>\"5\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"1\", \"plan_code\"=>\"311\", \"plan_name\"=>\"Children\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"tuition_time_name\"=>\"Full Time\"}, \"_dc\"=>\"1455677989024\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"tuition_time_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-17 02:59:49','2016-02-17 02:59:49',NULL,NULL),(379,1,'Create','AccFeePlan','create new AccFeePlan =   Foundation','{\"data\"=>{\"plan_cat_id\"=>\"5\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"1\", \"plan_code\"=>\"312\", \"plan_name\"=>\"Foundation\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"tuition_time_name\"=>\"Full Time\"}, \"_dc\"=>\"1455678091541\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"tuition_time_id\"=>\"1\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-17 03:01:31','2016-02-17 03:01:31',NULL,NULL),(380,1,'Login','System','Login System','','2016-02-17 03:02:42','2016-02-17 03:02:42',NULL,NULL),(381,1,'Login','System','Login System','','2016-02-17 05:00:51','2016-02-17 05:00:51',NULL,NULL),(382,1,'Login','System','Login System','','2016-02-17 06:17:59','2016-02-17 06:17:59',NULL,NULL),(383,1,'Login','System','Login System','','2016-02-17 07:55:05','2016-02-17 07:55:05',NULL,NULL),(384,1,'Login','System','Login System','','2016-02-18 03:50:36','2016-02-18 03:50:36',NULL,NULL),(385,1,'Create','AccFeePlan','create new AccFeePlan =   sdf','{\"data\"=>{\"plan_cat_id\"=>\"5\", \"batch_id\"=>\"9\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"111\", \"plan_name\"=>\"sdf\", \"degree_id\"=>4, \"course_id\"=>3, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"batch_name\"=>\"Batch 13\"}, \"_dc\"=>\"1455768494727\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-18 04:08:14','2016-02-18 04:08:14',NULL,NULL),(386,1,'Login','System','Login System','','2016-02-18 04:29:26','2016-02-18 04:29:26',NULL,NULL),(387,1,'Login','System','Login System','','2016-02-18 07:59:25','2016-02-18 07:59:25',NULL,NULL),(388,1,'Login','System','Login System','','2016-02-18 08:50:43','2016-02-18 08:50:43',NULL,NULL),(389,1,'Login','System','Login System','','2016-02-18 09:24:53','2016-02-18 09:24:53',NULL,NULL),(390,1,'Login','System','Login System','','2016-02-18 17:41:51','2016-02-18 17:41:51',NULL,NULL),(391,1,'Login','System','Login System','','2016-02-18 17:41:51','2016-02-18 17:41:51',NULL,NULL),(392,1,'Create','AccChargeItem','create new ChargeItem =   Item Allow Edit','{\"data\"=>{\"item_code\"=>\"002\", \"item_name\"=>\"Item Allow Edit\", \"item_type_id\"=>1, \"item_type_name\"=>\"\", \"charge_amount\"=>\"0\", \"note\"=>\"\", \"campus_id\"=>\"\", \"is_del\"=>\"\", \"is_editable\"=>\"on\", \"status\"=>\"A\", \"charge_item\"=>\"undefined\"}, \"_dc\"=>\"1455819379652\", \"action\"=>\"create\", \"controller\"=>\"acc_charge_items\", \"acc_charge_item\"=>{}}','2016-02-18 18:16:19','2016-02-18 18:16:19',NULL,NULL),(393,1,'Update','AccChargeItem','udpate ChargeItem =   Official Charge',' {\"data\"=>{\"id\"=>1, \"item_code\"=>\"OFCCHG\", \"item_name\"=>\"Official Charge\", \"item_type_id\"=>2, \"item_type_name\"=>\"Additional Charge\", \"charge_amount\"=>\"50\", \"note\"=>\"\", \"campus_id\"=>1, \"is_del\"=>false, \"is_editable\"=>0, \"status\"=>\"A\", \"charge_item\"=>\"undefined(Allow Adjustment)\"}, \"_dc\"=>\"1455819448536\", \"action\"=>\"update\", \"controller\"=>\"acc_charge_items\", \"id\"=>\"1\", \"acc_charge_item\"=>{}}','2016-02-18 18:17:28','2016-02-18 18:17:28',NULL,NULL),(394,1,'Login','System','Login System','','2016-02-19 00:33:38','2016-02-19 00:33:38',NULL,NULL),(395,1,'Login','System','Login System','','2016-02-19 03:44:33','2016-02-19 03:44:33',NULL,NULL),(396,1,'Login','System','Login System','','2016-02-19 04:57:19','2016-02-19 04:57:19',NULL,NULL),(397,1,'Login','System','Login System','','2016-02-19 07:41:29','2016-02-19 07:41:29',NULL,NULL),(398,1,'Login','System','Login System','','2016-02-21 12:01:42','2016-02-21 12:01:42',NULL,NULL),(399,1,'Login','System','Login System','','2016-02-21 15:39:35','2016-02-21 15:39:35',NULL,NULL),(400,1,'Login','System','Login System','','2016-02-22 07:55:03','2016-02-22 07:55:03',NULL,NULL),(401,1,'Create','AccFeePlan','create new AccFeePlan =   wefedsfs','{\"data\"=>{\"plan_cat_id\"=>\"5\", \"batch_id\"=>\"\", \"tuition_time_id\"=>\"2\", \"plan_code\"=>\"222\", \"plan_name\"=>\"wefedsfs\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"tuition_time_name\"=>\"Part Time\"}, \"_dc\"=>\"1456129061733\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"tuition_time_id\"=>\"2\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-22 08:17:41','2016-02-22 08:17:41',NULL,NULL),(402,1,'Login','System','Login System','','2016-02-22 09:51:34','2016-02-22 09:51:34',NULL,NULL),(403,1,'Login','System','Login System','','2016-02-23 00:15:49','2016-02-23 00:15:49',NULL,NULL),(404,1,'Update','AccFeePlan','udpate AccFeePlan =   Children',' {\"data\"=>{\"id\"=>16, \"plan_cat_id\"=>\"5\", \"batch_id\"=>nil, \"tuition_time_id\"=>\"1\", \"plan_code\"=>\"311\", \"plan_name\"=>\"Children\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"uytuytt6t76t\", \"is_active\"=>1, \"is_delleted\"=>false, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-17 02:59:49\", \"updated_at\"=>\"2016-02-17 02:59:49\", \"degree_name\"=>\"English Course\", \"course_name\"=>\"General English Program\", \"tuition_time_name\"=>\"Full Time\"}, \"_dc\"=>\"1456190450290\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"tuition_time_id\"=>\"1\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"16\", \"acc_fee_plan\"=>{}}','2016-02-23 01:20:50','2016-02-23 01:20:50',NULL,NULL),(405,1,'Login','System','Login System','','2016-02-23 01:36:08','2016-02-23 01:36:08',NULL,NULL),(406,1,'Login','System','Login System','','2016-02-24 00:46:14','2016-02-24 00:46:14',NULL,NULL),(407,1,'Update','AccFeePlan','udpate AccFeePlan =   sdfdsf',' {\"data\"=>{\"id\"=>19, \"plan_cat_id\"=>\"5\", \"batch_id\"=>nil, \"tuition_time_id\"=>\"2\", \"plan_code\"=>\"222\", \"plan_name\"=>\"sdfdsf\", \"degree_id\"=>1, \"course_id\"=>1, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>false, \"plan_type\"=>\"\", \"user_id\"=>1, \"campus_id\"=>1, \"created_at\"=>\"2016-02-22 08:17:41\", \"updated_at\"=>\"2016-02-22 08:17:41\", \"degree_name\"=>\"English Course\", \"course_name\"=>\"General English Program\", \"tuition_time_name\"=>\"Part Time\"}, \"_dc\"=>\"1456274847051\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"tuition_time_id\"=>\"2\", \"action\"=>\"update\", \"controller\"=>\"acc_fee_plans\", \"id\"=>\"19\", \"acc_fee_plan\"=>{}}','2016-02-24 00:47:27','2016-02-24 00:47:27',NULL,NULL),(408,1,'Create','SdnLead','create new name =   Channa','','2016-02-24 00:54:48','2016-02-24 00:54:48',NULL,NULL),(409,1,'Create','Student','create Student =   Monydara Sary',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"2\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Monydara\", \"last_name\"=>\"Sary\", \"khr_first_name\"=>\"មុនីដារ៉ា\", \"khr_last_name\"=>\"សារី\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2016-02-06\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"234234\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"WU\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"13-B0001\", \"studentId\"=>\"3\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"sdfsf\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"sdfdsf\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2016-02-24\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>9, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"diploma_exam_place\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"3\"}, \"_dc\"=>\"1456275649357\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2016-02-24 01:00:49','2016-02-24 01:00:49',NULL,NULL),(410,1,'Create','Student','create Student =   Channa Ly',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"3\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Channa\", \"last_name\"=>\"Ly\", \"khr_first_name\"=>\"Channa\", \"khr_last_name\"=>\"Ly\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2016-02-24\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"32423423\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\", \"reference_no\"=>\"\", \"studentId\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"sfdsfs\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"dsfsdf\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2016-02-24\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"N\", \"tuition_time_id\"=>\"\", \"term_id\"=>\"\", \"s_level_id\"=>\"\", \"c_level_id\"=>\"\", \"batch_id\"=>9, \"degree_id\"=>4, \"course_id\"=>9, \"class_shift_id\"=>1, \"major_id\"=>1, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>{\"student_id\"=>\"\", \"gender\"=>\"ប\", \"date_of_birth\"=>\"\", \"place_of_birth\"=>\"\", \"address\"=>\"\", \"phone\"=>\"\", \"total_score\"=>\"0\", \"diploma_year\"=>\"\", \"diploma_grade\"=>\"\", \"is_passed_diploma\"=>true, \"diploma_num\"=>\"\", \"certificate\"=>\"\", \"institue\"=>\"\", \"institue_city\"=>\"\", \"city\"=>\"\", \"father_name\"=>\"\", \"mother_name\"=>\"\", \"occupation\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"diploma_exam_place\"=>\"\"}, \"type\"=>\"WU\", \"student_id\"=>\"\"}, \"_dc\"=>\"1456275836675\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2016-02-24 01:03:57','2016-02-24 01:03:57',NULL,NULL),(411,1,'Ative','Student','Ative Student =   Channa Ly',' {\"student_id\"=>\"5\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2016-02-24 01:04:06','2016-02-24 01:04:06',NULL,NULL),(412,1,'Ative','Student','Ative Student =   Monydara Sary',' {\"student_id\"=>\"4\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student_wu\"}','2016-02-24 01:04:29','2016-02-24 01:04:29',NULL,NULL),(413,1,'Create','Student','create Student =   Channa Ly',' {\"data\"=>{\"studentModel\"=>{\"lead_id\"=>\"3\", \"category_id\"=>1, \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"Channa\", \"last_name\"=>\"Ly\", \"khr_first_name\"=>\"Channa\", \"khr_last_name\"=>\"Ly\", \"gender\"=>\"M\", \"date_of_birth\"=>\"2016-02-24\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"32423423\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>1, \"national_id\"=>1, \"religion_id\"=>1, \"langauge_id\"=>1, \"ethnicity_id\"=>1, \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"campus_id\"=>\"\", \"image_url\"=>\"resources/images/photo/no-picture.gif\", \"sdn_document_attributes\"=>nil, \"from_city_id\"=>\"\"}, \"emergencyModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"M\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"fatherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"motherModel\"=>{\"student_id\"=>\"\", \"title_id\"=>\"\", \"contact_type\"=>\"\", \"contact_name\"=>\"\", \"gender\"=>\"\", \"address\"=>\"\", \"email\"=>\"\", \"phone\"=>\"\"}, \"admissionModel\"=>{\"admission_no\"=>\"\", \"reference_no\"=>\"\", \"admission_date\"=>\"2016-02-24\", \"admission_by_id\"=>\"\", \"admission_type\"=>\"N\", \"program_type\"=>\"\", \"tuition_time_id\"=>1, \"term_id\"=>1, \"s_level_id\"=>4, \"c_level_id\"=>\"\", \"batch_id\"=>\"\", \"degree_id\"=>1, \"course_id\"=>1, \"class_shift_id\"=>1, \"major_id\"=>2, \"class_id\"=>\"\", \"start_acd_year_id\"=>1, \"end_acd_year_id\"=>\"\", \"student_id\"=>\"\", \"student_name\"=>\"\", \"dob\"=>\"\", \"image_url\"=>\"\", \"category_id\"=>\"\", \"title_id\"=>\"\", \"student_code\"=>\"\", \"student_no\"=>\"\", \"first_name\"=>\"\", \"last_name\"=>\"\", \"khr_first_name\"=>\"\", \"khr_last_name\"=>\"\", \"gender\"=>\"\", \"date_of_birth\"=>\"\", \"registered_date\"=>\"\", \"place_of_birth\"=>\"\", \"phone_no\"=>\"\", \"email\"=>\"\", \"address\"=>\"\", \"occupation_id\"=>\"\", \"national_id\"=>\"\", \"religion_id\"=>\"\", \"langauge_id\"=>\"\", \"ethnicity_id\"=>\"\", \"national_no\"=>\"\", \"passport_no\"=>\"\", \"note\"=>\"\", \"status\"=>\"\", \"handler\"=>\"\", \"from_city_id\"=>\"\", \"batch_name\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"class_shift_name\"=>\"\", \"term_name\"=>\"\", \"acd_year\"=>\"\", \"shift\"=>\"\", \"key_account_id\"=>\"\", \"plan_id\"=>\"\", \"pay_type\"=>\"\", \"credit_control_id\"=>\"\", \"account_no\"=>\"\", \"account_status\"=>\"\", \"balance\"=>\"\", \"cycle_name\"=>\"\"}, \"feeChargeModel\"=>\"\", \"discountList\"=>\"\", \"feeList\"=>\"\", \"studentKhrModel\"=>\"\", \"type\"=>\"TC\", \"student_id\"=>\"\"}, \"_dc\"=>\"1456275906869\", \"action\"=>\"create\", \"controller\"=>\"sdn_student\", \"sdn_student\"=>{}}','2016-02-24 01:05:07','2016-02-24 01:05:07',NULL,NULL),(414,1,'Ative','Student','Ative Student =   Channa Ly',' {\"admission_id\"=>\"6\", \"controller\"=>\"sdn_student\", \"action\"=>\"active_student\"}','2016-02-24 01:05:13','2016-02-24 01:05:13',NULL,NULL),(415,1,'Create','AccFeePlan','create new AccFeePlan =   Computer Science','{\"data\"=>{\"plan_cat_id\"=>\"5\", \"batch_id\"=>\"9\", \"tuition_time_id\"=>\"\", \"plan_code\"=>\"115\", \"plan_name\"=>\"Computer Science\", \"degree_id\"=>4, \"course_id\"=>9, \"description\"=>\"\", \"is_active\"=>1, \"is_delleted\"=>\"\", \"plan_type\"=>\"\", \"user_id\"=>\"\", \"campus_id\"=>\"\", \"created_at\"=>\"\", \"updated_at\"=>\"\", \"degree_name\"=>\"\", \"course_name\"=>\"\", \"batch_name\"=>\"Batch 13\"}, \"_dc\"=>\"1456278103645\", \"plan_type\"=>\"TC\", \"plan_cat_id\"=>\"5\", \"batch_id\"=>\"9\", \"action\"=>\"create\", \"controller\"=>\"acc_fee_plans\", \"acc_fee_plan\"=>{}}','2016-02-24 01:41:43','2016-02-24 01:41:43',NULL,NULL),(416,1,'Login','System','Login System','','2016-02-24 05:44:34','2016-02-24 05:44:34',NULL,NULL),(417,1,'Login','System','Login System','','2016-02-24 14:35:21','2016-02-24 14:35:21',NULL,NULL),(418,1,'Login','System','Login System','','2016-02-25 01:44:56','2016-02-25 01:44:56',NULL,NULL),(419,1,'Login','System','Login System','','2016-02-25 03:06:47','2016-02-25 03:06:47',NULL,NULL),(420,1,'Login','System','Login System','','2016-02-25 08:36:53','2016-02-25 08:36:53',NULL,NULL),(421,1,'Login','System','Login System','','2016-02-25 10:33:50','2016-02-25 10:33:50',NULL,NULL),(422,1,'Login','System','Login System','','2016-02-25 15:21:13','2016-02-25 15:21:13',NULL,NULL),(423,1,'Login','System','Login System','','2016-02-26 01:47:59','2016-02-26 01:47:59',NULL,NULL),(424,1,'Login','System','Login System','','2016-02-26 02:52:07','2016-02-26 02:52:07',NULL,NULL),(425,1,'Login','System','Login System','','2016-02-26 04:53:17','2016-02-26 04:53:17',NULL,NULL),(426,1,'Delete','AccReceipt','delete AccReceipt =   #{@data.payer_name} ','{\"data\"=>{\"id\"=>1, \"receipt_date\"=>\"2016-02-26\", \"receipt_no\"=>\"\", \"receipt_type\"=>\"\", \"ref_type\"=>\"L\", \"payer_name\"=>\"Monydara Sary\", \"ref_id\"=>2, \"usd_amount\"=>\"50.0\", \"khr_amount\"=>\"0.0\", \"charges_amount\"=>\"50.0\", \"discount_amount\"=>\"0.0\", \"remark\"=>\"\", \"is_paid\"=>false, \"paid_date\"=>nil, \"is_del\"=>false, \"receipt_by_id\"=>1, \"campus_id\"=>1, \"acc_receipt_detail_attributes\"=>\"\"}, \"_dc\"=>\"1456463007637\", \"action\"=>\"destroy\", \"controller\"=>\"acc_receipts\", \"id\"=>\"1\", \"acc_receipt\"=>{}}','2016-02-26 05:03:28','2016-02-26 05:03:28',NULL,NULL),(427,1,'Create','AccChargeItem','create new ChargeItem =   Pre-Payment','{\"data\"=>{\"item_code\"=>\"000001\", \"item_name\"=>\"Pre-Payment\", \"item_type_id\"=>1, \"item_type_name\"=>\"\", \"charge_amount\"=>\"0\", \"note\"=>\"\", \"campus_id\"=>\"\", \"is_del\"=>\"\", \"is_editable\"=>\"on\", \"status\"=>\"A\", \"charge_item\"=>\"undefined\"}, \"_dc\"=>\"1456463270739\", \"action\"=>\"create\", \"controller\"=>\"acc_charge_items\", \"acc_charge_item\"=>{}}','2016-02-26 05:07:51','2016-02-26 05:07:51',NULL,NULL),(428,1,'Create','AccChargeItem','create new ChargeItem =   Deposit','{\"data\"=>{\"item_code\"=>\"000002\", \"item_name\"=>\"Deposit\", \"item_type_id\"=>1, \"item_type_name\"=>\"\", \"charge_amount\"=>\"0\", \"note\"=>\"\", \"campus_id\"=>\"\", \"is_del\"=>\"\", \"is_editable\"=>\"on\", \"status\"=>\"A\", \"charge_item\"=>\"undefined\"}, \"_dc\"=>\"1456463299065\", \"action\"=>\"create\", \"controller\"=>\"acc_charge_items\", \"acc_charge_item\"=>{}}','2016-02-26 05:08:19','2016-02-26 05:08:19',NULL,NULL),(429,1,'Delete','AccChargeItem','delete ChargeItem =   #{@data.item_name} ','{\"data\"=>{\"id\"=>2, \"item_code\"=>\"002\", \"item_name\"=>\"Item Allow Edit\", \"item_type_id\"=>1, \"item_type_name\"=>\"Advance Payment\", \"charge_amount\"=>\"0.0\", \"note\"=>\"\", \"campus_id\"=>1, \"is_del\"=>false, \"is_editable\"=>true, \"status\"=>\"A\", \"charge_item\"=>\"undefined(Allow Adjustment)\"}, \"_dc\"=>\"1456463307924\", \"action\"=>\"destroy\", \"controller\"=>\"acc_charge_items\", \"id\"=>\"2\", \"acc_charge_item\"=>{}}','2016-02-26 05:08:28','2016-02-26 05:08:28',NULL,NULL),(430,1,'Update','AccChargeItem','udpate ChargeItem =   Official Charge',' {\"data\"=>{\"id\"=>1, \"item_code\"=>\"000003\", \"item_name\"=>\"Official Charge\", \"item_type_id\"=>2, \"item_type_name\"=>\"Additional Charge\", \"charge_amount\"=>\"50\", \"note\"=>\"\", \"campus_id\"=>1, \"is_del\"=>false, \"is_editable\"=>0, \"status\"=>\"A\", \"charge_item\"=>\"undefined\"}, \"_dc\"=>\"1456463323452\", \"action\"=>\"update\", \"controller\"=>\"acc_charge_items\", \"id\"=>\"1\", \"acc_charge_item\"=>{}}','2016-02-26 05:08:43','2016-02-26 05:08:43',NULL,NULL),(431,1,'Login','System','Login System','','2016-02-26 06:32:33','2016-02-26 06:32:33',NULL,NULL),(432,1,'Update','AccInvoiceRule','udpate cash drawer group  Penalty',' {\"data\"=>{\"id\"=>4, \"rule_name\"=>\"Penalty\", \"from_days\"=>\"31\", \"to_days\"=>\"60\", \"credit_control_id\"=>\"3\", \"alert_type_id\"=>1, \"action_type_id\"=>3, \"charge_per_day\"=>\"0.5\", \"description\"=>\"\", \"is_active\"=>true, \"is_del\"=>false, \"created_at\"=>\"2015-08-08 07:53:28\", \"updated_at\"=>\"2015-08-08 07:53:28\"}, \"_dc\"=>\"1456470981876\", \"ar_policy_id\"=>\"3\", \"action\"=>\"update\", \"controller\"=>\"acc_invoice_rule\", \"id\"=>\"4\", \"acc_invoice_rule\"=>{}}','2016-02-26 07:16:21','2016-02-26 07:16:21',NULL,NULL),(433,1,'Create','AccCashDrawerTran','create new cash drawer tran id  5','{\"data\"=>{\"acc_cash_drawer_id\"=>5, \"user_name\"=>\"\", \"open_date\"=>\"\", \"open_by\"=>\"\", \"open_by_name\"=>\"\", \"open_amount\"=>\"100\", \"open_amount_khr\"=>\"0\", \"closed_amount\"=>\"\", \"closed_amount_khr\"=>\"\", \"closed_by\"=>\"\", \"closed_by_name\"=>\"\", \"closed_date\"=>\"\"}, \"_dc\"=>\"1456471062615\", \"action\"=>\"create\", \"controller\"=>\"acc_cash_drawer_trans\", \"acc_cash_drawer_tran\"=>{}}','2016-02-26 07:17:43','2016-02-26 07:17:43',NULL,NULL),(434,1,'Login','System','Login System','','2016-02-27 03:42:10','2016-02-27 03:42:10',NULL,NULL),(435,1,'Login','System','Login System','','2016-02-27 04:13:06','2016-02-27 04:13:06',NULL,NULL),(436,1,'Create','AccFinanceTran','create new AccFinanceTran =   ','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>\"\", \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"payment_method_id\"=>2, \"currency_id\"=>1, \"paid_amount\"=>\"9\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"\", \"remark\"=>\"\"}, \"_dc\"=>\"1456547684863\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 04:34:45','2016-02-27 04:34:45',NULL,NULL),(437,1,'Create','AccFinanceTran','create new AccFinanceTran =   000001','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>\"\", \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"payment_method_id\"=>1, \"currency_id\"=>1, \"paid_amount\"=>\"16\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"\", \"remark\"=>\"remark\"}, \"_dc\"=>\"1456548184787\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 04:43:05','2016-02-27 04:43:05',NULL,NULL),(438,1,'Create','AccFinanceTran','create new AccFinanceTran =   000002','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>\"\", \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"payment_method_id\"=>1, \"currency_code\"=>\"KHR\", \"paid_amount\"=>\"31\", \"exchange_rate\"=>\"4200.0\", \"total_amount\"=>\"\", \"remark\"=>\"\"}, \"_dc\"=>\"1456548766747\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 04:52:48','2016-02-27 04:52:48',NULL,NULL),(439,1,'Create','AccFinanceTran','create new AccFinanceTran =   000003','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>\"\", \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"payment_method_id\"=>2, \"currency_code\"=>\"KHR\", \"paid_amount\"=>\"200000\", \"exchange_rate\"=>\"4200.0\", \"total_amount\"=>\"\", \"remark\"=>\"\"}, \"_dc\"=>\"1456549048856\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 04:57:28','2016-02-27 04:57:28',NULL,NULL),(440,1,'Create','AccFinanceTran','create new AccFinanceTran =   000004','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>\"\", \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"payment_method_id\"=>2, \"currency_code\"=>\"USD\", \"paid_amount\"=>\"100\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"\", \"remark\"=>\"\"}, \"_dc\"=>\"1456549114059\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 04:58:34','2016-02-27 04:58:34',NULL,NULL),(441,1,'Create','AccFinanceTran','create new AccFinanceTran =   000005','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>1, \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"currency_code\"=>\"USD\", \"paid_amount\"=>\"25\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"85\", \"remark\"=>\"\"}, \"_dc\"=>\"1456550073557\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 05:14:34','2016-02-27 05:14:34',NULL,NULL),(442,1,'Create','AccFinanceTran','create new AccFinanceTran =   000006','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>1, \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"currency_code\"=>\"USD\", \"paid_amount\"=>\"2000\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"85\", \"remark\"=>\"\"}, \"_dc\"=>\"1456558516478\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 07:35:16','2016-02-27 07:35:16',NULL,NULL),(443,1,'Create','AccFinanceTran','create new AccFinanceTran =   000007','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>1, \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"currency_code\"=>\"USD\", \"paid_amount\"=>\"22\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"85\", \"remark\"=>\"\"}, \"_dc\"=>\"1456558542200\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 07:35:42','2016-02-27 07:35:42',NULL,NULL),(444,1,'Create','AccFinanceTran','create new AccFinanceTran =   000008','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>1, \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"currency_code\"=>\"USD\", \"paid_amount\"=>\"6\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"85\", \"remark\"=>\"\"}, \"_dc\"=>\"1456558831401\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 07:40:31','2016-02-27 07:40:31',NULL,NULL),(445,1,'Create','AccFinanceTran','create new AccFinanceTran =   000009','{\"data\"=>{\"receipt_no\"=>\"\", \"acc_tran_type_id\"=>\"\", \"acc_reason_type_id\"=>\"\", \"acc_cash_drawer_tran_id\"=>\"\", \"acc_payment_method_id\"=>1, \"ref_no\"=>\"\", \"tran_date\"=>\"\", \"amount_usd\"=>\"\", \"amount_khr\"=>\"\", \"commited_date\"=>\"\", \"rollback_date\"=>\"\", \"tranRemark\"=>\"\", \"campus_id\"=>\"\", \"account_id\"=>\"11\", \"student_no\"=>\"000003\", \"admission_no\"=>\"GEP-000002\", \"currency_code\"=>\"USD\", \"paid_amount\"=>\"10\", \"exchange_rate\"=>\"1.0\", \"total_amount\"=>\"85\", \"remark\"=>\"\"}, \"_dc\"=>\"1456558897743\", \"action\"=>\"create\", \"controller\"=>\"acc_finance_trans\", \"acc_finance_tran\"=>{}}','2016-02-27 07:41:37','2016-02-27 07:41:37',NULL,NULL),(446,1,'Login','System','Login System','','2016-02-27 16:50:28','2016-02-27 16:50:28',NULL,NULL),(447,1,'Login','System','Login System','','2016-02-29 01:50:40','2016-02-29 01:50:40',NULL,NULL),(448,1,'Login','System','Login System','','2016-05-22 11:38:08','2016-05-22 11:38:08',NULL,NULL);

/*Table structure for table `audits` */

DROP TABLE IF EXISTS `audits`;

CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(11) DEFAULT NULL,
  `auditable_type` varchar(255) DEFAULT NULL,
  `associated_id` int(11) DEFAULT NULL,
  `associated_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `audited_changes` text,
  `version` int(11) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `remote_address` varchar(255) DEFAULT NULL,
  `request_uuid` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auditable_index` (`auditable_id`,`auditable_type`),
  KEY `associated_index` (`associated_id`,`associated_type`),
  KEY `user_index` (`user_id`,`user_type`),
  KEY `index_audits_on_request_uuid` (`request_uuid`),
  KEY `index_audits_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `audits` */

insert  into `audits`(`id`,`auditable_id`,`auditable_type`,`associated_id`,`associated_type`,`user_id`,`user_type`,`username`,`action`,`audited_changes`,`version`,`comment`,`remote_address`,`request_uuid`,`created_at`) values (1,1,'AccReceiptDetail',1,'AccReceipt',NULL,NULL,NULL,'create','---\nreceipt_id: 1\nitem_type: C\nitem_id: 1\namount: !ruby/object:BigDecimal 18:0.5E2\ndescription: \'\'\nitem_name: Official Charge\nitem_unit: A\n',1,NULL,'127.0.0.1','48b1e83e-6b20-48ce-ba94-a1ed9354a011','2016-02-26 04:55:09'),(2,1,'AccReceipt',NULL,NULL,NULL,NULL,NULL,'create','---\nreceipt_date: 2016-02-26\nreceipt_no: \'\'\nreceipt_type: \'\'\nref_type: L\npayer_name: Monydara Sary\nref_id: 2\nusd_amount: !ruby/object:BigDecimal 18:0.5E2\nkhr_amount: !ruby/object:BigDecimal 18:0.0\ncharges_amount: !ruby/object:BigDecimal 18:0.5E2\ndiscount_amount: !ruby/object:BigDecimal 18:0.0\nremark: \'\'\nis_paid: false\npaid_date: \nis_del: false\nreceipt_by_id: 1\ncampus_id: 1\n',1,NULL,'127.0.0.1','48b1e83e-6b20-48ce-ba94-a1ed9354a011','2016-02-26 04:55:09'),(3,1,'AccReceipt',NULL,NULL,NULL,NULL,NULL,'update','---\nis_del:\n- false\n- true\n',2,NULL,'127.0.0.1','4f8f3ea3-b03d-4e7e-a85b-2793faea6b0c','2016-02-26 05:03:28'),(4,2,'AccReceiptDetail',2,'AccReceipt',NULL,NULL,NULL,'create','---\nreceipt_id: 2\nitem_type: C\nitem_id: 3\namount: !ruby/object:BigDecimal 18:0.1E3\ndescription: \'\'\nitem_name: Pre-Payment\nitem_unit: A\n',1,NULL,'127.0.0.1','823aafd5-67c3-46da-9d12-b77613e0724b','2016-02-26 05:10:10'),(5,2,'AccReceipt',NULL,NULL,NULL,NULL,NULL,'create','---\nreceipt_date: 2016-02-26\nreceipt_no: \'\'\nreceipt_type: \'\'\nref_type: L\npayer_name: SOPHAT HENG\nref_id: 1\nusd_amount: !ruby/object:BigDecimal 18:0.1E3\nkhr_amount: !ruby/object:BigDecimal 18:0.0\ncharges_amount: !ruby/object:BigDecimal 18:0.1E3\ndiscount_amount: !ruby/object:BigDecimal 18:0.0\nremark: \'\'\nis_paid: false\npaid_date: \nis_del: false\nreceipt_by_id: 1\ncampus_id: 1\n',1,NULL,'127.0.0.1','823aafd5-67c3-46da-9d12-b77613e0724b','2016-02-26 05:10:10');

/*Table structure for table `cfg_academic_years` */

DROP TABLE IF EXISTS `cfg_academic_years`;

CREATE TABLE `cfg_academic_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `gen_campus_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_academic_years` */

insert  into `cfg_academic_years`(`id`,`code`,`name`,`start_date`,`end_date`,`gen_campus_id`,`user_id`,`is_deleted`,`created_at`,`updated_at`) values (1,'Y1516','2015​ -​​ 2016','2015-11-01','2016-11-01',1,1,0,'2015-10-30 07:09:06','2015-12-03 03:50:15'),(2,'Y1415','2014 - 2015','2014-11-01','2015-11-30',1,1,0,'2015-12-03 03:44:17','2015-12-03 03:44:17');

/*Table structure for table `cfg_ethinicities` */

DROP TABLE IF EXISTS `cfg_ethinicities`;

CREATE TABLE `cfg_ethinicities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `khr` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_ethinicities` */

insert  into `cfg_ethinicities`(`id`,`name`,`khr`,`is_deleted`,`created_at`,`updated_at`) values (1,'Khmer ','ខ្មែរ',0,'2015-03-07 13:52:55','2015-03-07 13:53:04'),(2,'English','អង់គេ្លស',0,'2015-07-14 10:14:43','2015-07-14 10:14:43');

/*Table structure for table `cfg_langauges` */

DROP TABLE IF EXISTS `cfg_langauges`;

CREATE TABLE `cfg_langauges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `khr` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_langauges` */

insert  into `cfg_langauges`(`id`,`name`,`khr`,`is_deleted`,`created_at`,`updated_at`) values (1,'Khmer','ខ្មែរ',0,'2015-03-07 13:31:28','2015-03-07 13:39:21'),(2,'English','អង់គ្លេស',0,'2015-03-07 13:44:18','2015-03-07 13:44:26'),(3,'China','ចិន',0,'2015-07-14 10:11:19','2015-07-14 10:11:19'),(4,'France','បារាំង',0,'2015-07-14 10:13:49','2015-07-14 10:13:49');

/*Table structure for table `cfg_look_ups` */

DROP TABLE IF EXISTS `cfg_look_ups`;

CREATE TABLE `cfg_look_ups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `k_name` varchar(255) DEFAULT NULL,
  `l_type` varchar(255) DEFAULT NULL,
  `int_val` int(11) DEFAULT NULL,
  `line_seq` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

/*Data for the table `cfg_look_ups` */

insert  into `cfg_look_ups`(`id`,`code`,`name`,`k_name`,`l_type`,`int_val`,`line_seq`,`created_at`,`updated_at`) values (1,NULL,'Register	',NULL,'STUDENT_STATUS',1,0,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(2,NULL,'Active	',NULL,'STUDENT_STATUS',2,1,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(3,NULL,'Suspend	',NULL,'STUDENT_STATUS',3,2,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(4,NULL,'Drop	',NULL,'STUDENT_STATUS',4,3,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(5,NULL,'Cancel	',NULL,'STUDENT_STATUS',5,4,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(6,NULL,'Finished	',NULL,'STUDENT_STATUS',6,5,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(7,NULL,'Male	',NULL,'GENDER',1,0,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(8,NULL,'Female	',NULL,'GENDER',2,1,'2015-03-05 13:54:48','2015-03-05 13:54:48'),(9,NULL,'Mr.',NULL,'TITLE',1,0,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(10,NULL,'Ms.',NULL,'TITLE',2,1,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(11,NULL,'Miss.',NULL,'TITLE',3,2,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(12,NULL,'Dr.',NULL,'TITLE',4,3,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(13,NULL,'Other	',NULL,'TITLE',5,4,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(14,NULL,'Single	',NULL,'MARITAL_STATUS',1,0,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(15,NULL,'Widows	',NULL,'MARITAL_STATUS',2,1,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(16,NULL,'Maried	',NULL,'MARITAL_STATUS',3,2,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(17,NULL,'Morning	',NULL,'SESSION',1,0,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(18,NULL,'Afternoon	',NULL,'SESSION',2,1,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(19,NULL,'Evening	',NULL,'SESSION',3,2,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(20,NULL,'Weekend	',NULL,'SESSION',4,3,'2015-03-05 13:54:49','2015-03-05 13:54:49'),(21,NULL,'Father	',NULL,'RELATIONSHIP',1,0,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(22,NULL,'Mother	',NULL,'RELATIONSHIP',2,1,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(23,NULL,'Uncle	',NULL,'RELATIONSHIP',3,2,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(24,NULL,'Aunt	',NULL,'RELATIONSHIP',4,3,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(25,NULL,'Bother	',NULL,'RELATIONSHIP',5,4,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(26,NULL,'Sister	',NULL,'RELATIONSHIP',6,5,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(27,NULL,'Friend	',NULL,'RELATIONSHIP',7,6,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(28,NULL,'Others	',NULL,'RELATIONSHIP',8,7,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(29,NULL,'Active	',NULL,'USER_STATUS',1,0,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(30,NULL,'Locked	',NULL,'USER_STATUS',2,1,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(31,NULL,'Suspend	',NULL,'USER_STATUS',3,2,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(32,NULL,'Disabled	',NULL,'USER_STATUS',4,3,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(33,NULL,'Change Name',NULL,'EMP_HIS_TYPE',1,0,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(34,NULL,'Change Address',NULL,'EMP_HIS_TYPE',2,1,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(35,NULL,'Change Status',NULL,'EMP_HIS_TYPE',3,2,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(36,NULL,'Change Type',NULL,'EMP_HIS_TYPE',4,3,'2015-03-05 13:54:50','2015-03-05 13:54:50'),(37,NULL,'Change Position',NULL,'EMP_HIS_TYPE',5,4,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(38,NULL,'Change Department',NULL,'EMP_HIS_TYPE',6,5,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(39,NULL,'Change Level',NULL,'EMP_HIS_TYPE',7,6,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(40,NULL,'Change User ID',NULL,'EMP_HIS_TYPE',8,7,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(41,NULL,'Change Shift',NULL,'EMP_HIS_TYPE',9,8,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(42,NULL,'Change Salary',NULL,'EMP_HIS_TYPE',10,9,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(43,NULL,'Create New',NULL,'1',1,0,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(44,NULL,'Change Photo',NULL,'1',2,1,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(45,NULL,'Drop Employee',NULL,'1',3,2,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(46,NULL,'Change Other',NULL,'1',4,3,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(47,NULL,'Probation	',NULL,'EMP_STATUS',1,0,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(48,NULL,'Permanence	',NULL,'EMP_STATUS',2,1,'2015-03-05 13:54:51','2015-03-05 13:54:51'),(49,NULL,'Resignated	',NULL,'EMP_STATUS',3,2,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(50,NULL,'Suspend	',NULL,'EMP_STATUS',4,3,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(51,NULL,'Drop	',NULL,'EMP_STATUS',5,4,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(52,NULL,'Lecturer',NULL,'EMP_TYPE',1,0,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(53,NULL,'Normal Staff',NULL,'EMP_TYPE',2,1,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(54,NULL,'Academic	',NULL,'EMP_TYPE',3,2,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(55,NULL,'Receptionist	',NULL,'EMP_TYPE',4,3,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(56,NULL,'Cashier	',NULL,'EMP_TYPE',5,4,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(57,NULL,'Accountant	',NULL,'EMP_TYPE',6,5,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(58,NULL,'HR & Admin',NULL,'EMP_TYPE',7,6,'2015-03-05 13:54:52','2015-03-05 13:54:52'),(59,NULL,'Other	',NULL,'EMP_TYPE',8,7,'2015-03-05 13:54:52','2015-03-05 13:54:52');

/*Table structure for table `cfg_message_templates` */

DROP TABLE IF EXISTS `cfg_message_templates`;

CREATE TABLE `cfg_message_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cfg_message_templates` */

/*Table structure for table `cfg_religions` */

DROP TABLE IF EXISTS `cfg_religions`;

CREATE TABLE `cfg_religions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `khr` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_religions` */

insert  into `cfg_religions`(`id`,`name`,`khr`,`is_deleted`,`created_at`,`updated_at`) values (1,'Buhda','ព្រះពុទ្ទ',0,'2015-03-07 15:01:48','2015-03-07 15:01:53'),(2,'Christian','គ្រីស្ទាន',0,NULL,NULL),(3,'Islam','សាសនាអ៊ីស្លាម',0,NULL,NULL);

/*Table structure for table `degree_standards` */

DROP TABLE IF EXISTS `degree_standards`;

CREATE TABLE `degree_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `degree_standards` */

/*Table structure for table `exm_assessment_rule_details` */

DROP TABLE IF EXISTS `exm_assessment_rule_details`;

CREATE TABLE `exm_assessment_rule_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_rule_id` int(11) DEFAULT NULL,
  `assessment_type_id` int(11) DEFAULT NULL,
  `rate_p` int(11) DEFAULT NULL,
  `rate_value` decimal(10,0) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_assessment_rule_details` */

/*Table structure for table `exm_assessment_rules` */

DROP TABLE IF EXISTS `exm_assessment_rules`;

CREATE TABLE `exm_assessment_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_code` varchar(6) DEFAULT NULL,
  `rule_name` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_assessment_rules` */

/*Table structure for table `exm_examinations` */

DROP TABLE IF EXISTS `exm_examinations`;

CREATE TABLE `exm_examinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `exam_type` varchar(1) DEFAULT 'E',
  `exam_level` int(11) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `exm_examinations` */

insert  into `exm_examinations`(`id`,`code`,`name`,`description`,`exam_type`,`exam_level`,`is_deleted`,`created_at`,`updated_at`) values (1,'SATEXM','State Exam',NULL,'E',3,0,NULL,NULL),(2,'FSEXM1','Semester I Exam',NULL,'E',2,0,NULL,NULL),(3,'FSEXM2','Semester II Exam',NULL,'E',2,0,NULL,NULL),(4,'HOMASM','Home Work Assessment',NULL,'A',1,0,NULL,NULL);

/*Table structure for table `exm_gpas` */

DROP TABLE IF EXISTS `exm_gpas`;

CREATE TABLE `exm_gpas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `edu_type` varchar(2) DEFAULT 'TC',
  `description` text,
  `gpa_value` decimal(4,2) DEFAULT '0.00',
  `is_deleted` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_gpas` */

/*Table structure for table `exm_tc_assessment_setup_details` */

DROP TABLE IF EXISTS `exm_tc_assessment_setup_details`;

CREATE TABLE `exm_tc_assessment_setup_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_setup_id` int(11) DEFAULT NULL,
  `assessment_type_id` int(11) DEFAULT NULL,
  `rate_p` int(11) DEFAULT NULL,
  `rate_value` float DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_assessment_setup_details` */

/*Table structure for table `exm_tc_assessment_setups` */

DROP TABLE IF EXISTS `exm_tc_assessment_setups`;

CREATE TABLE `exm_tc_assessment_setups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `total_rate` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_assessment_setups` */

/*Table structure for table `exm_tc_assessment_types` */

DROP TABLE IF EXISTS `exm_tc_assessment_types`;

CREATE TABLE `exm_tc_assessment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `category` varchar(255) DEFAULT 'A',
  `max_assessment` int(11) DEFAULT NULL,
  `is_tc` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) DEFAULT 'A',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_assessment_types` */

/*Table structure for table `exm_tc_attendance_details` */

DROP TABLE IF EXISTS `exm_tc_attendance_details`;

CREATE TABLE `exm_tc_attendance_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'P',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_attendance_details` */

/*Table structure for table `exm_tc_attendances` */

DROP TABLE IF EXISTS `exm_tc_attendances`;

CREATE TABLE `exm_tc_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `start_time` varchar(15) DEFAULT NULL,
  `is_generated` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_attendances` */

/*Table structure for table `exm_tc_grade_finals` */

DROP TABLE IF EXISTS `exm_tc_grade_finals`;

CREATE TABLE `exm_tc_grade_finals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_avg` float DEFAULT NULL,
  `grade_type` varchar(5) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_grade_finals` */

/*Table structure for table `exm_tc_score_details` */

DROP TABLE IF EXISTS `exm_tc_score_details`;

CREATE TABLE `exm_tc_score_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score_master_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_score_details` */

/*Table structure for table `exm_tc_score_masters` */

DROP TABLE IF EXISTS `exm_tc_score_masters`;

CREATE TABLE `exm_tc_score_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `assessment_type_id` int(11) DEFAULT NULL,
  `score_date` date DEFAULT NULL,
  `is_generated` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exm_tc_score_masters` */

/*Table structure for table `file_uploads` */

DROP TABLE IF EXISTS `file_uploads`;

CREATE TABLE `file_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `file_file_name` varchar(255) DEFAULT NULL,
  `file_content_type` varchar(255) DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `file_uploads` */

/*Table structure for table `gen_campus` */

DROP TABLE IF EXISTS `gen_campus`;

CREATE TABLE `gen_campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campus_code` varchar(255) DEFAULT NULL,
  `campus_name` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `gen_campus` */

insert  into `gen_campus`(`id`,`campus_code`,`campus_name`,`abbr`,`address`,`email`,`phone`,`director`,`start_date`,`is_deleted`,`status`,`created_at`,`updated_at`) values (1,'001','Head Office','HO','Head Office','mdatait@gmail.com','078856156','Dara','2014-01-01 00:00:00',0,'1',NULL,'2015-04-02 14:49:39'),(2,'002','Toul Svay Prey','TSP','Toul Svay Prey','toul_svay_prey@email.com','011716785','Phat','2014-01-01 00:00:00',0,'1',NULL,NULL);

/*Table structure for table `gen_cities` */

DROP TABLE IF EXISTS `gen_cities`;

CREATE TABLE `gen_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_country_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gen_cities` */

/*Table structure for table `gen_communes` */

DROP TABLE IF EXISTS `gen_communes`;

CREATE TABLE `gen_communes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_district_id` int(11) DEFAULT NULL,
  `gen_city_id` int(11) DEFAULT NULL,
  `commune` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gen_communes` */

/*Table structure for table `gen_countries` */

DROP TABLE IF EXISTS `gen_countries`;

CREATE TABLE `gen_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gen_countries` */

/*Table structure for table `gen_districts` */

DROP TABLE IF EXISTS `gen_districts`;

CREATE TABLE `gen_districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_city_id` int(11) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gen_districts` */

/*Table structure for table `gen_nationalities` */

DROP TABLE IF EXISTS `gen_nationalities`;

CREATE TABLE `gen_nationalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `khr` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `gen_nationalities` */

insert  into `gen_nationalities`(`id`,`name`,`khr`,`is_deleted`,`created_at`,`updated_at`) values (1,'Khmer','ខ្មែរ',0,'2015-03-07 14:01:43','2015-03-07 14:01:51'),(2,'Chinese','ចិន',0,'2015-07-14 10:16:17','2015-07-14 10:16:17');

/*Table structure for table `gen_occupations` */

DROP TABLE IF EXISTS `gen_occupations`;

CREATE TABLE `gen_occupations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `khr` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `gen_occupations` */

insert  into `gen_occupations`(`id`,`name`,`khr`,`is_deleted`,`created_at`,`updated_at`) values (1,'Student','សិស្ស',0,'2015-03-07 14:05:32','2015-03-07 14:05:41'),(2,'Business','ធ្វើជំនួយ',0,NULL,NULL),(3,'Company','ធ្វើការក្រុមហ៊ុន',0,NULL,NULL),(4,'Farmer','កសិករ',0,NULL,NULL),(5,'Teacher','គ្រូបង្រៀន',0,NULL,NULL),(6,'Doctor','គ្រូពេទ្យ',0,NULL,NULL),(7,'Organization','ធ្វើការអង្គការ',0,NULL,NULL),(8,'Goverment','ធ្វើការរាជ្យការ',0,NULL,NULL),(9,'Banking','ធ្វើការធនាគារ',0,NULL,NULL),(10,'Others','មុខរបរផេ្សងទៀត',1,NULL,'2015-07-14 10:16:50');

/*Table structure for table `hr_departments` */

DROP TABLE IF EXISTS `hr_departments`;

CREATE TABLE `hr_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `hr_departments` */

insert  into `hr_departments`(`id`,`department`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'IT','Information Technology',0,NULL,NULL),(2,'Management',NULL,0,NULL,NULL),(3,'Registrar','Department of Registrar',1,NULL,'2015-08-01 02:00:15'),(4,'Foundation Year','Department of Foundation Year',0,NULL,'2015-05-29 15:12:27'),(5,'Marketing','Department of Marketing',0,NULL,'2015-05-29 15:12:44'),(6,'Accounting','Department of Accounting',0,NULL,'2015-05-29 15:12:56'),(7,'Human Resource','Department of HR',0,NULL,'2015-05-29 15:13:09'),(8,'GEP Office','GEP Office',0,NULL,'2015-05-29 15:13:49'),(9,'Graduate Office','Graduate Office',1,NULL,'2015-08-01 02:00:23'),(10,'Registrar Office','',0,'2015-12-03 03:01:58','2015-12-03 03:01:58'),(11,'Internal Audit','Internal Audit Department',0,'2015-12-06 06:16:54','2015-12-06 06:16:54');

/*Table structure for table `hr_employee_levels` */

DROP TABLE IF EXISTS `hr_employee_levels`;

CREATE TABLE `hr_employee_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_level` varchar(50) DEFAULT NULL,
  `khr_emp_level` varchar(50) DEFAULT NULL,
  `description` text,
  `level_value` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `hr_employee_levels` */

insert  into `hr_employee_levels`(`id`,`emp_level`,`khr_emp_level`,`description`,`level_value`,`is_deleted`,`created_at`,`updated_at`) values (1,'Director','អគ្គនាយក',NULL,1,0,NULL,NULL),(2,'Vice Rector','អគ្គនាយករង',NULL,2,0,NULL,NULL),(3,'Head of Department','ប្រធាននាយកដ្ជាន',NULL,3,0,NULL,NULL),(4,'Manager','អ្កកប្រគប់គ្រង',NULL,4,0,NULL,NULL),(5,'Supervisor',NULL,NULL,5,1,NULL,'2015-08-01 02:10:50'),(6,'Senior','បុគ្គលិកជំនាញ',NULL,6,1,NULL,'2015-08-01 02:10:44'),(7,'Officer','បុគ្គលិកការិយាល័យ',NULL,7,0,NULL,NULL),(8,'Volunteer',NULL,NULL,8,0,NULL,NULL),(9,'Trainer',NULL,NULL,9,1,NULL,'2015-08-01 02:10:54'),(10,'test','ដសថសដ','សដថសដ',9,1,'2015-08-01 02:08:02','2015-08-01 02:08:20');

/*Table structure for table `hr_employee_shifts` */

DROP TABLE IF EXISTS `hr_employee_shifts`;

CREATE TABLE `hr_employee_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(50) DEFAULT NULL,
  `shift_type` varchar(2) DEFAULT 'FT',
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `hr_employee_shifts` */

insert  into `hr_employee_shifts`(`id`,`shift_name`,`shift_type`,`start_time`,`end_time`,`description`,`campus_id`,`is_deleted`,`created_at`,`updated_at`) values (1,'Staff Full Time','FT','8:00 AM','5:00 PM','test',1,0,NULL,'2015-08-01 02:12:46'),(2,'Lecturer Full Time','FT','07:00:00','17:00:00',NULL,1,1,NULL,'2015-08-01 02:14:06'),(3,'Lecturer Part Time','PT','07:00:00','20:30:00',NULL,1,1,NULL,'2015-08-01 02:14:02'),(4,'Weekend','PT','7:00 AM','9:00 PM','test',1,1,'2015-08-01 02:13:46','2015-08-01 02:15:51');

/*Table structure for table `hr_employees` */

DROP TABLE IF EXISTS `hr_employees`;

CREATE TABLE `hr_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `khr_name` varchar(100) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `place_of_birth` varchar(200) DEFAULT NULL,
  `emp_type` varchar(1) DEFAULT NULL,
  `working_time` varchar(2) DEFAULT 'FT',
  `emp_level_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `basic_salary` decimal(10,0) DEFAULT NULL,
  `id_card_no` varchar(30) DEFAULT NULL,
  `passport_no` varchar(30) DEFAULT NULL,
  `national_id` int(11) DEFAULT NULL,
  `ethnicity_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `langauge_id` int(11) DEFAULT NULL,
  `marital_status` varchar(1) DEFAULT NULL,
  `spouse_name` varchar(100) DEFAULT NULL,
  `no_of_child` int(11) DEFAULT NULL,
  `studied_child` int(11) DEFAULT NULL,
  `house_no` varchar(20) DEFAULT NULL,
  `street_no` varchar(50) DEFAULT NULL,
  `group_no` varchar(20) DEFAULT NULL,
  `village` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `commune` varchar(50) DEFAULT NULL,
  `phone_no` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `description` text,
  `status` varchar(2) DEFAULT NULL,
  `photo_path` text,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hr_employees` */

/*Table structure for table `hr_holidays` */

DROP TABLE IF EXISTS `hr_holidays`;

CREATE TABLE `hr_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `khr_name` varchar(50) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `academic_year_id` int(11) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hr_holidays` */

/*Table structure for table `hr_positions` */

DROP TABLE IF EXISTS `hr_positions`;

CREATE TABLE `hr_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `hr_positions` */

insert  into `hr_positions`(`id`,`position`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'System Administrator','',0,NULL,'2015-05-29 15:14:46'),(4,'Vice Rector','Vice Rector',0,'2015-05-29 15:15:00','2015-05-29 15:15:00'),(5,'Head of Marketing Office','Head of Marketing Office',0,'2015-05-29 15:15:11','2015-05-29 15:15:11'),(6,'Assistant of Marketing','Assistant of Marketing',1,'2015-05-29 15:15:20','2015-08-01 02:00:32'),(7,'Head of Foundation Year','Head of Department of Foundation Year',0,'2015-05-29 15:15:40','2015-05-29 15:15:40'),(8,'Assistant of Foundation Year','Assistant of Foundation Year',0,'2015-05-29 15:15:50','2015-05-29 15:15:50'),(9,'Head of Registrar Office','Head of Registrar Office',0,'2015-05-29 15:16:00','2015-05-29 15:16:00'),(10,'Assistant of Registrar','Assistant of Registrar',0,'2015-05-29 15:16:10','2015-05-29 15:16:10'),(11,'GEP Officer','GEP Officer',0,'2015-05-29 15:16:19','2015-05-29 15:16:19'),(12,'Vice Dean ot Gratuate Office Director of IP','Vice Dean ot Gratuate Office Director of IP',0,'2015-05-29 15:16:30','2015-05-29 15:16:46'),(13,'Head of Accouting','Head of Accouting',0,'2015-05-29 15:16:55','2015-05-29 15:16:55'),(14,'Assistant of Accouting','Assistant of Accouting',1,'2015-05-29 15:17:04','2015-08-01 02:00:36'),(15,'Registrar Officer','',0,'2015-12-03 03:02:16','2015-12-03 03:02:16'),(16,'Head of Internal Audit','',0,'2015-12-06 06:14:07','2015-12-06 06:14:54'),(17,'Internal Audit Officer','',0,'2015-12-06 06:14:35','2015-12-06 06:15:09');

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_updated_at` datetime DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `images` */

insert  into `images`(`id`,`image_updated_at`,`image_file_size`,`image_content_type`,`image_file_name`,`created_at`,`updated_at`) values (1,'2016-02-12 23:55:35',35925,'image/jpeg','3x4.jpg','2016-02-12 23:55:35','2016-02-12 23:55:35'),(2,'2016-02-23 01:38:45',561276,'image/jpeg','Lighthouse.jpg','2016-02-23 01:38:45','2016-02-23 01:38:45');

/*Table structure for table `inv_items` */

DROP TABLE IF EXISTS `inv_items`;

CREATE TABLE `inv_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(6) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `inv_items` */

insert  into `inv_items`(`id`,`item_code`,`item_name`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'001','Table',NULL,0,NULL,NULL);

/*Table structure for table `next_versions` */

DROP TABLE IF EXISTS `next_versions`;

CREATE TABLE `next_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `next_code` int(11) DEFAULT NULL,
  `degit` int(11) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `next_versions` */

insert  into `next_versions`(`id`,`n_type`,`description`,`next_code`,`degit`,`prefix`,`campus_id`,`created_at`,`updated_at`) values (1,'STUDENT CODE TC','Campus Abbr-Batch Code-Degree-Course Abbr-DDMMYY-R000 ',1,3,NULL,1,'2015-05-29 14:23:30','2015-09-19 10:22:33'),(2,'STUDENT_NO','',4,6,NULL,1,'2015-05-29 14:23:30','2016-02-24 01:04:06'),(5,'RECEIPT','',10,6,'',1,'2015-07-30 12:42:48','2016-02-27 07:41:37'),(6,'ACCOUNT NO','',4,8,'',1,'2015-08-06 16:26:38','2016-02-24 00:54:48'),(9,'ADMISSION NO. TC','',3,6,'',1,'2015-10-02 15:09:36','2016-02-24 01:05:13'),(10,'ADMISSION NO. WU','',4,4,'',1,'2015-10-02 15:09:36','2016-02-24 01:04:29'),(11,'INVOICE NO',NULL,2,6,NULL,1,'2015-10-02 15:09:36','2016-02-27 01:26:56');

/*Table structure for table `schema_migrations` */

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schema_migrations` */

insert  into `schema_migrations`(`version`) values ('20150223140532'),('20150223143316'),('20150223143344'),('20150223154728'),('20150225150737'),('20150226152650'),('20150227152452'),('20150301081323'),('20150301084251'),('20150301174348'),('20150302150856'),('20150303140100'),('20150303143236'),('20150305135400'),('20150306123221'),('20150306124724'),('20150307115726'),('20150307115936'),('20150307120059'),('20150307120149'),('20150307120352'),('20150307120444'),('20150307141947'),('20150307143427'),('20150307151337'),('20150307154551'),('20150308012556'),('20150308014755'),('20150308015028'),('20150308034750'),('20150308041350'),('20150310133832'),('20150312132244'),('20150313121118'),('20150313121312'),('20150313121741'),('20150313121924'),('20150314034519'),('20150315055259'),('20150320152601'),('20150321160615'),('20150321163740'),('20150321165035'),('20150322014356'),('20150322025803'),('20150322041255'),('20150322042852'),('20150322050035'),('20150322050530'),('20150322095926'),('20150326090815'),('20150326100036'),('20150328112813'),('20150328113042'),('20150328133628'),('20150401152010'),('20150405145807'),('20150405152753'),('20150405154938'),('20150406122745'),('20150406130021'),('20150406145323'),('20150408123243'),('20150408123904'),('20150408124052'),('20150408124429'),('20150408124835'),('20150412000343'),('20150417085251'),('20150417141720'),('20150417142631'),('20150417150728'),('20150418073037'),('20150418110029'),('20150418110728'),('20150418111728'),('20150418114738'),('20150418115647'),('20150418153131'),('20150418165310'),('20150419005211'),('20150419011757'),('20150419013111'),('20150419013208'),('20150419014128'),('20150419014625'),('20150419032028'),('20150419032645'),('20150419032740'),('20150419035007'),('20150419042109'),('20150419043013'),('20150419043600'),('20150419044316'),('20150419045505'),('20150419050343'),('20150419083012'),('20150419083545'),('20150421125904'),('20150421153307'),('20150422163135'),('20150426171647'),('20150430030826'),('20150502144037'),('20150502152952'),('20150503123451'),('20150503123528'),('20150503123624'),('20150503124443'),('20150503151425'),('20150503152422'),('20150505073244'),('20150505073621'),('20150505073731'),('20150505074209'),('20150505141430'),('20150505152120'),('20150506060840'),('20150506080727'),('20150506082040'),('20150506140650'),('20150506142635'),('20150506143618'),('20150510060841'),('20150510062443'),('20150510064443'),('20150511154259'),('20150511154746'),('20150512082918'),('20150513034850'),('20150513035114'),('20150516005344'),('20150516040247'),('20150516140914'),('20150517040557'),('20150517115810'),('20150518145640'),('20150518163508'),('20150519145808'),('20150521101704'),('20150521104741'),('20150525142247'),('20150527162731'),('20150529040617'),('20150529050028'),('20150529051241'),('20150529052326'),('20150529090839'),('20150529150438'),('20150607052454'),('20150607081230'),('20150607085932'),('20150607091055'),('20150607091557'),('20150607091851'),('20150608115050'),('20150608120453'),('20150609142015'),('20150612090649'),('20150612094852'),('20150615143714'),('20150616225938'),('20150617144822'),('20150618102202'),('20150620105734'),('20150625074403'),('20150625082347'),('20150625083656'),('20150625084615'),('20150625084911'),('20150625085752'),('20150627094547'),('20150628025334'),('20150628140433'),('20150702143342'),('20150702144356'),('20150702144856'),('20150714142718'),('20150714144403'),('20150714151508'),('20150714151543'),('20150715002140'),('20150715002226'),('20150715002306'),('20150716023843'),('20150716030037'),('20150716030111'),('20150716030135'),('20150716032850'),('20150716032919'),('20150716040330'),('20150718041214'),('20150719063915'),('20150719064334'),('20150725085511'),('20150801032225'),('20150801041140'),('20150801083037'),('20150802152811'),('20150805120405'),('20150805120704'),('20150805142714'),('20150806162437'),('20150807143852'),('20150808112639'),('20150809061053'),('20150809070730'),('20150815082316'),('20150817152519'),('20150822154124'),('20150823002640'),('20150823044737'),('20150823045440'),('20150824143628'),('20150824145719'),('20150825150041'),('20150827071830'),('20150827074539'),('20150827080221'),('20150827081103'),('20150827145435'),('20150827163331'),('20150827165343'),('20150827233615'),('20150827235144'),('20150916091216'),('20150916153316'),('20150918074416'),('20150918075827'),('20150919021011'),('20150919021106'),('20150919021332'),('20150919021419'),('20150919071308'),('20150919103040'),('20150919104241'),('20150922024816'),('20150923022126'),('20150925021742'),('20150925021859'),('20150928135812'),('20150929153147'),('20151003004659'),('20151013033506'),('20151016015542'),('20151018033943'),('20151108024515'),('20151115090517'),('20151120165549'),('20160127083155'),('20160127085158');

/*Table structure for table `sdn_acc_key_accounts` */

DROP TABLE IF EXISTS `sdn_acc_key_accounts`;

CREATE TABLE `sdn_acc_key_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `refer_type` varchar(1) DEFAULT 'O',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_acc_key_accounts` */

insert  into `sdn_acc_key_accounts`(`id`,`code`,`name`,`refer_type`,`campus_id`,`created_at`,`updated_at`,`is_deleted`) values (1,'001','Sary Monydarfa','O',1,NULL,NULL,0);

/*Table structure for table `sdn_additional_fees` */

DROP TABLE IF EXISTS `sdn_additional_fees`;

CREATE TABLE `sdn_additional_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_charge_id` int(11) DEFAULT NULL,
  `item_charge_id` int(11) DEFAULT NULL,
  `charge_amount` decimal(8,2) DEFAULT '0.00',
  `is_recurring` tinyint(1) DEFAULT '0',
  `is_bill` tinyint(1) DEFAULT '0',
  `note` text,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_additional_fees` */

/*Table structure for table `sdn_admission_histories` */

DROP TABLE IF EXISTS `sdn_admission_histories`;

CREATE TABLE `sdn_admission_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `program_type` varchar(1) DEFAULT 'N',
  `batch_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_shift_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `start_acad_year_id` int(11) DEFAULT NULL,
  `current_acad_year_id` int(11) DEFAULT NULL,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_admission_histories` */

/*Table structure for table `sdn_admissions` */

DROP TABLE IF EXISTS `sdn_admissions`;

CREATE TABLE `sdn_admissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `admission_no` varchar(30) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `admission_by_id` int(11) DEFAULT NULL,
  `admission_type` varchar(1) DEFAULT 'N',
  `program_type` varchar(1) NOT NULL DEFAULT 'N',
  `tuition_time_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `s_level_id` int(11) DEFAULT NULL,
  `c_level_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_shift_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `start_acd_year_id` int(11) DEFAULT NULL,
  `end_acd_year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `note` text,
  `status` varchar(1) NOT NULL DEFAULT 'N',
  `record_stat` varchar(1) DEFAULT 'O',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reference_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_admissions` */

insert  into `sdn_admissions`(`id`,`student_id`,`lead_id`,`admission_no`,`admission_date`,`admission_by_id`,`admission_type`,`program_type`,`tuition_time_id`,`term_id`,`s_level_id`,`c_level_id`,`batch_id`,`degree_id`,`course_id`,`class_shift_id`,`major_id`,`start_acd_year_id`,`end_acd_year_id`,`class_id`,`note`,`status`,`record_stat`,`campus_id`,`created_at`,`updated_at`,`reference_no`) values (2,2,NULL,'GEP-000001','2016-02-06',1,'N','N',1,1,1,1,NULL,1,1,1,2,1,NULL,NULL,'','A','O',1,'2016-02-06 11:09:32','2016-02-06 11:09:41',NULL),(3,3,NULL,'13-B0001','2016-02-06',1,'N','N',NULL,NULL,NULL,NULL,9,4,3,1,1,1,NULL,NULL,'','A','O',1,'2016-02-06 11:25:13','2016-02-06 11:26:48',NULL),(4,3,NULL,'B13-0003','2016-02-24',1,'N','N',NULL,NULL,NULL,NULL,9,4,9,1,1,1,NULL,NULL,'','A','O',1,'2016-02-24 01:00:49','2016-02-24 01:04:29',NULL),(5,4,NULL,'B13-0002','2016-02-24',1,'N','N',NULL,NULL,NULL,NULL,9,4,9,1,1,1,NULL,NULL,'','A','O',1,'2016-02-24 01:03:57','2016-02-24 01:04:06',NULL),(6,4,NULL,'GEP-000002','2016-02-24',1,'N','N',1,1,4,4,NULL,1,1,1,2,1,NULL,NULL,'','A','O',1,'2016-02-24 01:05:07','2016-02-24 01:05:13',NULL);

/*Table structure for table `sdn_categories` */

DROP TABLE IF EXISTS `sdn_categories`;

CREATE TABLE `sdn_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_categories` */

insert  into `sdn_categories`(`id`,`code`,`name`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'INV','Individual','Individual registration student',0,'2015-03-14 03:51:12','2015-05-11 15:25:58'),(2,'ORG','Organization',NULL,0,'2015-03-14 03:51:12','2015-03-14 03:51:12'),(3,'GOV','Goverment',NULL,0,'2015-03-14 03:51:12','2015-03-14 03:51:12'),(4,'BUS','Bussiness',NULL,0,'2015-03-14 03:51:12','2015-03-14 03:51:12'),(5,'EMB','Embassy',NULL,0,'2015-03-14 03:51:12','2015-03-14 03:51:12'),(6,'TFC','Transfer from other campus','Student transfer from other western campus or other western center',0,'2015-03-14 03:51:12','2015-05-11 15:31:36'),(7,'TFO','Transfer from other','student transfer from other university or other center',0,'2015-05-11 15:25:31','2015-05-11 15:35:33');

/*Table structure for table `sdn_change_histories` */

DROP TABLE IF EXISTS `sdn_change_histories`;

CREATE TABLE `sdn_change_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `change_type` varchar(1) DEFAULT 'F',
  `from_ref_id` int(11) DEFAULT NULL,
  `to_ref_id` int(11) DEFAULT NULL,
  `changed_date` date DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_change_histories` */

/*Table structure for table `sdn_city_states` */

DROP TABLE IF EXISTS `sdn_city_states`;

CREATE TABLE `sdn_city_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(6) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `city_name_khr` varchar(50) NOT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_city_states` */

insert  into `sdn_city_states`(`id`,`city_code`,`city_name`,`city_name_khr`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'023','Phnom Pehn','ភ្តំពេញ','ភ្តំពេញ',0,'2015-08-18 09:47:17','2015-08-18 09:47:17'),(2,'SRP','Siem Reap','សៀមរាប','សៀមរាប',0,'2015-08-18 09:48:37','2015-08-18 09:48:37'),(3,'KRT','Kratie','Kratie','Kratie',0,'2015-08-18 09:50:54','2015-08-18 09:50:54'),(4,'KPC','Kam Pong Cham','Kam Pong Cham','Kam Pong Cham',0,'2015-08-18 09:54:06','2015-08-18 09:54:06'),(5,'SVR','Svay Reang','ស្វាយរៀង','ស្វាយរៀង',0,'2015-10-02 16:21:03','2015-10-02 16:21:03');

/*Table structure for table `sdn_class_students` */

DROP TABLE IF EXISTS `sdn_class_students`;

CREATE TABLE `sdn_class_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `degree_type` varchar(2) DEFAULT 'WU',
  `enroll_date` date DEFAULT NULL,
  `enroll_by_id` int(11) DEFAULT NULL,
  `is_promoted` tinyint(4) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_class_students` */

/*Table structure for table `sdn_class_tc_students` */

DROP TABLE IF EXISTS `sdn_class_tc_students`;

CREATE TABLE `sdn_class_tc_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `enroll_date` date DEFAULT NULL,
  `enroll_by_id` int(11) DEFAULT NULL,
  `is_promoted` tinyint(1) DEFAULT '0',
  `campus_id` int(11) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_class_tc_students` */

/*Table structure for table `sdn_contacts` */

DROP TABLE IF EXISTS `sdn_contacts`;

CREATE TABLE `sdn_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `contact_type` varchar(2) DEFAULT '',
  `contact_name` varchar(100) DEFAULT NULL,
  `gender` varchar(1) DEFAULT 'M',
  `address` text,
  `email` varchar(100) DEFAULT '',
  `phone` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_contacts` */

insert  into `sdn_contacts`(`id`,`student_id`,`title_id`,`contact_type`,`contact_name`,`gender`,`address`,`email`,`phone`,`created_at`,`updated_at`) values (4,2,NULL,'E','','M','','','','2016-02-06 11:09:32','2016-02-06 11:09:32'),(5,2,NULL,'F','','M','','','','2016-02-06 11:09:32','2016-02-06 11:09:32'),(6,2,NULL,'M','','F','','','','2016-02-06 11:09:32','2016-02-06 11:09:32'),(7,3,NULL,'E','','M','','','','2016-02-06 11:25:13','2016-02-06 11:25:13'),(8,3,NULL,'F','sdfsf','','','','','2016-02-06 11:25:13','2016-02-24 01:00:49'),(9,3,NULL,'M','sdfdsf','','','','','2016-02-06 11:25:13','2016-02-24 01:00:49'),(10,4,NULL,'E','','M','','','','2016-02-24 01:03:57','2016-02-24 01:03:57'),(11,4,NULL,'F','','','','','','2016-02-24 01:03:57','2016-02-24 01:05:07'),(12,4,NULL,'M','','','','','','2016-02-24 01:03:57','2016-02-24 01:05:07');

/*Table structure for table `sdn_document_types` */

DROP TABLE IF EXISTS `sdn_document_types`;

CREATE TABLE `sdn_document_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_document_types` */

insert  into `sdn_document_types`(`id`,`code`,`type_name`,`created_at`,`updated_at`) values (1,'CERTFC','Certificate','2015-05-13 02:00:09','2015-05-13 02:00:09'),(2,'NATIDC','National ID Card','2015-05-13 02:00:09','2015-05-13 02:00:09'),(3,'PASSPT','Passport Book','2015-05-13 02:00:09','2015-05-13 02:00:09'),(4,'FAMLBK','Familty Book','2015-05-13 02:00:09','2015-05-13 02:00:09'),(5,'DRIVLC','Driver License','2015-05-13 02:00:09','2015-05-13 02:00:09'),(6,'BCERTC','Certificate of Birth','2015-05-13 02:00:09','2015-05-13 02:00:09'),(7,'OTHERS','Other Documents','2015-05-13 02:00:09','2015-05-13 02:00:09');

/*Table structure for table `sdn_documents` */

DROP TABLE IF EXISTS `sdn_documents`;

CREATE TABLE `sdn_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(50) DEFAULT NULL,
  `doc_type_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `file_path` text,
  `orginal_file_name` varchar(100) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `tmp_emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_documents` */

/*Table structure for table `sdn_drop_types` */

DROP TABLE IF EXISTS `sdn_drop_types`;

CREATE TABLE `sdn_drop_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_drop_types` */

insert  into `sdn_drop_types`(`id`,`code`,`name`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'001','STOP STUDY','',0,'2015-05-13 13:20:21','2015-05-13 13:20:21'),(2,'002','Bad Debt','',0,'2015-05-13 13:22:23','2015-05-14 07:21:08');

/*Table structure for table `sdn_fee_charges` */

DROP TABLE IF EXISTS `sdn_fee_charges`;

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

/*Data for the table `sdn_fee_charges` */

/*Table structure for table `sdn_fee_discounts` */

DROP TABLE IF EXISTS `sdn_fee_discounts`;

CREATE TABLE `sdn_fee_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_charge_id` int(11) DEFAULT NULL,
  `discount_item_detail_id` int(11) DEFAULT NULL,
  `discount_amount` decimal(8,2) DEFAULT '0.00',
  `discount_p` float DEFAULT '0',
  `deduct_type` varchar(1) DEFAULT 'F',
  `is_bill` tinyint(1) DEFAULT '0',
  `discount_by_id` int(11) DEFAULT NULL,
  `note` text,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_fee_discounts` */

/*Table structure for table `sdn_leads` */

DROP TABLE IF EXISTS `sdn_leads`;

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
  `photo_path` text,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_leads` */

insert  into `sdn_leads`(`id`,`title_id`,`first_name`,`last_name`,`khr_first_name`,`khr_last_name`,`gender`,`date_of_birth`,`registered_date`,`place_of_birth`,`phone_no`,`email`,`address`,`note`,`photo_path`,`degree_id`,`course_id`,`class_shift_id`,`is_canceled`,`campus_id`,`created_at`,`updated_at`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`avatar_updated_at`) values (1,NULL,'SOPHAT','HENG','សុផាត','ហេង','M','1983-03-08','2016-02-03','','011716785','','','','/resources/images/photo/no-picture.gif',1,1,1,0,1,'2016-02-03 07:03:28','2016-02-03 07:03:28',NULL,NULL,NULL,NULL),(2,NULL,'Monydara','Sary','','','M',NULL,NULL,'','234234','','','','/resources/images/photo/no-picture.gif',4,3,1,0,1,'2016-02-03 07:29:24','2016-02-06 11:16:35',NULL,NULL,NULL,NULL),(3,NULL,'Channa','Ly','Channa','Ly','M','2016-02-24','2016-02-24','','32423423','','','','/resources/images/photo/no-picture.gif',4,8,1,0,1,'2016-02-24 00:54:48','2016-02-24 00:54:48',NULL,NULL,NULL,NULL);

/*Table structure for table `sdn_reason_types` */

DROP TABLE IF EXISTS `sdn_reason_types`;

CREATE TABLE `sdn_reason_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `description` text,
  `reason_for` varchar(1) DEFAULT 'D',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_reason_types` */

insert  into `sdn_reason_types`(`id`,`code`,`type_name`,`description`,`reason_for`,`is_deleted`,`created_at`,`updated_at`) values (1,'D001','Bad Debt',NULL,'D',0,NULL,NULL),(2,'S001','Busy with job',NULL,'S',0,NULL,NULL),(3,'S002','On mission',NULL,'S',0,NULL,NULL);

/*Table structure for table `sdn_status_logs` */

DROP TABLE IF EXISTS `sdn_status_logs`;

CREATE TABLE `sdn_status_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `status_type` varchar(1) DEFAULT 'N',
  `reason_type_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_by_id` int(11) DEFAULT NULL,
  `description` text,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_status_logs` */

insert  into `sdn_status_logs`(`id`,`student_id`,`admission_id`,`status_type`,`reason_type_id`,`start_date`,`end_date`,`status_by_id`,`description`,`campus_id`,`created_at`,`updated_at`) values (1,2,2,'N',NULL,'2016-02-06','2016-02-06',1,NULL,1,'2016-02-06 11:09:32','2016-02-06 11:09:32'),(2,2,2,'A',NULL,'2016-02-06',NULL,1,NULL,1,'2016-02-06 11:09:41','2016-02-06 11:09:41'),(3,3,3,'N',NULL,'2016-02-06','2016-02-24',1,NULL,1,'2016-02-06 11:25:13','2016-02-06 11:25:13'),(4,3,3,'A',NULL,'2016-02-06',NULL,1,NULL,1,'2016-02-06 11:26:48','2016-02-06 11:26:48'),(5,3,4,'N',NULL,'2016-02-24','2016-02-24',1,NULL,1,'2016-02-24 01:00:49','2016-02-24 01:00:49'),(6,4,5,'N',NULL,'2016-02-24','2016-02-24',1,NULL,1,'2016-02-24 01:03:57','2016-02-24 01:03:57'),(7,4,5,'A',NULL,'2016-02-24',NULL,1,NULL,1,'2016-02-24 01:04:06','2016-02-24 01:04:06'),(8,3,4,'A',NULL,'2016-02-24',NULL,1,NULL,1,'2016-02-24 01:04:29','2016-02-24 01:04:29'),(9,4,6,'N',NULL,'2016-02-24','2016-02-24',1,NULL,1,'2016-02-24 01:05:07','2016-02-24 01:05:07'),(10,4,6,'A',NULL,'2016-02-24',NULL,1,NULL,1,'2016-02-24 01:05:13','2016-02-24 01:05:13');

/*Table structure for table `sdn_student_khrs` */

DROP TABLE IF EXISTS `sdn_student_khrs`;

CREATE TABLE `sdn_student_khrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` varchar(20) DEFAULT NULL,
  `place_of_birth` text,
  `address` text,
  `phone` varchar(30) DEFAULT NULL,
  `diploma_year` varchar(50) DEFAULT NULL,
  `diploma_grade` varchar(1) DEFAULT NULL,
  `total_score` int(11) DEFAULT '0',
  `is_passed_diploma` tinyint(1) DEFAULT NULL,
  `diploma_num` varchar(50) DEFAULT NULL,
  `certificate` varchar(100) DEFAULT NULL,
  `institue` varchar(100) DEFAULT NULL,
  `institue_city` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_student_khrs` */

insert  into `sdn_student_khrs`(`id`,`student_id`,`gender`,`date_of_birth`,`place_of_birth`,`address`,`phone`,`diploma_year`,`diploma_grade`,`total_score`,`is_passed_diploma`,`diploma_num`,`certificate`,`institue`,`institue_city`,`city`,`father_name`,`mother_name`,`occupation`,`created_at`,`updated_at`) values (1,3,'ប','','','','','','',0,1,'','','','','','','','','2016-02-06 11:25:13','2016-02-06 11:25:13'),(2,4,'ប','','','','','','',0,1,'','','','','','','','','2016-02-24 01:03:57','2016-02-24 01:03:57');

/*Table structure for table `sdn_student_promotes` */

DROP TABLE IF EXISTS `sdn_student_promotes`;

CREATE TABLE `sdn_student_promotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admission_id` int(11) DEFAULT NULL,
  `class_type` char(2) DEFAULT 'TC',
  `from_class_id` int(11) DEFAULT NULL,
  `to_class_id` int(11) DEFAULT NULL,
  `promoted_by_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `promoted_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_student_promotes` */

/*Table structure for table `sdn_student_requests` */

DROP TABLE IF EXISTS `sdn_student_requests`;

CREATE TABLE `sdn_student_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_no` varchar(8) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `note` text,
  `marker_id` int(11) DEFAULT NULL,
  `maker_date` date DEFAULT NULL,
  `checker_id` int(11) DEFAULT NULL,
  `checker_date` date DEFAULT NULL,
  `status` varchar(1) DEFAULT 'N',
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sdn_student_requests` */

/*Table structure for table `sdn_students` */

DROP TABLE IF EXISTS `sdn_students`;

CREATE TABLE `sdn_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `student_code` varchar(50) DEFAULT NULL,
  `student_no` varchar(13) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `khr_first_name` varchar(50) DEFAULT NULL,
  `khr_last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `date_of_birth` date DEFAULT NULL,
  `registered_date` date DEFAULT NULL,
  `place_of_birth` text,
  `phone_no` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `from_city_id` int(11) DEFAULT NULL,
  `occupation_id` int(11) DEFAULT NULL,
  `national_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `langauge_id` int(11) DEFAULT NULL,
  `ethnicity_id` int(11) DEFAULT NULL,
  `national_no` varchar(30) DEFAULT NULL,
  `passport_no` varchar(30) DEFAULT NULL,
  `note` text,
  `image_url` varchar(255) DEFAULT NULL,
  `handler` varchar(2) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `record_stat` varchar(1) DEFAULT 'O',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_students` */

insert  into `sdn_students`(`id`,`lead_id`,`category_id`,`title_id`,`student_code`,`student_no`,`first_name`,`last_name`,`khr_first_name`,`khr_last_name`,`gender`,`date_of_birth`,`registered_date`,`place_of_birth`,`phone_no`,`email`,`address`,`from_city_id`,`occupation_id`,`national_id`,`religion_id`,`langauge_id`,`ethnicity_id`,`national_no`,`passport_no`,`note`,`image_url`,`handler`,`campus_id`,`created_at`,`updated_at`,`status`,`record_stat`) values (2,1,1,NULL,NULL,'000001','SOPHAT','HENG','សុផាត','ហេង','M','1983-03-08','2016-02-06','','011716785','','',NULL,1,1,1,1,1,'','','','resources/images/photo/no-picture.gif','TC',1,'2016-02-06 11:09:32','2016-02-06 11:09:41','A','O'),(3,2,NULL,NULL,NULL,'000002','Monydara','Sary','មុនីដារ៉ា','សារី','M','2016-02-06',NULL,'','234234','','',NULL,NULL,NULL,NULL,NULL,NULL,'','','','resources/images/photo/no-picture.gif','WU',1,'2016-02-06 11:25:13','2016-02-24 01:00:49','A','O'),(4,3,1,NULL,NULL,'000003','Channa','Ly','Channa','Ly','M','2016-02-24',NULL,'','32423423','','',NULL,1,1,1,1,1,'','','','resources/images/photo/no-picture.gif','',1,'2016-02-24 01:03:57','2016-02-24 01:05:07','A','O');

/*Table structure for table `sdn_suspend_types` */

DROP TABLE IF EXISTS `sdn_suspend_types`;

CREATE TABLE `sdn_suspend_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sdn_suspend_types` */

insert  into `sdn_suspend_types`(`id`,`code`,`name`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'001','Busy with Job','',0,'2015-05-14 06:58:05','2015-05-14 07:26:10'),(2,'002','On mission','',0,'2015-05-14 06:58:50','2015-05-14 06:59:47'),(3,'003','Testing','',1,'2015-05-14 07:03:16','2015-05-14 07:11:43');

/*Table structure for table `sys_menus` */

DROP TABLE IF EXISTS `sys_menus`;

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

/*Data for the table `sys_menus` */

insert  into `sys_menus`(`id`,`name`,`description`,`module`,`group`,`url`,`action`,`order_val`,`created_at`,`updated_at`,`shortcut_id`) values (1,'Registration','Student Registration','Student','Admin','resources/images/icons/student/register.png','Lead',1,NULL,NULL,1),(2,'T.C Admission','Admission for Training Center','Student','Admin','resources/images/icons/student/add.png','Admission',2,NULL,NULL,1),(3,'W.U Admission','Admission for Western University','Student','Admin','resources/images/icons/student/add.png','AdmissionWU',3,NULL,NULL,1),(4,'Student Detail','Detail information of student','Student','Admin','resources/images/icons/student/detail.png','Student',4,NULL,NULL,1),(5,'W.U Promotion','Promote or Demote students to another class','Student','Admin','resources/images/icons/academic/book.png','StudentPromoteWU',6,NULL,NULL,1),(7,'T.C Class Members','FY Admission (High Diploma, Associate, Bachelor)','Student','Admin','resources/images/icons/student/Attendancereg.png','ClassEnrollment',4,NULL,NULL,1),(8,'T.C Promotion','Promote or Demote students to another class','Student','Admin','resources/images/icons/student/up.png','StudentPromote',5,NULL,NULL,1),(9,'Student Category','Student classification','Student','Admin','resources/images/icons/student/Attendancereg.png','StudentCategory',8,NULL,NULL,1),(10,'Drop Reason','Reason use when student drop','Student','Admin','resources/images/icons/student/Attendancereg.png','DropType',9,NULL,NULL,1),(11,'Supsend Reason','The reaseon use when student suspend','Student','Admin','resources/images/icons/student/Attendancereg.png','SuspendType',11,NULL,NULL,1),(16,'City',NULL,'Student',NULL,'resources/images/icons/setting/setup.png','CityState',12,NULL,NULL,1),(17,'W.U Class Members',NULL,'Student',NULL,'resources/images/icons/student/Attendancereg.png','ClassEnrollmentWU',4,NULL,NULL,1),(100,'Courses',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','Course',5,NULL,NULL,2),(101,'Faculties',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','Faculty',6,NULL,NULL,2),(102,'Majors',NULL,'Academic',NULL,'resources/images/icons/academic/skills.png','Major',3,NULL,NULL,2),(103,'Subjects',NULL,'Academic',NULL,'resources/images/icons/academic/subject.png','Subject',4,NULL,NULL,2),(104,'Batches',NULL,'Academic',NULL,'resources/images/icons/academic/batch.png','Batch',1,NULL,NULL,2),(105,'Academic Years',NULL,'Academic',NULL,'resources/images/icons/academic/year.png','AcademicYear',2,NULL,NULL,2),(106,'TC Classes',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','ClassTC',14,NULL,NULL,2),(107,'WU Classes',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','Class',15,NULL,NULL,2),(108,'Standards',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','Standard',8,NULL,NULL,2),(109,'Divisions',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','Division',9,NULL,NULL,2),(110,'Rooms',NULL,'Academic',NULL,'resources/images/icons/academic/room.png','Room',10,NULL,NULL,2),(112,'TC Level',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','LevelTC',11,NULL,NULL,2),(113,'TC Level Type',NULL,'Academic',NULL,'resources/images/icons/academic/Class.png','LevelType',12,NULL,NULL,2),(115,'Course Setup',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','CourseSetup',14,NULL,NULL,2),(116,'Faculty Setup',NULL,'Academic',NULL,'resources/images/icons/academic/book.png','FacultySetup',7,NULL,NULL,2),(200,'Prepaid List',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Prepaid',1,NULL,NULL,3),(201,'Account Master',NULL,'Account',NULL,'resources/images/icons/account/cash.png','AccountMaster',2,NULL,NULL,3),(202,'Invoicing',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Invoicing',3,NULL,NULL,3),(203,'Open Cash Drawer',NULL,'Account',NULL,'resources/images/icons/account/cash.png','OpenCashDrawer',4,NULL,NULL,3),(204,'Payment',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Payment',5,NULL,NULL,3),(205,'Close Cash Drawer',NULL,'Account',NULL,'resources/images/icons/account/cash.png','CloseCashDrawer',6,NULL,NULL,3),(206,'AR Monitor',NULL,'Account',NULL,'resources/images/icons/account/monitor.png','ARMonitor',8,NULL,NULL,3),(207,'Group Accounts',NULL,'Account',NULL,'resources/images/icons/account/policy.png','GroupAccount',7,NULL,NULL,3),(208,'Receipt',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Receipt',6,NULL,NULL,3),(220,'Fee Plan Cataloque',NULL,'Account',NULL,'resources/images/icons/account/product.png','TuitionFee',11,NULL,NULL,3),(221,'Discount Items',NULL,'Account',NULL,'resources/images/icons/account/discount.png','DiscountItemC',12,NULL,NULL,3),(222,'Charge Items',NULL,'Account',NULL,'resources/images/icons/account/promotion.png','ChargeItemC',13,NULL,NULL,3),(223,'Tax Rate',NULL,'Account',NULL,'resources/images/icons/account/cash.png','TaxRate',14,NULL,NULL,3),(224,'Currencies',NULL,'Account',NULL,'resources/images/icons/account/cash.png','Currency',15,NULL,NULL,3),(225,'Key Account',NULL,'Account',NULL,'resources/images/icons/hr/employee.png','KeyAccount',16,NULL,NULL,3),(226,'AR Policies',NULL,'Account',NULL,'resources/images/icons/account/policy.png','ArPolicy',17,NULL,NULL,3),(227,'Cash Drawer Rules',NULL,'Account',NULL,'resources/images/icons/account/cash.png','CashDrawerManager',18,NULL,NULL,3),(300,'Employee Profile',NULL,'HR',NULL,'resources/images/icons/hr/employee.png','Employee',1,NULL,NULL,6),(301,'Department',NULL,'HR',NULL,'resources/images/icons/hr/department.png','Department',2,NULL,NULL,6),(302,'Positon',NULL,'HR',NULL,'resources/images/icons/hr/position.png','Position',3,NULL,NULL,6),(303,'Employee Level',NULL,'HR',NULL,'resources/images/icons/hr/employee.png','EmployeeLevel',4,NULL,NULL,6),(305,'Holiday',NULL,'HR',NULL,'resources/images/icons/setting/holiday.png','Holiday',6,NULL,NULL,6),(306,'Employee Shift',NULL,'HR',NULL,'resources/images/icons/hr/shift.png','Shift',7,NULL,NULL,6),(400,'Lanuage',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Langauge',NULL,NULL,NULL,7),(401,'Ethnicity',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Ethnicity',NULL,NULL,NULL,7),(402,'Nationalty',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Nationality',NULL,NULL,NULL,7),(403,'Occupation',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Occupation',NULL,NULL,NULL,7),(404,'Religion',NULL,'Admin',NULL,'resources/images/icons/setting/setup.png','Religion',NULL,NULL,NULL,7),(405,'User Manager',NULL,'Admin',NULL,'resources/images/icons/system/user.png','User',0,NULL,NULL,7),(406,'Roles',NULL,'Admin',NULL,'resources/images/icons/system/key.png','Role',1,NULL,NULL,7),(407,'Campuses',NULL,'Admin',NULL,'resources/images/icons/system/home.png','Campus',3,NULL,NULL,7),(408,'Login History',NULL,'Admin',NULL,'resources/images/icons/system/history.png',NULL,4,NULL,NULL,7),(409,'Users History',NULL,'Admin',NULL,'resources/images/icons/system/history.png',NULL,5,NULL,NULL,7),(410,'System History',NULL,'Admin',NULL,'resources/images/icons/system/history.png',NULL,6,NULL,NULL,7),(411,'Privileges',NULL,'Admin',NULL,'resources/images/icons/system/key.png','Privilege',2,NULL,NULL,7);

/*Table structure for table `sys_role_shortcuts` */

DROP TABLE IF EXISTS `sys_role_shortcuts`;

CREATE TABLE `sys_role_shortcuts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortcut_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_shortcuts` */

insert  into `sys_role_shortcuts`(`id`,`shortcut_id`,`role_id`,`created_at`,`updated_at`) values (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(5,5,1,NULL,NULL),(6,6,1,NULL,NULL),(7,7,1,NULL,NULL),(8,1,14,'2015-08-23 08:00:19','2015-08-23 08:00:19'),(9,2,14,'2015-08-23 08:00:19','2015-08-23 08:00:19'),(10,1,15,'2015-09-14 06:35:20','2015-09-14 06:35:20'),(11,2,15,'2015-09-14 06:35:20','2015-09-14 06:35:20'),(12,7,15,'2015-09-14 06:35:20','2015-09-14 06:35:20'),(13,8,1,'2015-09-21 03:49:39','2015-09-21 03:49:39'),(14,7,14,'2015-11-02 04:40:33','2015-11-02 04:40:33'),(15,1,16,'2015-12-03 02:38:02','2015-12-03 02:38:02'),(16,2,16,'2015-12-03 02:38:02','2015-12-03 02:38:02'),(17,7,16,'2015-12-03 02:38:02','2015-12-03 02:38:02'),(18,1,17,'2015-12-03 02:54:44','2015-12-03 02:54:44'),(19,2,17,'2015-12-03 02:54:44','2015-12-03 02:54:44'),(20,7,17,'2015-12-03 02:54:44','2015-12-03 02:54:44'),(21,5,17,'2015-12-03 02:54:44','2015-12-03 02:54:44'),(22,6,17,'2015-12-03 03:28:23','2015-12-03 03:28:23'),(23,6,16,'2015-12-03 03:29:39','2015-12-03 03:29:39'),(24,1,18,'2015-12-06 06:11:04','2015-12-06 06:11:04'),(25,3,18,'2015-12-06 06:11:04','2015-12-06 06:11:04'),(26,2,18,'2015-12-06 06:11:04','2015-12-06 06:11:04'),(27,6,18,'2015-12-06 06:11:04','2015-12-06 06:11:04'),(28,7,18,'2015-12-06 06:11:04','2015-12-06 06:11:04');

/*Table structure for table `sys_role_users` */

DROP TABLE IF EXISTS `sys_role_users`;

CREATE TABLE `sys_role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_users` */

insert  into `sys_role_users`(`id`,`role_id`,`user_id`,`created_at`,`updated_at`) values (1,1,1,NULL,NULL),(12,15,3,'2015-09-14 06:41:32','2015-09-14 06:41:32'),(13,15,4,'2015-09-14 06:42:30','2015-09-14 06:42:30'),(14,15,5,'2015-09-14 06:43:30','2015-09-14 06:43:30'),(15,1,3,'2015-11-02 03:02:04','2015-11-02 03:02:04'),(16,16,6,'2015-12-03 02:48:12','2015-12-03 02:48:12'),(17,17,7,'2015-12-03 03:05:08','2015-12-03 03:05:08'),(18,17,8,'2015-12-03 03:53:55','2015-12-03 03:53:55'),(19,17,9,'2015-12-03 03:55:29','2015-12-03 03:55:29'),(20,16,10,'2015-12-03 03:56:43','2015-12-03 03:56:43'),(21,18,11,'2015-12-06 06:18:30','2015-12-06 06:18:30'),(22,18,12,'2015-12-06 06:19:54','2015-12-06 06:19:54'),(23,18,13,'2015-12-06 06:21:14','2015-12-06 06:21:14'),(24,18,14,'2015-12-06 07:13:58','2015-12-06 07:13:58'),(25,18,15,'2015-12-06 07:15:49','2015-12-06 07:15:49'),(26,18,16,'2015-12-06 07:17:30','2015-12-06 07:17:30');

/*Table structure for table `sys_roles` */

DROP TABLE IF EXISTS `sys_roles`;

CREATE TABLE `sys_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `sys_roles` */

insert  into `sys_roles`(`id`,`code`,`name`,`description`,`is_deleted`,`created_at`,`updated_at`) values (1,'R001','Admin','Role ',0,NULL,'2015-06-17 14:21:33'),(14,'FYOFF','Foundation Year Officer','Role for officer of foundation year',0,'2015-06-20 12:20:07','2015-06-20 12:20:07'),(15,'GEPMNG','GEP Manager','',0,'2015-09-14 06:35:20','2015-09-14 06:35:20'),(16,'TCROLE','T.C. Role','Role for training center (GEP)',0,'2015-12-03 02:38:02','2015-12-03 02:38:02'),(17,'WU01','University Role for Head Department','',0,'2015-12-03 02:54:44','2015-12-03 02:55:05'),(18,'AUDT01','Auditor Role','Role for Auditor team',0,'2015-12-06 06:11:04','2015-12-06 06:11:04');

/*Table structure for table `sys_shortcut_menus` */

DROP TABLE IF EXISTS `sys_shortcut_menus`;

CREATE TABLE `sys_shortcut_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortcut_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

/*Data for the table `sys_shortcut_menus` */

insert  into `sys_shortcut_menus`(`id`,`shortcut_id`,`role_id`,`menu_id`,`created_at`,`updated_at`) values (1,1,14,NULL,'2015-08-23 08:00:58','2015-08-23 08:00:58'),(4,1,14,16,'2015-08-23 08:01:16','2015-08-23 08:01:16'),(8,1,14,1,'2015-08-23 08:01:16','2015-08-23 08:01:16'),(18,2,14,NULL,'2015-08-23 08:03:06','2015-08-23 08:03:06'),(19,2,14,107,'2015-08-23 08:03:46','2015-08-23 08:03:46'),(20,2,14,113,'2015-08-23 08:03:46','2015-08-23 08:03:46'),(21,2,14,112,'2015-08-23 08:03:46','2015-08-23 08:03:46'),(22,2,14,106,'2015-08-23 08:03:46','2015-08-23 08:03:46'),(23,2,14,115,'2015-08-23 08:03:46','2015-08-23 08:03:46'),(24,2,14,104,'2015-08-23 08:03:46','2015-08-23 08:03:46'),(25,2,14,105,'2015-08-23 08:03:46','2015-08-23 08:03:46'),(26,1,15,NULL,'2015-09-14 06:35:50','2015-09-14 06:35:50'),(27,1,15,1,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(28,1,15,2,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(30,1,15,4,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(31,1,15,6,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(32,1,15,7,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(34,1,15,9,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(37,1,15,12,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(41,1,15,16,'2015-09-14 06:36:02','2015-09-14 06:36:02'),(44,2,15,100,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(45,2,15,102,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(46,2,15,103,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(48,2,15,105,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(49,2,15,106,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(50,2,15,110,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(51,2,15,112,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(52,2,15,113,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(53,2,15,115,'2015-09-14 06:38:17','2015-09-14 06:38:17'),(54,7,15,400,'2015-09-14 06:39:56','2015-09-14 06:39:56'),(55,7,15,401,'2015-09-14 06:39:56','2015-09-14 06:39:56'),(56,7,15,402,'2015-09-14 06:39:56','2015-09-14 06:39:56'),(57,7,15,403,'2015-09-14 06:39:56','2015-09-14 06:39:56'),(58,7,15,404,'2015-09-14 06:39:56','2015-09-14 06:39:56'),(59,7,15,NULL,'2015-11-02 04:20:40','2015-11-02 04:20:40'),(60,7,15,NULL,'2015-11-02 04:20:40','2015-11-02 04:20:40'),(61,7,15,NULL,'2015-11-02 04:20:51','2015-11-02 04:20:51'),(62,7,15,405,'2015-11-02 04:21:25','2015-11-02 04:21:25'),(63,7,15,406,'2015-11-02 04:21:25','2015-11-02 04:21:25'),(64,7,15,407,'2015-11-02 04:21:25','2015-11-02 04:21:25'),(65,7,15,408,'2015-11-02 04:21:25','2015-11-02 04:21:25'),(66,7,15,409,'2015-11-02 04:21:25','2015-11-02 04:21:25'),(67,7,15,410,'2015-11-02 04:21:25','2015-11-02 04:21:25'),(68,7,15,411,'2015-11-02 04:21:25','2015-11-02 04:21:25'),(69,2,15,104,'2015-11-02 04:39:42','2015-11-02 04:39:42'),(70,7,14,400,'2015-11-02 04:42:49','2015-11-02 04:42:49'),(71,7,14,401,'2015-11-02 04:42:59','2015-11-02 04:42:59'),(72,7,14,402,'2015-11-02 04:42:59','2015-11-02 04:42:59'),(73,7,14,403,'2015-11-02 04:43:51','2015-11-02 04:43:51'),(74,7,14,404,'2015-11-02 04:43:51','2015-11-02 04:43:51'),(81,7,14,411,'2015-11-02 04:43:51','2015-11-02 04:43:51'),(82,1,1,1,'2015-11-03 08:21:27','2015-11-03 08:21:27'),(83,1,1,2,'2015-11-03 08:21:27','2015-11-03 08:21:27'),(84,2,1,NULL,'2015-11-20 05:53:47','2015-11-20 05:53:47'),(85,1,16,1,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(86,1,16,2,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(87,1,16,4,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(88,1,16,7,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(89,1,16,8,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(90,1,16,9,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(91,1,16,10,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(92,1,16,11,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(93,1,16,16,'2015-12-03 02:39:47','2015-12-03 02:39:47'),(94,2,16,100,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(95,2,16,102,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(96,2,16,103,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(97,2,16,105,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(98,2,16,106,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(99,2,16,112,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(100,2,16,113,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(101,2,16,115,'2015-12-03 02:41:33','2015-12-03 02:41:33'),(102,7,16,400,'2015-12-03 02:42:38','2015-12-03 02:42:38'),(103,7,16,401,'2015-12-03 02:42:38','2015-12-03 02:42:38'),(104,7,16,402,'2015-12-03 02:42:38','2015-12-03 02:42:38'),(105,7,16,403,'2015-12-03 02:42:38','2015-12-03 02:42:38'),(106,7,16,404,'2015-12-03 02:42:38','2015-12-03 02:42:38'),(107,1,17,1,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(108,1,17,3,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(109,1,17,4,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(110,1,17,5,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(111,1,17,9,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(112,1,17,10,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(113,1,17,11,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(114,1,17,16,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(115,1,17,17,'2015-12-03 02:56:05','2015-12-03 02:56:05'),(116,2,17,101,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(117,2,17,102,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(118,2,17,103,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(119,2,17,104,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(120,2,17,105,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(121,2,17,107,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(122,2,17,108,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(123,2,17,109,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(124,2,17,110,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(125,2,17,116,'2015-12-03 02:56:51','2015-12-03 02:56:51'),(126,7,17,400,'2015-12-03 02:57:42','2015-12-03 02:57:42'),(127,7,17,401,'2015-12-03 02:57:42','2015-12-03 02:57:42'),(128,7,17,402,'2015-12-03 02:57:42','2015-12-03 02:57:42'),(129,7,17,403,'2015-12-03 02:57:42','2015-12-03 02:57:42'),(130,7,17,404,'2015-12-03 02:57:42','2015-12-03 02:57:42'),(131,6,17,300,'2015-12-03 03:29:16','2015-12-03 03:29:16'),(132,6,17,301,'2015-12-03 03:29:16','2015-12-03 03:29:16'),(133,6,17,302,'2015-12-03 03:29:16','2015-12-03 03:29:16'),(134,6,17,303,'2015-12-03 03:29:16','2015-12-03 03:29:16'),(135,6,17,306,'2015-12-03 03:29:16','2015-12-03 03:29:16'),(136,6,16,300,'2015-12-03 03:29:53','2015-12-03 03:29:53'),(137,6,16,301,'2015-12-03 03:29:53','2015-12-03 03:29:53'),(138,6,16,302,'2015-12-03 03:29:53','2015-12-03 03:29:53'),(139,6,16,303,'2015-12-03 03:29:53','2015-12-03 03:29:53'),(140,6,16,306,'2015-12-03 03:29:53','2015-12-03 03:29:53'),(141,1,18,1,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(142,1,18,2,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(143,1,18,3,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(144,1,18,4,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(145,1,18,5,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(146,1,18,7,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(147,1,18,8,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(148,1,18,9,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(149,1,18,10,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(150,1,18,11,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(151,1,18,16,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(152,1,18,17,'2015-12-06 06:11:51','2015-12-06 06:11:51'),(153,2,18,100,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(154,2,18,101,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(155,2,18,102,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(156,2,18,103,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(157,2,18,104,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(158,2,18,105,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(159,2,18,106,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(160,2,18,107,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(161,2,18,108,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(162,2,18,109,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(163,2,18,110,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(164,2,18,112,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(165,2,18,113,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(166,2,18,115,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(167,2,18,116,'2015-12-06 06:12:02','2015-12-06 06:12:02'),(168,6,18,300,'2015-12-06 06:12:17','2015-12-06 06:12:17'),(169,6,18,301,'2015-12-06 06:12:17','2015-12-06 06:12:17'),(170,6,18,302,'2015-12-06 06:12:17','2015-12-06 06:12:17'),(171,6,18,303,'2015-12-06 06:12:17','2015-12-06 06:12:17'),(172,6,18,306,'2015-12-06 06:12:17','2015-12-06 06:12:17'),(173,7,18,400,'2015-12-06 06:12:36','2015-12-06 06:12:36'),(174,7,18,401,'2015-12-06 06:12:36','2015-12-06 06:12:36'),(175,7,18,402,'2015-12-06 06:12:36','2015-12-06 06:12:36'),(176,7,18,403,'2015-12-06 06:12:36','2015-12-06 06:12:36'),(177,7,18,404,'2015-12-06 06:12:36','2015-12-06 06:12:36');

/*Table structure for table `sys_shortcuts` */

DROP TABLE IF EXISTS `sys_shortcuts`;

CREATE TABLE `sys_shortcuts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `iconCls` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `modules` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sys_shortcuts` */

insert  into `sys_shortcuts`(`id`,`name`,`iconCls`,`module`,`modules`,`created_at`,`updated_at`) values (1,'Student','student-shortcut','student-win','ExtDesktop.view.module.student',NULL,NULL),(2,'Academic','academic','acad-win','ExtDesktop.view.module.acad',NULL,NULL),(3,'Accounting','accounting','account-win','ExtDesktop.view.module.account',NULL,NULL),(6,'Human Resource','academic','hr-win','ExtDesktop.view.module.hr',NULL,NULL),(7,'Setting','setting_application','admin-win','ExtDesktop.view.module.admin',NULL,NULL);

/*Table structure for table `sys_user_campus` */

DROP TABLE IF EXISTS `sys_user_campus`;

CREATE TABLE `sys_user_campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_user_id` int(11) DEFAULT NULL,
  `gen_campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `sys_user_campus` */

insert  into `sys_user_campus`(`id`,`sys_user_id`,`gen_campus_id`,`created_at`,`updated_at`) values (1,1,1,'2015-03-03 14:08:07','2015-03-03 14:08:07');

/*Table structure for table `sys_user_degrees` */

DROP TABLE IF EXISTS `sys_user_degrees`;

CREATE TABLE `sys_user_degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_degrees` */

insert  into `sys_user_degrees`(`id`,`user_id`,`degree_id`,`created_at`,`updated_at`) values (2,1,4,'2015-06-12 14:50:23','2015-06-12 14:50:23'),(3,1,1,'2015-11-04 07:01:40','2015-11-04 07:01:40'),(4,1,2,'2015-11-04 07:01:40','2015-11-04 07:01:40'),(5,1,3,'2015-11-04 07:01:40','2015-11-04 07:01:40'),(6,6,1,'2015-12-03 02:48:12','2015-12-03 02:48:12'),(7,6,2,'2015-12-03 02:48:12','2015-12-03 02:48:12'),(8,8,3,'2015-12-03 03:53:55','2015-12-03 03:53:55'),(9,8,4,'2015-12-03 03:53:55','2015-12-03 03:53:55'),(10,10,1,'2015-12-03 03:56:43','2015-12-03 03:56:43'),(11,10,2,'2015-12-03 03:56:43','2015-12-03 03:56:43'),(12,11,1,'2015-12-06 06:18:30','2015-12-06 06:18:30'),(13,11,2,'2015-12-06 06:18:30','2015-12-06 06:18:30'),(14,11,3,'2015-12-06 06:18:30','2015-12-06 06:18:30'),(15,11,4,'2015-12-06 06:18:30','2015-12-06 06:18:30'),(16,11,5,'2015-12-06 06:18:30','2015-12-06 06:18:30'),(17,11,6,'2015-12-06 06:18:30','2015-12-06 06:18:30'),(18,12,1,'2015-12-06 06:19:54','2015-12-06 06:19:54'),(19,12,2,'2015-12-06 06:19:54','2015-12-06 06:19:54'),(20,12,3,'2015-12-06 06:19:54','2015-12-06 06:19:54'),(21,12,4,'2015-12-06 06:19:54','2015-12-06 06:19:54'),(22,12,5,'2015-12-06 06:19:54','2015-12-06 06:19:54'),(23,12,6,'2015-12-06 06:19:54','2015-12-06 06:19:54'),(24,13,1,'2015-12-06 06:21:14','2015-12-06 06:21:14'),(25,13,2,'2015-12-06 06:21:14','2015-12-06 06:21:14'),(26,13,3,'2015-12-06 06:21:14','2015-12-06 06:21:14'),(27,13,4,'2015-12-06 06:21:14','2015-12-06 06:21:14'),(28,13,5,'2015-12-06 06:21:14','2015-12-06 06:21:14'),(29,13,6,'2015-12-06 06:21:14','2015-12-06 06:21:14'),(30,14,1,'2015-12-06 07:13:58','2015-12-06 07:13:58'),(31,14,2,'2015-12-06 07:13:58','2015-12-06 07:13:58'),(32,14,3,'2015-12-06 07:13:58','2015-12-06 07:13:58'),(33,14,4,'2015-12-06 07:13:58','2015-12-06 07:13:58'),(34,14,5,'2015-12-06 07:13:58','2015-12-06 07:13:58'),(35,14,6,'2015-12-06 07:13:58','2015-12-06 07:13:58'),(36,15,1,'2015-12-06 07:15:49','2015-12-06 07:15:49'),(37,15,2,'2015-12-06 07:15:49','2015-12-06 07:15:49'),(38,15,3,'2015-12-06 07:15:49','2015-12-06 07:15:49'),(39,15,4,'2015-12-06 07:15:49','2015-12-06 07:15:49'),(40,15,5,'2015-12-06 07:15:49','2015-12-06 07:15:49'),(41,15,6,'2015-12-06 07:15:49','2015-12-06 07:15:49'),(42,16,6,'2015-12-06 07:17:30','2015-12-06 07:17:30'),(43,16,5,'2015-12-06 07:17:30','2015-12-06 07:17:30'),(44,16,4,'2015-12-06 07:17:30','2015-12-06 07:17:30'),(45,16,3,'2015-12-06 07:17:30','2015-12-06 07:17:30'),(46,16,2,'2015-12-06 07:17:30','2015-12-06 07:17:30'),(47,16,1,'2015-12-06 07:17:30','2015-12-06 07:17:30');

/*Table structure for table `sys_user_locations` */

DROP TABLE IF EXISTS `sys_user_locations`;

CREATE TABLE `sys_user_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_locations` */

insert  into `sys_user_locations`(`id`,`user_id`,`campus_id`,`created_at`,`updated_at`) values (2,1,2,'2015-06-12 14:15:30','2015-06-12 14:15:30'),(3,5,2,'2015-11-04 07:01:20','2015-11-04 07:01:20');

/*Table structure for table `sys_user_shortcuts` */

DROP TABLE IF EXISTS `sys_user_shortcuts`;

CREATE TABLE `sys_user_shortcuts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shortcut_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_shortcuts` */

insert  into `sys_user_shortcuts`(`id`,`user_id`,`shortcut_id`,`created_at`,`updated_at`) values (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,6,NULL,NULL),(7,1,7,NULL,NULL);

/*Table structure for table `sys_users` */

DROP TABLE IF EXISTS `sys_users`;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `sys_users` */

insert  into `sys_users`(`id`,`user_id`,`user_name`,`encrypted_password`,`hr_position_id`,`hr_department_id`,`address`,`phone`,`email`,`description`,`status_id`,`created_at`,`updated_at`,`user_type`,`start_date`,`home_campus_id`) values (1,'admin','administrator','lC+HI813oC0JPEVWB73TgQ==\n',1,1,'sfdsfsdfds','07888561565','mdarait@gmail.com','test description',29,'2015-06-07 15:23:03','2015-11-02 03:02:37','Admin','2015-06-07',1),(3,'G001','GEP User 1','YlcdjnT+BsaWI/nIxhQjjA==\n',11,8,'#123, St E, PP','011716785','sophat.live@gmail.com','',29,'2015-09-14 06:41:32','2015-11-02 03:01:54','Admin','2015-09-14',1),(4,'G002','GEP User 2','YlcdjnT+BsaWI/nIxhQjjA==\n',11,8,'','','','',29,'2015-09-14 06:42:30','2015-09-14 06:42:30','Admin','2015-09-14',1),(5,'G003','GEP User 3','YlcdjnT+BsaWI/nIxhQjjA==\n',11,8,'','','','',29,'2015-09-14 06:43:30','2015-09-14 06:43:30','Admin','2015-09-14',1),(6,'TC01','TC 01','YlcdjnT+BsaWI/nIxhQjjA==\n',11,8,'','','','',29,'2015-12-03 02:48:12','2015-12-03 02:48:12','Staff','2015-12-03',1),(7,'RG001','WU01','YlcdjnT+BsaWI/nIxhQjjA==\n',15,10,'','','','',29,'2015-12-03 03:05:08','2015-12-03 03:05:08','Staff','2015-12-04',1),(8,'WU02','RG002','YlcdjnT+BsaWI/nIxhQjjA==\n',9,10,'','','','',29,'2015-12-03 03:53:55','2015-12-03 03:53:55','Staff','2015-12-03',1),(9,'WU01','WU01','YlcdjnT+BsaWI/nIxhQjjA==\n',9,10,'','','','',29,'2015-12-03 03:55:29','2015-12-03 03:55:29','Staff','2015-12-03',1),(10,'TC02','TC02','YlcdjnT+BsaWI/nIxhQjjA==\n',11,8,'','','','',29,'2015-12-03 03:56:43','2015-12-03 03:56:43','Staff','2015-12-03',1),(11,'AU01','Meas Phidochampa','YlcdjnT+BsaWI/nIxhQjjA==\n',16,11,'','','','',29,'2015-12-06 06:18:30','2015-12-06 07:12:15','Admin','2015-12-06',1),(12,'AU02','HORM SITHA','YlcdjnT+BsaWI/nIxhQjjA==\n',17,11,'','','','',29,'2015-12-06 06:19:54','2015-12-06 07:12:34','Staff','2015-12-06',1),(13,'AU03','CHHENG CHANDY','YlcdjnT+BsaWI/nIxhQjjA==\n',17,11,'','','','',29,'2015-12-06 06:21:14','2015-12-06 07:12:52','Staff','2015-12-06',1),(14,'AU04','YAN SOKHOUCH','YlcdjnT+BsaWI/nIxhQjjA==\n',17,11,'','','','',29,'2015-12-06 07:13:58','2015-12-06 07:13:58','Staff','2015-12-06',1),(15,'AU05','LIM SIVOUCH','YlcdjnT+BsaWI/nIxhQjjA==\n',17,11,'','','','',29,'2015-12-06 07:15:49','2015-12-06 07:15:49','Staff','2015-12-06',1),(16,'AU06','POV RATHA','YlcdjnT+BsaWI/nIxhQjjA==\n',17,11,'','','','',29,'2015-12-06 07:17:30','2015-12-06 07:17:30','Staff','2015-12-06',1);

/*Table structure for table `vw_account_detail` */

DROP TABLE IF EXISTS `vw_account_detail`;

/*!50001 DROP VIEW IF EXISTS `vw_account_detail` */;
/*!50001 DROP TABLE IF EXISTS `vw_account_detail` */;

/*!50001 CREATE TABLE  `vw_account_detail`(
 `item_name` text ,
 `id` int(11) ,
 `account_id` int(11) ,
 `item_id` int(11) ,
 `item_type` varchar(1) ,
 `item_unit` varchar(1) ,
 `item_value` decimal(8,2) ,
 `is_recurring` tinyint(1) ,
 `recurring_val` int(11) ,
 `effective_date` date ,
 `expired_date` date ,
 `comments` text ,
 `is_deleted` tinyint(1) ,
 `status` varchar(1) ,
 `user_id` int(11) ,
 `created_at` datetime ,
 `updated_at` datetime 
)*/;

/*View structure for view vw_account_detail */

/*!50001 DROP TABLE IF EXISTS `vw_account_detail` */;
/*!50001 DROP VIEW IF EXISTS `vw_account_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_account_detail` AS select (case when (`acd`.`item_type` = 'A') then `aci`.`item_name` when (`acd`.`item_type` = 'D') then `adit`.`item_name` when (`acd`.`item_type` = 'T') then `atr`.`description` else NULL end) AS `item_name`,`acd`.`id` AS `id`,`acd`.`account_id` AS `account_id`,`acd`.`item_id` AS `item_id`,`acd`.`item_type` AS `item_type`,`acd`.`item_unit` AS `item_unit`,`acd`.`item_value` AS `item_value`,`acd`.`is_recurring` AS `is_recurring`,`acd`.`recurring_val` AS `recurring_val`,`acd`.`effective_date` AS `effective_date`,`acd`.`expired_date` AS `expired_date`,`acd`.`comments` AS `comments`,`acd`.`is_deleted` AS `is_deleted`,`acd`.`status` AS `status`,`acd`.`user_id` AS `user_id`,`acd`.`created_at` AS `created_at`,`acd`.`updated_at` AS `updated_at` from ((((`acc_account_details` `acd` left join `acc_charge_items` `aci` on(((`aci`.`id` = `acd`.`item_id`) and (`acd`.`item_type` = 'A')))) left join `acc_tax_rates` `atr` on(((`atr`.`id` = `acd`.`item_id`) and (`acd`.`item_type` = 'T')))) left join `acc_discount_item_details` `adi` on(((`adi`.`id` = `acd`.`item_id`) and (`acd`.`item_type` = 'D')))) left join `acc_discount_items` `adit` on((`adit`.`id` = `adi`.`acc_discount_item_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
