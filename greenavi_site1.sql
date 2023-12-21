-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: greenavi_site
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-0+deb11u2

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
-- Table structure for table `affiliate_invitation`
--

DROP TABLE IF EXISTS `affiliate_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `affiliate_user_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `percent` int(11) NOT NULL DEFAULT 20,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_invitation`
--

LOCK TABLES `affiliate_invitation` WRITE;
/*!40000 ALTER TABLE `affiliate_invitation` DISABLE KEYS */;
INSERT INTO `affiliate_invitation` VALUES (1,2,1,'a7c4b56429efb49',2,'2022-06-28 10:25:12',20);
/*!40000 ALTER TABLE `affiliate_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_offers`
--

DROP TABLE IF EXISTS `affiliate_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `about` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_offers`
--

LOCK TABLES `affiliate_offers` WRITE;
/*!40000 ALTER TABLE `affiliate_offers` DISABLE KEYS */;
INSERT INTO `affiliate_offers` VALUES (1,'Комиссия от чистого оборота','Комиссия от чистого оборота — Вы получаете комиссию от общего торгового оборота Ваших рефералов'),(2,'RevShare','Комиссия от прибыли компании — Вы получаете комиссию от проигрышных сделок Вашего реферала.'),(3,'Комиссия от депозита','Комиссия от депозита — Вы получаете комиссию в зависимости от суммы депозита, сделанного Вашим рефералом');
/*!40000 ALTER TABLE `affiliate_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_payment_increases`
--

DROP TABLE IF EXISTS `affiliate_payment_increases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_payment_increases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `affiliate_user_id` int(11) NOT NULL,
  `trader_user_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_payment_increases`
--

LOCK TABLES `affiliate_payment_increases` WRITE;
/*!40000 ALTER TABLE `affiliate_payment_increases` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_payment_increases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_payment_outputs`
--

DROP TABLE IF EXISTS `affiliate_payment_outputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_payment_outputs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `affiliate_user_id` int(11) NOT NULL,
  `wallet_type_id` int(11) DEFAULT NULL,
  `wallet_data` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `promocode_id` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_payment_outputs`
--

LOCK TABLES `affiliate_payment_outputs` WRITE;
/*!40000 ALTER TABLE `affiliate_payment_outputs` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_payment_outputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_users`
--

DROP TABLE IF EXISTS `affiliate_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `telegram` varchar(100) DEFAULT NULL,
  `dollars` decimal(15,2) NOT NULL DEFAULT 0.00,
  `wallet_type_id` int(11) DEFAULT NULL,
  `wallet_data` varchar(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` int(11) DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `affiliate_invitation_id` int(11) NOT NULL,
  `last_visit_time` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `confirm_email` timestamp NULL DEFAULT NULL,
  `confirm_email_token` varchar(36) DEFAULT NULL,
  `confirm_reset_expire` timestamp NULL DEFAULT NULL,
  `confirm_reset_token` varchar(36) DEFAULT NULL,
  `confirm_delete_expire` timestamp NULL DEFAULT NULL,
  `confirm_delete_token` varchar(36) DEFAULT NULL,
  `delete_date` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_users`
--

LOCK TABLES `affiliate_users` WRITE;
/*!40000 ALTER TABLE `affiliate_users` DISABLE KEYS */;
INSERT INTO `affiliate_users` VALUES (1,'276997',2,'dukker11@yandex.ru','8979eb4b0c470a1e1015e8583a48eb259f6665da2666c9c8e1660578aa4830cdfd76a5d6cdd6d1eb85d652ea19a4f09165fc','',0.00,NULL,NULL,'','','','','$2y$10$giMZTwcevwCBJmbm76OkG.h8kbvrH18ytLleEo9o1KOCsY9qMS0fO',0,0,0,0,NULL,'2022-06-28 09:46:12','2022-06-28 09:46:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `affiliate_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_wallet_types`
--

DROP TABLE IF EXISTS `affiliate_wallet_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_wallet_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_wallet_types`
--

LOCK TABLES `affiliate_wallet_types` WRITE;
/*!40000 ALTER TABLE `affiliate_wallet_types` DISABLE KEYS */;
INSERT INTO `affiliate_wallet_types` VALUES (1,'VISA/MASTERCARD'),(2,'WebMoney'),(3,'PAYEER'),(4,'QIWI'),(5,'Yandex.Money'),(6,'PayPal'),(7,'Bitcoin'),(8,'AdvCash'),(9,'PerfectMoney');
/*!40000 ALTER TABLE `affiliate_wallet_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `banned` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_host` varchar(255) NOT NULL,
  `mail_username` varchar(255) NOT NULL,
  `mail_password` varchar(255) NOT NULL,
  `max_virtual_dollars` int(11) NOT NULL,
  `min_increase_amount` int(11) NOT NULL,
  `min_withdrawal_amount` int(11) NOT NULL,
  `min_order_amount` int(11) NOT NULL,
  `min_affiliate_order_amount` int(11) NOT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `merchant_secret_word` varchar(255) NOT NULL,
  `merchant_secret_word_2` varchar(255) NOT NULL,
  `support_chat` int(11) NOT NULL,
  `exchange` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
INSERT INTO `apps` VALUES (2,'Greenavi Cash','greenavi.com',0,'support@greenavicash.ru','smtp.yandex.ru','support@greenavicash.ru','M354at790!',10000,100,100,50,50,'307583','lrirt1xf','5il77l5g',0,60);
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('admin','1',1622723517),('admin','54',1622723517);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/admin/*',2,NULL,NULL,NULL,1622722573,1622722573),('/rbac/*',2,NULL,NULL,NULL,1622722589,1622722589),('admin',1,NULL,NULL,NULL,1622722887,1622722887),('adminPermission',2,NULL,NULL,NULL,1622722622,1622722622),('moder',1,NULL,NULL,NULL,1622722872,1622722872),('moderPermission',2,NULL,NULL,NULL,1622722854,1622722854);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('admin','adminPermission'),('adminPermission','/admin/*'),('adminPermission','/rbac/*'),('moder','moderPermission'),('moderPermission','/admin/*');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorizations_log`
--

DROP TABLE IF EXISTS `authorizations_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorizations_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(255) NOT NULL,
  `log_type` varchar(255) NOT NULL,
  `location_action` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorizations_log`
--

LOCK TABLES `authorizations_log` WRITE;
/*!40000 ALTER TABLE `authorizations_log` DISABLE KEYS */;
INSERT INTO `authorizations_log` VALUES (1,2,1,'84.201.247.16','register','terminal','2022-06-22 06:56:23'),(2,2,1,'84.201.247.16','register','terminal','2022-06-22 06:57:41'),(3,2,1,'84.201.247.16','login','terminal','2022-06-22 06:58:24'),(4,2,1,'84.201.247.16','login','terminal','2022-06-22 07:01:07'),(5,2,1,'84.201.247.16','login','terminal','2022-06-22 07:11:01'),(6,2,1,'84.201.247.16','login','terminal','2022-06-22 07:12:09'),(7,2,1,'84.201.247.16','login','terminal','2022-06-22 07:15:21'),(8,2,1,'84.201.247.16','login','terminal','2022-06-22 07:19:36'),(9,2,1,'84.201.247.16','login','terminal','2022-06-22 07:20:38'),(10,2,1,'84.201.247.16','login','terminal','2022-06-22 07:38:24'),(11,2,2,'178.219.176.148','register','terminal','2022-06-23 10:36:30'),(12,2,2,'178.219.176.148','login','terminal','2022-06-23 10:37:03'),(13,2,2,'178.219.176.148','login','terminal','2022-06-23 10:38:34'),(14,2,1,'92.39.214.14','login','terminal','2022-06-26 19:29:19'),(15,2,3,'78.106.192.53','register','terminal','2022-06-27 14:02:06'),(16,2,3,'78.106.192.53','login','terminal','2022-06-27 14:02:38'),(17,2,1,'92.39.214.241','login','terminal','2022-06-28 09:44:36'),(18,2,1,'92.39.214.241','register','terminal','2022-06-28 09:46:12'),(19,2,1,'92.39.214.241','logout','terminal','2022-06-28 09:46:26'),(20,2,1,'92.39.214.241','login','terminal','2022-06-28 09:46:43'),(21,2,1,'92.39.214.241','logout','affiliate','2022-06-28 09:50:27'),(22,2,1,'92.39.214.241','login','terminal','2022-06-28 09:51:37'),(23,2,1,'92.39.214.241','logout','terminal','2022-06-28 09:52:08'),(24,2,1,'92.39.214.241','login','terminal','2022-06-28 09:53:19'),(25,2,1,'92.39.214.241','login','terminal','2022-06-28 10:01:16'),(26,2,1,'92.39.214.241','logout','terminal','2022-06-28 10:03:23'),(27,2,1,'92.39.214.241','login','terminal','2022-06-28 10:04:46'),(28,2,1,'92.39.214.241','logout','terminal','2022-06-28 10:21:41'),(29,2,1,'92.39.214.241','login','terminal','2022-06-28 10:23:49'),(30,2,4,'92.39.214.241','register','terminal','2022-06-28 10:26:45'),(31,2,1,'92.39.214.241','logout','affiliate','2022-06-28 11:29:43'),(32,2,1,'92.39.214.241','login','terminal','2022-06-28 11:29:59'),(33,2,1,'92.39.214.241','logout','affiliate','2022-06-28 11:30:14'),(34,2,1,'92.39.214.241','login','terminal','2022-06-28 11:30:30'),(35,2,1,'92.39.214.241','logout','terminal','2022-06-28 11:30:48'),(36,2,5,'31.173.85.179','register','terminal','2022-06-28 12:20:52'),(37,2,6,'31.173.85.179','register','terminal','2022-06-28 12:28:06'),(38,2,6,'31.173.85.179','login','terminal','2022-06-28 12:29:51'),(39,2,1,'91.193.178.56','login','terminal','2022-06-28 12:35:37'),(40,2,1,'2a00:1fa1:8220:30b7:b109:7fa2:6c58:5d19','login','terminal','2022-06-28 12:51:05'),(41,2,1,'92.39.214.236','login','terminal','2022-06-28 13:33:41'),(42,2,1,'92.39.214.236','login','terminal','2022-06-28 13:54:57'),(43,2,1,'91.193.178.56','login','terminal','2022-06-28 13:56:19'),(44,2,1,'91.193.178.56','logout','terminal','2022-06-28 13:58:23'),(45,2,1,'92.39.214.236','login','terminal','2022-06-28 14:00:15'),(46,2,1,'84.201.247.16','login','terminal','2022-07-21 12:53:39'),(47,2,1,'92.39.213.168','login','terminal','2022-07-22 11:38:05'),(48,2,1,'92.39.213.168','login','terminal','2022-07-24 15:07:03'),(49,2,1,'92.39.213.168','login','terminal','2022-07-24 15:36:12'),(50,2,1,'92.39.213.168','login','terminal','2022-07-24 15:50:58'),(51,2,1,'83.220.239.121','login','terminal','2022-07-24 16:09:59'),(52,2,1,'193.233.158.142','login','terminal','2022-07-25 11:50:58'),(53,2,1,'193.233.158.142','login','terminal','2022-08-23 08:41:11'),(54,2,1,'193.233.158.142','login','terminal','2022-08-23 08:44:39'),(55,2,1,'178.176.72.188','login','terminal','2022-08-23 15:49:47'),(56,2,7,'178.176.75.201','register','terminal','2022-08-23 15:50:59'),(57,2,1,'194.34.132.173','login','terminal','2022-08-23 15:55:22'),(58,2,1,'193.233.158.142','logout','terminal','2022-08-23 18:31:10'),(59,2,8,'193.233.158.142','register','terminal','2022-08-23 18:33:37'),(60,2,1,'193.233.158.142','login','terminal','2022-08-23 18:35:15'),(61,2,1,'84.201.247.16','logout','terminal','2022-08-24 09:12:03'),(62,2,9,'84.201.247.16','register','terminal','2022-08-24 09:12:17'),(63,2,1,'193.233.158.142','logout','terminal','2022-08-24 09:12:55'),(64,2,10,'84.201.247.16','register','terminal','2022-08-24 09:14:35'),(65,2,11,'84.201.247.16','register','terminal','2022-08-24 10:02:29'),(66,2,9,'84.201.247.16','login','terminal','2022-08-24 10:09:26'),(67,2,12,'193.233.158.142','register','terminal','2022-08-24 11:34:53'),(68,2,13,'193.233.158.142','register','terminal','2022-08-24 11:37:51'),(69,2,9,'92.39.212.47','login','terminal','2022-08-24 14:36:36'),(70,2,9,'92.39.212.47','login','terminal','2022-08-24 14:41:13'),(71,2,9,'92.39.212.47','login','terminal','2022-08-24 14:42:04'),(72,2,14,'193.233.158.142','register','terminal','2022-08-24 14:49:57'),(73,2,15,'193.233.158.142','register','terminal','2022-08-24 14:51:53'),(74,2,15,'193.233.158.142','login','terminal','2022-08-24 14:52:34'),(75,2,16,'178.176.72.159','register','terminal','2022-08-24 15:53:34'),(76,2,16,'178.176.72.159','login','terminal','2022-08-24 15:54:51'),(77,2,1,'92.39.212.47','login','terminal','2022-08-24 16:11:41'),(78,2,17,'176.59.43.230','register','terminal','2022-08-24 16:14:30'),(79,2,17,'176.59.43.230','login','terminal','2022-08-24 16:15:45'),(80,2,1,'84.201.247.16','logout','terminal','2022-08-30 11:27:04'),(81,2,1,'84.201.247.16','login','terminal','2022-08-30 12:10:31'),(82,2,18,'31.170.22.19','register','terminal','2022-08-31 12:43:16'),(83,2,18,'78.155.217.217','login','terminal','2022-08-31 12:44:03'),(84,2,19,'185.253.101.104','register','terminal','2022-09-17 05:49:36'),(85,2,19,'185.253.101.104','login','terminal','2022-09-17 05:54:07'),(86,2,14,'193.233.158.142','login','terminal','2022-09-27 04:08:25'),(87,2,14,'193.233.158.142','logout','terminal','2022-09-27 10:54:21'),(88,2,14,'193.233.158.142','login','terminal','2022-09-28 12:06:02'),(89,2,14,'193.233.158.142','logout','terminal','2022-09-28 12:06:12'),(90,2,20,'213.151.23.209','register','terminal','2022-10-04 17:00:51'),(91,2,20,'213.151.23.209','login','terminal','2022-10-04 17:02:13'),(92,2,20,'213.151.23.209','login','terminal','2022-10-04 17:03:13'),(93,2,20,'213.151.23.209','login','terminal','2022-10-04 17:03:39'),(94,2,14,'193.233.158.142','login','terminal','2022-10-07 06:22:08'),(95,2,21,'95.83.5.36','register','terminal','2022-10-07 20:01:02'),(96,2,21,'95.83.5.36','login','terminal','2022-10-07 20:04:19'),(97,2,21,'95.83.5.36','login','terminal','2022-10-07 20:07:42'),(98,2,21,'95.83.5.36','login','terminal','2022-10-07 20:08:08'),(99,2,14,'193.233.158.142','logout','terminal','2022-10-12 11:20:32'),(100,2,14,'193.233.158.142','login','terminal','2022-10-12 16:03:41'),(101,2,22,'178.186.15.222','register','terminal','2022-11-06 04:11:03'),(102,2,22,'178.186.15.222','login','terminal','2022-11-06 04:11:51'),(103,2,23,'176.59.174.216','register','terminal','2022-11-13 21:44:29'),(104,2,24,'176.59.172.104','register','terminal','2022-11-17 10:25:33'),(105,2,24,'176.59.172.104','login','terminal','2022-11-17 10:26:41'),(106,2,25,'178.78.14.238','register','terminal','2022-11-29 10:28:26'),(107,2,25,'178.78.14.238','login','terminal','2022-11-29 10:35:47'),(108,2,25,'176.59.81.30','login','terminal','2022-11-29 10:55:05'),(109,2,26,'176.59.43.51','register','terminal','2022-12-05 11:35:30'),(110,2,26,'176.59.43.51','login','terminal','2022-12-05 11:36:43'),(111,2,27,'2a00:1fa0:4a17:d453:fab9:75c1:6f54:ae9e','register','terminal','2022-12-05 12:38:39'),(112,2,27,'2a00:1fa0:4a17:d453:fab9:75c1:6f54:ae9e','login','terminal','2022-12-05 12:39:07'),(113,2,28,'178.78.14.238','register','terminal','2022-12-06 11:42:10'),(114,2,28,'178.78.14.238','login','terminal','2022-12-06 11:44:20'),(115,2,29,'178.78.14.47','register','terminal','2022-12-20 19:57:54'),(116,2,29,'178.78.14.47','login','terminal','2022-12-20 19:59:11'),(117,2,1,'92.39.212.41','login','terminal','2023-01-02 08:00:18'),(118,2,30,'176.59.42.196','register','terminal','2023-01-05 14:46:29'),(119,2,30,'176.59.42.196','login','terminal','2023-01-05 14:48:04'),(120,2,31,'176.59.116.213','register','terminal','2023-01-06 19:10:25'),(121,2,31,'176.59.116.213','login','terminal','2023-01-06 19:10:48'),(122,2,31,'176.59.116.213','login','terminal','2023-01-06 19:22:17'),(123,2,32,'136.169.174.229','register','terminal','2023-01-26 09:57:05'),(124,2,32,'136.169.174.229','login','terminal','2023-01-26 09:58:08'),(125,2,33,'178.70.15.121','register','terminal','2023-01-27 16:44:10'),(126,2,34,'193.233.158.138','register','terminal','2023-02-10 07:34:39'),(127,2,34,'193.233.158.138','login','terminal','2023-02-10 07:43:58'),(128,2,35,'176.59.106.60','register','terminal','2023-02-23 18:00:43'),(129,2,35,'176.59.106.60','login','terminal','2023-02-23 18:01:42'),(130,2,21,'95.83.20.187','login','terminal','2023-02-27 10:14:20'),(131,2,36,'2a03:d000:8509:59f6:1:0:f44d:46e0','register','terminal','2023-02-27 17:10:25'),(132,2,37,'2a03:d000:8509:59f6:1:0:f44d:46e0','register','terminal','2023-02-27 17:16:04'),(133,2,38,'85.249.19.163','register','terminal','2023-03-03 05:28:13'),(134,2,38,'85.249.19.163','login','terminal','2023-03-03 05:29:34'),(135,2,39,'5.141.102.49','register','terminal','2023-04-25 07:17:23'),(136,2,39,'5.141.102.49','login','terminal','2023-04-25 07:18:59'),(137,2,40,'77.35.32.132','register','terminal','2023-04-25 13:39:33'),(138,2,40,'77.35.32.132','login','terminal','2023-04-25 13:39:51'),(139,2,41,'91.151.136.67','register','terminal','2023-04-25 15:23:07'),(140,2,41,'91.151.136.67','login','terminal','2023-04-25 15:23:35'),(141,2,42,'95.31.177.144','register','terminal','2023-05-10 12:57:27'),(142,2,42,'95.31.177.144','login','terminal','2023-05-10 12:58:03'),(143,2,42,'95.31.177.144','logout','terminal','2023-05-10 13:05:21'),(144,2,1,'92.39.213.123','login','terminal','2023-05-14 09:08:57'),(145,2,43,'2a03:d000:150c:50d0:d19f:83ec:c416:b709','register','terminal','2023-05-14 09:34:44'),(146,2,1,'92.39.213.123','login','terminal','2023-05-14 09:58:11'),(147,2,44,'176.59.168.200','register','terminal','2023-05-14 12:36:41'),(148,2,45,'5.165.251.244','register','terminal','2023-05-14 21:35:06'),(149,2,45,'5.165.251.244','login','terminal','2023-05-14 21:35:28'),(150,2,45,'5.165.251.244','logout','terminal','2023-05-14 21:35:52'),(151,2,45,'5.165.251.244','login','terminal','2023-05-14 21:35:57'),(152,2,45,'5.165.251.244','logout','terminal','2023-05-14 22:02:03'),(153,2,45,'5.165.251.244','login','terminal','2023-05-14 22:15:17'),(154,2,46,'2a03:d000:1601:91dd:4831:a558:a448:e602','register','terminal','2023-05-14 22:21:10'),(155,2,46,'2a03:d000:1601:91dd:4831:a558:a448:e602','login','terminal','2023-05-14 22:21:35'),(156,2,46,'2a03:d000:1601:91dd:4831:a558:a448:e602','logout','terminal','2023-05-14 22:22:17'),(157,2,1,'92.39.213.31','logout','terminal','2023-05-15 04:47:21'),(158,2,1,'92.39.213.31','logout','terminal','2023-05-15 04:47:24'),(159,2,1,'92.39.213.31','login','terminal','2023-05-15 06:22:59'),(160,2,1,'92.39.213.31','login','terminal','2023-05-21 11:33:55'),(161,2,1,'85.140.7.41','login','terminal','2023-06-11 12:29:35'),(162,2,47,'178.214.254.108','register','terminal','2023-07-20 23:42:52'),(163,2,47,'178.214.254.108','login','terminal','2023-07-20 23:43:54'),(164,2,48,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','register','terminal','2023-08-01 08:07:13'),(165,2,48,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','login','terminal','2023-08-01 08:08:20'),(166,2,49,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','register','terminal','2023-08-01 08:35:06'),(167,2,50,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','register','terminal','2023-08-01 08:36:42'),(168,2,50,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','login','terminal','2023-08-01 08:40:13'),(169,2,50,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','logout','terminal','2023-08-01 08:55:02'),(170,2,50,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','login','terminal','2023-08-01 08:56:12'),(171,2,50,'2a00:1fa2:82b5:d5d0:3e6f:47ea:36ed:b13b','logout','terminal','2023-08-01 09:23:32'),(172,2,51,'89.113.137.190','register','terminal','2023-08-03 09:39:47'),(173,2,51,'89.113.137.190','login','terminal','2023-08-03 09:40:54'),(174,2,51,'213.234.222.180','logout','terminal','2023-08-07 08:17:44'),(175,2,52,'213.234.222.180','register','terminal','2023-08-07 08:18:32'),(176,2,53,'37.139.212.4','register','terminal','2023-08-07 13:33:33'),(177,2,53,'37.139.212.4','login','terminal','2023-08-07 13:34:22'),(178,2,54,'37.139.212.4','register','terminal','2023-08-07 13:54:33'),(179,2,54,'37.139.212.4','login','terminal','2023-08-07 13:55:17'),(180,2,54,'37.139.212.4','login','terminal','2023-08-15 15:54:51'),(181,2,54,'37.139.212.4','login','terminal','2023-08-18 10:14:48'),(182,2,54,'2a00:1fa2:8249:fc0:b672:5d4d:28a4:7ba8','login','terminal','2023-08-18 11:17:02'),(183,2,55,'176.115.145.238','register','terminal','2023-10-10 11:27:36'),(184,2,55,'176.115.145.238','login','terminal','2023-10-10 11:32:31'),(185,2,56,'2a03:32c0:8000:7cf8:60b4:b0d3:1749:ce6c','register','terminal','2023-10-24 11:29:12'),(186,2,56,'2a03:32c0:8000:7cf8:60b4:b0d3:1749:ce6c','login','terminal','2023-10-24 11:31:48'),(187,2,56,'2a03:32c0:8000:7cf8:60b4:b0d3:1749:ce6c','login','terminal','2023-10-24 11:46:55'),(188,2,57,'2a03:32c0:8000:7cf8:60b4:b0d3:1749:ce6c','register','terminal','2023-10-24 11:48:18'),(189,2,57,'2a03:32c0:8000:7cf8:60b4:b0d3:1749:ce6c','login','terminal','2023-10-24 11:49:21'),(190,2,57,'2a03:32c0:8000:7cf8:60b4:b0d3:1749:ce6c','login','terminal','2023-10-24 11:50:20'),(191,2,58,'178.186.182.77','register','terminal','2023-10-24 14:13:46'),(192,2,59,'178.186.182.77','register','terminal','2023-10-24 14:15:26'),(193,2,59,'178.186.182.77','login','terminal','2023-10-24 14:17:56'),(194,2,60,'176.210.76.101','register','terminal','2023-10-24 14:24:31'),(195,2,60,'176.210.76.101','login','terminal','2023-10-24 14:26:04'),(196,2,61,'2a00:1fa2:4bb:7525:0:6d:6373:b101','register','terminal','2023-10-25 04:08:52'),(197,2,61,'2a00:1fa2:4bb:7525:0:6d:6373:b101','login','terminal','2023-10-25 04:33:44'),(198,2,62,'109.197.206.144','register','terminal','2023-10-26 17:30:30'),(199,2,62,'109.197.206.144','login','terminal','2023-10-26 17:31:36'),(200,2,62,'46.32.67.103','login','terminal','2023-10-26 18:21:27'),(201,2,62,'46.32.67.103','login','terminal','2023-10-26 18:24:02'),(202,2,55,'176.59.102.226','logout','terminal','2023-10-26 19:13:26'),(203,2,62,'109.197.206.144','login','terminal','2023-10-27 03:55:52'),(204,2,62,'176.59.3.128','login','terminal','2023-10-27 05:26:19'),(205,2,63,'84.245.201.103','register','terminal','2023-10-27 15:19:34'),(206,2,63,'84.245.201.103','login','terminal','2023-10-27 15:20:54'),(207,2,62,'46.32.67.103','logout','terminal','2023-10-29 18:32:29'),(208,2,62,'46.32.67.103','login','terminal','2023-10-29 18:32:49'),(209,2,62,'46.32.67.103','login','terminal','2023-10-29 18:33:34'),(210,2,64,'2a0d:5600:46:d003::a362','register','terminal','2023-10-30 10:59:27'),(211,2,64,'2a0d:5600:46:d003::a362','login','terminal','2023-10-30 11:00:19'),(212,2,65,'145.255.178.198','register','terminal','2023-11-09 14:59:41'),(213,2,65,'145.255.178.198','login','terminal','2023-11-09 15:01:42'),(214,2,65,'145.255.178.198','login','terminal','2023-11-09 15:17:21'),(215,2,65,'145.255.178.198','login','terminal','2023-11-09 15:23:35'),(216,2,65,'145.255.178.198','login','terminal','2023-11-09 15:39:37'),(217,2,65,'145.255.178.198','logout','terminal','2023-11-09 16:14:27'),(218,2,65,'145.255.178.198','login','terminal','2023-11-09 16:14:47'),(219,2,66,'92.47.84.195','register','terminal','2023-11-10 19:35:53'),(220,2,66,'92.47.84.195','login','terminal','2023-11-10 19:37:02'),(221,2,67,'91.231.136.254','register','terminal','2023-11-22 14:42:00'),(222,2,67,'91.231.136.254','login','terminal','2023-11-22 16:05:23'),(223,2,68,'109.196.76.222','register','terminal','2023-11-30 10:51:26'),(224,2,68,'109.196.76.222','login','terminal','2023-11-30 10:52:45'),(225,2,55,'176.115.145.238','login','terminal','2023-12-01 08:34:34'),(226,2,69,'157.49.177.65','register','terminal','2023-12-05 11:55:30'),(227,2,69,'157.49.177.65','login','terminal','2023-12-05 11:56:11'),(228,2,69,'157.49.177.65','login','terminal','2023-12-05 11:56:16'),(229,2,70,'157.49.177.65','register','terminal','2023-12-05 12:03:44'),(230,2,71,'176.59.78.96','register','terminal','2023-12-10 15:18:35'),(231,2,71,'176.59.78.96','login','terminal','2023-12-10 15:20:55');
/*!40000 ALTER TABLE `authorizations_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charts`
--

DROP TABLE IF EXISTS `charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `exchange` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `yield` int(11) DEFAULT NULL,
  `course` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `category_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `hidden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charts`
--

LOCK TABLES `charts` WRITE;
/*!40000 ALTER TABLE `charts` DISABLE KEYS */;
INSERT INTO `charts` VALUES (259,2,'Coinbase','BTCUSDT','Bitcoin',60,21235.5500,6,2,0),(260,2,'Coinbase','ETHUSDT','Ethereum',44,1628.4100,6,1,0),(261,2,'Coinbase','BNBUSDT','Binance Coin',37,352.3000,6,0,0),(262,2,'Coinbase','XRPUSDT','XRP',39,0.4895,6,0,0),(263,2,'Coinbase','USDTUSDT','Tether',51,1.0004,6,0,0),(264,2,'Coinbase','ADAUSDT','Cardano',21,0.4232,6,0,0),(265,2,'Coinbase','DOGEUSDT','Dogecoin',47,0.1244,6,0,0),(266,2,'Coinbase','LTCUSDT','Litecoin',84,69.3100,6,0,0),(267,2,'Coinbase','BCHUSDT','Bitcoin Cash',32,122.4000,6,0,0),(268,2,'Coinbase','LINKUSDT','Chainlink',33,8.7090,6,0,0),(269,2,'Coinbase','XLMUSDT','Stellar',34,0.1131,6,0,0),(270,2,'Coinbase','USDCUSDT','USD Coin',35,0.9999,6,0,0),(271,2,'Coinbase','THETAUSDT','Theta',27,1.2980,6,0,0),(272,2,'Coinbase','TRXUSDT','Tron',30,0.0650,6,0,0),(273,2,'Coinbase','XMRUSDT','Monero',31,159.1000,6,0,0),(274,2,'Coinbase','NEOUSDT','Neo',33,9.0100,6,0,0),(275,2,'Coinbase','EOSUSDT','EOS',32,1.1650,6,0,0),(276,2,'Coinbase','BSVUSDT','Bitcoin SV',34,77.7690,6,0,0),(277,2,'Coinbase','MKRUSDT','Maker',35,896.0000,6,0,0),(278,2,'Coinbase','XTZUSDT','Tezos',31,1.4340,6,0,0),(279,2,'Coinbase','ICXUSDT','ICON',33,0.2414,6,0,0),(280,2,'Coinbase','RIFUSDT','RIF',32,0.0561,6,0,0),(281,2,'Coinbase','ZECUSDT','Zcash',31,53.4000,6,0,0),(282,2,'Coinbase','STRATUSDT','Stratis',29,0.4082,6,0,0),(283,2,'Coinbase','SUBUSDT','Substratum',25,0.0035,6,0,0),(284,2,'Coinbase','CRPTUSDT','CRPTUSD',28,0.2292,6,0,0),(285,2,'Coinbase','ZILUSDT','ZILLIQA',26,0.0327,6,0,0),(286,2,'Coinbase','ZRXUSDT','0X',35,0.2714,6,0,0),(287,2,'Coinbase','IOSTUSDT','IOST',33,0.0119,6,0,0),(288,2,'Coinbase','ELFUSDT','AELF',22,0.1350,6,0,0),(289,2,'Coinbase','BMCUSDT','Blackmoon',29,0.0287,6,0,0),(290,2,'Coinbase','DAIUSDT','DAI',21,0.9999,6,0,0),(291,2,'Coinbase','DCNUSDT','Dentacoin',12,0.0000,6,0,0),(292,2,'Coinbase','NEXOUSDT','Nexo',21,1.0010,6,0,0),(293,2,'Coinbase','DCRUSDT','Decred',23,27.8000,6,0,0),(294,2,'Coinbase','ACTUSDT','ACHAIN',28,0.0105,6,0,0),(295,2,'Coinbase','WAXUSDT','WAX',30,0.2733,6,0,0),(296,2,'Coinbase','CVCUSDT','CIVIC',31,0.1374,6,0,0),(297,2,'Coinbase','SMARTUSDT','SmartCash',32,0.0093,6,0,0),(298,2,'Coinbase','ANTUSDT','Aragon',17,2.0070,6,0,0),(299,2,'Coinbase','STXUSDT','Blockstack',34,0.3310,6,0,0),(300,2,'Coinbase','DASHUSDT','DASH',39,45.6800,6,0,0),(301,2,'Coinbase','LRCUSDT','Loopring',31,0.3581,6,0,0),(302,2,'Coinbase','HTMLUSDT','HTMLCOIN',23,0.0002,6,0,0),(303,2,'Coinbase','NXTUSDT','NXT',27,0.0442,6,0,0),(304,2,'Coinbase','BTGUSDT','Bitcoin Gold',29,20.6900,6,0,0),(305,2,'Coinbase','NCTUSDT','Polyswarm NEC',27,0.0360,6,0,0),(306,2,'Coinbase','PPCUSDT','Peercoin',23,1.4672,6,0,0),(307,2,'Coinbase','NANOUSDT','NANO',13,2.1051,6,0,0),(308,2,'Coinbase','SANUSDT','Santiment',37,0.1803,6,0,0),(309,2,'Coinbase','MITHUSDT','Mithril',35,0.0203,6,0,0),(310,2,'Coinbase','ONTUSDT','Ontology',34,0.2409,6,0,0),(311,2,'Coinbase','OMGUSDT','OMG',32,1.7780,6,0,0),(312,2,'Coinbase','IOTAUSDT','IOTA',23,0.2760,6,0,0),(313,2,'Coinbase','REPUSDT','Augur',37,7.1200,6,0,0),(314,2,'Coinbase','QTUMUSDT','QTUM',38,3.0120,6,0,0),(315,2,'Coinbase','MLNUSDT','MLN',33,25.5100,6,0,0),(316,2,'Coinbase','DATAUSDT','Streamr DC',31,0.0326,6,0,0),(317,2,'Coinbase','HTUSDT','Huobi',23,17.1691,6,0,0),(318,2,'Coinbase','LSKUSDT','LISK',36,1.0080,6,0,0),(319,2,'Coinbase','UTKUSDT','UTK',49,0.1379,6,0,0),(320,2,'Coinbase','ETCUSDT','Ethereum Classic',31,26.2800,6,0,0),(321,2,'Coinbase','ETPUSDT','ETP',51,0.1165,6,0,0),(322,2,'Coinbase','BNTUSDT','BNT',37,0.5010,6,0,0),(324,2,'Coinbase','WAVESUSDT','Waves',34,3.5410,6,0,0),(325,2,'Coinbase','STORJUSDT','Storj',37,0.4793,6,0,0),(326,2,'Coinbase','BATUSDT','Basic Attention',33,0.3299,6,0,0),(327,2,'Coinbase','KNCUSDT','KNC',21,0.9440,6,0,0),(328,2,'Coinbase','MAIDUSDT','Maidsafe Coin',27,0.7290,6,0,0),(329,2,'Coinbase','OAXUSDT','OAX',30,0.2162,6,0,0),(330,2,'Coinbase','ODEUSDT','Odem',14,0.0014,6,0,0),(331,2,'Coinbase','BCDUSDT','Bitcoin Diamond',32,2.7917,6,0,0),(332,2,'Coinbase','MANAUSDT','Mana',24,0.7062,6,0,0),(333,2,'Coinbase','EVXUSDT','Everex',17,0.5713,6,0,0),(334,2,'Coinbase','DATUSDT','Datum',21,0.0703,6,0,0),(336,2,'Coinbase','ENJUSDT','Enjin Coin',23,0.4786,6,0,0),(337,2,'Coinbase','CNDUSDT','Cindicator',24,0.0192,6,0,0),(338,2,'Coinbase','XVGUSDT','Verge',31,0.0033,6,0,0),(339,2,'Coinbase','GBXUSDT','British Pence',26,0.0502,6,0,0),(340,2,'Coinbase','ARDRUSDT','Ardor',27,0.0998,6,0,0),(341,2,'Coinbase','NGCUSDT','Naga',29,0.0311,6,0,0),(342,2,'Coinbase','BTXUSDT','Bitcore',21,0.4390,6,0,0),(343,2,'Coinbase','SNTUSDT','Status',27,0.0571,6,0,0),(344,2,'Coinbase','QSHUSDT','Qash',33,0.0562,6,0,0),(440,2,'Tradernet','GBPCAD','GBP/CAD',71,1.7137,7,0,0),(441,2,'Tradernet','EURUSD','EUR/USD',81,1.2100,7,3,0),(442,2,'Tradernet','USDJPY','USD/JPY',13,109.5960,7,0,0),(443,2,'Tradernet','GBPUSD','GBP/USD',55,1.4101,7,0,0),(444,2,'Tradernet','AUDUSD','AUD/USD',59,0.7661,7,0,0),(445,2,'Tradernet','USDCHF','USD/CHF',51,0.8985,7,0,0),(446,2,'Tradernet','USDCAD','USD/CAD',43,1.2150,7,0,0),(447,2,'Tradernet','EURGBP','EUR/GBP',45,0.8574,7,0,0),(448,2,'Tradernet','EURCHF','EUR/CHF',59,1.0875,7,0,0),(449,2,'Tradernet','EURCAD','EUR/CAD',53,1.4691,7,0,0),(450,2,'Tradernet','EURAUD','EUR/AUD',51,1.5713,7,0,0),(451,2,'Tradernet','EURNZD','EUR/NZD',54,1.6946,7,0,0),(452,2,'Tradernet','EURJPY','EUR/JPY',61,132.6220,7,0,0),(453,2,'Tradernet','GBPJPY','GBP/JPY',60,154.5870,7,0,0),(454,2,'Tradernet','CHFJPY','CHF/JPY',55,121.8415,7,0,0),(455,2,'Tradernet','CADJPY','CAD/JPY',41,90.1164,7,0,0),(456,2,'Tradernet','AUDJPY','AUD/JPY',61,84.4172,7,0,0),(457,2,'Tradernet','NZDJPY','NZD/JPY',43,78.1673,7,0,0),(458,2,'Tradernet','GBPCHF','GBP/CHF',55,1.2643,7,0,0),(459,2,'Tradernet','GBPAUD','GBP/AUD',51,1.8303,7,0,0);
/*!40000 ALTER TABLE `charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charts_categories`
--

DROP TABLE IF EXISTS `charts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charts_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `hidden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charts_categories`
--

LOCK TABLES `charts_categories` WRITE;
/*!40000 ALTER TABLE `charts_categories` DISABLE KEYS */;
INSERT INTO `charts_categories` VALUES (6,2,'Криптовалюты',0,0),(7,2,'Валюты',3,1);
/*!40000 ALTER TABLE `charts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `user_id` int(11) NOT NULL,
  `chart_id` int(11) NOT NULL,
  `minutes` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `income` decimal(15,2) NOT NULL,
  `yield` int(11) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `spot` decimal(15,8) NOT NULL,
  `close_spot` decimal(15,8) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `notified` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` VALUES (1,2,1,259,1,1.00,-1.00,60,'virtual_dollars',20138.85000000,20125.28000000,'up','loss',NULL,'2022-06-22 07:20:51','77a3b784-e9e7-4bae-ac66-3fd289161686'),(2,2,1,259,1,1.00,1.60,60,'virtual_dollars',20145.19000000,20154.17000000,'up','win',NULL,'2022-06-22 08:41:31','49b9300a-3d35-46f6-9ffa-898eecbd0f98'),(3,2,1,259,1,1.00,1.60,60,'virtual_dollars',21052.70000000,22999.07000000,'up','win',NULL,'2022-06-28 13:46:31','64c2f409-6d7d-409d-b8ea-e7667d2f4b20'),(4,2,1,259,1,10.00,16.00,60,'virtual_dollars',21366.47000000,21777.83000000,'up','win',NULL,'2022-08-24 09:10:04','1fdc18b9-59bc-44ea-8f3b-953a039a7795'),(5,2,15,260,1,1.00,1.44,44,'virtual_dollars',1650.59000000,1679.84000000,'up','win',NULL,'2022-08-24 14:53:30','8530cdab-e40b-4764-a05e-f07d60d36ab2'),(6,2,16,259,1,7.00,11.20,60,'virtual_dollars',21609.87000000,21777.83000000,'up','win',NULL,'2022-08-24 15:56:41','b3cce3a3-0e88-4ae1-b838-6d3a63e88675'),(7,2,16,259,1,1.00,1.60,60,'virtual_dollars',21630.71000000,21777.83000000,'up','win',NULL,'2022-08-24 16:02:09','0676734c-3895-408d-bca1-199cf692a1e4'),(8,2,15,260,1,22.00,-22.00,44,'virtual_dollars',1687.70000000,1679.84000000,'up','loss',NULL,'2022-08-24 16:10:20','7a88f289-090e-422d-b767-3dd8e2acbe6b'),(9,2,17,259,1,5.00,-5.00,60,'virtual_dollars',21779.23000000,21777.83000000,'up','loss',NULL,'2022-08-24 16:16:15','765241ae-ac9a-474e-81c2-91be830a2f5d'),(10,2,15,260,1,1.00,-1.00,44,'virtual_dollars',1680.99000000,1680.47000000,'up','loss',NULL,'2022-08-24 16:26:28','cbdbea12-7ed6-4473-8bab-d6afd84dd3c4'),(11,2,15,260,1,1.00,1.44,44,'virtual_dollars',1670.86000000,1671.99000000,'up','win',NULL,'2022-08-24 17:26:49','9f9b5d71-4922-494b-97c5-77bc3ee9ca48'),(12,2,15,260,2,818.00,1177.92,44,'virtual_dollars',1672.10000000,1672.60000000,'up','win',NULL,'2022-08-24 17:28:32','f7bdf17f-5085-466e-9401-e736e010592e'),(13,2,20,259,5,10.00,-10.00,60,'virtual_dollars',19932.16000000,21235.55000000,'down','loss',NULL,'2022-10-04 17:08:15','05c51032-caf0-468f-87bb-0ae481e495b3'),(14,2,20,259,5,20.00,32.00,60,'virtual_dollars',19938.37000000,21235.55000000,'up','win',NULL,'2022-10-04 17:10:10','91f00454-b3dc-4f78-9c54-4c810b551958'),(15,2,20,259,5,40.00,-40.00,60,'virtual_dollars',19921.64000000,21235.55000000,'down','loss',NULL,'2022-10-04 17:13:24','4a20af01-16c1-466b-a21b-f7e02977934e'),(16,2,22,266,1,500.00,-500.00,84,'virtual_dollars',69.05000000,69.31000000,'down','loss',NULL,'2022-11-06 04:14:03','10efc123-6ebf-498d-a585-df4a8acd4c60'),(17,2,22,266,1,500.00,-500.00,84,'virtual_dollars',69.02000000,69.31000000,'down','loss',NULL,'2022-11-06 04:15:15','7aef51a5-e707-4b56-86b4-7b5cc773a058'),(18,2,22,266,1,100.00,184.00,84,'virtual_dollars',68.97000000,69.31000000,'up','win',NULL,'2022-11-06 04:16:07','6e2ab4d8-56c8-44ad-a8bc-d140a5b00f14'),(19,2,24,259,1,500.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-11-17 10:29:40','1c6194b3-c351-43e7-897a-5ef5f1b93b80'),(20,2,25,266,3,1100.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2022-11-29 10:57:25','454f3454-5fe9-4aca-812f-53eebe93ed68'),(21,2,25,266,1,100.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'up','draw',NULL,'2022-11-29 18:19:48','530c748f-604c-4e4a-a8ac-c5b7d7225220'),(22,2,25,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-11-30 03:55:37','40e63907-15cd-43be-ad73-fe8f55046326'),(23,2,25,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-11-30 07:42:40','5c605a9b-abe8-4c9c-be82-29466ec86694'),(24,2,25,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-11-30 07:46:01','21d554d2-0b41-4ae6-8dbf-74cf5ca6016d'),(25,2,25,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-11-30 07:48:34','1a864de1-b376-4911-8972-d321184ca7b4'),(26,2,25,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-11-30 16:42:36','c171bfe9-2646-442e-a0be-a5c388e1b695'),(27,2,26,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-12-05 11:36:57','bfacb083-8ee7-4b2a-a4c9-41709c0d04d8'),(28,2,26,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-12-05 11:37:02','2c3a8023-fc37-493b-b98a-c7d41fabe9a3'),(29,2,26,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-12-09 08:08:54','e0bdff16-0583-40f2-94be-793306141a16'),(30,2,29,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-12-20 20:01:08','8bc47857-a701-4925-90d4-cead7796a3c6'),(31,2,19,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-12-30 18:17:56','cfbfb3f4-ca91-4358-95e9-b1af6f7cb8fb'),(32,2,19,259,1,10.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-12-30 18:20:58','45e825c9-d5e3-41d3-9806-ca1f7eea1484'),(33,2,19,259,1,10.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-12-30 18:21:00','547f854d-64c7-48ab-ae55-023cd0f3de49'),(34,2,19,259,1,10.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-12-30 18:21:58','395b80e6-3376-43b4-a10c-b3ef3b7f1bb0'),(35,2,19,259,1,10.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-12-30 18:22:59','905ef2d7-af77-4ced-b0f8-1beaa0aa9c6f'),(36,2,19,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2022-12-31 05:39:27','d4b82579-a294-41ea-9c75-670f182cc14a'),(37,2,19,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2022-12-31 05:39:31','4be8828a-3f06-4f43-89b2-d31e8c0dc1d7'),(38,2,31,266,1,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2023-01-06 19:14:58','227873c4-cab8-460a-acd0-f57d5e694c99'),(39,2,31,266,1,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'up','draw',NULL,'2023-01-06 19:16:00','f354953c-d597-450e-b7f3-45ad12002409'),(40,2,31,266,2,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2023-01-06 19:17:29','7a9e2636-41e0-4e37-b26f-efe84609fc4c'),(41,2,31,266,2,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2023-01-06 19:18:15','9682b935-73aa-4716-afef-07362125daa7'),(42,2,31,266,1,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2023-01-06 19:18:20','44c8b8d9-d090-4294-8f3c-150f5503efc6'),(43,2,31,266,1,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2023-01-06 19:18:22','d97ad8b6-5229-4552-a048-8415bbc2b74b'),(44,2,31,266,1,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'up','draw',NULL,'2023-01-06 19:19:02','54039910-8350-4c29-a076-85974df7b951'),(45,2,31,266,1,10.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'up','draw',NULL,'2023-01-06 19:19:15','12a5b5cd-ec02-4fab-8fd9-91f46e211d30'),(46,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-01-06 19:22:47','d3166cf4-760b-4c46-b28e-c55a0bab96fd'),(47,2,31,259,1,100.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:40:02','910ad7c2-a1f3-4ee8-ba7e-03904919f3dd'),(48,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:18','93c6a6ae-f1a8-4767-af9d-915985676917'),(49,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:25','270bd9d7-02cb-45c9-a018-2f8cf49e8566'),(50,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:26','d558f9ee-aab7-46f1-aaaf-c1af844ec4cc'),(51,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:26','ba118b3a-4fa2-440e-b6af-630c3bd06e24'),(52,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:27','a0e48940-c0be-4c8e-96a9-9687a654cac9'),(53,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:27','fcf0c369-e5bc-4552-b4bc-0c604f708b5a'),(54,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:27','a00a7d68-3384-4f56-97fa-a8f911872c4b'),(55,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:28','9fc7702c-97d5-45de-9391-c4f6b0b395a4'),(56,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:28','c96d5ba9-50d7-467e-bbad-990e8a1c78a7'),(57,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:28','137b8d1f-3214-4fa9-bb8d-f3ed58035f48'),(58,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:29','f520705b-2ae4-4715-8f82-3caa9d928215'),(59,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:30','a80add50-7f94-42a6-a046-75364216eb02'),(60,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:31','78c5e791-b967-4271-a237-a997d302e27e'),(61,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-06 20:45:32','41c01e15-32da-4f6b-a4cc-971f5eeec51e'),(62,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'up','draw',NULL,'2023-01-06 20:46:04','4427ef2d-dc4b-4369-ba29-478a4255ef51'),(63,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'down','draw',NULL,'2023-01-06 20:46:06','15d67e1b-b000-4c82-90a2-b012c58814bd'),(64,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'up','draw',NULL,'2023-01-06 20:46:06','a89768d7-ee07-4a1a-8ef6-82c885c8eb2d'),(65,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'down','draw',NULL,'2023-01-06 20:46:06','dcfc8b5f-9806-42cd-8e3b-b4bc55b9b516'),(66,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'up','draw',NULL,'2023-01-06 20:46:07','39a8737b-804a-485f-be85-cb4f72f05dcb'),(67,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'down','draw',NULL,'2023-01-06 20:46:07','6f0f26d7-fe04-4930-bcd5-092a25ac7849'),(68,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'up','draw',NULL,'2023-01-06 20:46:07','9708aa86-f80b-4367-b649-dfc8cdc1cfc8'),(69,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'down','draw',NULL,'2023-01-06 20:46:07','311c3366-7e56-4790-9aeb-e0d9b44c4f33'),(70,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'up','draw',NULL,'2023-01-06 20:46:08','2488f987-f6d1-4efc-a686-656443555f87'),(71,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'down','draw',NULL,'2023-01-06 20:46:08','2a98e38f-aa51-4beb-9e1e-03ef4e8c46ed'),(72,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'down','draw',NULL,'2023-01-11 00:55:23','04d58d23-0b86-4f57-83ca-58975a042511'),(73,2,31,265,1,1.00,0.00,47,'virtual_dollars',0.12440000,0.12440000,'down','draw',NULL,'2023-01-11 17:41:24','a91c4b60-c48c-48af-8fce-75b7eab8ddaf'),(74,2,31,266,1,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2023-01-12 17:40:59','db0fc47e-a53b-40c0-9197-1199208bc6cb'),(75,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-01-12 17:45:22','3119666e-956d-4d1c-8cfc-641f4cf5acca'),(76,2,31,259,1,9872.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-12 17:48:13','90d70537-cdfc-4e13-a2aa-b3566238a448'),(77,2,31,259,1,9872.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-12 17:49:33','1ea69257-4303-4941-8ec7-54e00614ef86'),(78,2,31,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-01-12 18:06:03','cb6cd9ef-7b4c-4b4e-b8b1-05f326c40110'),(79,2,31,271,1,1.00,0.00,27,'virtual_dollars',1.29800000,1.29800000,'down','draw',NULL,'2023-01-17 09:57:33','a28b3c8c-7ca1-44f4-b31f-00e886d84e8f'),(80,2,31,266,1,1.00,0.00,84,'virtual_dollars',69.31000000,69.31000000,'down','draw',NULL,'2023-01-20 17:14:23','eb5fcb94-eec4-413e-8b62-9338b7ff4143'),(81,2,34,259,1,2.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-02-10 07:50:34','930b4659-3f1d-4c2f-8786-90d47d6f8dd3'),(82,2,34,259,1,2.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-02-10 07:52:30','c42ff832-531b-42f3-93e9-bc281deea21c'),(83,2,34,259,1,6.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-02-10 07:53:47','59c0c2a5-e07f-4d74-905d-4a18ae4e4bbf'),(84,2,35,259,2,3.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-02-23 18:10:20','f2b3da9c-1c99-410c-b7f0-6192d00094a5'),(85,2,35,259,2,3.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-02-23 18:10:33','00305315-eeeb-44ce-bb46-df831ccb920a'),(86,2,35,259,1,20.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-02-23 18:13:28','cc99617d-2ba1-42e0-b612-e45c170a6969'),(87,2,39,259,2,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-04-25 07:22:05','4c51938b-b90e-4dec-bcb6-0686b126c332'),(88,2,39,259,1,10.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-04-25 07:39:41','bf84cc83-eec8-4611-a40e-dd69cb300440'),(89,2,40,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-04-25 13:41:16','296818ab-8114-47d8-9758-d292b3ef7d9d'),(90,2,40,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-04-25 13:41:18','dc900cc2-6da5-438f-9174-3cc488ad81fb'),(91,2,41,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-04-25 15:24:28','7026954b-e8b6-41b4-b868-a2d4f7b74a24'),(92,2,41,259,1,3.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-04-25 15:26:23','23182e85-8ba4-489d-853a-626367c87ab6'),(93,2,45,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-05-14 21:43:05','9af05902-fb91-48be-8c3f-764dd5525198'),(94,2,45,259,1,20.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-05-14 21:43:14','f1a0155d-712f-46b4-864e-2f65e9f0363c'),(95,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'up','draw',NULL,'2023-05-14 21:47:12','26f7da5c-7d5c-4402-95dc-455debc16777'),(96,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'up','draw',NULL,'2023-05-14 21:47:12','395233c6-2f87-4233-a350-0220b8469bd6'),(97,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:47:15','3195de97-0293-4676-90b1-0f9741fe5550'),(98,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:47:15','d9390b83-f5ae-447a-bc8e-2c9d5fee45fb'),(99,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:47:16','6e6c13f0-dcab-4dd4-a93e-156c9fa39d36'),(100,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:47:16','f456ee43-0b0a-46f8-9124-36d9adc4cf38'),(101,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:47:17','42d0a2ca-1547-48d4-969e-cce1fc28bb96'),(102,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:47:17','255d991a-d9ae-4377-92b8-6d4857d38504'),(103,2,45,260,1,1.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:47:17','f1c2d6c8-fc29-4974-ae44-26d146427b0f'),(104,2,45,260,1,1000.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'down','draw',NULL,'2023-05-14 21:48:55','e68c1175-410c-4e20-a5b3-52d71eaf0e61'),(105,2,45,260,1,1000.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'up','draw',NULL,'2023-05-14 21:49:02','d3e634c6-4d98-4f3a-afe9-3c61ff01f8f6'),(106,2,45,260,1,1000.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'up','draw',NULL,'2023-05-14 21:49:03','3502f044-6ee3-47b4-8a13-defdf8d1bef4'),(107,2,45,260,1,1000.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'up','draw',NULL,'2023-05-14 21:49:03','5a603cc4-447d-4e59-8818-3ee32ea32aba'),(108,2,45,260,1,1000.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'up','draw',NULL,'2023-05-14 21:49:04','06a150ae-2d07-412e-a746-ba355b1cc8b9'),(109,2,45,260,1,5000.00,0.00,44,'virtual_dollars',1628.41000000,1628.41000000,'up','draw',NULL,'2023-05-14 21:49:17','efb4e702-2b83-4609-8132-42d7a80b44f5'),(110,2,45,259,1,10000.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'down','draw',NULL,'2023-05-14 21:51:32','237caa81-16e5-4758-a3a0-005c3d6c8397'),(111,2,46,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-05-14 22:21:53','cba08285-6e94-437c-bdba-dee6947531a6'),(112,2,1,259,1,1.00,0.00,60,'virtual_dollars',21235.55000000,21235.55000000,'up','draw',NULL,'2023-05-15 06:23:30','428a5455-3c47-4353-aacc-4563e1f4286e'),(113,2,50,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-08-01 08:56:23','996c8745-2389-41b5-93cc-556288ee21d7'),(114,2,51,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-08-07 00:01:05','e4d0d4c7-984f-4ebf-b037-a9dad2baff49'),(115,2,53,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-08-07 13:34:38','0b359090-f6c8-430c-b136-8b89aedc3753'),(116,2,55,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-10 12:12:29','e42db97f-4666-4511-ba50-57e0d212ce28'),(117,2,55,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'down','in_progress',NULL,'2023-10-11 06:03:36','42d584bc-f6c6-40d2-aae4-304d838736eb'),(118,2,57,262,1,1.00,1.39,39,'virtual_dollars',0.48950000,NULL,'up','in_progress',NULL,'2023-10-24 11:52:00','539407b5-5104-48c3-a119-dd1e21fd6295'),(119,2,62,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-26 18:33:42','bd6d6aef-8e3d-4730-b87c-378213c0d1f9'),(120,2,62,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 03:56:15','fee0d808-8d66-43d8-8e23-2d8d1ec5a82d'),(121,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:13','4c0c2cd1-98ea-44dd-81fb-5aa7edcca995'),(122,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:16','25dc50c7-f3cb-432e-9910-79a2452ed7e4'),(123,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:17','9efb0886-f415-4239-bb82-fe12bb546a84'),(124,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:18','95ef9c65-14c3-4dcd-8101-d1b03e1812d6'),(125,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:19','810e64b8-8934-4e46-a852-f50732d979d1'),(126,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:19','2ce63d28-c25f-4926-93a5-65d3f2a12bb5'),(127,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:20','fdf89f53-59d2-4444-86af-fdf0cdd03cba'),(128,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:21','3afac15d-b944-454a-bea9-bad2433160e6'),(129,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:21','bf2db4ac-f9c8-4fb8-9ec5-40dfd433351e'),(130,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:22','d35e3a82-0469-4bef-a762-e61931420441'),(131,2,62,260,2,10.00,14.40,44,'virtual_dollars',1628.41000000,NULL,'down','in_progress',NULL,'2023-10-27 05:28:22','ef3859e3-c804-4be6-b609-a045a0acd589'),(132,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:01','0702c915-3243-4b16-b465-f5464d3f5563'),(133,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:02','6f3fbe62-1680-4be3-b71c-4f92013e54d9'),(134,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:02','d484ab53-cf5c-4fc9-98d8-38285f37afe9'),(135,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:03','7852286c-cf09-4f12-8d8d-546fce2cafaf'),(136,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:03','3d97dd0b-08bf-456c-bf84-91336fa464e1'),(137,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:04','9f0d8f60-d5cc-4470-a955-97c11f7d483d'),(138,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:04','6423b81b-72bb-47d2-8b2a-a8229b252a2b'),(139,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:04','3c249887-92d6-441e-abd6-303137fe1d81'),(140,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:05','94603c36-d68d-4be4-a238-87edc0d8e33e'),(141,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:05','e571a19c-8a29-4d18-8475-7d9fa97f902b'),(142,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:06','189098ab-7400-4b50-8441-c4b7239b8b4f'),(143,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:06','8f07a853-c64f-4d8f-9709-f64d4b4cd8c0'),(144,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:07','52c20195-aca7-49ce-8f78-55668ae7f0fe'),(145,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:07','c9cf3ce2-7f47-454b-93db-b116368220fa'),(146,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:07','6833c455-9abd-4baa-b9e8-dd6b4ec2c8da'),(147,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:08','02fcf32f-8d3d-44fc-b235-8459cc8e6a80'),(148,2,62,259,20,5.00,8.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:08','d9375c51-1d88-4737-b593-4ba748a7de2c'),(149,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:28','e1a8663f-8928-49e0-98fd-ced3284175d9'),(150,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:28','e8cd72b0-bf0f-425c-a4e1-970eaea33e7b'),(151,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:29','3f2977ac-e19c-4620-91df-6303f85caf0c'),(152,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:30','de42fa4d-11f0-4c38-bef4-98c5b23a18f9'),(153,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:31','78af66d2-1183-4900-811c-bce9abd4545f'),(154,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:31','54cf835c-4d30-4a01-987e-179f457fa3af'),(155,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:31','56ce6906-f465-44e0-bd10-7b795b0b96bc'),(156,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:32','ad64ab06-5835-48d6-9fcd-32325ab079f6'),(157,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:32','47d78525-0eae-452f-a32c-797f8e01e2af'),(158,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:33','d05dd53b-39ea-4991-8d22-89ae7078a92f'),(159,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:33','438002f6-c7d9-407e-82cc-bd02cff9b7e7'),(160,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:34','5d396b99-4942-4718-b058-ab92e8bc869c'),(161,2,62,259,5,20.00,32.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-27 07:12:35','40a3fa49-8c5b-44bc-a82a-c106a308776a'),(162,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:44','f19ba179-8b43-4799-8d64-159b2126d3c4'),(163,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:44','eb00f0b4-c2b0-4ad4-a72c-000e000de7e4'),(164,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:45','c9a1f9d0-0e36-4dcf-b16b-d28a6beebb12'),(165,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:45','d2cda22b-4288-4315-ae88-c1d714e6e7d0'),(166,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:46','dc386ec2-30f5-4658-9f5f-b907226cbad6'),(167,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:46','cccb0ade-38c5-4369-9de6-8d8656d603fb'),(168,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:47','8e342b1b-4553-4d5b-bedf-c6e5860418e0'),(169,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:47','16b7aae9-cdfb-44b9-8a13-020623f4d897'),(170,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:48','aae5ddc8-05ec-4b8b-a7c9-6aec8fc7a5ba'),(171,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:49','571a4b4c-69e9-4503-9c20-606b8b2609b5'),(172,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:49','f3e546b8-dab4-4de2-b958-67a365d93e78'),(173,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:50','380f138d-34a4-4d6a-a62f-e993fab3d70b'),(174,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:50','576a0d12-081f-4714-9e8c-229ef2bc4fd6'),(175,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:50','800a4f6a-a3d1-4b6b-98df-0cbb150dff5c'),(176,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:51','8afe79d4-33de-497a-9953-a5f47d3cbc33'),(177,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:51','53456475-0ac1-493a-893a-aedb905df275'),(178,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:52','5aae40db-9a9e-4711-8cf5-76dd5fd73346'),(179,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:52','0e4cd7a3-a36e-4158-ab7a-f1436a0ef9a9'),(180,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:53','aecea111-9050-4230-a6d0-eec75367758f'),(181,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:56','02b98054-9584-46ca-9ce0-a0c2a3a01519'),(182,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:22:59','04fbe4f7-a8f4-4e3d-862f-7bc3b4581b7a'),(183,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:23:02','93417b8c-75d2-468d-b9d0-3121e687d6bc'),(184,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:23:04','cb27e9ac-be1f-4cee-a8aa-a685a79c8f9c'),(185,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:23:07','ed87cea9-3035-40bc-b473-773cc042e500'),(186,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:23:14','aba60bb7-3d2f-4a2e-8b74-35c8e63a1547'),(187,2,62,266,5,20.00,36.80,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:23:17','1a55ac20-d7ca-4b7d-9378-2acf2f69c8d7'),(188,2,62,266,5,23.00,42.32,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:23:22','db69e674-e34f-44eb-b50d-543e2762c9c8'),(189,2,62,266,5,3000.00,5520.00,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-27 14:32:09','b7955cf5-40b5-4639-9b56-7006db341574'),(190,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:18:01','d1c7ee07-e5c0-41c6-9d2b-5c9e42d57161'),(191,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'down','in_progress',NULL,'2023-10-28 07:18:43','0dab839d-ec16-4578-943e-b1fff8284fc2'),(192,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'down','in_progress',NULL,'2023-10-28 07:18:46','18047c01-18e5-4ad8-b85e-c5ffa3b3657d'),(193,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:18:56','928936ca-58f5-4e10-9553-81d26b4f6d14'),(194,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:19:11','f2f24325-b2a4-43bd-aeb4-09e9037a7267'),(195,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:19:13','2f0ae43f-2405-4dca-8de4-2b4954951cef'),(196,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:19:16','8ff1e11f-a01c-44a9-a134-8894ad2b2a1e'),(197,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:19:17','09caefa1-f28a-416c-b70c-cc1580f89521'),(198,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:19:18','e6bfb5fd-1c7c-48a6-83b3-d89d4ab8d23b'),(199,2,62,259,1,100.00,160.00,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-10-28 07:19:18','3879dbb2-2a9c-4738-a5f0-e5b11dd1b782'),(200,2,62,266,1,1.00,1.84,84,'virtual_dollars',69.31000000,NULL,'up','in_progress',NULL,'2023-10-29 08:09:52','0c55dcf6-5b84-4045-8c43-697fc54a01e7'),(201,2,62,266,1,1.00,1.84,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-29 18:26:47','0f82fbb8-5adc-4f7c-9e61-f12cd998c095'),(202,2,62,266,1,1.00,1.84,84,'virtual_dollars',69.31000000,NULL,'down','in_progress',NULL,'2023-10-29 18:34:03','1b60adcf-551c-4bf7-8186-32d983385e36'),(203,2,62,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'down','in_progress',NULL,'2023-10-29 18:40:29','f9066d6a-b3a9-4324-b308-2e7cee24d23a'),(204,2,65,260,1,1.00,1.44,44,'virtual_dollars',1628.41000000,NULL,'up','in_progress',NULL,'2023-11-09 15:17:46','40ec6fc5-4a6c-4223-8527-5d154d6144a0'),(205,2,65,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'down','in_progress',NULL,'2023-11-09 15:19:46','2c2cabb9-2b77-407f-bbfd-57ef451a3ab4'),(206,2,65,261,1,1.00,1.37,37,'virtual_dollars',352.30000000,NULL,'up','in_progress',NULL,'2023-11-09 16:10:15','774cb0b3-3458-4914-961d-21b3e3c3705e'),(207,2,65,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-11-09 17:12:57','6dc637d5-1e59-4539-ae35-a9c9768edfed'),(208,2,65,259,1,1.00,1.60,60,'virtual_dollars',21235.55000000,NULL,'up','in_progress',NULL,'2023-11-09 17:12:57','c5cd7620-2f65-4a54-84f8-5aeac4fcbe50'),(209,2,55,266,1,1.00,1.84,84,'virtual_dollars',69.31000000,NULL,'up','in_progress',NULL,'2023-12-01 08:35:26','0dea01f0-5aeb-443d-a8e8-5ff1e102fb6d');
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_increases`
--

DROP TABLE IF EXISTS `payment_increases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_increases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `user_id` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `full_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL,
  `affiliate_invitation_id` int(11) NOT NULL,
  `affiliate_invitation_paid` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_increases`
--

LOCK TABLES `payment_increases` WRITE;
/*!40000 ALTER TABLE `payment_increases` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_increases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_outputs`
--

DROP TABLE IF EXISTS `payment_outputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_outputs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `card_holder` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `promocode_id` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_outputs`
--

LOCK TABLES `payment_outputs` WRITE;
/*!40000 ALTER TABLE `payment_outputs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_outputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,'Bitcoin','Сеть BTC \r\n1JKbpjHqidy9PWg37ppfoZckJsqmjhjB1m\r\n<br/><br/>\r\nСеть BEP20\r\n0xb398de50076f62d926b5f87bc120010778a15a71'),(2,'Litecoin','Сеть LTC\r\nLdef9xC6QRG4bTJBeoM89ESwGvCpKyCGim\r\n'),(3,'Tether','Сеть ERC20\r\n0xb398de50076f62d926b5f87bc120010778a15a71\r\n<br/><br/>\r\nСеть TRC20\r\nTUSYFXdxeWrCiqRinfNDAvYuB5dh9gf81F'),(4,'Ethereum','Сеть ERC20\r\n0xDB1F783512eC4662928447077a8c9cC021F9F9f9');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodes`
--

DROP TABLE IF EXISTS `promocodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `creator_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `payment_bonus` int(11) NOT NULL,
  `from_admin_panel` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodes`
--

LOCK TABLES `promocodes` WRITE;
/*!40000 ALTER TABLE `promocodes` DISABLE KEYS */;
INSERT INTO `promocodes` VALUES (2,2,0,'SXT100',10,0,'2022-06-22 06:23:46'),(3,2,0,'TRADE50',50,0,'2022-06-22 06:23:46'),(4,2,0,'TRADE',10,0,'2022-06-22 06:23:46');
/*!40000 ALTER TABLE `promocodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodes_log`
--

DROP TABLE IF EXISTS `promocodes_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocodes_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `promocode_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodes_log`
--

LOCK TABLES `promocodes_log` WRITE;
/*!40000 ALTER TABLE `promocodes_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocodes_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 2,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `telegram` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `affiliate_invitation_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0,
  `last_visit_time` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `confirm_email` timestamp NULL DEFAULT NULL,
  `confirm_email_token` varchar(36) DEFAULT NULL,
  `confirm_reset_expire` timestamp NULL DEFAULT NULL,
  `confirm_reset_token` varchar(36) DEFAULT NULL,
  `confirm_delete_expire` timestamp NULL DEFAULT NULL,
  `confirm_delete_token` varchar(36) DEFAULT NULL,
  `delete_date` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'286410',2,'dukker11@yandex.ru','qr3xxoDyTd8CxVTd9N5aHvd-yWyRk0Ni',1,NULL,'','','','','$2y$10$X/CWfr0qrl0cv68X845UCeHiVnmLGIB3QduJOJnQgGXIuO8YHcoDy',0,0,0,0,'2023-10-29 15:40:58','2022-06-22 06:57:41','2022-06-22 07:20:18',NULL,'2022-08-30 12:29:09','d3c45c37-edea-46c2-9fb0-a50b606baf23','2022-08-30 12:27:04','335b2b0e-8962-42e4-b355-8ff57439c163',NULL,''),(14,'697855',2,'pasha.zeta@gmail.com','a7bbb6efca1a79f692260a2cd67c939ea1281a3f5e492426fa450d1499834a29a60e73255dae86727f0ff2821cad08c2e14f',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$z5EkDmgIE0p1lt3nqpb7TeOyb35AZ6VOf72rkUcFAxeqoihlrqetS',0,0,0,0,'2022-10-13 13:07:15','2022-08-24 14:49:57','2022-08-24 14:50:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'828654',2,'greenavicash@gmail.com','0e328a55f6e0f475ab7a3cbad0202a2220d62a4941d808967eba23f21c444318930b3768f75d225ef79ffcee4c486e2af62f',1,NULL,NULL,NULL,NULL,NULL,'$2y$10$1BMj8Ll59WpThO/id43S5u.XhtrStYiwdFm2vU8toFUFBJTqPCN/C',0,0,0,0,'2022-08-24 17:43:32','2022-08-24 14:51:53','2022-08-24 14:52:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'531663',2,'mitean93@mail.ru','1a12b12e85efda9becf82e7017c33893e45f07864925337b2ec2dad4e2aec3f9da7601bae62dd803aa7fdba9fdeaa14f3f50',1,NULL,NULL,NULL,NULL,NULL,'$2y$10$RwJuiXg4ZFnV0CNaTdsLHeqPJgOFbDjDJjLe/zN7TP2xjbyYf65ni',0,0,0,0,'2022-08-31 07:42:25','2022-08-24 15:53:34','2022-08-24 15:54:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'162035',2,'mikhail.nazarenko.00@bk.ru','ea9aa04e0c2bf10ccc12afb467d84cf97d15c8736aee36ba401720565784642eaf3611791add1392b11ecbc410ca61cedb04',1,NULL,NULL,NULL,NULL,NULL,'$2y$10$pSqarenzLHwjNybCc4ljIulPBA5y2iHI1x9WFVnh/RuJydNKLtK4C',0,0,0,0,'2022-08-25 13:17:24','2022-08-24 16:14:30','2022-08-24 16:15:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'634400',2,'ladoanton41@gmail.com','b229183b57a2a2151e73c00e49a2524b834f9b57d891a6090e02961be45e125e6af14bc633e1fd041711a3cd7c83428ebe7a',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$qLC.wyLVd2hL3WwNQzsqRe5VHroaHSSCwzLj2ogAiR/di3FKSOSb2',0,0,0,0,'2022-09-01 11:04:44','2022-08-31 12:43:16','2022-08-31 12:43:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'233620',2,'sergej26rus@yandex.ru','8ab45bc2db826809a25b267dcd7a9d6787f363efdab73e0db3c3cad83f6938e000e2b35850c4c4eefc65a0fd6ce5174f3225',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$c2qPCIxNJqfqrShp6fXXyewQBotTwDC61INXS0KPVUTGfhowBxDwC',0,0,0,0,'2023-01-02 08:29:34','2022-09-17 05:49:36','2022-09-17 05:52:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'392424',2,'deevevgenij7@gmail.com','0443a68759ae20ae08d2df65d690cc0c64104a35c810f969fd1d85c9494fc095b6a046daa242ee638dca15e7d9ea27d75ec3',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$Vof51oznqXrbzmC6AFvO5er4tMzH.RVK8P3tmE2WXFKg1O/lleR56',0,0,0,0,'2022-10-05 11:20:02','2022-10-04 17:00:51','2022-10-04 17:03:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'700789',2,'max_sobo1ev@mail.ru','47b6d0176b2344b3ece521158e6e66dc3c527a869debbe86e6fe24deb51cabb681f8a6cdb1edd9c07bcdcb2163c430342f1c',1,NULL,NULL,NULL,NULL,NULL,'$2y$10$/qJC3R/Gv7n/9.MQXrB6xuujnp4qTgIY7K0Hhpk/9Uzi7eJLA7.HS',0,0,0,0,'2023-02-27 10:14:24','2022-10-07 20:01:02','2022-10-07 20:07:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'423335',2,'mrpozitivik66@gmail.com','27ea5338bf72ffde4cd1eb57d8a2085407417f4252957b2b7aaf961babeea97997bb7310eaea00209add3a446f2391025e07',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$YaxWc1Bdr1a.TEHYh6ZnTOw8ienwF7K2IgV4HvStlT3RmdODgF.Ci',0,0,0,0,'2022-11-06 04:17:44','2022-11-06 04:11:03','2022-11-06 04:11:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'718372',2,'vdokucaev049@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$mRJW7ECOQLsF/gLCh/7z3.3bwebDQ7pRACBZOmJ5h.b9fY3N1S.em',0,0,0,0,NULL,'2022-11-13 21:44:29',NULL,'70a382b5-25ec-4f44-9037-61a5034cad07',NULL,NULL,NULL,NULL,NULL,NULL),(24,'641004',2,'mswero04@mail.ru','9dfb1cf1a7c995c501750fadae980b32baccaf87f7e636c9dccc3be5dae147dc504a51dae314fd7446c477c2c2891fe15018',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$65mQ0s88xbLfQmkC/IH81e2/4fQydy8m2cDFU6gNixZ0AOqZVa/Ji',0,0,0,0,'2022-11-18 08:29:12','2022-11-17 10:25:33','2022-11-17 10:26:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'699054',2,'parahinsergej74@gmail.com','3ea88df6ae21cbb6b63dc7802826c0660b4c2f6e9015a105032af6a6ba64a007b045aeb2522b5b0c9c668fef941c95f93a86',1,NULL,'Cергей Алексадрович','Парахин','Россия','Краснодарский край, Гулькевичи, Некрасова 74','$2y$10$FQ63RoxnYLkJ6thU0lSso.Lh2YcoUb2QYfDxUpIMOPYrcSO0eCWIy',0,0,0,0,'2022-12-06 11:43:37','2022-11-29 10:28:26','2022-11-29 10:35:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'667317',2,'zafar.zafar.19-95@mail.ru','b192d7a2009158d436195bfe36ad9db4a1513ffb86217024bbb4a42e9e23e0724ef25fcc59ee2cc6010a8d0d04be096cb653',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$lQXPoCJC08XEOP59WRThQulpKErKI/py8UbVDN/tmMLUHriSfKsXa',0,0,0,0,'2022-12-09 08:11:02','2022-12-05 11:35:30','2022-12-05 11:35:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'806302',2,'mair1991@mail.ru','531d4d6faebe937076a96c846c608ec13bab517bce3364015f643f9d622693661418d6b63226201eb7b080e6c9a6c025d80f',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$bQiavtyGp5KP0zWyuVhlD.f9eUKrNRp/YhTy9QMVVKt9By4iOyHdC',0,0,0,0,'2022-12-05 15:33:41','2022-12-05 12:38:39','2022-12-05 12:38:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'332965',2,'sparahin79@gmail.com','aa3535f1de8ff4c6cf9129417386133c78520cd948b19abeeef4b1b6aa8b11a19b69f7aa75df46fbbbb8d2192b36e7a5a8f1',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$JHl/Lxo2OSlNtF1YdDWTce7T581aiFPech2GIQxPyCYv4Oy9MilOO',0,0,0,0,'2022-12-06 11:45:27','2022-12-06 11:42:10','2022-12-06 11:43:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'522709',2,'sergejtrade79@gmail.com','9302e5dc441d251a49c77378f9e68c1d72c1d51ddeaeec0dee6fe759e58e4d3e020ffd059135282edb7f64e60feac0debd34',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$8RxdkbYSj0bm8mbfuHPpQeFpCvT1UglqeG/SaQ1zyBd5Zjh.5Ky62',0,0,0,0,'2022-12-20 20:01:37','2022-12-20 19:57:54','2022-12-20 19:58:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'424656',2,'limonovaleksandr72@gmail.com','2d5c7b18c95f680c764361cbd39e49334e63e41ad53d1bcf1cba3e687a6908d30cb5886e238b83bc6d2c8629166cbff760ad',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$GyoH8Q8V6DOOulrLlgrVSOGcn3C2OyHVO4orgS4zELWQqcA83GvyO',0,0,0,0,'2023-01-05 14:50:40','2023-01-05 14:46:29','2023-01-05 14:47:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'496618',2,'pimpov5@gmail.com','291904086401ba6adb7f83e81eee3e44d161c0376ea33ca035a17b0fe296a097d1a91903755eae52728b3aa22f2a5cf099c7',1,NULL,NULL,NULL,NULL,NULL,'$2y$10$3YtnHYBaJOyIUuz2HdnjVu/l9g4/1I5JFANQIbRMih0O693.ZqCmW',0,0,0,0,'2023-01-20 17:14:26','2023-01-06 19:10:25','2023-01-06 19:10:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'427981',2,'agulnur934ab@gmail.com','695b0cb300b3ec49a9b0aee3cd3c5461e6794403ec7878f6105b315f4d0347a99ab53a325d55ace6c029f8a4472f302d4c9f',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$NANwl.nWMXQri5b9588V8eJDY.oqzKtulmj9wRQpdHD1M/YJALEim',0,0,0,0,'2023-01-26 09:58:48','2023-01-26 09:57:05','2023-01-26 09:57:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'287274',2,'vadimsunov@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$gGHAzcAobFCey5W0G/njVe/pcElVI8GZd.GcJDr2Vx9NXVzjH029u',0,0,0,0,NULL,'2023-01-27 16:44:10',NULL,'b5e6b521-04b0-4247-88e7-e55b73205669',NULL,NULL,NULL,NULL,NULL,NULL),(34,'324585',2,'tmsaid1@mail.ru','1dae266fbccb3e41c67beec5e4100f1fdd177b5ab4f1ac1010b4a1c8374597174ea871e2f05b8af53e3859455440758e55d3',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$XlBdX3XJPz3q.m0oXdXdyem9IBLiv0i0YyLLYyh1Kui5wzTtFRmWK',0,0,0,0,'2023-02-10 14:05:59','2023-02-10 07:34:39','2023-02-10 07:43:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'321089',2,'aleks139s@icloud.com','29151a143d1de413579bcdfc2459dd233ad0dabc510ba02e5b79facf57d81f44b5d63ea2b0d514d6d8afd0b166c58f367178',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$57dI7k8vYSDjlKhhvIzfj.o7tty5GIojc8p9dUsA1E1/CUx.h2t12',0,0,0,0,'2023-02-24 16:28:06','2023-02-23 18:00:43','2023-02-23 18:01:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'436243',2,'ahbalaevaleksandr8@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$r84nehNtAmhyr1TSF5UF/OnrKoomTxsWE/BHqUL0XntO2mHy5Czqu',0,0,0,0,NULL,'2023-02-27 17:10:25',NULL,'36bbcaf5-deca-4fc2-a4f7-c2ab1dc3eee0',NULL,NULL,NULL,NULL,NULL,NULL),(37,'678971',2,'akhbalayev@inbox.ru',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$wjQASHgr9iBXA/sZ7X/CluczNi095JjwdG7cBfqXndKaFqp75Oo6m',0,0,0,0,NULL,'2023-02-27 17:16:04','2023-02-27 17:16:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'473556',2,'belovilya4373@gmail.com','5f6ee01d49130fb1de7459f2ddfccd4bdb9e2bff027451f4f9f466e6d91294c4cefdc407e3886b16ae3bc2c9261a99243a01',1,NULL,NULL,NULL,NULL,NULL,'$2y$10$KEymzSzLHovE3zwdJ5kSDOAXAz0RmN57LwreWJb/9xNdSxzyZUfiG',0,0,0,0,'2023-03-03 06:40:49','2023-03-03 05:28:13','2023-03-03 05:28:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'845624',2,'wowa.stefanyuk.72@gmail.com','3b2fba8301f5778341e65f5b722c3b2618a0eed0a263d80b884bbe4f78f46a7f1a531aa3fe3b0d0b679b239e989174eca738',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$3uT3V3iDwNlDvWwF7tvifeqB/1IvJe67gSa3CIpWI0wd.agXQZ8Bm',0,0,0,0,'2023-04-25 07:41:03','2023-04-25 07:17:23','2023-04-25 07:18:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'846011',2,'esinromanswift@gmail.com','3314203bff44fc54cf52b8c378231e7a1c49ae61bb3aafe56a654ea920ad31b806ecb7c9d7c5f0ad01324010caf35ffc119d',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$aLsb4x0IwKydE68FKjOabebEbo2N7/xqTvcDdjDA7n44ItCmFjduW',0,0,0,0,'2023-04-25 13:41:46','2023-04-25 13:39:33','2023-04-25 13:39:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'700796',2,'robase7136@soombo.com','a00657810675cd293bc7a7d75fe68d0e3d93d18a060c1a59c4a72edd1a3e453696fb6044ad2018a77b847bd856625ccb521e',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$OmfifUXwyWvxUwWzruYNv.v5TcK2Pv9XPRfin7xFhRG68gmeYnkxS',0,0,0,0,'2023-04-25 15:27:17','2023-04-25 15:23:07','2023-04-25 15:23:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'980703',2,'rublev.v1@yandex.ru','45f4402a875bd0b74ada6e1cbbed4f16246113fbf40e63fca6faa740a79241ccb285a77c7e86981d3ef552e278cb158022c9',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$hinV.q7XmbSmEYJfwygsxeXOPxcoVShyrGjTc/Xpy9caO1T5o16ze',0,0,0,0,'2023-05-10 13:05:21','2023-05-10 12:57:27','2023-05-10 12:57:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'320226',2,'armen.886@yandex.ru',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$Eg5WVSB5UlLnpj78642i4uwK2tNZ9Vc.V1X7FAI6ZGCEKGWtrytBi',0,0,0,0,NULL,'2023-05-14 09:34:44',NULL,'2e7d5c3a-1243-40d1-a177-1f0b94d57b88','2023-05-14 10:35:24','caa54aaa-1d70-4ac5-9bdd-e7cac8724175',NULL,NULL,NULL,NULL),(44,'493407',2,'mswero@mail.ru',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$pPjFSuO9aRSKa702Bj8/mepXditsKauSBAYIDteK7iSeRkA5BFMRm',0,0,0,0,NULL,'2023-05-14 12:36:41',NULL,'a5ddc033-b5d8-48b4-8363-e1f7792e79a2',NULL,NULL,NULL,NULL,NULL,NULL),(45,'509219',2,'test.grenavi@gmail.com','e764712f1aea640afcdd7dccaa2b29d5e47f01f1d04a0fb805df37191eb675f94d8a2e9c67e98421c2415b868e578aa6c836',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$2sTs.wl3/0cVnkcrWv2FO..7RAD6QZsamDqEez0Ke2sBJIrZhOyjy',0,0,0,0,'2023-05-15 09:00:25','2023-05-14 21:35:06','2023-05-14 21:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'401530',2,'lavrickov.dmitry@yandex.ru','f85c959cd599146e545e753bc8c146550d11ea708866adf16ff7afc461c54e611511385660643e3bfd11cd2166e2b4eeb271',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$k36F87OoFWNhk1k4yyuaA.ExvjeuOjr5fZZCT12q28w/YNtQx/Tqu',0,0,0,0,'2023-05-14 22:22:17','2023-05-14 22:21:10','2023-05-14 22:21:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'359337',2,'marsh1mallow@yandex.ru','ec33b2ce60b2e2ca4f68f710e55a990863f7977e21a3d09d8126c82d6e913c9fdc9b4b8edbdbc4ab93ac9a2a03617bb47cff',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$GGlRM3KzKGQCuF3JjDtHvOyV671TDUU9lH2FeQGTvW9xtFbbTL0ve',0,0,0,0,'2023-07-20 23:45:00','2023-07-20 23:42:52','2023-07-20 23:43:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'260877',2,'artivus2@mail.ru',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$8Ds45ZAmIY0Y4PoHeAfLmOvc4BRwm7yDxLun7hbcbNWCU49AaLLzC',0,0,0,0,NULL,'2023-08-01 08:07:13',NULL,'c1f07f22-b1d2-402e-aa51-e98ef8781e54',NULL,NULL,NULL,NULL,NULL,NULL),(49,'985251',2,'artivus2@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$UTpuoyNu3m.uoExwrVycZ.R9xE8iAYj/n4LzuGZj2sYUkUpWmIMp.',0,0,0,0,NULL,'2023-08-01 08:35:06',NULL,'b8921fd8-99d7-4b05-a402-536e5e794aa6',NULL,NULL,NULL,NULL,NULL,NULL),(51,'576380',2,'artivus6-test@yandex.ru','3904de16841b0d4b23a777b8890a917c368365c80847661d0ba6998ca62fa33605af420c6cb730cfbe77db9ef04eecfbc769',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$fPzhXF1s3deCOy.SuUPx4ORS/s8k7KrrUXHkd8iXcTKKOKqTZUMDK',0,0,0,0,'2023-08-07 08:17:44','2023-08-03 09:39:47','2023-08-03 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'591728',2,'artivus3@mail.ru',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$6Y1ocnq/kOjp3KvhpD/18uDyXUquSUVavLeHK8kbbDin0Tb9kgoaq',0,0,0,0,NULL,'2023-08-07 08:18:32',NULL,'a7fa8478-bfd8-4a9c-9fe7-8c6721cfc9b2',NULL,NULL,NULL,NULL,NULL,NULL),(54,'944066',2,'artivus3@yandex.ru','i2FCsKLakPaGkbnOmtQZftWDkbBAJ8Py',1,NULL,NULL,NULL,NULL,NULL,'$2y$10$VAr6/0s5TbmeZW8CeZ9Zq.2lfGwoz/Dqr3PU.phuoUdgKuEmA58xu',0,0,0,0,'2023-09-10 12:15:03','2023-08-07 13:54:33','2023-08-07 13:55:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'645688',2,'vladimir07aniskin@yandex.ru','28ee81e9ecff45ed73140df6c649c6ea6d11b854abb731b0cc5eed788744de7e81a6d971abde4287a9160d936db2db8e74cb',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$Bk9hsN0QcG.IkBj4Re/x8u5poSgU2PPjpGVWUZcgJQGmW88ydrJaC',0,0,0,0,'2023-12-01 08:37:02','2023-10-10 11:27:36','2023-10-10 11:31:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'610249',2,'bmw06727@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$dl5hMpJypLKjytADrFENDOGS6RXDPVYDZDcuKpXbryLex2/wqLOme',0,0,0,0,NULL,'2023-10-24 11:29:12',NULL,'adecb613-fd36-4e9e-b077-f2f99241919d',NULL,NULL,NULL,NULL,NULL,NULL),(57,'183079',2,'mad.zhumagulov2016@yandex.kz','2450f282657bd1d1975d9a5bf08fc56bc23c39c23c8ae7728e600e6065ceab06c8ab92c1424047e694c121a3cb5cb6f03464',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$722p8GHJZz86qvxX.IatAO.RpKAcyo16jYwH8QIbxDTTHTgWD7xsS',0,0,0,0,'2023-10-24 11:54:37','2023-10-24 11:48:18','2023-10-24 11:49:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'449037',2,'egnggnne@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$ztlVrqIBVLiSLUbPrc2HJOGQhTRS0JNQV3SZnNXMzlGxtjeNWRjti',0,0,0,0,NULL,'2023-10-24 14:13:46',NULL,'645749f6-aede-409e-b4b8-59c89ad6017b',NULL,NULL,NULL,NULL,NULL,NULL),(59,'971814',2,'egnnggne@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$Lz3Ybp8ro50x4j/mPd0MfeCqP9EDMFnk2u6ckG.y.3t9OZ4iPeRW6',0,0,0,0,NULL,'2023-10-24 14:15:26',NULL,'15f199d2-b050-4203-b39d-7c9e13aeeb4e',NULL,NULL,NULL,NULL,NULL,NULL),(60,'604767',2,'sxxs@list.ru','53c72238025914b6a1507f903679fa0963026d30b4cbcf0b69e92cc1bea5dc9f18c5c90ff1d76d8bf4ae453a944708800fc6',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$FMhfFdRmHL8AZEUKEjee5Oejpo773auwwxILYXbIBfGOulRlSwhGO',0,0,0,0,'2023-12-02 09:30:43','2023-10-24 14:24:31','2023-10-24 14:25:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'336779',2,'stekxem@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$V8PIto3bgQekgq9pGAp/seLhLwJwxXlf4N7L6R4lgYh2j0NieZSSS',0,0,0,0,NULL,'2023-10-25 04:08:52',NULL,'a93ddcc0-a4c0-4d04-9894-079e041fd9e2',NULL,NULL,NULL,NULL,NULL,NULL),(62,'802999',2,'alekseismirodov@mail.ru','8a5419b0d6767e39f546868b6ef5a61d5397c3e9e1b777fd4db27bb42095838b0952140960e99d8d776db25d857e67a8615c',1,NULL,'Алексей','Смородов','Россия','Ломоносов.Ораниенбаумский пр. д.21 кв 52.','$2y$10$WmCNUCKjz.O4f2XSAUhj7uFHt0A6KQNe/vLtE6t1UE0lqY4yPxhL6',0,0,0,0,'2023-10-29 19:00:41','2023-10-26 17:30:30','2023-10-26 18:23:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'754289',2,'oksanadud@outlook.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$c1ev0nctw/DDl2kEZWZ7NeAjMTUsqkLOcbG7N6aJo7hRQ4QaC1npe',0,0,0,0,NULL,'2023-10-27 15:19:34',NULL,'aee94923-b44f-4c0a-bdb5-0f3e8975b74e',NULL,NULL,NULL,NULL,NULL,NULL),(64,'795936',2,'kseniyanovik77@rambler.ru','bfbdacb2af9d66d2c9add067a5d458897728dfa7a2245d298900f5ba1e0e7c31905d43aa5410ea74fc0fd6ed7fc921ea6a56',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$ggSAUnM.zCJydgH5jYuCV.cDPYuWLtKq7l2hnrqgJBIHDukNO.jkO',0,0,0,0,'2023-10-30 11:08:48','2023-10-30 10:59:27','2023-10-30 11:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'243286',2,'makcim.popov.2000@mail.ru','dff475f3b7d4fd2a6992f256fc4ca1f7bdd2e77d66886c77701be963fe8c4865310c31a07184ed23af19593ee88df059594a',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$2euzpGNfr6Z/33lI2yIMmeZVpivynRQO7NkaoW.s4U/PlJoLVTNpe',0,0,0,0,'2023-11-09 17:15:49','2023-11-09 14:59:41','2023-11-09 15:00:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'347931',2,'etoleshov@yandex.kz','a525657afdd2c34d529211f4f4f19558bf49dce4ac0f68030b0befd5913a674d07c601f172e2448d81945e6aefad93fe18a2',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$eAk9HXjOiG48zCBDj.mQbeGB1ta3SKYUmCu24q4H8dVI4kRVBd6Gu',0,0,0,0,'2023-11-10 19:38:25','2023-11-10 19:35:53','2023-11-10 19:36:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'544031',2,'acecevickin0@gmail.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$13Bukt9I83jACefzWlVS/eT226yEvMAjaL/0zMdM3Dm91hk/fcdbq',0,0,0,0,NULL,'2023-11-22 14:42:00',NULL,'39705db5-7046-4db5-8a13-3ffb2ec31adf',NULL,NULL,NULL,NULL,NULL,NULL),(68,'624498',2,'davidemaas@inbox.lv','dbe6f2b29661afbbcd8e563b48cc5237f3506b99b08f0ff82f70f484d1b650a2dd92378efbd63b24b2c6bc3fa0d9572612fa',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$KdTiPcTDPFDIYUdryI3pF.YsfpjHpdiVITGW17dIxF4WPnogqRCAO',0,0,0,0,'2023-11-30 11:32:52','2023-11-30 10:51:26','2023-11-30 10:51:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'100957',2,'nytuky@yogrow.co',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$cOf.H.IujA94Wj3Wt15rJed39x7fEs25xpYJdi.yeDvfuUSGH9kZq',0,0,0,0,NULL,'2023-12-05 11:55:30',NULL,'9c297e2b-41a8-4c72-98e8-b312e1be76bb',NULL,NULL,NULL,NULL,NULL,NULL),(70,'461801',2,'pidakin464@getmola.com',NULL,0,NULL,NULL,NULL,NULL,NULL,'$2y$10$r.XPftsW7AR44yilV.v8bulmxNVz5yIXXVZ1b0NzSyyPBms0MYXM.',0,0,0,0,NULL,'2023-12-05 12:03:44',NULL,'56dbd71f-9fb8-48a8-a741-000a93a6bd12',NULL,NULL,NULL,NULL,NULL,NULL),(71,'746144',2,'ss88ddsysoev@yandex.ru','6c6fd600dbb7e69e013ab0289208837a232fa4f6d1511e56271eb9757236d0c488ffbb6fcea79ee2c5fc8d408d3492c113fc',0,NULL,NULL,NULL,NULL,NULL,'$2y$10$CAsShQtUzqhzU8ZMgcIQOui2zgcKAisiLP.Uy2Ehbqlh0HdZidIbu',0,0,0,0,'2023-12-10 15:23:11','2023-12-10 15:18:35','2023-12-10 15:19:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `dollars` decimal(15,2) NOT NULL DEFAULT 0.00,
  `virtual_dollars` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,1,0.00,10006.20),(2,2,0.00,10000.00),(3,3,0.00,10000.00),(4,4,0.00,10000.00),(5,5,0.00,10000.00),(6,6,0.00,10000.00),(7,7,0.00,10000.00),(8,8,0.00,10000.00),(9,9,0.00,10000.00),(10,10,0.00,10000.00),(11,11,0.00,10000.00),(12,12,0.00,10000.00),(13,13,0.00,10000.00),(14,14,0.00,10000.00),(15,15,0.00,10337.80),(16,16,0.00,10004.80),(17,17,0.00,9995.00),(18,18,0.00,10000.00),(19,19,0.00,10000.00),(20,20,0.00,9962.00),(21,21,0.00,10000.00),(22,22,0.00,9084.00),(23,23,0.00,10000.00),(24,24,0.00,10000.00),(25,25,0.00,11200.00),(26,26,0.00,10000.00),(27,27,0.00,10000.00),(28,28,0.00,10000.00),(29,29,0.00,10000.00),(30,30,0.00,10000.00),(31,31,0.00,20018.00),(32,32,0.00,10000.00),(33,33,0.00,10000.00),(34,34,0.00,10000.00),(35,35,0.00,10000.00),(36,36,0.00,10000.00),(37,37,0.00,10000.00),(38,38,0.00,10000.00),(39,39,0.00,10000.00),(40,40,0.00,10000.00),(41,41,0.00,10000.00),(42,42,0.00,10000.00),(43,43,0.00,10000.00),(44,44,0.00,10000.00),(45,45,0.00,10000.00),(46,46,0.00,10000.00),(47,47,0.00,10000.00),(48,48,0.00,10000.00),(49,49,0.00,10000.00),(50,50,0.00,9999.00),(51,51,0.00,9999.00),(52,52,0.00,10000.00),(53,53,0.00,9999.00),(54,54,0.00,10000.00),(55,55,0.00,9997.00),(56,56,0.00,10000.00),(57,57,0.00,9999.00),(58,58,0.00,10000.00),(59,59,0.00,10000.00),(60,60,0.00,10000.00),(61,61,0.00,10000.00),(62,62,0.00,4996.00),(63,63,0.00,10000.00),(64,64,0.00,10000.00),(65,65,0.00,9995.00),(66,66,0.00,10000.00),(67,67,0.00,10000.00),(68,68,0.00,10000.00),(69,69,0.00,10000.00),(70,70,0.00,10000.00),(71,71,0.00,10000.00);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-19 10:35:01
