CREATE DATABASE  IF NOT EXISTS `btl` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `btl`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: btl
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `chain_count`
--

DROP TABLE IF EXISTS `chain_count`;
/*!50001 DROP VIEW IF EXISTS `chain_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chain_count` AS SELECT 
 1 AS `Place_Chain`,
 1 AS `Chain_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `btl_joined`
--

DROP TABLE IF EXISTS `btl_joined`;
/*!50001 DROP VIEW IF EXISTS `btl_joined`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `btl_joined` AS SELECT 
 1 AS `Place_ID`,
 1 AS `SAP_code`,
 1 AS `Place_Chain`,
 1 AS `Place_name`,
 1 AS `Region`,
 1 AS `Place_location`,
 1 AS `Place_pic`,
 1 AS `Place_status`,
 1 AS `Channel_ID`,
 1 AS `Channel_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gt_unit_count`
--

DROP TABLE IF EXISTS `gt_unit_count`;
/*!50001 DROP VIEW IF EXISTS `gt_unit_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gt_unit_count` AS SELECT 
 1 AS `Place_ID`,
 1 AS `Place_Chain`,
 1 AS `Place_name`,
 1 AS `Region`,
 1 AS `Unit_name`,
 1 AS `unit_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `abdo_db`
--

DROP TABLE IF EXISTS `abdo_db`;
/*!50001 DROP VIEW IF EXISTS `abdo_db`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `abdo_db` AS SELECT 
 1 AS `Place_ID`,
 1 AS `SAP_code`,
 1 AS `Place_Chain`,
 1 AS `Place_name`,
 1 AS `Region`,
 1 AS `Place_location`,
 1 AS `Place_pic`,
 1 AS `Place_status`,
 1 AS `Channel_ID`,
 1 AS `CDR`,
 1 AS `Guided_trial_tray`,
 1 AS `Terea_tray`,
 1 AS `Medium_device_tray`,
 1 AS `Large_device_tray`,
 1 AS `Digital_counter_unit`,
 1 AS `Unmanned`,
 1 AS `Counter_unit`,
 1 AS `D_FBW`,
 1 AS `FBW`,
 1 AS `IRR`,
 1 AS `IRR_L`,
 1 AS `NG_FBW`,
 1 AS `NG_HBW`,
 1 AS `NG_MBW`,
 1 AS `NG_IRR`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ka_unit_count`
--

DROP TABLE IF EXISTS `ka_unit_count`;
/*!50001 DROP VIEW IF EXISTS `ka_unit_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ka_unit_count` AS SELECT 
 1 AS `Place_ID`,
 1 AS `Place_Chain`,
 1 AS `Place_name`,
 1 AS `Region`,
 1 AS `Unit_name`,
 1 AS `unit_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `chain_count`
--

/*!50001 DROP VIEW IF EXISTS `chain_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chain_count` AS select `btl_joined`.`Place_Chain` AS `Place_Chain`,count(0) AS `Chain_Count` from `btl_joined` group by `btl_joined`.`Place_Chain` order by `btl_joined`.`Place_Chain` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `btl_joined`
--

/*!50001 DROP VIEW IF EXISTS `btl_joined`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `btl_joined` AS select `places`.`Place_ID` AS `Place_ID`,`places`.`SAP_code` AS `SAP_code`,`places`.`Place_Chain` AS `Place_Chain`,`places`.`Place_name` AS `Place_name`,`places`.`Region` AS `Region`,`places`.`Place_location` AS `Place_location`,`places`.`Place_pic` AS `Place_pic`,`places`.`Place_status` AS `Place_status`,`places`.`Channel_ID` AS `Channel_ID`,`channels`.`Channel_type` AS `Channel_type` from (`places` join `channels` on((`places`.`Channel_ID` = `channels`.`Channel_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gt_unit_count`
--

/*!50001 DROP VIEW IF EXISTS `gt_unit_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gt_unit_count` AS select `p`.`Place_ID` AS `Place_ID`,`p`.`Place_Chain` AS `Place_Chain`,`p`.`Place_name` AS `Place_name`,`p`.`Region` AS `Region`,`u`.`Unit_name` AS `Unit_name`,count(`pu`.`Unit_ID`) AS `unit_count` from ((`places` `p` join `gt_places_units` `pu` on((`pu`.`Place_ID` = `p`.`Place_ID`))) join `gt_units` `u` on((`pu`.`Unit_ID` = `u`.`Unit_ID`))) group by `p`.`Place_ID`,`p`.`Place_name`,`p`.`Region`,`u`.`Unit_name` order by `p`.`Place_name`,`unit_count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `abdo_db`
--

/*!50001 DROP VIEW IF EXISTS `abdo_db`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Ziad`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `abdo_db` AS select `p`.`Place_ID` AS `Place_ID`,`p`.`SAP_code` AS `SAP_code`,`p`.`Place_Chain` AS `Place_Chain`,`p`.`Place_name` AS `Place_name`,`p`.`Region` AS `Region`,`p`.`Place_location` AS `Place_location`,`p`.`Place_pic` AS `Place_pic`,`p`.`Place_status` AS `Place_status`,`p`.`Channel_ID` AS `Channel_ID`,`u`.`CDR` AS `CDR`,`u`.`Guided_trial_tray` AS `Guided_trial_tray`,`u`.`Terea_tray` AS `Terea_tray`,`u`.`Medium_device_tray` AS `Medium_device_tray`,`u`.`Large_device_tray` AS `Large_device_tray`,`u`.`Digital_counter_unit` AS `Digital_counter_unit`,`u`.`Unmanned` AS `Unmanned`,`u`.`Counter_unit` AS `Counter_unit`,`u`.`D_FBW` AS `D_FBW`,`u`.`FBW` AS `FBW`,`u`.`IRR` AS `IRR`,`u`.`IRR_L` AS `IRR_L`,`u`.`NG_FBW` AS `NG_FBW`,`u`.`NG_HBW` AS `NG_HBW`,`u`.`NG_MBW` AS `NG_MBW`,`u`.`NG_IRR` AS `NG_IRR` from (`places` `p` left join (select `pu`.`Place_ID` AS `Place_ID`,count((case when (`u`.`Unit_name` = 'CDR') then `u`.`Unit_ID` end)) AS `CDR`,count((case when (`u`.`Unit_name` = 'Guided trial tray') then `u`.`Unit_ID` end)) AS `Guided_trial_tray`,count((case when (`u`.`Unit_name` = 'Terea tray') then `u`.`Unit_ID` end)) AS `Terea_tray`,count((case when (`u`.`Unit_name` = 'Medium device tray') then `u`.`Unit_ID` end)) AS `Medium_device_tray`,count((case when (`u`.`Unit_name` = 'Large device tray') then `u`.`Unit_ID` end)) AS `Large_device_tray`,count((case when (`u`.`Unit_name` = 'Digital counter unit') then `u`.`Unit_ID` end)) AS `Digital_counter_unit`,count((case when (`u`.`Unit_name` = 'Unmanned') then `u`.`Unit_ID` end)) AS `Unmanned`,count((case when (`u`.`Unit_name` = 'Counter unit') then `u`.`Unit_ID` end)) AS `Counter_unit`,count((case when (`u`.`Unit_name` = 'D FBW') then `u`.`Unit_ID` end)) AS `D_FBW`,count((case when (`u`.`Unit_name` = 'FBW') then `u`.`Unit_ID` end)) AS `FBW`,count((case when (`u`.`Unit_name` = 'IRR') then `u`.`Unit_ID` end)) AS `IRR`,count((case when (`u`.`Unit_name` = 'IRR L') then `u`.`Unit_ID` end)) AS `IRR_L`,count((case when (`u`.`Unit_name` = 'NG FBW') then `u`.`Unit_ID` end)) AS `NG_FBW`,count((case when (`u`.`Unit_name` = 'NG HBW') then `u`.`Unit_ID` end)) AS `NG_HBW`,count((case when (`u`.`Unit_name` = 'NG MBW') then `u`.`Unit_ID` end)) AS `NG_MBW`,count((case when (`u`.`Unit_name` = 'NG IRR') then `u`.`Unit_ID` end)) AS `NG_IRR` from (`places_units` `pu` join `units` `u` on((`pu`.`Unit_ID` = `u`.`Unit_ID`))) group by `pu`.`Place_ID`) `u` on((`p`.`Place_ID` = `u`.`Place_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ka_unit_count`
--

/*!50001 DROP VIEW IF EXISTS `ka_unit_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ka_unit_count` AS select `p`.`Place_ID` AS `Place_ID`,`p`.`Place_Chain` AS `Place_Chain`,`p`.`Place_name` AS `Place_name`,`p`.`Region` AS `Region`,`u`.`Unit_name` AS `Unit_name`,count(`pu`.`Unit_ID`) AS `unit_count` from ((`places` `p` join `places_units` `pu` on((`pu`.`Place_ID` = `p`.`Place_ID`))) join `units` `u` on((`pu`.`Unit_ID` = `u`.`Unit_ID`))) group by `p`.`Place_ID`,`p`.`Place_name`,`p`.`Region`,`u`.`Unit_name` order by `p`.`Place_name`,`unit_count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'btl'
--
/*!50003 DROP PROCEDURE IF EXISTS `GenerateDynamicUnitCounts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateDynamicUnitCounts`()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE unit_name VARCHAR(100);
    
    -- Declare cursor to fetch all distinct unit names from the btl.units table
    DECLARE cur CURSOR FOR 
        SELECT DISTINCT Unit_name FROM btl.units;
    
    -- Continue handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Variable to store the dynamic SQL query
    SET @dynamic_sql = '
        CREATE VIEW dynamic_unit_counts AS
        SELECT
            p.Place_ID,
            p.SAP_code,
            p.Place_Chain,
            p.Place_name,
            p.Region,
            p.Place_location,
            p.Place_pic,
            p.Place_status,
            p.Channel_ID,
    ';
    
    -- Dynamic part of the SQL query (conditional aggregation)
    SET @dynamic_part = '';
    
    -- Open cursor
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO unit_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Adding conditional aggregation for the current unit name to the dynamic SQL query
        SET @dynamic_part = CONCAT(@dynamic_part, 
            'COUNT(CASE WHEN u.Unit_name = ''', unit_name, ''' THEN u.Unit_ID ELSE NULL END) AS ', REPLACE(unit_name, ' ', '_'), ', '
        );
    END LOOP;
    
    CLOSE cur;
    
    -- Removing the trailing comma and space from dynamic_part
    SET @dynamic_part = SUBSTRING(@dynamic_part, 1, LENGTH(@dynamic_part) - 2);
    
    -- Concatenating dynamic_part to the dynamic SQL query
    SET @dynamic_sql = CONCAT(@dynamic_sql, @dynamic_part);
    
    -- Constructing the remaining part of the dynamic SQL query
    SET @dynamic_sql = CONCAT(
        @dynamic_sql,
        '
        FROM
            btl.places p
        LEFT JOIN
            btl.places_units pu ON p.Place_ID = pu.Place_ID
        LEFT JOIN
            btl.units u ON pu.Unit_ID = u.Unit_ID
        GROUP BY
            p.Place_ID
        );
        '
    );
    
    -- Execute the generated dynamic SQL query
    PREPARE stmt FROM @dynamic_sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateUnitCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateUnitCount`()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE unit_name VARCHAR(100);
    
    -- Declare cursor to fetch all distinct unit names from the btl.units table
    DECLARE cur CURSOR FOR 
        SELECT DISTINCT Unit_name FROM btl.units;
    
    -- Continue handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Variable to store the dynamic SQL query
    SET @dynamic_sql = '
        SELECT *
    ';
    
    -- Dynamic part of the SQL query (conditional aggregation)
    SET @dynamic_part = '';
    
    -- Open cursor
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO unit_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Adding conditional aggregation for the current unit name to the dynamic SQL query
        SET @dynamic_part = CONCAT(
            @dynamic_part, 
            ', COUNT(CASE WHEN u.Unit_name = ''', unit_name, ''' THEN u.Unit_ID ELSE 1 END) AS ', REPLACE(unit_name, ' ', '_')
        );
    END LOOP;
    
    CLOSE cur;
    
    -- Concatenating dynamic_part to the dynamic SQL query
    SET @dynamic_sql = CONCAT(@dynamic_sql, @dynamic_part);
    
    -- Constructing the remaining part of the dynamic SQL query
    SET @dynamic_sql = CONCAT(
        @dynamic_sql,
        '
        FROM
            btl.places p
        LEFT JOIN
            btl.places_units pu ON p.Place_ID = pu.Place_ID
        LEFT JOIN
            btl.units u ON pu.Unit_ID = u.Unit_ID
        GROUP BY
            p.Place_ID
        '
    );
    
    -- Execute the generated dynamic SQL query
    PREPARE stmt FROM @dynamic_sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateGTUnitQty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGTUnitQty`()
BEGIN
    UPDATE gt_units u
    JOIN (
        SELECT p.Unit_ID, COUNT(*) AS count_units
        FROM gt_places_units p
        GROUP BY p.Unit_ID
    ) ab ON u.Unit_ID = ab.Unit_ID
    SET u.Unit_Qty = ab.count_units;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUnitQty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUnitQty`()
BEGIN
    UPDATE btl.units u
    JOIN (
        SELECT Unit_name, COUNT(*) AS count_units
        FROM unit_count
        GROUP BY Unit_name
    ) ab ON u.Unit_name = ab.Unit_name
    SET u.Unit_Qty = ab.count_units;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

