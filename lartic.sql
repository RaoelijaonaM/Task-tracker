-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lartic
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `adminespace`
--

DROP TABLE IF EXISTS `adminespace`;
/*!50001 DROP VIEW IF EXISTS `adminespace`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `adminespace` (
  `ID_ESPACE` tinyint NOT NULL,
  `NOM` tinyint NOT NULL,
  `THEME` tinyint NOT NULL,
  `TODO` tinyint NOT NULL,
  `PROGRESS` tinyint NOT NULL,
  `FINISH` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alarme`
--

DROP TABLE IF EXISTS `alarme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarme` (
  `ID_ALARME` varchar(5) NOT NULL,
  `REMINDER` int(11) DEFAULT NULL,
  `LIBELLE` text DEFAULT NULL,
  PRIMARY KEY (`ID_ALARME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarme`
--

LOCK TABLES `alarme` WRITE;
/*!40000 ALTER TABLE `alarme` DISABLE KEYS */;
INSERT INTO `alarme` VALUES ('A1',1,'1 jour avant fin date'),('A2',5,'5 jours avant fin date'),('A3',7,'1 semaine avant fin date'),('A4',30,'1 mois avant fin date');
/*!40000 ALTER TABLE `alarme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `alarmesoutenance`
--

DROP TABLE IF EXISTS `alarmesoutenance`;
/*!50001 DROP VIEW IF EXISTS `alarmesoutenance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `alarmesoutenance` (
  `ID_TACHE` tinyint NOT NULL,
  `ID_TACHED` tinyint NOT NULL,
  `ID_UTILISATEUR` tinyint NOT NULL,
  `DATE_SOUTENANCE` tinyint NOT NULL,
  `ALARME` tinyint NOT NULL,
  `ROLE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `detailalarme`
--

DROP TABLE IF EXISTS `detailalarme`;
/*!50001 DROP VIEW IF EXISTS `detailalarme`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `detailalarme` (
  `ID_TACHE` tinyint NOT NULL,
  `ALARME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `detailespace`
--

DROP TABLE IF EXISTS `detailespace`;
/*!50001 DROP VIEW IF EXISTS `detailespace`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `detailespace` (
  `ID_UTILISATEUR` tinyint NOT NULL,
  `NOM` tinyint NOT NULL,
  `MAIL` tinyint NOT NULL,
  `NUMERO` tinyint NOT NULL,
  `ID_ESPACE` tinyint NOT NULL,
  `THEME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `detailtache`
--

DROP TABLE IF EXISTS `detailtache`;
/*!50001 DROP VIEW IF EXISTS `detailtache`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `detailtache` (
  `ID_TACHE` tinyint NOT NULL,
  `ID_TACHED` tinyint NOT NULL,
  `ID_UTILISATEUR` tinyint NOT NULL,
  `ID_ESPACE` tinyint NOT NULL,
  `DATE_DEBUT` tinyint NOT NULL,
  `DATE_FIN` tinyint NOT NULL,
  `STATUS` tinyint NOT NULL,
  `ID_ALARME` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `ROLE` tinyint NOT NULL,
  `FICHIER` tinyint NOT NULL,
  `PRIORITE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion` (
  `ID_DISCUSSION` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ESPACE` varchar(10) NOT NULL,
  `DATE_DISCUSSION` datetime DEFAULT NULL,
  `MESSAGE` text DEFAULT NULL,
  `NOM` text DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_DISCUSSION`),
  KEY `FK_CORRESPOND` (`ID_ESPACE`),
  CONSTRAINT `FK_CORRESPOND` FOREIGN KEY (`ID_ESPACE`) REFERENCES `espace` (`ID_ESPACE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dossier` (
  `ID_DOSSIER` varchar(4) NOT NULL,
  `LIBELLE` text DEFAULT NULL,
  PRIMARY KEY (`ID_DOSSIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossier`
--

LOCK TABLES `dossier` WRITE;
/*!40000 ALTER TABLE `dossier` DISABLE KEYS */;
/*!40000 ALTER TABLE `dossier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dossieretudiant`
--

DROP TABLE IF EXISTS `dossieretudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dossieretudiant` (
  `ID_DOSSIER` int(11) NOT NULL AUTO_INCREMENT,
  `ID_UTILISATEUR` varchar(10) NOT NULL,
  `DOSSIER` text DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DOSSIER`),
  KEY `FK_DE` (`ID_UTILISATEUR`),
  CONSTRAINT `FK_DE` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossieretudiant`
--

LOCK TABLES `dossieretudiant` WRITE;
/*!40000 ALTER TABLE `dossieretudiant` DISABLE KEYS */;
INSERT INTO `dossieretudiant` VALUES (1,'User1','[\n  {\n    \"dossier\": \"Fiche de suivi\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Exemplaire complet de la thèse\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Rapport de stage\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Fiche de thèse\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Attestation du Directeur\",\n    \"url\": \"\",\n    \"etat\": 1\n  }\n]',1),(2,'User2','[\n  {\n    \"dossier\": \"Fiche de suivi\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Exemplaire complet de la thèse\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Rapport de stage\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Fiche de thèse\",\n    \"url\": \"\",\n    \"etat\": 1\n  },\n  {\n    \"dossier\": \"Attestation du Directeur\",\n    \"url\": \"\",\n    \"etat\": 1\n  }\n]',1),(3,'User12','[{\"dossier\":\"Fiche de suivi\",\"url\":\"\",\"etat\":0},{\"dossier\":\"Exemplaire complet de la thèse\",\"url\":\"https://firebasestorage.googleapis.com/v0/b/stockageionic.appspot.com/o/dossiers%2Ft3%2Fexemplaire-these%2FExemplaire%20these.docx?alt=media&token=27c22f82-36e2-4f87-9dec-3be2f8f5a005\",\"etat\":1},{\"dossier\":\"Rapport de stage\",\"url\":\"\",\"etat\":0},{\"dossier\":\"Fiche de thèse\",\"url\":\"\",\"etat\":0},{\"dossier\":\"Attestation du Directeur\",\"url\":\"\",\"etat\":0}]',0);
/*!40000 ALTER TABLE `dossieretudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espace`
--

DROP TABLE IF EXISTS `espace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `espace` (
  `ID_ESPACE` varchar(10) NOT NULL,
  `ID_THESE` int(11) NOT NULL,
  `DATE_SOUTENANCE` datetime DEFAULT NULL,
  `ETAT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ESPACE`),
  KEY `FK_ESPACEDE` (`ID_THESE`),
  CONSTRAINT `FK_ESPACEDE` FOREIGN KEY (`ID_THESE`) REFERENCES `these` (`ID_THESE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espace`
--

LOCK TABLES `espace` WRITE;
/*!40000 ALTER TABLE `espace` DISABLE KEYS */;
INSERT INTO `espace` VALUES ('ES1',1,'2022-09-20 23:42:55',0);
/*!40000 ALTER TABLE `espace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etatdossier`
--

DROP TABLE IF EXISTS `etatdossier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etatdossier` (
  `ID_THESE` int(11) NOT NULL,
  `ID_DOSSIER` varchar(4) NOT NULL,
  `ETAT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_THESE`,`ID_DOSSIER`),
  KEY `FK_ETATDOSSIER2` (`ID_DOSSIER`),
  CONSTRAINT `FK_ETATDOSSIER` FOREIGN KEY (`ID_THESE`) REFERENCES `these` (`ID_THESE`),
  CONSTRAINT `FK_ETATDOSSIER2` FOREIGN KEY (`ID_DOSSIER`) REFERENCES `dossier` (`ID_DOSSIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etatdossier`
--

LOCK TABLES `etatdossier` WRITE;
/*!40000 ALTER TABLE `etatdossier` DISABLE KEYS */;
/*!40000 ALTER TABLE `etatdossier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executeur`
--

DROP TABLE IF EXISTS `executeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executeur` (
  `ID_UTILISATEUR` varchar(10) NOT NULL,
  `ID_TACHE` varchar(10) NOT NULL,
  `PRIORITE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_UTILISATEUR`,`ID_TACHE`),
  KEY `FK_EXECUTEUR2` (`ID_TACHE`),
  CONSTRAINT `FK_EXECUTEUR` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`),
  CONSTRAINT `FK_EXECUTEUR2` FOREIGN KEY (`ID_TACHE`) REFERENCES `tache` (`ID_TACHE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executeur`
--

LOCK TABLES `executeur` WRITE;
/*!40000 ALTER TABLE `executeur` DISABLE KEYS */;
INSERT INTO `executeur` VALUES ('User1','Task1',0),('User1','Task3',1),('User1','Task5',1),('User1','Task6',0),('User1','Task7',0),('User3','Task1',1),('User3','Task2',0),('User3','Task3',0),('User3','Task4',1),('User3','Task6',1),('User3','Task7',1),('User4','Task5',0),('User4','Task7',0),('User5','Task7',0),('User6','Task7',0),('User7','Task7',0),('User8','Task2',1);
/*!40000 ALTER TABLE `executeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichier`
--

DROP TABLE IF EXISTS `fichier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fichier` (
  `ID_FICHIER` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TACHE` varchar(10) NOT NULL,
  `LINK` text DEFAULT NULL,
  `COMMENTAIRE` text DEFAULT NULL,
  `TITRE` text DEFAULT NULL,
  PRIMARY KEY (`ID_FICHIER`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichier`
--

LOCK TABLES `fichier` WRITE;
/*!40000 ALTER TABLE `fichier` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `foisfirstjury`
--

DROP TABLE IF EXISTS `foisfirstjury`;
/*!50001 DROP VIEW IF EXISTS `foisfirstjury`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `foisfirstjury` (
  `id_utilisateur` tinyint NOT NULL,
  `annee` tinyint NOT NULL,
  `fois` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `foisiduser`
--

DROP TABLE IF EXISTS `foisiduser`;
/*!50001 DROP VIEW IF EXISTS `foisiduser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `foisiduser` (
  `ID_UTILISATEUR` tinyint NOT NULL,
  `JURY` tinyint NOT NULL,
  `ANNEE` tinyint NOT NULL,
  `FOIS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `foisjury`
--

DROP TABLE IF EXISTS `foisjury`;
/*!50001 DROP VIEW IF EXISTS `foisjury`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `foisjury` (
  `id_utilisateur` tinyint NOT NULL,
  `annee` tinyint NOT NULL,
  `fois` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `foissecondjury`
--

DROP TABLE IF EXISTS `foissecondjury`;
/*!50001 DROP VIEW IF EXISTS `foissecondjury`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `foissecondjury` (
  `id_utilisateur` tinyint NOT NULL,
  `annee` tinyint NOT NULL,
  `fois` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membre` (
  `ID_UTILISATEUR` varchar(10) NOT NULL,
  `ID_ESPACE` varchar(10) NOT NULL,
  `ROLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_UTILISATEUR`,`ID_ESPACE`),
  KEY `FK_MEMBRE2` (`ID_ESPACE`),
  CONSTRAINT `FK_MEMBRE` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`),
  CONSTRAINT `FK_MEMBRE2` FOREIGN KEY (`ID_ESPACE`) REFERENCES `espace` (`ID_ESPACE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES ('User1','ES1','Etudiant'),('User3','ES1','Admin'),('User4','ES1','Directeur de thèse'),('User5','ES1','Rapporteur'),('User6','ES1','1er Jury'),('User7','ES1','2e Jury'),('User8','ES1','Anonyme');
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `membreespace`
--

DROP TABLE IF EXISTS `membreespace`;
/*!50001 DROP VIEW IF EXISTS `membreespace`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `membreespace` (
  `ID_UTILISATEUR` tinyint NOT NULL,
  `NOM` tinyint NOT NULL,
  `MAIL` tinyint NOT NULL,
  `NUMERO` tinyint NOT NULL,
  `ID_ESPACE` tinyint NOT NULL,
  `ROLE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `repetition`
--

DROP TABLE IF EXISTS `repetition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repetition` (
  `ID_REPETITION` varchar(5) NOT NULL,
  `JOUR` int(11) DEFAULT NULL,
  `LIBELLE` text DEFAULT NULL,
  PRIMARY KEY (`ID_REPETITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repetition`
--

LOCK TABLES `repetition` WRITE;
/*!40000 ALTER TABLE `repetition` DISABLE KEYS */;
/*!40000 ALTER TABLE `repetition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ID_ROLE` varchar(4) NOT NULL,
  `LIBELLE` text DEFAULT NULL,
  PRIMARY KEY (`ID_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('R1','Etudiant'),('R2','Admin'),('R3','Prof');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tache`
--

DROP TABLE IF EXISTS `tache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tache` (
  `ID_TACHE` varchar(10) NOT NULL,
  `ID_ESPACE` varchar(10) NOT NULL,
  `ID_ALARME` varchar(5) DEFAULT NULL,
  `ID_REPETITION` varchar(5) DEFAULT NULL,
  `ID_TACHED` varchar(10) NOT NULL,
  `DATE_DEBUT` datetime DEFAULT NULL,
  `DATE_FIN` datetime DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  PRIMARY KEY (`ID_TACHE`),
  KEY `FK_REMINDER` (`ID_ALARME`),
  KEY `FK_REPETER` (`ID_REPETITION`),
  KEY `FK_TACHEESPACE` (`ID_ESPACE`),
  KEY `FK_TYPETACHE` (`ID_TACHED`),
  CONSTRAINT `FK_REMINDER` FOREIGN KEY (`ID_ALARME`) REFERENCES `alarme` (`ID_ALARME`),
  CONSTRAINT `FK_REPETER` FOREIGN KEY (`ID_REPETITION`) REFERENCES `repetition` (`ID_REPETITION`),
  CONSTRAINT `FK_TACHEESPACE` FOREIGN KEY (`ID_ESPACE`) REFERENCES `espace` (`ID_ESPACE`),
  CONSTRAINT `FK_TYPETACHE` FOREIGN KEY (`ID_TACHED`) REFERENCES `tachedefaut` (`ID_TACHED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tache`
--

LOCK TABLES `tache` WRITE;
/*!40000 ALTER TABLE `tache` DISABLE KEYS */;
INSERT INTO `tache` VALUES ('Task1','ES1','A1',NULL,'td1','2022-08-27 13:24:36','2022-09-22 21:00:00',0,'correction administrative'),('Task2','ES1','A1',NULL,'td2','2022-09-07 00:00:00','2022-09-20 00:00:00',0,NULL),('Task3','ES1','A1',NULL,'td3','2022-09-02 18:08:51','2022-09-05 22:37:18',0,NULL),('Task4','ES1','A1',NULL,'td4','2022-09-13 23:54:46','2022-09-19 21:42:12',0,NULL),('Task5','ES1','A1',NULL,'td5','2022-09-14 20:17:36','2022-09-15 17:19:03',0,NULL),('Task6','ES1','A1',NULL,'td6','2022-09-14 20:17:36','2022-09-15 17:19:03',0,NULL),('Task7','ES1','A1',NULL,'td7','2022-09-26 00:00:00','2022-09-26 00:00:00',0,NULL);
/*!40000 ALTER TABLE `tache` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tg_task_insert
BEFORE INSERT ON TACHE
FOR EACH ROW
BEGIN
  INSERT INTO task_seq VALUES (NULL);
  SET NEW.id_tache = CONCAT('Task',LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tachedefaut`
--

DROP TABLE IF EXISTS `tachedefaut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tachedefaut` (
  `ID_TACHED` varchar(10) NOT NULL,
  `LIBELLE` text DEFAULT NULL,
  `RESPONSABLE` varchar(50) DEFAULT NULL,
  `VALIDATION` int(11) DEFAULT NULL,
  `FICHIER` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`ID_TACHED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tachedefaut`
--

LOCK TABLES `tachedefaut` WRITE;
/*!40000 ALTER TABLE `tachedefaut` DISABLE KEYS */;
INSERT INTO `tachedefaut` VALUES ('td1','Correction Administrative','Admin',1,1),('td2','Lecture Anonyme','Anonyme',1,1),('td3','Correction selon commentaire lecture anonyme','Etudiant',0,1),('td4','Validation du Vice Doyen','Admin',0,1),('td5','Finalisation document de thèse','Etudiant',1,1),('td6','Rendu des 5 exemplaires du document de thèse','Etudiant',1,0),('td7','Soutenance','Etudiant',0,0);
/*!40000 ALTER TABLE `tachedefaut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_seq`
--

DROP TABLE IF EXISTS `task_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_seq`
--

LOCK TABLES `task_seq` WRITE;
/*!40000 ALTER TABLE `task_seq` DISABLE KEYS */;
INSERT INTO `task_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14);
/*!40000 ALTER TABLE `task_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `these`
--

DROP TABLE IF EXISTS `these`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `these` (
  `ID_THESE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_UTILISATEUR` varchar(10) NOT NULL,
  `THEME` text DEFAULT NULL,
  PRIMARY KEY (`ID_THESE`),
  KEY `FK_ETUDIANT` (`ID_UTILISATEUR`),
  CONSTRAINT `FK_ETUDIANT` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `these`
--

LOCK TABLES `these` WRITE;
/*!40000 ALTER TABLE `these` DISABLE KEYS */;
INSERT INTO `these` VALUES (1,'User1','Loratadine'),(2,'User2','Timolol Maleate'),(3,'User11','theme1'),(4,'User12','them3');
/*!40000 ALTER TABLE `these` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `thesedossier`
--

DROP TABLE IF EXISTS `thesedossier`;
/*!50001 DROP VIEW IF EXISTS `thesedossier`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `thesedossier` (
  `ID_THESE` tinyint NOT NULL,
  `ID_UTILISATEUR` tinyint NOT NULL,
  `ETUDIANT` tinyint NOT NULL,
  `THEME` tinyint NOT NULL,
  `STATUS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `totalfinish`
--

DROP TABLE IF EXISTS `totalfinish`;
/*!50001 DROP VIEW IF EXISTS `totalfinish`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `totalfinish` (
  `id_espace` tinyint NOT NULL,
  `achieve` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `totalfinishcomplet`
--

DROP TABLE IF EXISTS `totalfinishcomplet`;
/*!50001 DROP VIEW IF EXISTS `totalfinishcomplet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `totalfinishcomplet` (
  `id_espace` tinyint NOT NULL,
  `achieve` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `totalprogress`
--

DROP TABLE IF EXISTS `totalprogress`;
/*!50001 DROP VIEW IF EXISTS `totalprogress`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `totalprogress` (
  `id_espace` tinyint NOT NULL,
  `progress` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `totalprogresscomplet`
--

DROP TABLE IF EXISTS `totalprogresscomplet`;
/*!50001 DROP VIEW IF EXISTS `totalprogresscomplet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `totalprogresscomplet` (
  `id_espace` tinyint NOT NULL,
  `progress` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `totaltask`
--

DROP TABLE IF EXISTS `totaltask`;
/*!50001 DROP VIEW IF EXISTS `totaltask`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `totaltask` (
  `id_espace` tinyint NOT NULL,
  `total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `totaltodo`
--

DROP TABLE IF EXISTS `totaltodo`;
/*!50001 DROP VIEW IF EXISTS `totaltodo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `totaltodo` (
  `id_espace` tinyint NOT NULL,
  `todo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `totaltodocomplet`
--

DROP TABLE IF EXISTS `totaltodocomplet`;
/*!50001 DROP VIEW IF EXISTS `totaltodocomplet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `totaltodocomplet` (
  `id_espace` tinyint NOT NULL,
  `todo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (12);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `ID_UTILISATEUR` varchar(10) NOT NULL,
  `ID_ROLE` varchar(4) NOT NULL,
  `NOM` text DEFAULT NULL,
  `PRENOM` text DEFAULT NULL,
  `MAIL` text DEFAULT NULL,
  `NUMERO` text DEFAULT NULL,
  `LOGIN` text DEFAULT NULL,
  `MDP` text DEFAULT NULL,
  `TOKENDEVICE` text DEFAULT NULL,
  PRIMARY KEY (`ID_UTILISATEUR`),
  KEY `FK_ATTRIBUE` (`ID_ROLE`),
  CONSTRAINT `FK_ATTRIBUE` FOREIGN KEY (`ID_ROLE`) REFERENCES `role` (`ID_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES ('User1','R1','Aubury','Cosmo','caubury0@dagondesign.com','+236 570 556 8316','Cosmo','Cosmo',NULL),('User11','R3','Jean','Michel','jean@prof.com','+261 32 364 45','Michel','Michel',NULL),('User12','R1','n3','p3','m3','t3','p3','p3',''),('User2','R1','Nehl','Crichton','cnehl1@huffingtonpost.com','+63 862 835 4154','Crichton','Crichton',NULL),('User3','R2','Varah','Merissa','mvarah2@wisc.edu','+351 724 951 2837','Merissa','Merissa',NULL),('User4','R3','Orpen','Verna','vorpen3@purevolume.com','+66 414 828 0886','Verna','Verna',NULL),('User5','R3','Rediers','Melva','mrediers4@home.pl','+7 825 931 8137','Melva','Melva',NULL),('User6','R3','Rabe','Koto','rabe@prof.com','+261 32 354 25','Koto','Koto',NULL),('User7','R3','Ravao','Marie','ravao@prof.com','+261 32 364 75','Marie','Marie',NULL),('User8','R3','Jean','Michel','jean@prof.com','+261 32 364 45','Michel','Michel',NULL);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tg_user_insert
BEFORE INSERT ON UTILISATEUR
FOR EACH ROW
BEGIN
  INSERT INTO user_seq VALUES (NULL);
  SET NEW.ID_UTILISATEUR = CONCAT('User',LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `adminespace`
--

/*!50001 DROP TABLE IF EXISTS `adminespace`*/;
/*!50001 DROP VIEW IF EXISTS `adminespace`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adminespace` AS select `tt`.`id_espace` AS `ID_ESPACE`,concat(`utilisateur`.`NOM`,' ',`utilisateur`.`PRENOM`) AS `NOM`,`t`.`THEME` AS `THEME`,`td`.`todo` / `tt`.`total` AS `TODO`,`tp`.`progress` / `tt`.`total` AS `PROGRESS`,`tf`.`achieve` / `tt`.`total` AS `FINISH` from ((((((`utilisateur` join `these` `t` on(`utilisateur`.`ID_UTILISATEUR` = `t`.`ID_UTILISATEUR`)) join `espace` `e` on(`e`.`ID_THESE` = `t`.`ID_THESE`)) join `totaltask` `tt` on(`tt`.`id_espace` = `e`.`ID_ESPACE`)) join `totaltodocomplet` `td` on(`td`.`id_espace` = `tt`.`id_espace`)) join `totalprogresscomplet` `tp` on(`tp`.`id_espace` = `tt`.`id_espace`)) join `totalfinishcomplet` `tf` on(`tf`.`id_espace` = `tt`.`id_espace`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alarmesoutenance`
--

/*!50001 DROP TABLE IF EXISTS `alarmesoutenance`*/;
/*!50001 DROP VIEW IF EXISTS `alarmesoutenance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alarmesoutenance` AS select `dt`.`ID_TACHE` AS `ID_TACHE`,`dt`.`ID_TACHED` AS `ID_TACHED`,`dt`.`ID_UTILISATEUR` AS `ID_UTILISATEUR`,`dt`.`DATE_DEBUT` AS `DATE_SOUTENANCE`,`da`.`ALARME` AS `ALARME`,`dt`.`ROLE` AS `ROLE` from (`detailtache` `dt` join `detailalarme` `da`) where `dt`.`ID_TACHE` = `da`.`ID_TACHE` and `dt`.`ID_TACHED` = 'Soutenance' and `dt`.`STATUS` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detailalarme`
--

/*!50001 DROP TABLE IF EXISTS `detailalarme`*/;
/*!50001 DROP VIEW IF EXISTS `detailalarme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detailalarme` AS select `tache`.`ID_TACHE` AS `ID_TACHE`,`tache`.`DATE_FIN` + interval (-`alarme`.`REMINDER`) day AS `ALARME` from (`tache` join `alarme` on(`alarme`.`ID_ALARME` = `tache`.`ID_ALARME`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detailespace`
--

/*!50001 DROP TABLE IF EXISTS `detailespace`*/;
/*!50001 DROP VIEW IF EXISTS `detailespace`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detailespace` AS select `t`.`ID_UTILISATEUR` AS `ID_UTILISATEUR`,concat(`utilisateur`.`NOM`,' ',`utilisateur`.`PRENOM`) AS `NOM`,`utilisateur`.`MAIL` AS `MAIL`,`utilisateur`.`NUMERO` AS `NUMERO`,`e`.`ID_ESPACE` AS `ID_ESPACE`,`t`.`THEME` AS `THEME` from ((`utilisateur` join `these` `t` on(`utilisateur`.`ID_UTILISATEUR` = `t`.`ID_UTILISATEUR`)) join `espace` `e` on(`e`.`ID_THESE` = `t`.`ID_THESE`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detailtache`
--

/*!50001 DROP TABLE IF EXISTS `detailtache`*/;
/*!50001 DROP VIEW IF EXISTS `detailtache`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detailtache` AS select `tache`.`ID_TACHE` AS `ID_TACHE`,`detail`.`LIBELLE` AS `ID_TACHED`,concat(`u`.`NOM`,' ',`u`.`PRENOM`) AS `ID_UTILISATEUR`,`tache`.`ID_ESPACE` AS `ID_ESPACE`,`tache`.`DATE_DEBUT` AS `DATE_DEBUT`,`tache`.`DATE_FIN` AS `DATE_FIN`,`tache`.`STATUS` AS `STATUS`,`tache`.`ID_ALARME` AS `ID_ALARME`,`tache`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`ROLE` AS `ROLE`,`detail`.`FICHIER` AS `FICHIER`,`e`.`PRIORITE` AS `PRIORITE` from ((((`tachedefaut` `detail` join `tache` on(`detail`.`ID_TACHED` = `tache`.`ID_TACHED`)) join `executeur` `e` on(`e`.`ID_TACHE` = `tache`.`ID_TACHE`)) join `utilisateur` `u` on(`u`.`ID_UTILISATEUR` = `e`.`ID_UTILISATEUR`)) join `membre` `m` on(`m`.`ID_UTILISATEUR` = `e`.`ID_UTILISATEUR` and `m`.`ID_ESPACE` = `tache`.`ID_ESPACE`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `foisfirstjury`
--

/*!50001 DROP TABLE IF EXISTS `foisfirstjury`*/;
/*!50001 DROP VIEW IF EXISTS `foisfirstjury`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `foisfirstjury` AS select `detailtache`.`ID_UTILISATEUR` AS `id_utilisateur`,year(`detailtache`.`DATE_DEBUT`) AS `annee`,count(0) AS `fois` from `detailtache` where `detailtache`.`ROLE` = '1er Jury' group by year(`detailtache`.`DATE_DEBUT`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `foisiduser`
--

/*!50001 DROP TABLE IF EXISTS `foisiduser`*/;
/*!50001 DROP VIEW IF EXISTS `foisiduser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `foisiduser` AS select `u`.`ID_UTILISATEUR` AS `ID_UTILISATEUR`,case when `f`.`id_utilisateur` is null then concat(`u`.`NOM`,' ',`u`.`PRENOM`) else `f`.`id_utilisateur` end AS `JURY`,case when `f`.`annee` is null then 0 else `f`.`annee` end AS `ANNEE`,case when `f`.`fois` is null then 0 else `f`.`fois` end AS `FOIS` from (`utilisateur` `u` left join `foisjury` `f` on(concat(`u`.`NOM`,' ',`u`.`PRENOM`) = `f`.`id_utilisateur`)) where `u`.`ID_ROLE` = 'R3' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `foisjury`
--

/*!50001 DROP TABLE IF EXISTS `foisjury`*/;
/*!50001 DROP VIEW IF EXISTS `foisjury`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `foisjury` AS select `foisfirstjury`.`id_utilisateur` AS `id_utilisateur`,`foisfirstjury`.`annee` AS `annee`,`foisfirstjury`.`fois` AS `fois` from `foisfirstjury` union select `foissecondjury`.`id_utilisateur` AS `id_utilisateur`,`foissecondjury`.`annee` AS `annee`,`foissecondjury`.`fois` AS `fois` from `foissecondjury` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `foissecondjury`
--

/*!50001 DROP TABLE IF EXISTS `foissecondjury`*/;
/*!50001 DROP VIEW IF EXISTS `foissecondjury`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `foissecondjury` AS select `detailtache`.`ID_UTILISATEUR` AS `id_utilisateur`,year(`detailtache`.`DATE_DEBUT`) AS `annee`,count(0) AS `fois` from `detailtache` where `detailtache`.`ROLE` = '2e Jury' group by year(`detailtache`.`DATE_DEBUT`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `membreespace`
--

/*!50001 DROP TABLE IF EXISTS `membreespace`*/;
/*!50001 DROP VIEW IF EXISTS `membreespace`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `membreespace` AS select `m`.`ID_UTILISATEUR` AS `ID_UTILISATEUR`,concat(`utilisateur`.`NOM`,' ',`utilisateur`.`PRENOM`) AS `NOM`,`utilisateur`.`MAIL` AS `MAIL`,`utilisateur`.`NUMERO` AS `NUMERO`,`m`.`ID_ESPACE` AS `ID_ESPACE`,`m`.`ROLE` AS `ROLE` from (`utilisateur` join `membre` `m` on(`utilisateur`.`ID_UTILISATEUR` = `m`.`ID_UTILISATEUR`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `thesedossier`
--

/*!50001 DROP TABLE IF EXISTS `thesedossier`*/;
/*!50001 DROP VIEW IF EXISTS `thesedossier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `thesedossier` AS select `t`.`ID_THESE` AS `ID_THESE`,`t`.`ID_UTILISATEUR` AS `ID_UTILISATEUR`,concat(`u`.`NOM`,' ',`u`.`PRENOM`) AS `ETUDIANT`,`t`.`THEME` AS `THEME`,`d`.`STATUS` AS `STATUS` from ((`these` `t` join `dossieretudiant` `d` on(`t`.`ID_UTILISATEUR` = `d`.`ID_UTILISATEUR`)) join `utilisateur` `u` on(`u`.`ID_UTILISATEUR` = `t`.`ID_UTILISATEUR`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalfinish`
--

/*!50001 DROP TABLE IF EXISTS `totalfinish`*/;
/*!50001 DROP VIEW IF EXISTS `totalfinish`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalfinish` AS select `tache`.`ID_ESPACE` AS `id_espace`,count(`tache`.`ID_TACHE`) AS `achieve` from `tache` where `tache`.`STATUS` = 1 group by `tache`.`ID_ESPACE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalfinishcomplet`
--

/*!50001 DROP TABLE IF EXISTS `totalfinishcomplet`*/;
/*!50001 DROP VIEW IF EXISTS `totalfinishcomplet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalfinishcomplet` AS select `espace`.`ID_ESPACE` AS `id_espace`,case when `totalfinish`.`achieve` is null then 0 else `totalfinish`.`achieve` end AS `achieve` from (`espace` left join `totalfinish` on(`espace`.`ID_ESPACE` = `totalfinish`.`id_espace`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalprogress`
--

/*!50001 DROP TABLE IF EXISTS `totalprogress`*/;
/*!50001 DROP VIEW IF EXISTS `totalprogress`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalprogress` AS select `tache`.`ID_ESPACE` AS `id_espace`,count(`tache`.`ID_TACHE`) AS `progress` from `tache` where `tache`.`STATUS` = 10 group by `tache`.`ID_ESPACE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalprogresscomplet`
--

/*!50001 DROP TABLE IF EXISTS `totalprogresscomplet`*/;
/*!50001 DROP VIEW IF EXISTS `totalprogresscomplet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalprogresscomplet` AS select `espace`.`ID_ESPACE` AS `id_espace`,case when `totalprogress`.`progress` is null then 0 else `totalprogress`.`progress` end AS `progress` from (`espace` left join `totalprogress` on(`espace`.`ID_ESPACE` = `totalprogress`.`id_espace`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totaltask`
--

/*!50001 DROP TABLE IF EXISTS `totaltask`*/;
/*!50001 DROP VIEW IF EXISTS `totaltask`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totaltask` AS select `tache`.`ID_ESPACE` AS `id_espace`,count(`tache`.`ID_TACHE`) AS `total` from `tache` group by `tache`.`ID_ESPACE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totaltodo`
--

/*!50001 DROP TABLE IF EXISTS `totaltodo`*/;
/*!50001 DROP VIEW IF EXISTS `totaltodo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totaltodo` AS select `tache`.`ID_ESPACE` AS `id_espace`,count(`tache`.`ID_TACHE`) AS `todo` from `tache` where `tache`.`STATUS` = 0 group by `tache`.`ID_ESPACE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totaltodocomplet`
--

/*!50001 DROP TABLE IF EXISTS `totaltodocomplet`*/;
/*!50001 DROP VIEW IF EXISTS `totaltodocomplet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totaltodocomplet` AS select `espace`.`ID_ESPACE` AS `id_espace`,case when `totaltodo`.`todo` is null then 0 else `totaltodo`.`todo` end AS `todo` from (`espace` left join `totaltodo` on(`espace`.`ID_ESPACE` = `totaltodo`.`id_espace`)) */;
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

-- Dump completed on 2022-09-21 14:44:36
