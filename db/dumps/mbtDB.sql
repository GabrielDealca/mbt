-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: mbt
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add permission',6,'add_permission'),(22,'Can change permission',6,'change_permission'),(23,'Can delete permission',6,'delete_permission'),(24,'Can view permission',6,'view_permission'),(25,'Can add role',7,'add_role'),(26,'Can change role',7,'change_role'),(27,'Can delete role',7,'delete_role'),(28,'Can view role',7,'view_role'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add Token',9,'add_token'),(34,'Can change Token',9,'change_token'),(35,'Can delete Token',9,'delete_token'),(36,'Can view Token',9,'view_token'),(37,'Can add token',10,'add_tokenproxy'),(38,'Can change token',10,'change_tokenproxy'),(39,'Can delete token',10,'delete_tokenproxy'),(40,'Can view token',10,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('6335549ebce161b223aa237c53c76343897efa7d','2023-06-07 16:10:13.818782','b4faf1285d504d9c9f089414bad8ec57'),('be328b70a0ea7c37af5be2e79ed5c13502b379d7','2023-06-08 02:52:48.239285','4c393162fbc1444d888c8595570074a3');
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'authtoken','token'),(10,'authtoken','tokenproxy'),(6,'base','permission'),(7,'base','role'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(8,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'base','0001_initial','2023-06-07 16:08:56.689343'),(2,'contenttypes','0001_initial','2023-06-07 16:08:56.767450'),(3,'contenttypes','0002_remove_content_type_name','2023-06-07 16:08:56.892756'),(4,'auth','0001_initial','2023-06-07 16:08:57.407806'),(5,'auth','0002_alter_permission_name_max_length','2023-06-07 16:08:57.504549'),(6,'auth','0003_alter_user_email_max_length','2023-06-07 16:08:57.513313'),(7,'auth','0004_alter_user_username_opts','2023-06-07 16:08:57.523179'),(8,'auth','0005_alter_user_last_login_null','2023-06-07 16:08:57.532434'),(9,'auth','0006_require_contenttypes_0002','2023-06-07 16:08:57.537596'),(10,'auth','0007_alter_validators_add_error_messages','2023-06-07 16:08:57.547605'),(11,'auth','0008_alter_user_username_max_length','2023-06-07 16:08:57.555597'),(12,'auth','0009_alter_user_last_name_max_length','2023-06-07 16:08:57.564610'),(13,'auth','0010_alter_group_name_max_length','2023-06-07 16:08:57.586798'),(14,'auth','0011_update_proxy_permissions','2023-06-07 16:08:57.596601'),(15,'auth','0012_alter_user_first_name_max_length','2023-06-07 16:08:57.605590'),(16,'users','0001_initial','2023-06-07 16:08:58.704597'),(17,'admin','0001_initial','2023-06-07 16:08:59.023297'),(18,'admin','0002_logentry_remove_auto_add','2023-06-07 16:08:59.047194'),(19,'admin','0003_logentry_add_action_flag_choices','2023-06-07 16:08:59.065961'),(20,'authtoken','0001_initial','2023-06-07 16:08:59.293789'),(21,'authtoken','0002_auto_20160226_1747','2023-06-07 16:08:59.322546'),(22,'authtoken','0003_tokenproxy','2023-06-07 16:08:59.332840'),(23,'sessions','0001_initial','2023-06-07 16:08:59.390190');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4q1veyvi5oevsnuh16562gck03ig1ke7','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76sA:e3V62xdG-P2AfAf4rlCh5WSAnhJibFUo8rFDg9vCpFc','2023-06-22 04:03:42.436619'),('7c8g908fpug8y6356mr1nczamreeaoyu','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76qO:jyV-evIQVHxBypvmLx6foyiCpYv2X_CNs7ZcV1MHXbo','2023-06-22 04:01:52.493716'),('bgt1i7ugtiasxaxyu0bc91st7lfn4ioh','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76b9:lIWx-6cTML2-ACg00C0rdftVcJe48WjmoxruSjZhAUs','2023-06-22 03:46:07.321566'),('dn99fsv2sap58qvi2ka5kl6cj9pbci4e','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76t5:pVRQ52Xwtwke7SLa1w4u2ZNvfMJK4bkMpU34IcRJvDI','2023-06-22 04:04:39.157914'),('elvfcdyrt78zoyxg26mr68l0tz3hyt7f','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76rh:0tXkMTbHWFbO7FebmUWawNzhZamzYoEpwkNkT5pGijk','2023-06-22 04:03:13.442523'),('f7jesljphhc3okkcr0fzb4xdzr37kl2o','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76PQ:J9Epez7TFYr7wXI2gyDf7eAnPzrj-FXMXjtfP5UQh0M','2023-06-22 03:34:00.453775'),('i2a76sifwl54pamakx0qggvl55vmfu7w','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76bd:eaICCfOVxtHVpoddXaMQlG8pflqEHk8WTuZ8708BAtw','2023-06-22 03:46:37.169607'),('n2w4065jlmg4a7igna45ixeax86e9zky','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76p6:CDczi2GL8IoWagsifJ8aQou_agvIpZGw1QLQKPhtOzE','2023-06-22 04:00:32.552382'),('neirjyb13yklgye09kn8vj9jicdy3sal','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76t4:_GXlbpQRekRAo8FDxxoEl7IInzUCrguRb1MagK1r3Bg','2023-06-22 04:04:38.760052'),('o0kvktgsrgth239s7k5g8qxximwqyuf1','.eJxVjjsOwjAQBe_imli2144XSnrOEO2ubRJAiZRPhbg7jpQC6jfzNG_V0bb23bbkuRuSuigvcAbbuqaw2MZ7nxpElAbDOYRoTPQE6vSrMckzj7ubHjTeJy3TuM4D6x3Rx7ro25Ty63qwfwc9LX21LYtvWVy00YTCAYGxtnDxHAUgYsjJMkNNwuLawsV5IgIDFivg1OcLXMRAIg:1q76qx:I4tr4uisHdY2vc1Wq8a31ugU14CJ6L87zlbo8d69hz8','2023-06-22 04:02:27.170516'),('r0c4zick7fuwqjxqfknwusfn2ygacpbq','.eJxVjjkOwjAUBe_iGlveF0p6zhD9xSYsSqQsFeLuJFIKqN_M6L1FB-vSd-tcp-7O4izQN2jGZhk4aOm5kCxNZ1m88QicK4UkTr8aAj3rsLv8gOE2KhqHZbqj2hF1rLO6jlxfl4P9C_Qw95ttySA7sFQxOpfZFWymNajZJrambA-ST9rWSOhdDFUzAWT2rliIAcTnCy7zQaU:1q6vju:er3IF49kis5N-r9jZ3VGZvQXKucdF-XuU03VvJAsj_g','2023-06-21 16:10:26.418051'),('yq0vdlkr1bn0e7yr0p57lbpwwv7vakla','.eJxVjjkOwjAUBe_iGlveF0p6zhD9xSYsSqQsFeLuJFIKqN_M6L1FB-vSd-tcp-7O4izQN2jGZhk4aOm5kCxNZ1m88QicK4UkTr8aAj3rsLv8gOE2KhqHZbqj2hF1rLO6jlxfl4P9C_Qw95ttySA7sFQxOpfZFWymNajZJrambA-ST9rWSOhdDFUzAWT2rliIAcTnCy7zQaU:1q76bK:G_wNzUehFKHpueKnq5ernnD65PByIn2nNLZQlm3RsXA','2023-06-22 03:46:18.021343');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('access','Access',NULL,'2023-06-07 16:22:39.795212'),('read','Read',NULL,'2023-06-07 16:22:21.304386'),('write','Write',NULL,'2023-06-07 16:22:28.104096');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('hr','Human Resource',NULL,'2023-06-07 16:24:50.563431'),('manager','Manager',NULL,'2023-06-08 04:13:00.583877'),('staff','Staff',NULL,'2023-06-07 16:24:24.770308');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,'staff','write'),(2,'staff','read'),(3,'staff','access'),(4,'hr','write'),(5,'hr','read'),(6,'hr','access'),(7,'manager','write'),(8,'manager','access');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('pbkdf2_sha256$600000$bDWbPnwPu5AiMNzDVbgIne$ZO3I+ytVgPdv96CyUVDpZzQ2X47E7yzUKQS+pT1pKLI=',0,'4c393162fbc1444d888c8595570074a3',0,1,'2023-06-08 04:04:39.152915','2023-06-08 02:52:48.224386','usertwo','user2@email.com'),('pbkdf2_sha256$600000$mQopmXEbgLHizdj8Bo9Ts5$DVTL0zfFMOqLo87YFjzG/UAAPrV4MRLEBZZ3RYOIBnk=',0,'b4faf1285d504d9c9f089414bad8ec57',0,1,'2023-06-08 03:46:18.375526','2023-06-07 16:10:13.810818','user1','user@email.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_roles_user_id_role_id_69bfd9a0_uniq` (`user_id`,`role_id`),
  KEY `user_roles_role_id_816a4486_fk_role_id` (`role_id`),
  CONSTRAINT `user_roles_role_id_816a4486_fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `user_roles_user_id_9d9f8dbb_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (3,'4c393162fbc1444d888c8595570074a3','hr'),(4,'4c393162fbc1444d888c8595570074a3','staff'),(1,'b4faf1285d504d9c9f089414bad8ec57','hr'),(2,'b4faf1285d504d9c9f089414bad8ec57','staff');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08 13:28:28
