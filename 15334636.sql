-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: elect_gov
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cabinet`
--

DROP TABLE IF EXISTS `cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cabinet` (
  `Id` int(10) unsigned NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `Election_Id` int(10) unsigned NOT NULL,
  `Previous_Cabinet_Id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Election_Id` (`Election_Id`),
  UNIQUE KEY `Previous_Cabinet_Id` (`Previous_Cabinet_Id`),
  CONSTRAINT `cabinet_election` FOREIGN KEY (`Election_Id`) REFERENCES `election` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet`
--

LOCK TABLES `cabinet` WRITE;
/*!40000 ALTER TABLE `cabinet` DISABLE KEYS */;
INSERT INTO `cabinet` VALUES (93,'Lionel Jospin','1997-06-20','2002-05-07',431997,91),(94,'Jean-Dominique','2002-06-18','2007-05-15',432002,93),(96,'Fran?ois Fillon','2007-06-19','2012-05-10',432007,94),(97,'Jean-Manuel-Bernard','2012-06-19','2017-05-10',432012,96),(100,'?douard Philippe','2017-06-20','2017-06-20',432017,97);
/*!40000 ALTER TABLE `cabinet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Check_Cabinet_Formed_Date` BEFORE INSERT ON `cabinet` FOR EACH ROW BEGIN 
IF NEW.Start_Date<(SELECT Date FROM Election WHERE Election.Id=NEW.Election_Id) 
THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Cabinet cannot be formed before its associated Election';
ELSEIF NEW.Start_Date>CURDATE()
THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Cabinet cannot be formed in future';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cabinet_party`
--

DROP TABLE IF EXISTS `cabinet_party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cabinet_party` (
  `Cabinet_Id` int(10) unsigned NOT NULL,
  `Id` int(10) unsigned NOT NULL,
  `Party_Id` int(10) unsigned NOT NULL,
  `President` tinyint(1) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Cabinet_Id`,`Id`),
  KEY `Party_Id` (`Party_Id`),
  CONSTRAINT `cabinet_party_ibfk_1` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`),
  CONSTRAINT `cabinet_party_ibfk_2` FOREIGN KEY (`Cabinet_Id`) REFERENCES `cabinet` (`id`),
  CONSTRAINT `cabinet_party_ibfk_3` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`),
  CONSTRAINT `cabinet_party_ibfk_4` FOREIGN KEY (`Cabinet_Id`) REFERENCES `cabinet` (`id`),
  CONSTRAINT `cabinet_party_ibfk_5` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`),
  CONSTRAINT `cabinet_party_ibfk_6` FOREIGN KEY (`Cabinet_Id`) REFERENCES `cabinet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet_party`
--

LOCK TABLES `cabinet_party` WRITE;
/*!40000 ALTER TABLE `cabinet_party` DISABLE KEYS */;
INSERT INTO `cabinet_party` VALUES (93,1,2617,0,NULL),(93,2,2520,0,NULL),(93,3,2509,0,NULL),(93,4,2509,0,NULL),(94,1,2638,1,NULL),(94,2,2578,0,NULL),(94,3,2584,0,NULL),(96,1,2638,1,NULL),(96,2,2594,0,NULL),(97,1,2617,1,NULL),(97,2,2613,0,NULL),(97,3,2509,0,NULL),(100,1,2643,1,NULL),(100,2,2601,0,NULL);
/*!40000 ALTER TABLE `cabinet_party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `center`
--

DROP TABLE IF EXISTS `center`;
/*!50001 DROP VIEW IF EXISTS `center`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `center` AS SELECT 
 1 AS `Centre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `center_left`
--

DROP TABLE IF EXISTS `center_left`;
/*!50001 DROP VIEW IF EXISTS `center_left`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `center_left` AS SELECT 
 1 AS `CentreLeft`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `center_right`
--

DROP TABLE IF EXISTS `center_right`;
/*!50001 DROP VIEW IF EXISTS `center_right`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `center_right` AS SELECT 
 1 AS `CentreRight`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `election`
--

DROP TABLE IF EXISTS `election`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `election` (
  `Id` int(10) unsigned NOT NULL,
  `Type` enum('European Parliament','Parliamentary election','Presidential Election') DEFAULT NULL,
  `Date` date NOT NULL,
  `Total_Seats` int(10) unsigned NOT NULL,
  `Electorate` int(10) unsigned NOT NULL,
  `Votes_Cast` int(10) unsigned NOT NULL,
  `Valid_Votes` int(10) unsigned NOT NULL,
  `Previous_Election_Id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Previous_Election_Id` (`Previous_Election_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election`
--

LOCK TABLES `election` WRITE;
/*!40000 ALTER TABLE `election` DISABLE KEYS */;
INSERT INTO `election` VALUES (11995,'Presidential Election','1995-04-23',1,39976944,31845819,29943671,11988),(12002,'Presidential Election','2002-04-21',1,41191169,32832295,31062988,11995),(12007,'Presidential Election','2007-04-22',1,44472733,37342004,35773578,12002),(12012,'Presidential Election','2012-05-07',1,46066307,37016309,34861353,12007),(12017,'Presidential Election','2017-05-07',1,47568693,35467327,31381603,12012),(431997,'Parliamentary election','1997-06-18',577,37626821,26886073,25189627,431993),(432002,'Parliamentary election','2002-06-16',577,36783746,22186165,21221026,431997),(432007,'Parliamentary election','2007-06-17',577,35225248,21129039,20406454,432002),(432012,'Parliamentary election','2012-06-17',577,43233648,23952486,23029308,432007),(432017,'Parliamentary election','2017-06-18',577,47293103,20164615,18176066,432012);
/*!40000 ALTER TABLE `election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election_result`
--

DROP TABLE IF EXISTS `election_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `election_result` (
  `Election_Id` int(10) unsigned NOT NULL,
  `Id` int(10) unsigned NOT NULL,
  `Party_Id` int(10) unsigned NOT NULL,
  `Seats_Contested` int(10) unsigned NOT NULL,
  `Seats_Won` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Election_Id`,`Id`),
  KEY `Party_Id` (`Party_Id`),
  CONSTRAINT `election_result_ibfk_1` FOREIGN KEY (`Election_Id`) REFERENCES `election` (`id`),
  CONSTRAINT `election_result_ibfk_2` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`),
  CONSTRAINT `election_result_ibfk_3` FOREIGN KEY (`Election_Id`) REFERENCES `election` (`id`),
  CONSTRAINT `election_result_ibfk_4` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`),
  CONSTRAINT `election_result_ibfk_5` FOREIGN KEY (`Election_Id`) REFERENCES `election` (`id`),
  CONSTRAINT `election_result_ibfk_6` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election_result`
--

LOCK TABLES `election_result` WRITE;
/*!40000 ALTER TABLE `election_result` DISABLE KEYS */;
INSERT INTO `election_result` VALUES (11995,10020,2637,1,1),(11995,10021,2617,1,0),(12002,10120,2637,1,1),(12002,10121,2546,1,0),(12007,10320,2638,1,1),(12007,10321,2617,1,0),(12012,10420,2617,1,1),(12012,10421,2638,1,0),(12017,10520,2643,1,1),(12017,10521,2546,1,0),(431997,10130,2617,400,255),(431997,10131,2520,100,35),(431997,10132,2584,20,7),(431997,10133,2509,35,23),(431997,10135,2637,300,139),(431997,10136,2584,200,114),(431997,10137,2546,20,1),(432002,10230,2638,400,369),(432002,10231,2578,60,29),(432002,10232,2594,5,1),(432002,10233,2617,300,140),(432002,10234,2520,100,21),(432002,10235,2509,110,7),(432002,10236,2584,30,9),(432002,10237,2546,20,0),(432007,10330,2638,360,313),(432007,10331,2609,70,22),(432007,10332,2594,30,10),(432007,10333,2617,300,186),(432007,10334,2520,70,15),(432007,10335,2509,20,22),(432007,10336,2584,20,4),(432007,10337,2601,24,1),(432007,10338,2546,30,0),(432012,10430,2617,300,280),(432012,10431,2613,150,39),(432012,10432,2509,120,12),(432012,10433,2638,300,194),(432012,10434,2609,70,17),(432012,10435,2501,40,21),(432012,10436,2520,10,6),(432012,10437,2546,20,2),(432012,10438,2601,30,2),(432012,10439,2628,30,2),(432017,10530,2643,430,308),(432017,10531,2601,50,42),(432017,10532,2615,130,112),(432017,10534,2612,40,18),(432017,10535,2617,50,30),(432017,10536,2509,5,3),(432017,10537,2644,60,17),(432017,10538,2520,100,10),(432017,10539,2546,120,8),(432017,10540,2613,30,1),(432017,10541,2608,30,1);
/*!40000 ALTER TABLE `election_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `far_left`
--

DROP TABLE IF EXISTS `far_left`;
/*!50001 DROP VIEW IF EXISTS `far_left`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `far_left` AS SELECT 
 1 AS `FarLeft`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `far_right`
--

DROP TABLE IF EXISTS `far_right`;
/*!50001 DROP VIEW IF EXISTS `far_right`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `far_right` AS SELECT 
 1 AS `FarRight`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `left_right_histogram`
--

DROP TABLE IF EXISTS `left_right_histogram`;
/*!50001 DROP VIEW IF EXISTS `left_right_histogram`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `left_right_histogram` AS SELECT 
 1 AS `FarLeft`,
 1 AS `CentreLeft`,
 1 AS `Centre`,
 1 AS `CentreRight`,
 1 AS `FarRight`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `morethan2avg`
--

DROP TABLE IF EXISTS `morethan2avg`;
/*!50001 DROP VIEW IF EXISTS `morethan2avg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `morethan2avg` AS SELECT 
 1 AS `party_id`,
 1 AS `recent_victory`,
 1 AS `num_won_elections`,
 1 AS `party_family`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `participation_ratios`
--

DROP TABLE IF EXISTS `participation_ratios`;
/*!50001 DROP VIEW IF EXISTS `participation_ratios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `participation_ratios` AS SELECT 
 1 AS `Id`,
 1 AS `year`,
 1 AS `type`,
 1 AS `participationRatio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `party` (
  `Id` int(10) unsigned NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Abbreviation` varchar(10) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `Description` varchar(1000) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (2501,'Party Radical','PRV','1901-06-23','2017-12-09','Merge into Mouvement Radical'),(2509,'Parti radical de Gauche','PRG','1901-06-23','2017-12-09',''),(2520,'Parti communiste fran?ais','PCF','1920-12-30',NULL,''),(2546,'Rassemblement National','RN','1972-10-05',NULL,''),(2578,'Union pour la Démocratie Fran?aise','UDF','1978-02-01','2007-11-30','Suceeded by MoDem'),(2584,'Les Verts','LV','1984-01-20','2010-11-13','Merge into EELV'),(2594,'Mouvement pour la France','MPF','1994-01-01',NULL,''),(2601,'Mouvement démocrate','MoDem','2007-12-01',NULL,''),(2608,'Debout la France','DLF','2008-11-23',NULL,''),(2609,'Alliance Centriste','AC','2009-06-27',NULL,''),(2612,'Union des démocrates et indépendants','UDI','2012-09-18',NULL,''),(2613,'Europe ?cologie Les Verts','EELV','2010-11-13',NULL,''),(2615,'Les Républicains','LR','2015-05-30',NULL,''),(2617,'French Socialist Party','PSF','1969-05-04',NULL,''),(2628,'Front De Gauche','FDG','2008-11-18',NULL,''),(2637,'Rassemblement pour la République','RPR','1976-12-05','2002-09-21','Changed to UMP.'),(2638,'Union pour un mouvement populaire','UMP','2002-11-17','2015-05-30','Changed to The Republicans.'),(2643,'La République En Marche!','REM','2016-04-06',NULL,''),(2644,'La France Insoumise','FI','2016-02-10',NULL,'');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_family`
--

DROP TABLE IF EXISTS `party_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `party_family` (
  `Party_Id` int(10) unsigned NOT NULL,
  `Family` varchar(50) NOT NULL,
  PRIMARY KEY (`Party_Id`,`Family`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_family`
--

LOCK TABLES `party_family` WRITE;
/*!40000 ALTER TABLE `party_family` DISABLE KEYS */;
INSERT INTO `party_family` VALUES (2501,'Liberalism'),(2509,'Social Liberalism'),(2520,'Communism'),(2546,'National Conservatism'),(2578,'Christian Democracy'),(2584,'Green Politics'),(2594,'National Conservatism'),(2601,'Centrism'),(2608,'National Conservatism'),(2609,'Liberalism'),(2612,'Liberalism'),(2613,'Green Politics, Regionalism'),(2615,'Conservatism'),(2617,'Democratic Socialism'),(2628,'Socialism'),(2637,'Conservatism'),(2638,'Conservatism'),(2643,'Social Liberalism'),(2644,'Democratic Socialism');
/*!40000 ALTER TABLE `party_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `party_percentage_votes`
--

DROP TABLE IF EXISTS `party_percentage_votes`;
/*!50001 DROP VIEW IF EXISTS `party_percentage_votes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `party_percentage_votes` AS SELECT 
 1 AS `partyName`,
 1 AS `vote_percentage`,
 1 AS `year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `party_position`
--

DROP TABLE IF EXISTS `party_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `party_position` (
  `Party_Id` int(10) unsigned NOT NULL,
  `Position` double unsigned NOT NULL,
  PRIMARY KEY (`Party_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_position`
--

LOCK TABLES `party_position` WRITE;
/*!40000 ALTER TABLE `party_position` DISABLE KEYS */;
INSERT INTO `party_position` VALUES (2501,7.5),(2509,2.5),(2520,0),(2546,8.75),(2578,7.5),(2584,2.5),(2594,8.75),(2601,6.25),(2608,8.75),(2609,5),(2612,6.25),(2613,2.5),(2615,7.5),(2617,2.5),(2628,1.25),(2637,7.5),(2638,7.5),(2643,5),(2644,1.25);
/*!40000 ALTER TABLE `party_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `party_vote_range`
--

DROP TABLE IF EXISTS `party_vote_range`;
/*!50001 DROP VIEW IF EXISTS `party_vote_range`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `party_vote_range` AS SELECT 
 1 AS `year`,
 1 AS `partyName`,
 1 AS `voteRange`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `partyvotes`
--

DROP TABLE IF EXISTS `partyvotes`;
/*!50001 DROP VIEW IF EXISTS `partyvotes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `partyvotes` AS SELECT 
 1 AS `election_id`,
 1 AS `date`,
 1 AS `party_id`,
 1 AS `party_name`,
 1 AS `seats_won`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `partywinavg`
--

DROP TABLE IF EXISTS `partywinavg`;
/*!50001 DROP VIEW IF EXISTS `partywinavg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `partywinavg` AS SELECT 
 1 AS `party_id`,
 1 AS `max_date`,
 1 AS `election_id`,
 1 AS `num_won_elections`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `partywins`
--

DROP TABLE IF EXISTS `partywins`;
/*!50001 DROP VIEW IF EXISTS `partywins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `partywins` AS SELECT 
 1 AS `election_id`,
 1 AS `date`,
 1 AS `party_id`,
 1 AS `party_name`,
 1 AS `seats_won`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `president`
--

DROP TABLE IF EXISTS `president`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `president` (
  `Id` int(10) unsigned NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `Party_Id` int(10) unsigned NOT NULL,
  `Predecessor` int(10) unsigned NOT NULL,
  `Successor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Party_Id` (`Party_Id`),
  CONSTRAINT `president_ibfk_1` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`),
  CONSTRAINT `president_ibfk_2` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`),
  CONSTRAINT `president_ibfk_3` FOREIGN KEY (`Party_Id`) REFERENCES `party` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `president`
--

LOCK TABLES `president` WRITE;
/*!40000 ALTER TABLE `president` DISABLE KEYS */;
INSERT INTO `president` VALUES (21,'Chirac','Jacques','1995-05-17','2002-05-16',2637,20,22),(22,'Chirac','Jacques','2002-05-17','2007-05-16',2638,21,23),(23,'Sarkozy','Nicolas','2007-05-16','2012-05-15',2638,22,24),(24,'Hollande','Fran?ois','2012-05-15','2017-05-14',2617,23,25),(25,'Macron','Emmanuel','2017-05-14',NULL,2643,24,NULL);
/*!40000 ALTER TABLE `president` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `result2`
--

DROP TABLE IF EXISTS `result2`;
/*!50001 DROP VIEW IF EXISTS `result2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `result2` AS SELECT 
 1 AS `Party_Name`,
 1 AS `Party_Family`,
 1 AS `Elections_Won`,
 1 AS `MostRecentlyWonElection_Id`,
 1 AS `MostRecentlyWonElectionYear`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `center`
--

/*!50001 DROP VIEW IF EXISTS `center`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `center` AS select count(`pp`.`Position`) AS `Centre` from (`party_position` `pp` join `party` `p` on((`pp`.`Party_Id` = `p`.`Id`))) where (`pp`.`Position` = 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `center_left`
--

/*!50001 DROP VIEW IF EXISTS `center_left`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `center_left` AS select count(`pp`.`Position`) AS `CentreLeft` from (`party_position` `pp` join `party` `p` on((`pp`.`Party_Id` = `p`.`Id`))) where ((`pp`.`Position` >= 2.5) and (`pp`.`Position` < 5)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `center_right`
--

/*!50001 DROP VIEW IF EXISTS `center_right`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `center_right` AS select count(`pp`.`Position`) AS `CentreRight` from (`party_position` `pp` join `party` `p` on((`pp`.`Party_Id` = `p`.`Id`))) where ((`pp`.`Position` > 5) and (`pp`.`Position` <= 7.5)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `far_left`
--

/*!50001 DROP VIEW IF EXISTS `far_left`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `far_left` AS select count(`pp`.`Position`) AS `FarLeft` from (`party_position` `pp` join `party` `p` on((`pp`.`Party_Id` = `p`.`Id`))) where ((`pp`.`Position` >= 0) and (`pp`.`Position` < 2.5)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `far_right`
--

/*!50001 DROP VIEW IF EXISTS `far_right`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `far_right` AS select count(`pp`.`Position`) AS `FarRight` from (`party_position` `pp` join `party` `p` on((`pp`.`Party_Id` = `p`.`Id`))) where ((`pp`.`Position` > 7.5) and (`pp`.`Position` <= 10)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `left_right_histogram`
--

/*!50001 DROP VIEW IF EXISTS `left_right_histogram`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `left_right_histogram` AS select `a`.`FarLeft` AS `FarLeft`,`b`.`CentreLeft` AS `CentreLeft`,`c`.`Centre` AS `Centre`,`d`.`CentreRight` AS `CentreRight`,`e`.`FarRight` AS `FarRight` from ((((`far_left` `a` join `center_left` `b`) join `center` `c`) join `center_right` `d`) join `far_right` `e`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `morethan2avg`
--

/*!50001 DROP VIEW IF EXISTS `morethan2avg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `morethan2avg` AS select `ssq2`.`party_id` AS `party_id`,`ssq2`.`recent_victory` AS `recent_victory`,`ssq2`.`num_won_elections` AS `num_won_elections`,`ssq1`.`party_family` AS `party_family` from ((select `pwa`.`party_id` AS `party_id`,`pwa`.`max_date` AS `recent_victory`,`pwa`.`num_won_elections` AS `num_won_elections` from `partywinavg` `pwa` where (`pwa`.`num_won_elections` >= 3)) `ssq2` left join (select `pf`.`Party_Id` AS `party_id`,`pf`.`Family` AS `party_family` from `party_family` `pf`) `ssq1` on((`ssq1`.`party_id` = `ssq2`.`party_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `participation_ratios`
--

/*!50001 DROP VIEW IF EXISTS `participation_ratios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `participation_ratios` AS select `t`.`Id` AS `Id`,`t`.`year` AS `year`,`t`.`type` AS `type`,avg(`t`.`p_ratio`) AS `participationRatio` from (select `e`.`Id` AS `Id`,year(`e`.`Date`) AS `year`,`e`.`Type` AS `type`,format((`e`.`Votes_Cast` / `e`.`Electorate`),3) AS `p_ratio` from `election` `e`) `t` group by `t`.`Id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `party_percentage_votes`
--

/*!50001 DROP VIEW IF EXISTS `party_percentage_votes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `party_percentage_votes` AS select `t`.`partyName` AS `partyName`,ceiling(avg(`t`.`vote_percentage`)) AS `vote_percentage`,`t`.`year` AS `year` from (select year(`e`.`Date`) AS `year`,`p`.`Abbreviation` AS `partyName`,format(((`er`.`Seats_Won` / `e`.`Total_Seats`) * 100),2) AS `vote_percentage` from ((`election` `e` join `election_result` `er` on((`e`.`Id` = `er`.`Election_Id`))) join `party` `p` on((`p`.`Id` = `er`.`Party_Id`))) where (`e`.`Type` <> 'Presidential_Election')) `t` where (`t`.`vote_percentage` is not null) group by `t`.`year`,`t`.`partyName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `party_vote_range`
--

/*!50001 DROP VIEW IF EXISTS `party_vote_range`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `party_vote_range` AS select `party_percentage_votes`.`year` AS `year`,`party_percentage_votes`.`partyName` AS `partyName`,(case when ((`party_percentage_votes`.`vote_percentage` >= 0) and (`party_percentage_votes`.`vote_percentage` <= 5)) then '(0-5]' when ((`party_percentage_votes`.`vote_percentage` > 5) and (`party_percentage_votes`.`vote_percentage` <= 10)) then '(5-10]' when ((`party_percentage_votes`.`vote_percentage` > 10) and (`party_percentage_votes`.`vote_percentage` <= 30)) then '(10-30]' when ((`party_percentage_votes`.`vote_percentage` > 30) and (`party_percentage_votes`.`vote_percentage` <= 70)) then '(30-70]' when ((`party_percentage_votes`.`vote_percentage` > 70) and (`party_percentage_votes`.`vote_percentage` <= 100)) then '(70-100]' end) AS `voteRange` from `party_percentage_votes` order by `party_percentage_votes`.`year`,`party_percentage_votes`.`vote_percentage` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partyvotes`
--

/*!50001 DROP VIEW IF EXISTS `partyvotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partyvotes` AS select `e`.`Id` AS `election_id`,`e`.`Date` AS `date`,`p`.`Id` AS `party_id`,`p`.`Name` AS `party_name`,`er`.`Seats_Won` AS `seats_won` from ((`election_result` `er` join `election` `e`) join `party` `p`) where ((`er`.`Election_Id` = `e`.`Id`) and (`er`.`Party_Id` = `p`.`Id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partywinavg`
--

/*!50001 DROP VIEW IF EXISTS `partywinavg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partywinavg` AS select `pw`.`party_id` AS `party_id`,max(`pw`.`date`) AS `max_date`,`pw`.`election_id` AS `election_id`,count(distinct `pw`.`election_id`) AS `num_won_elections` from `partywins` `pw` group by `pw`.`party_id` order by `num_won_elections` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partywins`
--

/*!50001 DROP VIEW IF EXISTS `partywins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partywins` AS select `pv`.`election_id` AS `election_id`,`pv`.`date` AS `date`,`pv`.`party_id` AS `party_id`,`pv`.`party_name` AS `party_name`,`pv`.`seats_won` AS `seats_won` from (`partyvotes` `pv` join (select `partyvotes`.`election_id` AS `election_id`,max(`partyvotes`.`seats_won`) AS `max_seats` from `partyvotes` group by `partyvotes`.`election_id`) `pv2`) where ((`pv`.`election_id` = `pv2`.`election_id`) and (`pv`.`seats_won` = `pv2`.`max_seats`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `result2`
--

/*!50001 DROP VIEW IF EXISTS `result2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `result2` AS select `p`.`Name` AS `Party_Name`,`mt3a`.`party_family` AS `Party_Family`,`mt3a`.`num_won_elections` AS `Elections_Won`,`er`.`Election_Id` AS `MostRecentlyWonElection_Id`,extract(year from `mt3a`.`recent_victory`) AS `MostRecentlyWonElectionYear` from (((`morethan2avg` `mt3a` join `party` `p`) join `election` `e`) join `election_result` `er`) where ((`mt3a`.`recent_victory` = `e`.`Date`) and (`mt3a`.`party_id` = `p`.`Id`) and (`p`.`Id` = `er`.`Party_Id`) and (`e`.`Id` = `er`.`Election_Id`)) order by `p`.`Name` */;
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

-- Dump completed on 2018-11-28 19:21:38
