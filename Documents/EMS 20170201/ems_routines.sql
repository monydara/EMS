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
-- Temporary view structure for view `vw_account_detail`
--

DROP TABLE IF EXISTS `vw_account_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_account_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_account_detail` AS SELECT 
 1 AS `item_name`,
 1 AS `id`,
 1 AS `account_id`,
 1 AS `item_id`,
 1 AS `item_type`,
 1 AS `item_unit`,
 1 AS `item_value`,
 1 AS `is_recurring`,
 1 AS `recurring_val`,
 1 AS `effective_date`,
 1 AS `expired_date`,
 1 AS `comments`,
 1 AS `is_deleted`,
 1 AS `status`,
 1 AS `user_id`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_account_detail`
--

/*!50001 DROP VIEW IF EXISTS `vw_account_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_detail` AS select (case when (`acd`.`item_type` = 'A') then `aci`.`item_name` when (`acd`.`item_type` = 'D') then `adit`.`item_name` when (`acd`.`item_type` = 'T') then `atr`.`description` else NULL end) AS `item_name`,`acd`.`id` AS `id`,`acd`.`account_id` AS `account_id`,`acd`.`item_id` AS `item_id`,`acd`.`item_type` AS `item_type`,`acd`.`item_unit` AS `item_unit`,`acd`.`item_value` AS `item_value`,`acd`.`is_recurring` AS `is_recurring`,`acd`.`recurring_val` AS `recurring_val`,`acd`.`effective_date` AS `effective_date`,`acd`.`expired_date` AS `expired_date`,`acd`.`comments` AS `comments`,`acd`.`is_deleted` AS `is_deleted`,`acd`.`status` AS `status`,`acd`.`user_id` AS `user_id`,`acd`.`created_at` AS `created_at`,`acd`.`updated_at` AS `updated_at` from ((((`acc_account_details` `acd` left join `acc_charge_items` `aci` on(((`aci`.`id` = `acd`.`item_id`) and (`acd`.`item_type` = 'A')))) left join `acc_tax_rates` `atr` on(((`atr`.`id` = `acd`.`item_id`) and (`acd`.`item_type` = 'T')))) left join `acc_discount_item_details` `adi` on(((`adi`.`id` = `acd`.`item_id`) and (`acd`.`item_type` = 'D')))) left join `acc_discount_items` `adit` on((`adit`.`id` = `adi`.`acc_discount_item_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 13:45:49
