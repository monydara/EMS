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
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,1,'AccReceiptDetail',1,'AccReceipt',NULL,NULL,NULL,'create','---\nreceipt_id: 1\nitem_type: C\nitem_id: 1\namount: !ruby/object:BigDecimal 18:0.5E2\ndescription: \'\'\nitem_name: Official Charge\nitem_unit: A\n',1,NULL,'127.0.0.1','48b1e83e-6b20-48ce-ba94-a1ed9354a011','2016-02-26 04:55:09'),(2,1,'AccReceipt',NULL,NULL,NULL,NULL,NULL,'create','---\nreceipt_date: 2016-02-26\nreceipt_no: \'\'\nreceipt_type: \'\'\nref_type: L\npayer_name: Monydara Sary\nref_id: 2\nusd_amount: !ruby/object:BigDecimal 18:0.5E2\nkhr_amount: !ruby/object:BigDecimal 18:0.0\ncharges_amount: !ruby/object:BigDecimal 18:0.5E2\ndiscount_amount: !ruby/object:BigDecimal 18:0.0\nremark: \'\'\nis_paid: false\npaid_date: \nis_del: false\nreceipt_by_id: 1\ncampus_id: 1\n',1,NULL,'127.0.0.1','48b1e83e-6b20-48ce-ba94-a1ed9354a011','2016-02-26 04:55:09'),(3,1,'AccReceipt',NULL,NULL,NULL,NULL,NULL,'update','---\nis_del:\n- false\n- true\n',2,NULL,'127.0.0.1','4f8f3ea3-b03d-4e7e-a85b-2793faea6b0c','2016-02-26 05:03:28'),(4,2,'AccReceiptDetail',2,'AccReceipt',NULL,NULL,NULL,'create','---\nreceipt_id: 2\nitem_type: C\nitem_id: 3\namount: !ruby/object:BigDecimal 18:0.1E3\ndescription: \'\'\nitem_name: Pre-Payment\nitem_unit: A\n',1,NULL,'127.0.0.1','823aafd5-67c3-46da-9d12-b77613e0724b','2016-02-26 05:10:10'),(5,2,'AccReceipt',NULL,NULL,NULL,NULL,NULL,'create','---\nreceipt_date: 2016-02-26\nreceipt_no: \'\'\nreceipt_type: \'\'\nref_type: L\npayer_name: SOPHAT HENG\nref_id: 1\nusd_amount: !ruby/object:BigDecimal 18:0.1E3\nkhr_amount: !ruby/object:BigDecimal 18:0.0\ncharges_amount: !ruby/object:BigDecimal 18:0.1E3\ndiscount_amount: !ruby/object:BigDecimal 18:0.0\nremark: \'\'\nis_paid: false\npaid_date: \nis_del: false\nreceipt_by_id: 1\ncampus_id: 1\n',1,NULL,'127.0.0.1','823aafd5-67c3-46da-9d12-b77613e0724b','2016-02-26 05:10:10');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:38
