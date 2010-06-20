-- MySQL dump 10.13  Distrib 5.1.46, for pc-linux-gnu (x86_64)
--
-- Host: localhost    Database: mellterm
-- ------------------------------------------------------
-- Server version	5.1.46-log

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'ELEC','2010-06-12 04:51:16','2010-06-12 04:51:16'),(3,'LEGAL','2010-06-12 04:51:28','2010-06-12 04:51:28'),(4,'TECH','2010-06-12 04:51:41','2010-06-12 04:51:41'),(5,'MACH','2010-06-12 05:48:49','2010-06-12 05:48:49'),(6,'PROC','2010-06-12 05:49:04','2010-06-12 05:49:04'),(7,'SAFETY','2010-06-12 05:49:15','2010-06-12 05:49:15');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'ABC','2010-06-11 05:08:46','2010-06-11 05:08:46');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en_gb','2010-06-11 05:08:33','2010-06-11 06:58:31'),(2,'de_de','2010-06-11 05:08:40','2010-06-11 05:08:40'),(3,'en_us','2010-06-12 05:42:33','2010-06-12 05:42:33');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `body` text,
  `language_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `menu_order` int(11) DEFAULT '1',
  `link_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home Page','home','<p>Home Page</p>',2,'2010-06-11 09:19:45','2010-06-16 11:24:40',1,NULL),(2,'Electrical Engineering','electrical','<p>#THIS BOX SHOULD BE HTML-READY AS ON THE SITE YOU SHOWED ME#</p>\r\n<p>This is my page for Electrical Engineering  logo navbar</p>\r\n<p>------</p>\r\n<p>leftcol controls (show/display whats in middle)</p>\r\n<p>-------</p>\r\n<p>middle intro leftcol       sample de_de text rightcol terms</p>',3,'2010-06-12 04:56:04','2010-06-16 11:24:17',1,NULL),(3,'Home Page','home','<p><img title=\"Cool\" src=\"../javascripts/tiny_mce/plugins/emotions/img/smiley-cool.gif\" border=\"0\" alt=\"Cool\" /></p>',1,'2010-06-17 03:59:44','2010-06-17 03:59:44',1,NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20100529070102'),('20100529070256'),('20100529070456'),('20100529070829'),('20100529071346'),('20100615085920'),('20100615090553');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_content` varchar(255) DEFAULT NULL,
  `target_content` varchar(255) DEFAULT NULL,
  `source_language_id` int(11) DEFAULT NULL,
  `target_language_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (117,'Ablage','Personal Clipboard',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(118,'Allgemein','General',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(119,'Allg. Hinweise','general hints',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(120,'Aufgaben','Tasks',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(121,'Auftrag','Appointment',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(122,'Auswertung','Analysis',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(123,'Beitrag','Article',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(124,'Benutzer','User',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(125,'CustomSchnittImport','Custom Cut Import',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(126,'Datenträger','Volume',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(127,'Disziplinen','field Events',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(128,'Dokumentation','Documentation',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(129,'Einstellungen','Configuration',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(130,'Ereignis','Event',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(131,'Ereignisart','Event Type',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(132,'Ereignisimport','Event import',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(133,'Fertigmeldung','Ready Signal',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(134,'Freigabe','Approval',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(135,'Geschlecht','Gender',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(136,'Hochrechnung','Extrapolation',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(137,'Infos','Infos',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(138,'Kalender','Calender',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(139,'Kanäle','Canal',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(140,'Kontrolle','Checking',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(141,'Länder','Countrys',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(142,'LDAP-Konfiguration','LDAP-Configuration',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(143,'Mandanten','Clients',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(144,'Orte','Locations',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(145,'Panel','Panel',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(146,'Print','Print',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(147,'Quoten','Quoten',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(148,'Recherche','Research',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(149,'Richtlinien','Instructions',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(150,'Saisons','Saisons',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(151,'Selektionen','Selections',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(152,'Sender','Channel',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(153,'Sendung','Program',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(154,'Sendungen','Programs',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(155,'Sendung Excelexport','Program Excelexport',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(156,'Sendelisten Excelimport','Programlist Excelimport',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(157,'Sendungen Rohdaten löschen','delete Program rawdata',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(158,'Sendungsschemata','Progam schema',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(159,'Serien','Series',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(160,'Sicherheitsgruppen','Security Group',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(161,'Sicherheitsrechte','Security Rights',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(162,'Spieler','Player',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(163,'Sponsoren','Sponsor',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(164,'Sportart-Anhang','Sport addition',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(165,'Sportartbereiche','Sport bereiche',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(166,'Sportarten','Sport group',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(167,'Sprachen','Languages',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(168,'Stammdaten','Master data',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(169,'Statistik','Statistic',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(170,'Status','States',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(171,'Stoppzeiten','Stop time',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(172,'Studien','Studies',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(173,'Studienbausteine','Studie module',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(174,'Studiendefinition','Studie definition',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(175,'Studienprofile','Studie profile',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(176,'Teams','Teams',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(177,'Termine','Deadlines',2,1,NULL,NULL,NULL,'2010-06-12 05:30:09','2010-06-12 05:30:09'),(178,'Themen','Subjects',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(179,'TV','TV',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(180,'Übersicht','Overview',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(181,'Verwaltung','Administration',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(182,'Werbebotschaft','Advertising message',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(183,'Werbemittel','Advertising media',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(184,'Werbemittel-Anhang','Advertising media addition',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(185,'Werbepreise','Advertising prices',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(186,'Wettbewerb-Anhang','Champingionships addition',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(187,'Wettbewerbe','Champingionships',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(188,'Wettbewerbsart','Champingionships type',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(189,'Wk-Phasen','Wk-Phase',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(190,'Zeitzonen','Timezone',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(191,'Zielgruppen','Target group',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(192,'Stoppzeiten übertragen','copy stoptimes',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(193,'Neuer Eintrag','New Entry',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(194,'Quotenimport','Quotenimport',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(195,'Massenverarbeitung','multiedit',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(196,'Selektionsergebnis','selection result',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(197,'Schnellerfassung','Quick Insert',2,1,NULL,NULL,NULL,'2010-06-12 05:30:10','2010-06-12 05:30:10'),(198,'Bewertung des Sicherheitssystems','Evaluation of the safety system',2,3,6,1,'hello','2010-06-12 06:08:05','2010-06-12 06:08:05'),(199,'Sicherheitssystem','safety system',2,3,6,1,'also SAFETY','2010-06-12 06:11:37','2010-06-12 06:11:37'),(200,'Ablage','something else',2,3,6,NULL,'something else','2010-06-17 10:02:00','2010-06-17 10:02:00');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `single_access_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_login` (`login`),
  KEY `index_users_on_persistence_token` (`persistence_token`),
  KEY `index_users_on_last_request_at` (`last_request_at`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@localhost.com','a693904532d1fdff47930f55891aa12cc04d4f5b43dd77d12576ce996b5937334981c4b5618eb0e3cf0e2eeb9a34bb5aa6297d47db165f7d9a784ab237a0dcdf','2q8UPVIbPT0KrJCgdB5N','920ffff1198e05efd93e1ebb54cb4b4a42acedd57ffaad55ed720192e6c2c849171d768071f825482b3565fc34d1b0b2dcb7841bbd158e37b1858b6969676e4c','c0wAS3bAKyN-Z-TKMzCK','q8W3z4Z73kGb9P57TIck',3,0,'2010-06-20 07:41:03','2010-06-19 11:56:13','2010-06-17 03:53:00','116.48.178.222','58.8.250.199',1,'2010-06-16 10:44:27','2010-06-20 07:41:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-20 16:22:44
