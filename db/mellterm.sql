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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `data_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,'test file','',NULL,0,'2010-09-10 09:48:42','2010-09-10 09:48:42','IMG_0131.PNG','image/png',108208,'2010-09-10 09:48:42');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (42,'PROC','2010-09-10 11:10:17','2010-09-17 08:33:54',''),(43,'TECH','2010-09-17 08:33:37','2010-09-17 08:33:37','TECH'),(44,'MECH','2010-09-17 08:33:48','2010-09-17 08:33:48','Mechanical'),(45,'SAFETY','2010-09-17 08:34:05','2010-09-17 08:34:05','SAFETY');
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
INSERT INTO `categories_translations` VALUES (43,455),(43,456),(43,457),(43,458),(43,459),(43,460),(43,461),(43,462),(43,463),(43,464),(43,465),(43,466),(43,467),(43,468),(43,469),(43,470),(43,471),(43,472),(43,473),(43,474),(43,475),(43,476),(43,477),(43,478),(43,479),(43,480),(43,481),(43,482),(43,483),(43,484),(43,485),(43,486),(43,487),(43,488),(43,489),(43,490),(43,491),(43,492),(43,493),(43,494),(43,495),(43,496),(43,497),(43,498),(43,499),(43,500),(43,501),(43,502),(43,503),(43,504),(43,505),(43,506),(43,507),(43,508),(43,509),(43,510),(43,511),(43,512),(43,513),(43,514),(43,515),(43,516),(43,517),(43,518),(43,519),(43,520),(43,521),(43,522),(43,523),(43,524),(43,525),(43,526),(43,527),(43,528),(43,529),(43,530),(43,531),(43,532),(43,533),(43,534),(43,535),(44,455),(44,456),(44,457),(44,458),(44,459),(44,460),(44,461),(44,462),(44,463),(44,464),(44,465),(44,466),(44,467),(44,468),(44,469),(44,470),(44,471),(44,472),(44,473),(44,474),(44,475),(44,476),(44,477),(44,478),(44,479),(44,480),(44,481),(44,482),(44,483),(44,484),(44,485),(44,486),(44,487),(44,488),(44,489),(44,490),(44,491),(44,492),(44,493),(44,494),(44,495),(44,496),(44,497),(44,498),(44,499),(44,500),(44,501),(44,502),(44,503),(44,504),(44,505),(44,506),(44,507),(44,508),(44,509),(44,510),(44,511),(44,512),(44,513),(44,514),(44,515),(44,516),(44,517),(44,518),(44,519),(44,520),(44,521),(44,522),(44,523),(44,524),(44,525),(44,526),(44,527),(44,528),(44,529),(44,530),(44,531),(44,532),(44,533),(44,534),(44,535);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (13,'company1','2010-08-13 08:45:03','2010-08-13 08:45:03'),(14,'company2','2010-08-13 08:45:03','2010-08-13 08:45:03'),(15,'company3','2010-08-13 08:45:03','2010-08-13 08:45:03'),(16,'TÜV NORD ','2010-09-10 11:10:17','2010-09-10 11:10:17');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `date_updated_at` datetime DEFAULT NULL,
  `xliff_xmlns` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_original` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_source_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_datatype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_tool` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_tool_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_xml_space` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_ts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_target_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_product_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xliff_build_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_encoding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '0',
  `assigned` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `expires_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_documents_on_user_id` (`user_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_language_id` (`language_id`),
  KEY `index_documents_on_team_id` (`team_id`),
  KEY `index_documents_on_company_id` (`company_id`),
  KEY `index_documents_on_public` (`public`),
  KEY `index_documents_on_assigned` (`assigned`),
  KEY `index_documents_on_completed` (`completed`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (4,'AUTOBILD2_de_en.xlf','',9622,NULL,'urn:oasis:names:tc:xliff:document:1.1','1.1','AUTOBILD_de2.odf.odt','en','plaintext',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UTF-8',1,NULL,42,NULL,NULL,0,0,0,NULL,'','','2010-10-20 09:26:32','2010-10-20 09:26:33');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
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
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en_gb','2010-06-11 05:08:33','2010-10-12 07:41:17','en_gb'),(2,'de_de','2010-06-11 05:08:40','2010-10-12 07:42:46','de_de'),(3,'en_us','2010-06-12 05:42:33','2010-10-12 07:42:54','en_us'),(4,'pt','2010-08-12 11:17:22','2010-08-12 11:17:22','pt'),(5,'th','2010-08-12 11:17:22','2010-08-12 11:17:22','th'),(6,'en','2010-08-13 17:28:04','2010-08-13 17:28:04','en');
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
  `header_content` text,
  `location` varchar(255) DEFAULT 'page',
  `display_order` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_pages_on_permalink` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home Page','home','<p>This is the default home page.</p>\r\n<p>You can HTML here.</p>\r\n<p>Aliquam erat volutpat. Nam sollicitudin pulvinar convallis. Phasellus mollis placerat eros sit amet euismod. Donec nisl nisi, vulputate eu suscipit at, luctus sed turpis. Sed cursus fringilla justo ultrices tristique. Ut lectus tortor, rhoncus nec ullamcorper sed, rhoncus ac augue.</p>\r\n<p>Quisque malesuada aliquet felis, quis venenatis erat eleifend a. Phasellus sed libero vitae arcu pellentesque vulputate sit amet id nunc. Fusce malesuada, turpis ac rutrum ultrices, turpis augue consectetur elit, vel tristique urna arcu egestas leo. Suspendisse potenti. Proin ante augue, accumsan in condimentum eget, sodales a ligula. Maecenas eget magna at elit fringilla condimentum et ut metus. Curabitur auctor dolor sed lorem placerat vestibulum.</p>\r\n<p>&nbsp;</p>\r\n<p style=\"font-size: 9px;\"><span style=\"color: #ff0000;\">do not delete it</span></p>',3,'2010-06-11 09:19:45','2010-06-20 19:11:38',1,NULL,NULL,'page',1),(7,'About Us','about_us','<p>\r\n	This is the sidebar content</p>\r\n<p>\r\n	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. <a href=\"#\">Ut wisi enim ad minim veniam</a>, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure <a href=\"#\">dolor in hendrerit</a> in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>\r\n',1,'2010-09-17 09:49:12','2010-10-12 07:59:29',1,NULL,'','sidebar',1);
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
INSERT INTO `schema_migrations` VALUES ('20100529070102'),('20100529070256'),('20100529070456'),('20100529070829'),('20100529071346'),('20100615085920'),('20100615090553'),('20100619101434'),('20100619102617'),('20100713085541'),('20100713085615'),('20100724122016'),('20100802140230'),('20100910065740'),('20100910092910'),('20100910093016'),('20100910105059'),('20100913071041'),('20100917093605'),('20101011124513'),('20101012073044'),('20101012090136'),('20101012091133'),('20101020052615'),('20101020094020');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segments`
--

DROP TABLE IF EXISTS `segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_language_id` int(11) DEFAULT NULL,
  `target_language_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cru` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `raw_data` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segments`
--

LOCK TABLES `segments` WRITE;
/*!40000 ALTER TABLE `segments` DISABLE KEYS */;
INSERT INTO `segments` VALUES (105,'AutoBild Allrad Zukunft VW Polo SUV','AutoBild Allrad Future VW Polo SUV.   ',6,1,42,NULL,1,NULL,NULL,'','idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[0]xml:spacepreservetargetcontentAutoBild Allrad Future VW Polo SUVsourcecontentAutoBild Allrad Zukunft VW Polo SUV','2010-10-20 09:26:33','2010-10-20 19:20:29',4,1),(106,'Die Crossen Kleinen','The small crossovers',6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[3]xml:spacepreservetargetcontentThe small crossoverssourcecontentDie Crossen Kleinen','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(107,'Noch geheim: VW und Zuzuki denken über gemeinsame kompakte Allradmodelle nach.','Still under wraps: VW and Suzuki are thinking about joint compact 4WD models.',6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[4]xml:spacepreservetargetcontentStill under wraps: VW and Suzuki are thinking about joint compact 4WD models.sourcecontentNoch geheim: VW und Zuzuki denken über gemeinsame kompakte Allradmodelle nach.','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(108,'VW und Suzuki, das ist die Auto-Allianz des Jahres 2010. Die Deutschen besitzen knapp 20 Prozent am japanischen Hersteller - und die beiden Unternehmen ergänzen sich perfekt. Denn VW kann alles außer billig. Suzuki weiß dagegen, wie man mit kleinen und kl','VW and Suzuki: the alliance of 2010. The Germans own almost 20 of the Japanese carmaker- and the two companies complement each other perfectly. VW can do anything- except cheap and for its part, Suzuki knows a thing or two about making good money building',6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[5]xml:spacepreservetargetcontentVW and Suzuki: the alliance of 2010. The Germans own almost 20 of the Japanese carmaker- and the two companies complement each other perfectly. VW can do anything- except cheap and for its part, Suzuki knows a thing or two about making good money building small and super-small cars, whether in Japan or Europe.sourcecontentVW und Suzuki, das ist die Auto-Allianz des Jahres 2010. Die Deutschen besitzen knapp 20 Prozent am japanischen Hersteller - und die beiden Unternehmen ergänzen sich perfekt. Denn VW kann alles außer billig. Suzuki weiß dagegen, wie man mit kleinen und kleinsten Autos selbst dann gutes Geld verdient, wenn sie in Japan oder Europa gebaut werden.','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(109,'VWPoloSUV',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[8]xml:spacepreservetargetsourcexid0xidoffice:document-content[0]/office:body[0]/office:text[0]/text:p[8]/text:bookmark-start[0]id1xidoffice:document-content[0]/office:body[0]/office:text[0]/text:p[8]/text:bookmark-end[0]contentVWPoloSUV','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(110,'Kleiner als der Tiguan, aber geräumiger als der heutige Polo. Ab 2013 könnte der sparsame Allradler für 20 000 Euro an den Start gehen',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[9]xml:spacepreservetargetsourcexid2xidoffice:document-content[0]/office:body[0]/office:text[0]/text:p[9]/text:bookmark-start[0]id3xidoffice:document-content[0]/office:body[0]/office:text[0]/text:p[9]/text:bookmark-end[0]contentKleiner als der Tiguan, aber geräumiger als der heutige Polo. Ab 2013 könnte der sparsame Allradler für 20 000 Euro an den Start gehen','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(111,'berichtet - doch das ist schon wieder vom Tisch. Warum? Weil Suzuki beim Jimny mit viel längeren Zyklen kalkuliert, weil die Japaner nicht vom Simpeltechnik-Ansatz abweichen wollen und weil das Jimny-Profil im Markenverbund höchstens zu Skoda passt. Das P',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[11]xml:spacepreservesourcecontentberichtet - doch das ist schon wieder vom Tisch. Warum? Weil Suzuki beim Jimny mit viel längeren Zyklen kalkuliert, weil die Japaner nicht vom Simpeltechnik-Ansatz abweichen wollen und weil das Jimny-Profil im Markenverbund höchstens zu Skoda passt. Das Projekt ist zwar nicht gestorben, es soll aber auf Märkte wie Indien oder Südamerika beschränkt bleiben.','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(112,'Für anspruchsvollere Absatzgebiete haben die Marketing- und Entwicklungsexperten statt dessen den Nachfolger des Suzuki SX4 auserkoren, der aktuell gemeinsam mit dem Fiat Sedi- ci in Ungarn vom Band läuft. Weil die Kooperationsdeals mit Fiat und Opel in d',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[12]xml:spacepreservesourcecontentFür anspruchsvollere Absatzgebiete haben die Marketing- und Entwicklungsexperten statt dessen den Nachfolger des Suzuki SX4 auserkoren, der aktuell gemeinsam mit dem Fiat Sedi- ci in Ungarn vom Band läuft. Weil die Kooperationsdeals mit Fiat und Opel in der neuen Konstellation kaum Bestand haben dürften, ist demnächst die Bahn frei für einen modernen Softroader, der neben Suzuki und VW auch für Seat, Skoda und Audi an den Start gehen soll. Im Prinzip hat VW mit MQB (mo- dularer Querbaukasten) gerade erst eine eigene neue Matrix komplettiert, die günstiger und flexibler ist als die alte PQ-Architektur (PQ=Plattform für','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(113,'Quereinbau). Aber weil in diesem Unternehmen die Ingenieure das Sagen haben, wird nicht gespart, sondern di- versifiziert, aufgerüstet und optimiert.',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[13]xml:spacepreservesourcecontentQuereinbau). Aber weil in diesem Unternehmen die Ingenieure das Sagen haben, wird nicht gespart, sondern di- versifiziert, aufgerüstet und optimiert.','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(114,'Vor allem im Polo-Segment geht die Kostenschere eher auf statt zu - deshalb sind jetzt die Sparfüchse aus Japan gefragt. Sie sollen ein Fahrzeugkonzept entwickeln, das in einigen wichtigen Punkten der Polo-DNA über-',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[14]xml:spacepreservesourcecontentVor allem im Polo-Segment geht die Kostenschere eher auf statt zu - deshalb sind jetzt die Sparfüchse aus Japan gefragt. Sie sollen ein Fahrzeugkonzept entwickeln, das in einigen wichtigen Punkten der Polo-DNA über-','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(115,'Das noch namenlose Projekt wird flexibel und preiswert','New',6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[15]xml:spacepreservesourcecontentDas noch namenlose Projekt wird flexibel und preiswert','2010-10-20 09:26:33','2010-10-20 19:23:13',4,1),(116,'legen ist. Der Eigenschaftskatalog beinhaltet Begriffe wie allradfähig, flexibel hinsichtlich Abmessungen und verschiedenen Karosserievarianten, tauglich für alternative Antriebe von Hybrid bis Elektro, durch vorgefertigte Bauteile und neue Fügetechniken ','Nothing much here. ',6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[16]xml:spacepreservesourcecontentlegen ist. Der Eigenschaftskatalog beinhaltet Begriffe wie allradfähig, flexibel hinsichtlich Abmessungen und verschiedenen Karosserievarianten, tauglich für alternative Antriebe von Hybrid bis Elektro, durch vorgefertigte Bauteile und neue Fügetechniken billig in der Herstellung, ausgestattet mit einer frei und beliebig oft neu programmierbaren Elektronik.','2010-10-20 09:26:33','2010-10-20 19:23:06',4,1),(117,'Wie flexibel das noch namenlose Konstrukt sein soll, verdeutlicht ein',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[17]xml:spacepreservesourcecontentWie flexibel das noch namenlose Konstrukt sein soll, verdeutlicht ein','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(118,'Blick auf die Spannbreite des Angebots, das vom Suzuki-Hochdachkombi bis zum zweitürigen Crossover-Coupe (Audi Ql) reicht. Die Staffelung der fünf Modelle sieht im Detail so aus:',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[18]xml:spacepreservesourcecontentBlick auf die Spannbreite des Angebots, das vom Suzuki-Hochdachkombi bis zum zweitürigen Crossover-Coupe (Audi Ql) reicht. Die Staffelung der fünf Modelle sieht im Detail so aus:','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(119,'VW Polo SUV, positioniert zwischen CrossPolo und Tiguan, mit VW-Motoren/Getrieben, Start 2013;',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:list[0]/text:list-item[0]/text:p[0]xml:spacepreservesourcecontentVW Polo SUV, positioniert zwischen CrossPolo und Tiguan, mit VW-Motoren/Getrieben, Start 2013;','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(120,'Audi Ql, Erweiterung der Q-Reihe, vermutlich drei- statt fünftüriger Softroader, Einsatz offen;',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:list[0]/text:list-item[1]/text:p[0]xml:spacepreservesourcecontentAudi Ql, Erweiterung der Q-Reihe, vermutlich drei- statt fünftüriger Softroader, Einsatz offen;','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(121,'Seat Tribu, könnte Leon Freetrack heißen, viertüriges Hochdach-Coupe im Allroad-Stil, Start 2014;',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:list[0]/text:list-item[2]/text:p[0]xml:spacepreservesourcecontentSeat Tribu, könnte Leon Freetrack heißen, viertüriges Hochdach-Coupe im Allroad-Stil, Start 2014;','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(122,'Skoda-Yeti-Nachfolger, geräumig und nutzwertorientiert, optionales Offroad-Paket, Start 2015;',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:list[0]/text:list-item[3]/text:p[0]xml:spacepreservesourcecontentSkoda-Yeti-Nachfolger, geräumig und nutzwertorientiert, optionales Offroad-Paket, Start 2015;','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(123,'Suzuki-SX4-Nachfolger, allradtaug- licher Sportkombi, Start 2013.',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:list[0]/text:list-item[4]/text:p[0]xml:spacepreservesourcecontentSuzuki-SX4-Nachfolger, allradtaug- licher Sportkombi, Start 2013.','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(124,'VW braucht das Polo-SUV als Gegenpol zum künfigen Opel Corsa Cross- over und zum Nachfolger des Ford Fusion. Der neue VW erhält eine eigenständige Karosserie, die zwar sofort als Polo zu erkennen ist, aber bulliger und funktioneller wirkt. Erfolgsaussicht',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[19]xml:spacepreservesourcecontentVW braucht das Polo-SUV als Gegenpol zum künfigen Opel Corsa Cross- over und zum Nachfolger des Ford Fusion. Der neue VW erhält eine eigenständige Karosserie, die zwar sofort als Polo zu erkennen ist, aber bulliger und funktioneller wirkt. Erfolgsaussichten? Bestens.[Georg Kacher]gid4','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(125,'Audi Q1',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[21]xml:spacepreservesourcecontentAudi Q1','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(126,'Kompakte Lifestyle- Allradler sind definitiv ein Trend der nächsten Jahre. Ein dreitüriger Audi Ql für rund 25 000 Euro passt perfekt ins Bild',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[22]xml:spacepreservesourcecontentKompakte Lifestyle- Allradler sind definitiv ein Trend der nächsten Jahre. Ein dreitüriger Audi Ql für rund 25 000 Euro passt perfekt ins Bild','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(127,'Skoda Yeti II',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[24]xml:spacepreservesourcecontentSkoda Yeti II','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(128,'Die Technik des VW-Suzuki-Projekts eignet sich bestens auch für den Yeti-Nachfolger, der in Basisversion unter 20000 Euro bleiben soll',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[25]xml:spacepreservesourcexid5xidoffice:document-content[0]/office:body[0]/office:text[0]/text:p[25]/text:soft-page-break[0]contentDie Technik des VW-Suzuki-Projekts eignet sich bestens auch für den Yeti-Nachfolger, der in Basisversion unter 20000 Euro bleiben soll','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(129,'Seat Leon Freetrack',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[27]xml:spacepreservesourcecontentSeat Leon Freetrack','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL),(130,'Auch die Marke Seat steht in den Startlöchern für ein kompaktes SUV, das ebenfalls in der Region von 20 000 Euro antreten kann',NULL,6,NULL,42,NULL,1,NULL,NULL,NULL,'idoffice:document-content[0]/office:body[0]/office:text[0]/text:p[28]xml:spacepreservesourcexid6xidoffice:document-content[0]/office:body[0]/office:text[0]/text:p[28]/text:bookmark[0]contentAuch die Marke Seat steht in den Startlöchern für ein kompaktes SUV, das ebenfalls in der Region von 20 000 Euro antreten kann','2010-10-20 09:26:33','2010-10-20 09:26:33',4,NULL);
/*!40000 ALTER TABLE `segments` ENABLE KEYS */;
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
  `internal_id` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_translations_on_source_language_id` (`source_language_id`),
  KEY `index_translations_on_target_language_id` (`target_language_id`),
  KEY `index_translations_on_company_id` (`company_id`),
  KEY `index_translations_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (455,'Ablage','Personal Clipboard',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(456,'Allgemein','General',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(457,'Allg. Hinweise','general hints',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(458,'Aufgaben','Tasks',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(459,'Auftrag','Appointment',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(460,'Auswertung','Analysis',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(461,'Beitrag','Article',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(462,'Benutzer','User',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(463,'CustomSchnittImport','Custom Cut Import',2,1,14,'','2010-09-17 08:34:48','2010-09-17 08:34:48',1,NULL,NULL),(464,'Datenträger','Volume',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(465,'Disziplinen','field Events',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(466,'Dokumentation','Documentation',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(467,'Einstellungen','Configuration',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(468,'Ereignis','Event',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(469,'Ereignisart','Event Type',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(470,'Ereignisimport','Event import',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(471,'Fertigmeldung','Ready Signal',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(472,'Freigabe','Approval',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(473,'Geschlecht','Gender',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(474,'Hochrechnung','Extrapolation',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(475,'Infos','Infos',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(476,'Kalender','Calender',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(477,'Kanäle','Canal',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(478,'Kontrolle','Checking',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(479,'Länder','Countrys',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(480,'LDAP-Konfiguration','LDAP-Configuration',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(481,'Mandanten','Clients',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(482,'Orte','Locations',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(483,'Panel','Panel',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(484,'Print','Print',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(485,'Quoten','Quoten',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(486,'Recherche','Research',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(487,'Richtlinien','Instructions',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(488,'Saisons','Saisons',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(489,'Selektionen','Selections',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(490,'Sender','Channel',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(491,'Sendung','Program',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(492,'Sendungen','Programs',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(493,'Sendung Excelexport','Program Excelexport',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(494,'Sendelisten Excelimport','Programlist Excelimport',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(495,'Sendungen Rohdaten löschen','delete Program rawdata',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(496,'Sendungsschemata','Progam schema',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(497,'Serien','Series',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(498,'Sicherheitsgruppen','Security Group',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(499,'Sicherheitsrechte','Security Rights',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(500,'Spieler','Player',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(501,'Sponsoren','Sponsor',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(502,'Sportart-Anhang','Sport addition',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(503,'Sportartbereiche','Sport bereiche',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(504,'Sportarten','Sport group',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(505,'Sprachen','Languages',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(506,'Stammdaten','Master data',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(507,'Statistik','Statistic',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(508,'Status','States',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(509,'Stoppzeiten','Stop time',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(510,'Studien','Studies',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(511,'Studienbausteine','Studie module',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(512,'Studiendefinition','Studie definition',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(513,'Studienprofile','Studie profile',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(514,'Teams','Teams',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(515,'Termine','Deadlines',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(516,'Themen','Subjects',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(517,'TV','TV',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(518,'Übersicht','Overview',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(519,'Verwaltung','Administration',2,1,14,'','2010-09-17 08:34:49','2010-09-17 08:34:49',1,NULL,NULL),(520,'Werbebotschaft','Advertising message',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(521,'Werbemittel','Advertising media',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(522,'Werbemittel-Anhang','Advertising media addition',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(523,'Werbepreise','Advertising prices',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(524,'Wettbewerb-Anhang','Champingionships addition',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(525,'Wettbewerbe','Champingionships',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(526,'Wettbewerbsart','Champingionships type',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(527,'Wk-Phasen','Wk-Phase',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(528,'Zeitzonen','Timezone',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(529,'Zielgruppen','Target group',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(530,'Stoppzeiten übertragen','copy stoptimes',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(531,'Neuer Eintrag','New Entry',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(532,'Quotenimport','Quotenimport',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(533,'Massenverarbeitung','multiedit',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(534,'Selektionsergebnis','selection result',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL),(535,'Schnellerfassung','Quick Insert',2,1,14,'','2010-09-17 08:34:50','2010-09-17 08:34:50',1,NULL,NULL);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'translator','2010-10-12 09:10:52','2010-10-12 09:10:52'),(2,'reviewer','2010-10-12 09:10:52','2010-10-12 09:10:52'),(3,'company','2010-10-12 09:10:52','2010-10-12 09:10:52');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
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
  `name_title` varchar(255) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_login` (`login`),
  KEY `index_users_on_persistence_token` (`persistence_token`),
  KEY `index_users_on_last_request_at` (`last_request_at`),
  KEY `index_users_on_email` (`email`),
  KEY `index_users_on_admin` (`admin`),
  KEY `index_users_on_language_id` (`language_id`),
  KEY `index_users_on_user_type_id` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@localhost.com','a693904532d1fdff47930f55891aa12cc04d4f5b43dd77d12576ce996b5937334981c4b5618eb0e3cf0e2eeb9a34bb5aa6297d47db165f7d9a784ab237a0dcdf','2q8UPVIbPT0KrJCgdB5N','920ffff1198e05efd93e1ebb54cb4b4a42acedd57ffaad55ed720192e6c2c849171d768071f825482b3565fc34d1b0b2dcb7841bbd158e37b1858b6969676e4c','c0wAS3bAKyN-Z-TKMzCK','Ru_z5y6wW1pdVCvjKlSS',43,0,'2010-10-20 19:55:34','2010-10-18 18:45:05','2010-10-13 07:57:13','127.0.0.1','127.0.0.1',1,'2010-06-16 10:44:27','2010-10-20 19:55:34','Frederico','231423512342','Bangkok',NULL,'Personal Info about me.','',1,NULL,NULL,'','51fJ7PEpCcL.jpg','image/jpeg',34288,'2010-10-13 07:52:41'),(2,'fred','fred.the.master@gmail.com','c020b1944ceacc890ccf5d935d165b492e04bb1d41289691bf7e067026e56f2c41d5d4f64f1459bb364a7109e45feb9470144f4b464450594879c9ba0c214a0b','r_v6OfPbgvhEGcOXfkfY','5def53d37a8e1b4824633db0c80e74c56beaa45f6d8f8e92bda3f5e1d7cfe226135bed92afa3ce36ce348f20ede0f462b4a6b6c01cabd99c60a7e7153f84444c','uPhXAJxgKu1RJ3b3DwHD','5VIl2zNUvTFxCPs5sujj',1,1,'2010-09-10 11:09:34','2010-09-10 11:05:03',NULL,'127.0.0.1',NULL,0,'2010-07-14 14:54:16','2010-09-17 08:28:18','Frederico','123456753','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2010-10-21  2:56:14
