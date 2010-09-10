-- MySQL dump 10.13  Distrib 5.1.49, for apple-darwin10.4.0 (i386)
--
-- Host: localhost    Database: mellterm
-- ------------------------------------------------------
-- Server version	5.1.49-log

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
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (36,'cat1','2010-08-13 08:45:03','2010-08-13 08:45:03',NULL),(37,' cat2','2010-08-13 08:45:03','2010-08-13 08:45:03',NULL),(38,' cat3','2010-08-13 08:45:03','2010-08-13 08:45:03',NULL),(39,'cat3','2010-08-13 08:45:03','2010-08-13 08:45:03',NULL),(40,' cat4','2010-08-13 08:45:03','2010-08-13 08:45:03',NULL),(41,'cat5','2010-08-13 08:45:03','2010-08-13 08:45:03',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_translations` (
  `category_id` int(11) DEFAULT NULL,
  `translation_id` int(11) DEFAULT NULL,
  KEY `index_categories_translations_on_category_id` (`category_id`),
  KEY `index_categories_translations_on_translation_id` (`translation_id`),
  KEY `index_categories_translations_on_category_id_and_translation_id` (`category_id`,`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES (36,342),(36,343),(36,344),(36,347),(36,348),(36,349),(36,350),(36,353),(36,356),(36,357),(36,358),(37,343),(37,344),(37,349),(37,350),(37,356),(37,357),(37,358),(38,344),(38,350),(38,356),(38,357),(38,358),(39,345),(39,351),(40,345),(40,351),(41,346),(41,352),(41,359),(41,360),(41,361);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (13,'company1','2010-08-13 08:45:03','2010-08-13 08:45:03'),(14,'company2','2010-08-13 08:45:03','2010-08-13 08:45:03'),(15,'company3','2010-08-13 08:45:03','2010-08-13 08:45:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en_gb','2010-06-11 05:08:33','2010-06-11 06:58:31'),(2,'de_de','2010-06-11 05:08:40','2010-06-11 05:08:40'),(3,'en_us','2010-06-12 05:42:33','2010-06-12 05:42:33'),(4,'pt','2010-08-12 11:17:22','2010-08-12 11:17:22'),(5,'th','2010-08-12 11:17:22','2010-08-12 11:17:22'),(6,'en','2010-08-13 17:28:04','2010-08-13 17:28:04');
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
  PRIMARY KEY (`id`),
  KEY `index_pages_on_permalink` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home Page','home','<p>This is the default home page.</p>\r\n<p>You can HTML here.</p>\r\n<p>Aliquam erat volutpat. Nam sollicitudin pulvinar convallis. Phasellus mollis placerat eros sit amet euismod. Donec nisl nisi, vulputate eu suscipit at, luctus sed turpis. Sed cursus fringilla justo ultrices tristique. Ut lectus tortor, rhoncus nec ullamcorper sed, rhoncus ac augue.</p>\r\n<p>Quisque malesuada aliquet felis, quis venenatis erat eleifend a. Phasellus sed libero vitae arcu pellentesque vulputate sit amet id nunc. Fusce malesuada, turpis ac rutrum ultrices, turpis augue consectetur elit, vel tristique urna arcu egestas leo. Suspendisse potenti. Proin ante augue, accumsan in condimentum eget, sodales a ligula. Maecenas eget magna at elit fringilla condimentum et ut metus. Curabitur auctor dolor sed lorem placerat vestibulum.</p>\r\n<p>&nbsp;</p>\r\n<p style=\"font-size: 9px;\"><span style=\"color: #ff0000;\">do not delete it</span></p>',3,'2010-06-11 09:19:45','2010-06-20 19:11:38',1,NULL),(2,'Electrical Engineering','electrical','<p>#THIS BOX SHOULD BE HTML-READY AS ON THE SITE YOU SHOWED ME#</p>\r\n<p>This is my page for Electrical Engineering  logo navbar</p>\r\n<p>------</p>\r\n<p>leftcol controls (show/display whats in middle)</p>\r\n<p>-------</p>\r\n<p>middle intro leftcol       sample de_de text rightcol terms</p>',3,'2010-06-12 04:56:04','2010-06-16 11:24:17',1,NULL),(4,'Cat','cat','<p>you can also add images easily</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://icanhascheezburger.files.wordpress.com/2010/06/funny-pictures-cat-is-kissed-by-dog.jpg\" alt=\"\" width=\"400\" height=\"312\" /></p>',1,'2010-06-20 19:12:28','2010-06-20 19:12:28',1,NULL),(5,'NGO NGO NGO','jobcode','<table border=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					&nbsp;&nbsp; CLICK HIGHLIGHTED TERMS FOR TERM-TIPS!!</p>\r\n				<p>\r\n					THE SOURCE TEXT<span style=\"font-family: ArialMT;\"><span style=\"font-family: ArialMT;\"> (a sample)</span><strong><span style=\"font-family: Arial-BoldMT;\">A.I.M.E! </span></strong><span style=\"font-family: ArialMT;\">Programm &quot;Integration von AIDSwaisen in Pflegefamilien&quot; unterst&uuml;tzt in</span></span><span style=\"font-family: ArialMT;\"> </span></p>\r\n				<p>\r\n					Guinea mehr als 1732 Menschen, darunter 1255 Kinder und 477 Erwachsene in 251</p>\r\n				<p>\r\n					Familien in der Hauptstadt Conakry sowie in den Minengebieten Fria und Kamsar - in den</p>\r\n				<p>\r\n					Leistungsbereichen: Ern&auml;hrung, Bildung, Gesundheit und <span style=\"background-color: #99ccff;\">psychosoziale Betreuung</span>.</p>\r\n				<p>\r\n					Unsere mehrj&auml;hrige Erfahrung in der <span style=\"background-color: #99ccff;\">Familienbetreuung</span> hat uns gezeigt, dass den</p>\r\n				<p>\r\n					Kindern und Erwachsenen nur dann nachhaltig geholfen werden kann, wenn diese in allen</p>\r\n				<p>\r\n					o.g. <span style=\"background-color: #99ccff;\">Leistungsbereichen</span> &uuml;ber einen Zeitraum von 1 bis 3 Jahre Unterst&uuml;tzung erhalten.</p>\r\n				<p>\r\n					&nbsp;</p>\r\n				<p>\r\n					&nbsp;</p>\r\n				<p>\r\n					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>\r\n				<p>\r\n					&nbsp;</p>\r\n				<p>\r\n					1. Das</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					&nbsp;&nbsp;&nbsp;&nbsp;USER! click here for&nbsp;the full&nbsp;target document</p>\r\n				<p>\r\n					&gt;&gt;Link to WORD/GOOGLE DOCS PAGE&nbsp;</p>\r\n				\r\n				<p>\r\n					&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					TERMS TERMS TERMS</p>\r\n				<p>\r\n					DE DE F&ouml;rderverein<br />\r\n					EN GB fundraising association</p>\r\n				<p>\r\n					SOURCE ???</p>\r\n				<p>\r\n					CONTEXT Aktion zur Integration von Mutter und Kind in Entwicklungsl&auml;ndern e.V., wurde in Deutschland 2004 als F&ouml;rderverein gegr&uuml;ndet und ist seit Januar 2006 als gemeinn&uuml;tzig anerkannt.</p>\r\n				<p>\r\n					&nbsp;</p>\r\n				<p>\r\n					&nbsp;</p>\r\n			</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<iframe src=\"http://docs.google.com/document/pub?id=1WOtsWTyV4ypChjXvgFUa_ZsoqatogE16skOiOxwwyPk&amp;embedded=true\"></iframe>\r\n',1,'2010-06-26 02:33:31','2010-07-14 13:16:02',1,NULL),(6,'NGO 2','ngo','<p>\r\n	+++++++++++</p>\r\n<p>\r\n	User click here for target document as it is being edited</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<iframe  SCROLL=\"no\" src=\"http://docs.google.com/document/pub?id=1WOtsWTyV4ypChjXvgFUa_ZsoqatogE16skOiOxwwyPk&amp;embedded=true\"></iframe></p>\r\n<p>\r\n	+++++++++++++</p>\r\n<p>\r\n	Source text sample</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	1. Das</p>\r\n<p>\r\n	<strong><span style=\"font-family: Arial-BoldMT;\">A.I.M.E! </span></strong><span style=\"font-family: ArialMT;\">Programm &quot;Integration von AIDSwaisen in Pflegefamilien&quot; unterst&uuml;tzt in</span><span style=\"font-family: ArialMT;\"> </span></p>\r\n<p>\r\n	<span style=\"font-family: ArialMT;\">Guinea mehr als 1732 Menschen, darunter 1255 Kinder und 477 Erwachsene in 251</span></p>\r\n<p>\r\n	<span style=\"font-family: ArialMT;\">Familien in der Hauptstadt Conakry sowie in den Minengebieten Fria und Kamsar - in den</span></p>\r\n<p>\r\n	<span style=\"font-family: ArialMT;\">Leistungsbereichen: Ern&auml;hrung, Bildung, Gesundheit und psychosoziale Betreuung.</span></p>\r\n<p>\r\n	<span style=\"font-family: ArialMT;\">Unsere mehrj&auml;hrige Erfahrung in der Familienbetreuung hat uns gezeigt, dass den</span></p>\r\n<p>\r\n	<span style=\"font-family: ArialMT;\">Kindern und Erwachsenen nur dann nachhaltig geholfen werden kann, wenn diese in allen</span></p>\r\n<p>\r\n	<span style=\"font-family: ArialMT;\">o.g. Leistungsbereichen &uuml;ber einen Zeitraum von 1 bis 3 Jahre Unterst&uuml;tzung erhalten.</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	++++++++++++</p>\r\n<p>\r\n	Terms</p>\r\n<p>\r\n	DE DE F&ouml;rderverein<br />\r\n	EN GB fundraising association</p>\r\n<p>\r\n	SOURCE ???</p>\r\n<p>\r\n	CONTEXT Aktion zur Integration von Mutter und Kind in Entwicklungsl&auml;ndern e.V., wurde in Deutschland 2004 als F&ouml;rderverein gegr&uuml;ndet und ist seit Januar 2006 als gemeinn&uuml;tzig anerkannt.</p>\r\n',1,'2010-06-26 02:38:18','2010-07-14 13:26:58',1,NULL);
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
INSERT INTO `schema_migrations` VALUES ('20100529070102'),('20100529070256'),('20100529070456'),('20100529070829'),('20100529071346'),('20100615085920'),('20100615090553'),('20100619101434'),('20100619102617'),('20100713085541'),('20100713085615'),('20100724122016'),('20100802140230');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(255) DEFAULT NULL,
  `value` text,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_settings_on_var` (`var`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site_meta_keywords','Meta Keywords',NULL,'2010-06-20 19:13:47','2010-06-20 19:13:47'),(2,'site_email_alert','email@email.com',NULL,'2010-06-20 19:13:47','2010-06-20 19:13:47'),(3,'site_sub_title','my translations site',NULL,'2010-06-20 19:13:47','2010-07-14 15:02:42'),(4,'site_meta_title','Translations',NULL,'2010-06-20 19:13:47','2010-07-14 15:05:03'),(5,'site_meta_description','Meta Description',NULL,'2010-06-20 19:13:47','2010-06-20 19:13:47'),(6,'site_title','Translations',NULL,'2010-06-20 19:13:47','2010-06-20 19:13:47'),(7,'ga_key','UA-xxxxxx-xx',NULL,'2010-06-20 19:13:47','2010-06-20 19:13:47'),(8,'site_email','email@email.com',NULL,'2010-06-20 19:13:47','2010-06-20 19:13:47'),(9,'site_email_alert_subject','from mellterm',NULL,'2010-06-20 19:13:47','2010-06-20 19:13:47'),(10,'footer','Copyright (c) 2010 mellterm. All rights reserved.',NULL,'2010-06-20 19:13:47','2010-06-23 04:55:56');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
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
  `company_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_translations_on_source_language_id` (`source_language_id`),
  KEY `index_translations_on_target_language_id` (`target_language_id`),
  KEY `index_translations_on_company_id` (`company_id`),
  KEY `index_translations_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (342,'de1','en1',2,3,13,'notes','2010-08-13 08:45:03','2010-08-13 08:45:03',1),(343,'de2','en2',2,3,13,'notes','2010-08-13 08:45:03','2010-08-13 08:45:03',1),(344,'de3','en3',2,3,14,'notes','2010-08-13 08:45:03','2010-08-13 08:45:03',1),(345,'de4','en4',2,3,14,'notes','2010-08-13 08:45:03','2010-08-13 08:45:03',1),(346,'de5','en5',2,3,15,'notes','2010-08-13 08:45:03','2010-08-13 08:45:03',1),(347,'de6','en6',2,3,13,'notes','2010-08-13 08:45:03','2010-08-13 08:45:03',1),(348,'pt1','en1',4,5,13,'notes','2010-08-13 08:45:15','2010-08-13 08:45:15',1),(349,'pt2','en2',4,5,13,'notes','2010-08-13 08:45:15','2010-08-13 08:45:15',1),(350,'pt3','en3',4,5,14,'notes','2010-08-13 08:45:15','2010-08-13 08:45:15',1),(351,'pt4','en4',4,5,14,'notes','2010-08-13 08:45:15','2010-08-13 08:45:15',1),(352,'pt5','en5',4,5,15,'notes','2010-08-13 08:45:15','2010-08-13 08:45:15',1),(353,'pt6','en6',4,5,13,'notes','2010-08-13 08:45:15','2010-08-13 08:45:15',1),(354,'Ablage','Personal Clipboard',2,1,0,'','2010-08-13 10:00:57','2010-08-13 10:00:57',1),(355,'Ablage','Personal Clipboard',2,1,0,'','2010-08-13 10:02:27','2010-08-13 10:02:27',1),(356,'no1','en1',5,6,NULL,'','2010-08-13 17:28:04','2010-08-13 17:28:04',1),(357,'no2','en2',5,6,NULL,'','2010-08-13 17:28:04','2010-08-13 17:28:04',1),(358,'no3','en3',5,6,NULL,'','2010-08-13 17:28:04','2010-08-13 17:28:04',1),(359,'no1','en1',5,6,13,'','2010-08-13 17:33:13','2010-08-13 17:33:13',1),(360,'no2','en2',5,6,13,'','2010-08-13 17:33:13','2010-08-13 17:33:13',1),(361,'no3','en3',5,6,13,'','2010-08-13 17:33:13','2010-08-13 17:33:13',1),(362,'no1','en1',5,6,NULL,'','2010-08-13 17:35:08','2010-08-13 17:35:08',1),(363,'no2','en2',5,6,NULL,'','2010-08-13 17:35:08','2010-08-13 17:35:08',1),(364,'no3','en3',5,6,NULL,'','2010-08-13 17:35:08','2010-08-13 17:35:08',1);
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
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `index_users_on_login` (`login`),
  KEY `index_users_on_persistence_token` (`persistence_token`),
  KEY `index_users_on_last_request_at` (`last_request_at`),
  KEY `index_users_on_email` (`email`),
  KEY `index_users_on_admin` (`admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@localhost.com','a693904532d1fdff47930f55891aa12cc04d4f5b43dd77d12576ce996b5937334981c4b5618eb0e3cf0e2eeb9a34bb5aa6297d47db165f7d9a784ab237a0dcdf','2q8UPVIbPT0KrJCgdB5N','920ffff1198e05efd93e1ebb54cb4b4a42acedd57ffaad55ed720192e6c2c849171d768071f825482b3565fc34d1b0b2dcb7841bbd158e37b1858b6969676e4c','c0wAS3bAKyN-Z-TKMzCK','e-pkGhUBOutHE0sGXoxZ',21,0,'2010-09-10 05:24:51','2010-09-10 04:47:12','2010-08-12 10:28:31','127.0.0.1','127.0.0.1',1,'2010-06-16 10:44:27','2010-09-10 05:24:51',NULL,NULL,NULL,NULL,NULL),(2,'fred','fred.the.master@gmail.com','4fe9523d117f18996154772792da8da5a1222ce8764afc4f980f27fdb0ed7738380d582573d60975e4511f86b998601c9c4b0407381c0e5d314543ea506eb860','Y6qaJApkiK-IBiMLStAW','78d162e9e526192faaf68d10c8749e259f9058c4da09d7be4eeb7b5e52a5fb01f49489a9a531ff200bc5e682c31ebc8b0011839b759b27b135b1c173e2efeec2','uPhXAJxgKu1RJ3b3DwHD','gfCw3z_rw5HkOMontK17',0,0,NULL,NULL,NULL,NULL,NULL,1,'2010-07-14 14:54:16','2010-07-14 14:54:16','Frederico','123456753','',NULL,NULL);
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

-- Dump completed on 2010-09-10 12:35:00
