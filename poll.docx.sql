-- MySQL dump 10.13  Distrib 5.1.53, for Win32 (ia32)
--
-- Host: localhost    Database: elections
-- ------------------------------------------------------
-- Server version	5.1.53-community

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add votes',1,'add_votes'),(2,'Can change votes',1,'change_votes'),(3,'Can delete votes',1,'delete_votes'),(4,'Can add user',2,'add_voters'),(5,'Can change user',2,'change_voters'),(6,'Can delete user',2,'delete_voters'),(7,'Can add user',3,'add_admin'),(8,'Can change user',3,'change_admin'),(9,'Can delete user',3,'delete_admin'),(10,'Can add user',4,'add_candidates'),(11,'Can change user',4,'change_candidates'),(12,'Can delete user',4,'delete_candidates'),(13,'Can add log entry',5,'add_logentry'),(14,'Can change log entry',5,'change_logentry'),(15,'Can delete log entry',5,'delete_logentry'),(16,'Can add group',6,'add_group'),(17,'Can change group',6,'change_group'),(18,'Can delete group',6,'delete_group'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add permission',8,'add_permission'),(23,'Can change permission',8,'change_permission'),(24,'Can delete permission',8,'delete_permission'),(25,'Can add content type',9,'add_contenttype'),(26,'Can change content type',9,'change_contenttype'),(27,'Can delete content type',9,'delete_contenttype'),(28,'Can add session',10,'add_session'),(29,'Can change session',10,'change_session'),(30,'Can delete session',10,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$ApMtTmUWumPe$HzMt8pwZqp9ZHsmFk/vbdlzfxNFMMdPHdx9uoyRmxKA=','2018-05-23 07:14:43',1,'root','','','root@hto.fr',1,1,'2018-05-06 14:44:13'),(2,'pbkdf2_sha256$100000$q7O433n6bfdR$Emrc3xhx/4wUrrmeqP2i6g3w7uKJpNcDppFJFgs8kic=','2018-05-28 02:39:36',0,'ronald','','','',0,1,'2018-05-06 14:49:19'),(3,'pbkdf2_sha256$100000$MfH7dtyIcN0g$XRkXFkzNakq7f6wUuyTbQikA0ZAlw00ihGRXx+uRiW8=',NULL,0,'Paul','','','',0,1,'2018-05-06 14:55:47'),(4,'pbkdf2_sha256$100000$hgSEZHurwMNR$D+o24QeztUWsjD3bS6YQ2BD5JBi48SH2rBKE2gMNx40=','2018-05-28 02:41:15',0,'arami','','','',0,1,'2018-05-06 14:59:27'),(5,'',NULL,0,'','','','',0,1,'2018-05-11 23:01:18'),(7,'pbkdf2_sha256$100000$zRlgEWjdIY0i$N3t+N98lAEiHqDnQV8fskxvxrZDWRB3fsPkcm+OmrVs=',NULL,0,'Pacha','','','',0,1,'2018-05-11 23:18:51'),(8,'pbkdf2_sha256$100000$khAcHlzPofkN$gMTSJE82PVSdCpVo77YGSEGecVHg0MhCjDlkhIfwoeM=','2018-05-23 09:46:56',0,'vincent','','','',0,1,'2018-05-23 07:16:11');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-05-06 14:54:21','1156664261','ronald',1,'[{\"added\": {}}]',3,1),(2,'2018-05-06 14:58:32','RDPC','Paul',1,'[{\"added\": {}}]',4,1),(3,'2018-05-06 15:01:09','2031548795','arami',1,'[{\"added\": {}}]',2,1),(4,'2018-05-23 07:18:51','1254854223','vincent',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry'),(6,'auth','group'),(8,'auth','permission'),(7,'auth','user'),(9,'contenttypes','contenttype'),(10,'sessions','session'),(3,'vote','admin'),(4,'vote','candidates'),(2,'vote','voters'),(1,'vote','votes');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-05-06 14:39:55'),(2,'auth','0001_initial','2018-05-06 14:39:56'),(3,'admin','0001_initial','2018-05-06 14:39:56'),(4,'admin','0002_logentry_remove_auto_add','2018-05-06 14:39:56'),(5,'contenttypes','0002_remove_content_type_name','2018-05-06 14:39:56'),(6,'auth','0002_alter_permission_name_max_length','2018-05-06 14:39:56'),(7,'auth','0003_alter_user_email_max_length','2018-05-06 14:39:57'),(8,'auth','0004_alter_user_username_opts','2018-05-06 14:39:57'),(9,'auth','0005_alter_user_last_login_null','2018-05-06 14:39:57'),(10,'auth','0006_require_contenttypes_0002','2018-05-06 14:39:57'),(11,'auth','0007_alter_validators_add_error_messages','2018-05-06 14:39:57'),(12,'auth','0008_alter_user_username_max_length','2018-05-06 14:39:57'),(13,'auth','0009_alter_user_last_name_max_length','2018-05-06 14:39:57'),(14,'sessions','0001_initial','2018-05-06 14:39:57'),(15,'vote','0001_initial','2018-05-06 14:39:58'),(16,'vote','0002_auto_20180506_1539','2018-05-06 14:39:58');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2oqfu9av43014sx2np9vrc60qnd10aqc','ZjJkMjJiNDAzN2ZlYzE0M2M1MjdmNjliZDJjNWIxODQ2M2M2YTI0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlMmE1YWY0ZmY0OTEwMDcxNjYxN2Q4NjY0MzRhMzg0ZmE0MTczMjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2018-06-11 02:41:15'),('38dhunaf9ol36fspuxb9vtre4gxq8lu8','N2UwNDU3N2E2YTNhMDZmODAwNzVkZjYzODM5MzExMjQ5ZmFmMDk0Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2YyOTBhODZkZmE3N2MxMDRmMzJkMThlZGQ5MTgzYTU1MzRlODg2MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-06-02 10:16:30'),('azjryuff88mtxfjj55u5dwdxkwslqjav','ZTMwNjY5NGEyMTZjMGUzMGYxMzcyMDc4MGZlOTc4M2JhZmU0YzdjMDp7fQ==','2018-06-10 08:16:35'),('bfjafq0dcb6i7yhlaw4fyevpl46cjew4','ZTMwNjY5NGEyMTZjMGUzMGYxMzcyMDc4MGZlOTc4M2JhZmU0YzdjMDp7fQ==','2018-06-06 08:17:21'),('mewrmnoy10z41ylj75mo2ag4mcjrdxsg','YjZmZGNhYzYxNzZjMGMwOTk1NDc5NTFiNmY4NGQ5ZDEwNWE5NTgzYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2YyOTBhODZkZmE3N2MxMDRmMzJkMThlZGQ5MTgzYTU1MzRlODg2MyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-05-27 22:20:04'),('tpwzc0tc9ytiieqder7r0t2fo5fyhoga','ZTMwNjY5NGEyMTZjMGUzMGYxMzcyMDc4MGZlOTc4M2JhZmU0YzdjMDp7fQ==','2018-06-10 07:59:29'),('wz9ai6bkskbaxbw0eu0pfrvy8jiqg9vq','ZTMwNjY5NGEyMTZjMGUzMGYxMzcyMDc4MGZlOTc4M2JhZmU0YzdjMDp7fQ==','2018-06-06 21:05:58');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_admin`
--

DROP TABLE IF EXISTS `vote_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_admin` (
  `voters_ptr_id` int(11) NOT NULL,
  `status` varchar(12) NOT NULL,
  PRIMARY KEY (`voters_ptr_id`),
  CONSTRAINT `vote_admi_voters_ptr_id_a61a3dab_fk_vote_voters_cni_number` FOREIGN KEY (`voters_ptr_id`) REFERENCES `vote_voters` (`cni_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_admin`
--

LOCK TABLES `vote_admin` WRITE;
/*!40000 ALTER TABLE `vote_admin` DISABLE KEYS */;
INSERT INTO `vote_admin` VALUES (1156664261,'Agent'),(1254854223,'President');
/*!40000 ALTER TABLE `vote_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_candidates`
--

DROP TABLE IF EXISTS `vote_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_candidates` (
  `voters_ptr_id` int(11) NOT NULL,
  `p_party` varchar(15) NOT NULL,
  UNIQUE KEY `voters_ptr_id` (`voters_ptr_id`),
  CONSTRAINT `vote_candidates_voters_ptr_id_722b1b10_fk_vote_voters_cni_number` FOREIGN KEY (`voters_ptr_id`) REFERENCES `vote_voters` (`cni_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_candidates`
--

LOCK TABLES `vote_candidates` WRITE;
/*!40000 ALTER TABLE `vote_candidates` DISABLE KEYS */;
INSERT INTO `vote_candidates` VALUES (1522485697,'RDPC');
/*!40000 ALTER TABLE `vote_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_parties`
--

DROP TABLE IF EXISTS `vote_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_parties`
--

LOCK TABLES `vote_parties` WRITE;
/*!40000 ALTER TABLE `vote_parties` DISABLE KEYS */;
INSERT INTO `vote_parties` VALUES (1,'RDPC','C:UsersRonald VDesktopimages3.jpg'),(2,'SDF','C:UsersRonald VDesktopimages10.jpg'),(3,'MRC','11.jpg'),(4,'CPP','12.jpg');
/*!40000 ALTER TABLE `vote_parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_voters`
--

DROP TABLE IF EXISTS `vote_voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_voters` (
  `user_ptr_id` int(11) NOT NULL,
  `cni_number` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `date_of_birth` date NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`cni_number`),
  UNIQUE KEY `user_ptr_id` (`user_ptr_id`),
  CONSTRAINT `vote_voters_user_ptr_id_7bdfd1c7_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_voters`
--

LOCK TABLES `vote_voters` WRITE;
/*!40000 ALTER TABLE `vote_voters` DISABLE KEYS */;
INSERT INTO `vote_voters` VALUES (2,1156664261,'Ndayou','Ronald Vincent','1992-04-11','faces/22092488_1924129727803957_746791553_o.jpg'),(8,1254854223,'Mbarga','Vincent','1973-05-26','faces/Boule-et-Bill_momes_listing.jpg'),(3,1522485697,'Biya','Paul Barthelemy','1961-11-11','faces/IMG-20180227-WA0006.jpg'),(4,2031548795,'Ghano','cr','1992-02-02','faces/23584977_1942855532598043_1486254253_o.jpg');
/*!40000 ALTER TABLE `vote_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_votes`
--

DROP TABLE IF EXISTS `vote_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `place` varchar(15) NOT NULL,
  `electeur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vote_votes_electeur_id_6cf363eb_fk_vote_voters_cni_number` (`electeur_id`),
  CONSTRAINT `vote_votes_electeur_id_6cf363eb_fk_vote_voters_cni_number` FOREIGN KEY (`electeur_id`) REFERENCES `vote_voters` (`cni_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_votes`
--

LOCK TABLES `vote_votes` WRITE;
/*!40000 ALTER TABLE `vote_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote_votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-30 21:54:39
