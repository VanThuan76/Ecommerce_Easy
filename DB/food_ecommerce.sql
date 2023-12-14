-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: food_ecommerce
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'Dashboard','fa-bar-chart','/',NULL,NULL,NULL),(2,0,6,'Admin','fa-tasks','',NULL,NULL,'2023-11-20 02:55:58'),(3,2,7,'Users','fa-users','auth/users',NULL,NULL,'2023-11-20 02:55:58'),(4,2,8,'Roles','fa-user','auth/roles',NULL,NULL,'2023-11-20 02:55:58'),(5,2,9,'Permission','fa-ban','auth/permissions',NULL,NULL,'2023-11-20 02:55:58'),(6,2,10,'Menu','fa-bars','auth/menu',NULL,NULL,'2023-11-20 02:55:58'),(7,2,11,'Operation log','fa-history','auth/logs',NULL,NULL,'2023-11-20 02:55:58'),(8,0,2,'Quản lý sản phẩm','fa-shopping-cart','/manage-product',NULL,'2023-11-20 02:19:44','2023-11-20 02:55:58'),(9,0,3,'Nhóm sản phẩm','fa-align-center','/group-product',NULL,'2023-11-20 02:25:04','2023-11-20 02:55:58'),(10,0,4,'Quản lý khuyến mại','fa-tags','/manage-promotion',NULL,'2023-11-20 02:40:33','2023-11-20 02:55:58'),(11,0,5,'Quản lý đơn hàng','fa-money','/manage-order',NULL,'2023-11-20 02:55:31','2023-11-20 02:55:58');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_operation_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin','GET','127.0.0.1','[]','2023-11-20 01:41:18','2023-11-20 01:41:18'),(2,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 01:41:25','2023-11-20 01:41:25'),(3,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:17:12','2023-11-20 02:17:12'),(4,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:18:44','2023-11-20 02:18:44'),(5,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Qu\\u1ea3n l\\u00fd s\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-shopping-cart\",\"uri\":\"\\/manage-product\",\"roles\":[null],\"permission\":null,\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:19:44','2023-11-20 02:19:44'),(6,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:19:44','2023-11-20 02:19:44'),(7,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:21:27','2023-11-20 02:21:27'),(8,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:21:35','2023-11-20 02:21:35'),(9,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:21:36','2023-11-20 02:21:36'),(10,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 02:21:45','2023-11-20 02:21:45'),(11,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 02:21:58','2023-11-20 02:21:58'),(12,1,'admin/manage-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:22:04','2023-11-20 02:22:04'),(13,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:24:40','2023-11-20 02:24:40'),(14,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Nh\\u00f3m s\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-align-center\",\"uri\":\"\\/product-group\",\"roles\":[null],\"permission\":null,\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:25:04','2023-11-20 02:25:04'),(15,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:25:04','2023-11-20 02:25:04'),(16,1,'admin/auth/menu/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:25:12','2023-11-20 02:25:12'),(17,1,'admin/auth/menu/9','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Nh\\u00f3m s\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-align-center\",\"uri\":\"\\/group-product\",\"roles\":[null],\"permission\":null,\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}','2023-11-20 02:25:21','2023-11-20 02:25:21'),(18,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:25:21','2023-11-20 02:25:21'),(19,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:25:41','2023-11-20 02:25:41'),(20,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:25:43','2023-11-20 02:25:43'),(21,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:25:44','2023-11-20 02:25:44'),(22,1,'admin/group-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:25:45','2023-11-20 02:25:45'),(23,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 02:25:58','2023-11-20 02:25:58'),(24,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"\\u0110\\u1ed3 u\\u1ed1ng\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:26:03','2023-11-20 02:26:03'),(25,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 02:26:04','2023-11-20 02:26:04'),(26,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 02:26:05','2023-11-20 02:26:05'),(27,1,'admin/group-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:26:06','2023-11-20 02:26:06'),(28,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"Th\\u1ee9c \\u0103n chay\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/group-product\"}','2023-11-20 02:26:12','2023-11-20 02:26:12'),(29,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 02:26:12','2023-11-20 02:26:12'),(30,1,'admin/group-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:26:14','2023-11-20 02:26:14'),(31,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n x\\u00e0o\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/group-product\"}','2023-11-20 02:26:24','2023-11-20 02:26:24'),(32,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 02:26:24','2023-11-20 02:26:24'),(33,1,'admin/group-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:26:25','2023-11-20 02:26:25'),(34,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n chi\\u00ean\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/group-product\"}','2023-11-20 02:26:34','2023-11-20 02:26:34'),(35,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 02:26:34','2023-11-20 02:26:34'),(36,1,'admin/group-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:26:41','2023-11-20 02:26:41'),(37,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"\\u0110\\u1ed3 \\u0103n nhanh\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/group-product\"}','2023-11-20 02:26:45','2023-11-20 02:26:45'),(38,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 02:26:46','2023-11-20 02:26:46'),(39,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:27:53','2023-11-20 02:27:53'),(40,1,'admin/manage-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:27:54','2023-11-20 02:27:54'),(41,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:28:19','2023-11-20 02:28:19'),(42,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:28:28','2023-11-20 02:28:28'),(43,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:28:31','2023-11-20 02:28:31'),(44,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:28:44','2023-11-20 02:28:44'),(45,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:28:49','2023-11-20 02:28:49'),(46,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:29:02','2023-11-20 02:29:02'),(47,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:29:15','2023-11-20 02:29:15'),(48,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:29:39','2023-11-20 02:29:39'),(49,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:31:24','2023-11-20 02:31:24'),(50,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:32:31','2023-11-20 02:32:31'),(51,1,'admin/manage-product','POST','127.0.0.1','{\"product_group_id\":\"1\",\"title\":\"Caffee S\\u1eefa\",\"description\":\"Ngon\",\"price\":\"25000\",\"quantity\":\"50\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:33:04','2023-11-20 02:33:04'),(52,1,'admin/manage-product/create','GET','127.0.0.1','[]','2023-11-20 02:33:05','2023-11-20 02:33:05'),(53,1,'admin/manage-product','POST','127.0.0.1','{\"product_group_id\":\"1\",\"title\":\"Caffee S\\u1eefa\",\"description\":\"Ngon\",\"price\":\"25000\",\"quantity\":\"50\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:33:38','2023-11-20 02:33:38'),(54,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 02:33:38','2023-11-20 02:33:38'),(55,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 02:33:41','2023-11-20 02:33:41'),(56,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 02:33:54','2023-11-20 02:33:54'),(57,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:34:10','2023-11-20 02:34:10'),(58,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:34:11','2023-11-20 02:34:11'),(59,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:34:12','2023-11-20 02:34:12'),(60,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:37:50','2023-11-20 02:37:50'),(61,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Qu\\u1ea3n l\\u00fd khuy\\u1ebfn m\\u1ea1i\",\"icon\":\"fa-tags\",\"uri\":\"\\/mana\",\"roles\":[null],\"permission\":null,\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:40:33','2023-11-20 02:40:33'),(62,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:40:33','2023-11-20 02:40:33'),(63,1,'admin/auth/menu/10/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:40:35','2023-11-20 02:40:35'),(64,1,'admin/auth/menu/10','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Qu\\u1ea3n l\\u00fd khuy\\u1ebfn m\\u1ea1i\",\"icon\":\"fa-tags\",\"uri\":\"\\/manage-promotion\",\"roles\":[null],\"permission\":null,\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}','2023-11-20 02:40:47','2023-11-20 02:40:47'),(65,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:40:47','2023-11-20 02:40:47'),(66,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:40:49','2023-11-20 02:40:49'),(67,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:40:59','2023-11-20 02:40:59'),(68,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:41:01','2023-11-20 02:41:01'),(69,1,'admin/manage-promotion/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:43:28','2023-11-20 02:43:28'),(70,1,'admin/manage-promotion/create','GET','127.0.0.1','[]','2023-11-20 02:46:14','2023-11-20 02:46:14'),(71,1,'admin/manage-promotion','POST','127.0.0.1','{\"product_id\":\"1\",\"title\":\"Khuy\\u1ebfn m\\u1ea1i 20\\/11\",\"discount\":\"10\",\"from_at\":\"2023-11-20\",\"to_at\":\"2023-11-26\",\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:46:39','2023-11-20 02:46:39'),(72,1,'admin/manage-promotion','GET','127.0.0.1','[]','2023-11-20 02:46:39','2023-11-20 02:46:39'),(73,1,'admin/manage-promotion','GET','127.0.0.1','[]','2023-11-20 02:46:40','2023-11-20 02:46:40'),(74,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:46:45','2023-11-20 02:46:45'),(75,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:46:46','2023-11-20 02:46:46'),(76,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:46:47','2023-11-20 02:46:47'),(77,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:54:38','2023-11-20 02:54:38'),(78,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Qu\\u1ea3n l\\u00fd \\u0111\\u01a1n h\\u00e0ng\",\"icon\":\"fa-money\",\"uri\":\"\\/order\",\"roles\":[null],\"permission\":null,\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\"}','2023-11-20 02:55:31','2023-11-20 02:55:31'),(79,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:55:31','2023-11-20 02:55:31'),(80,1,'admin/auth/menu/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:55:49','2023-11-20 02:55:49'),(81,1,'admin/auth/menu/11','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Qu\\u1ea3n l\\u00fd \\u0111\\u01a1n h\\u00e0ng\",\"icon\":\"fa-money\",\"uri\":\"\\/manage-order\",\"roles\":[null],\"permission\":null,\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}','2023-11-20 02:55:53','2023-11-20 02:55:53'),(82,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:55:53','2023-11-20 02:55:53'),(83,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:55:54','2023-11-20 02:55:54'),(84,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"meYTlBeaYgOZ6ZgAf2bWBjlhQtUkqdThEcnVPfHZ\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2023-11-20 02:55:58','2023-11-20 02:55:58'),(85,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:55:58','2023-11-20 02:55:58'),(86,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:56:00','2023-11-20 02:56:00'),(87,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:56:02','2023-11-20 02:56:02'),(88,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:56:02','2023-11-20 02:56:02'),(89,1,'admin/auth/menu','GET','127.0.0.1','[]','2023-11-20 02:57:20','2023-11-20 02:57:20'),(90,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 02:57:23','2023-11-20 02:57:23'),(91,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-20 02:58:09','2023-11-20 02:58:09'),(92,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-20 03:02:39','2023-11-20 03:02:39'),(93,1,'admin/manage-order/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 03:02:41','2023-11-20 03:02:41'),(94,1,'admin/manage-order/create','GET','127.0.0.1','[]','2023-11-20 03:03:42','2023-11-20 03:03:42'),(95,1,'admin/manage-order/create','GET','127.0.0.1','[]','2023-11-20 03:04:34','2023-11-20 03:04:34'),(96,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 03:04:38','2023-11-20 03:04:38'),(97,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 03:04:38','2023-11-20 03:04:38'),(98,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 03:04:39','2023-11-20 03:04:39'),(99,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 03:04:40','2023-11-20 03:04:40'),(100,1,'admin','GET','127.0.0.1','[]','2023-11-20 10:50:48','2023-11-20 10:50:48'),(101,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 10:50:52','2023-11-20 10:50:52'),(102,1,'admin/manage-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 10:50:54','2023-11-20 10:50:54'),(103,1,'admin/manage-product','POST','127.0.0.1','{\"product_group_id\":\"2\",\"title\":\"C\\u01a1m \\u0111\\u1eadu\",\"description\":\"C\\u01a1m \\u0111\\u1eadu ph\\u1ee5 r\\u1ea5t ngon\",\"price\":\"5000\",\"quantity\":\"200\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/manage-product\"}','2023-11-20 10:51:33','2023-11-20 10:51:33'),(104,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 10:51:33','2023-11-20 10:51:33'),(105,1,'admin/manage-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 11:17:47','2023-11-20 11:17:47'),(106,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 11:18:02','2023-11-20 11:18:02'),(107,1,'admin/group-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 11:18:03','2023-11-20 11:18:03'),(108,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n n\\u01b0\\u1edbc\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/group-product\"}','2023-11-20 11:18:14','2023-11-20 11:18:14'),(109,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 11:18:14','2023-11-20 11:18:14'),(110,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 11:18:16','2023-11-20 11:18:16'),(111,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n n\\u01b0\\u1edbc\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\"}','2023-11-20 11:18:21','2023-11-20 11:18:21'),(112,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 11:18:21','2023-11-20 11:18:21'),(113,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 11:18:41','2023-11-20 11:18:41'),(114,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n n\\u01b0\\u1edbc\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\"}','2023-11-20 11:18:46','2023-11-20 11:18:46'),(115,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 11:18:46','2023-11-20 11:18:46'),(116,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n n\\u01b0\\u1edbc\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\"}','2023-11-20 11:18:48','2023-11-20 11:18:48'),(117,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 11:18:48','2023-11-20 11:18:48'),(118,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n n\\u01b0\\u1edbc\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\"}','2023-11-20 11:18:48','2023-11-20 11:18:48'),(119,1,'admin/group-product/create','GET','127.0.0.1','[]','2023-11-20 11:18:48','2023-11-20 11:18:48'),(120,1,'admin/group-product','POST','127.0.0.1','{\"title\":\"M\\u00f3n n\\u01b0\\u1edbc\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\"}','2023-11-20 11:18:49','2023-11-20 11:18:49'),(121,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 11:18:49','2023-11-20 11:18:49'),(122,1,'admin/group-product','GET','127.0.0.1','[]','2023-11-20 11:18:50','2023-11-20 11:18:50'),(123,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 11:19:00','2023-11-20 11:19:00'),(124,1,'admin/manage-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-20 11:19:01','2023-11-20 11:19:01'),(125,1,'admin/manage-product','POST','127.0.0.1','{\"product_group_id\":\"6\",\"title\":\"Ph\\u1edf\",\"description\":\"Ch\\u1ec9 c\\u1ea7n ng\\u1eedi m\\u00f9i th\\u01a1m c\\u1ee7a n\\u01b0\\u1edbc d\\u00f9ng c\\u0169ng \\u0111\\u1ee7 \\u0111\\u1ec3 c\\u1ea3m th\\u1ea5y ng\\u1ea5t ng\\u00e2y. C\\u00e1c h\\u01b0\\u01a1ng v\\u1ecb c\\u1ee7a th\\u1ecbt, x\\u01b0\\u01a1ng, rau th\\u01a1m quy\\u1ec7n v\\u00e0o nhau t\\u1ea1o n\\u00ean m\\u00f9i th\\u01a1m \\u0111\\u1eb7c bi\\u1ec7t \\u0111i v\\u00e0o l\\u00f2ng ng\\u01b0\\u1eddi. Th\\u1ecbt th\\u00ec m\\u1ec1m, b\\u00e1nh th\\u00ec d\\u1ebbo, th\\u1ec9nh tho\\u1ea3ng l\\u1ea1i th\\u1ea5y c\\u00e1i cay d\\u1ecbu c\\u1ee7a g\\u1eebng, c\\u00e1i cay n\\u1ed3ng c\\u1ee7a \\u1edbt, c\\u00e1i th\\u01a1m nh\\u00e8 nh\\u1eb9 c\\u1ee7a rau th\\u01a1m, v\\u00e0 m\\u00f9i th\\u01a1m n\\u1ed3ng c\\u1ee7a h\\u00e0nh l\\u00e1. T\\u1ea5t c\\u1ea3 h\\u00f2a quy\\u1ec7n m\\u1ed9t c\\u1ea3nh ng\\u1ecdt ng\\u00e0o, t\\u1ea1o n\\u00ean v\\u1ecb th\\u01a1m ngon \\u0111\\u1eb7c tr\\u01b0ng c\\u1ee7a m\\u00f3n ph\\u1edf.\",\"price\":\"50000\",\"quantity\":\"100\",\"_token\":\"p5yEhNaNfeIcMEfOHGdPtpyN4OrOn0H8nelCyikF\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/manage-product\"}','2023-11-20 11:19:39','2023-11-20 11:19:39'),(126,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 11:19:39','2023-11-20 11:19:39'),(127,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-20 11:19:41','2023-11-20 11:19:41'),(128,1,'admin','GET','127.0.0.1','[]','2023-11-25 06:17:17','2023-11-25 06:17:17'),(129,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 06:17:22','2023-11-25 06:17:22'),(130,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:35:07','2023-11-25 07:35:07'),(131,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:35:09','2023-11-25 07:35:09'),(132,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:35:10','2023-11-25 07:35:10'),(133,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:35:12','2023-11-25 07:35:12'),(134,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:35:13','2023-11-25 07:35:13'),(135,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:35:17','2023-11-25 07:35:17'),(136,1,'admin/manage-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:35:19','2023-11-25 07:35:19'),(137,1,'admin/manage-product','POST','127.0.0.1','{\"product_group_id\":\"3\",\"title\":\"M\\u1ef3 x\\u00e0o\",\"description\":\"R\\u1ea5t ngon\",\"price\":\"25000\",\"quantity\":\"10\",\"_token\":\"4QGjYZYjmrdxCSESsEIFMy8YnKEB3MPPVBZq4Tr4\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/manage-product\"}','2023-11-25 07:35:57','2023-11-25 07:35:57'),(138,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-25 07:35:57','2023-11-25 07:35:57'),(139,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:36:16','2023-11-25 07:36:16'),(140,1,'admin/manage-promotion/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:36:17','2023-11-25 07:36:17'),(141,1,'admin/manage-promotion','POST','127.0.0.1','{\"product_id\":\"4\",\"title\":\"Black Friday M\\u1ef3\",\"discount\":\"5\",\"from_at\":\"2023-11-25\",\"to_at\":\"2023-11-28\",\"_token\":\"4QGjYZYjmrdxCSESsEIFMy8YnKEB3MPPVBZq4Tr4\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/manage-promotion\"}','2023-11-25 07:36:36','2023-11-25 07:36:36'),(142,1,'admin/manage-promotion','GET','127.0.0.1','[]','2023-11-25 07:36:36','2023-11-25 07:36:36'),(143,1,'admin/manage-promotion','GET','127.0.0.1','[]','2023-11-25 07:36:48','2023-11-25 07:36:48'),(144,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:37:44','2023-11-25 07:37:44'),(145,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:38:07','2023-11-25 07:38:07'),(146,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:39:04','2023-11-25 07:39:04'),(147,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:39:04','2023-11-25 07:39:04'),(148,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:50:03','2023-11-25 07:50:03'),(149,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-25 07:51:20','2023-11-25 07:51:20'),(150,1,'admin','GET','127.0.0.1','[]','2023-11-26 20:46:05','2023-11-26 20:46:05'),(151,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-26 20:46:08','2023-11-26 20:46:08'),(152,1,'admin/manage-product/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-26 20:46:16','2023-11-26 20:46:16'),(153,1,'admin/manage-product/1','PUT','127.0.0.1','{\"product_group_id\":\"1\",\"title\":\"Caffee S\\u1eefa\",\"description\":\"Ngon\",\"price\":\"25000\",\"quantity\":\"50\",\"_token\":\"VQdIF2UNNnjQd51xpnO3C10pEKXlpgEsAru8myay\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/manage-product\"}','2023-11-26 20:46:23','2023-11-26 20:46:23'),(154,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-26 20:46:23','2023-11-26 20:46:23'),(155,1,'admin/manage-product','GET','127.0.0.1','[]','2023-11-26 20:50:47','2023-11-26 20:50:47'),(156,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-26 21:20:34','2023-11-26 21:20:34'),(157,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-26 21:22:31','2023-11-26 21:22:31'),(158,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-26 21:23:11','2023-11-26 21:23:11'),(159,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-26 21:23:19','2023-11-26 21:23:19'),(160,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-26 21:23:31','2023-11-26 21:23:31'),(161,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-26 22:32:51','2023-11-26 22:32:51'),(162,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-26 22:43:20','2023-11-26 22:43:20'),(163,1,'admin/manage-order','GET','127.0.0.1','[]','2023-11-26 22:43:42','2023-11-26 22:43:42'),(164,1,'admin','GET','127.0.0.1','[]','2023-11-27 08:24:11','2023-11-27 08:24:11'),(165,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-27 08:24:14','2023-11-27 08:24:14'),(166,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-27 08:25:42','2023-11-27 08:25:42'),(167,1,'admin/manage-promotion/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-27 08:25:43','2023-11-27 08:25:43'),(168,1,'admin/manage-promotion','POST','127.0.0.1','{\"product_id\":\"3\",\"title\":\"Giam gia demo\",\"discount\":\"50\",\"from_at\":\"2023-11-28\",\"to_at\":\"2023-11-29\",\"_token\":\"PSKGmC7pquzq0bxy5XKb1Z3LObUNdtNmO3sGAq65\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/manage-promotion\"}','2023-11-27 08:25:55','2023-11-27 08:25:55'),(169,1,'admin/manage-promotion','GET','127.0.0.1','[]','2023-11-27 08:25:55','2023-11-27 08:25:55'),(170,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-11-27 08:26:34','2023-11-27 08:26:34'),(171,1,'admin','GET','127.0.0.1','[]','2023-12-07 05:43:04','2023-12-07 05:43:04'),(172,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 05:43:08','2023-12-07 05:43:08'),(173,1,'admin/manage-order/8,9,10','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"pWLbC8iXvO1OIhrA3hUPZNyQK7PQiCTZ1Dq3quoN\"}','2023-12-07 05:43:22','2023-12-07 05:43:22'),(174,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 05:43:22','2023-12-07 05:43:22'),(175,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 05:49:00','2023-12-07 05:49:00'),(176,1,'admin/manage-order/11','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"pWLbC8iXvO1OIhrA3hUPZNyQK7PQiCTZ1Dq3quoN\"}','2023-12-07 05:49:06','2023-12-07 05:49:06'),(177,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 05:49:06','2023-12-07 05:49:06'),(178,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 05:52:15','2023-12-07 05:52:15'),(179,1,'admin/manage-order/12','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"pWLbC8iXvO1OIhrA3hUPZNyQK7PQiCTZ1Dq3quoN\"}','2023-12-07 05:52:21','2023-12-07 05:52:21'),(180,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 05:52:21','2023-12-07 05:52:21'),(181,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 05:53:43','2023-12-07 05:53:43'),(182,1,'admin/manage-order/13','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"pWLbC8iXvO1OIhrA3hUPZNyQK7PQiCTZ1Dq3quoN\"}','2023-12-07 05:53:47','2023-12-07 05:53:47'),(183,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 05:53:47','2023-12-07 05:53:47'),(184,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 05:54:26','2023-12-07 05:54:26'),(185,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 05:56:04','2023-12-07 05:56:04'),(186,1,'admin/manage-order/14,15','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"pWLbC8iXvO1OIhrA3hUPZNyQK7PQiCTZ1Dq3quoN\"}','2023-12-07 05:56:13','2023-12-07 05:56:13'),(187,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 05:56:13','2023-12-07 05:56:13'),(188,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 05:57:42','2023-12-07 05:57:42'),(189,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 06:01:18','2023-12-07 06:01:18'),(190,1,'admin/manage-order/17','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"pWLbC8iXvO1OIhrA3hUPZNyQK7PQiCTZ1Dq3quoN\"}','2023-12-07 06:01:25','2023-12-07 06:01:25'),(191,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:01:25','2023-12-07 06:01:25'),(192,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 06:01:45','2023-12-07 06:01:45'),(193,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-07 06:02:24','2023-12-07 06:02:24'),(194,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:02:47','2023-12-07 06:02:47'),(195,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:02:54','2023-12-07 06:02:54'),(196,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:02:56','2023-12-07 06:02:56'),(197,1,'admin/manage-promotion','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:02:57','2023-12-07 06:02:57'),(198,1,'admin/group-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:10:08','2023-12-07 06:10:08'),(199,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:10:09','2023-12-07 06:10:09'),(200,1,'admin/manage-product/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-07 06:10:13','2023-12-07 06:10:13'),(201,1,'admin','GET','127.0.0.1','[]','2023-12-12 08:08:23','2023-12-12 08:08:23'),(202,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-12 08:08:29','2023-12-12 08:08:29'),(203,1,'admin/manage-product','GET','127.0.0.1','[]','2023-12-12 08:10:15','2023-12-12 08:10:15'),(204,1,'admin','GET','127.0.0.1','[]','2023-12-13 18:57:03','2023-12-13 18:57:03'),(205,1,'admin/manage-product','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-13 18:58:27','2023-12-13 18:58:27'),(206,1,'admin/manage-product','GET','127.0.0.1','[]','2023-12-13 19:00:15','2023-12-13 19:00:15'),(207,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-13 19:38:04','2023-12-13 19:38:04'),(208,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-13 19:38:10','2023-12-13 19:38:10'),(209,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-13 19:43:25','2023-12-13 19:43:25'),(210,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-13 19:45:28','2023-12-13 19:45:28'),(211,1,'admin/manage-order/18/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-13 19:45:34','2023-12-13 19:45:34'),(212,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-13 19:45:40','2023-12-13 19:45:40'),(213,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-13 19:48:34','2023-12-13 19:48:34'),(214,1,'admin/manage-order/18/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-13 19:48:36','2023-12-13 19:48:36'),(215,1,'admin/manage-order','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-13 19:48:59','2023-12-13 19:48:59'),(216,1,'admin/manage-order','GET','127.0.0.1','[]','2023-12-13 19:49:00','2023-12-13 19:49:00'),(217,1,'admin/manage-order/18/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-12-13 19:49:02','2023-12-13 19:49:02');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2023-11-16 09:12:09','2023-11-16 09:12:09');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$jR3VBXl0cwspAj.MbPVomu8c64G8QGefeblUsY7ARH0rMWT.DjOYi','Administrator',NULL,'LOjA3nKGiGatcy8szNTxWLOvPxsV5cdysbZWPa9kSjHlQTmapDvm8mkwvpTF','2023-11-16 09:12:09','2023-11-16 09:12:09');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (27,1,1,4,90000,'2023-12-07 05:57:53','2023-12-07 05:57:53');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL DEFAULT '0',
  `id_nguoi_dung` int DEFAULT NULL,
  `noi_dung` varchar(1045) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_08_19_000000_create_failed_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `address` varchar(1045) DEFAULT NULL,
  `note` varchar(1045) DEFAULT NULL,
  `type` int DEFAULT '0',
  `status` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (6,1,'2023-11-26 17:00:00','Test','Test',1,0,'2023-11-27 01:43:06','2023-11-27 01:43:06'),(7,1,'2023-11-26 17:00:00','Hai phong','Demo123',1,0,'2023-11-27 08:25:09','2023-11-27 08:25:09'),(16,1,'2023-12-06 17:00:00','Test','Test',1,0,'2023-12-07 05:55:30','2023-12-07 05:55:30'),(18,1,'2023-12-06 17:00:00','Thanh toan khi nhan hang','Thanh toan khi nhan hang',2,1,'2023-12-07 06:01:42','2023-12-07 06:01:42');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_group_id` int DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `description` varchar(1045) DEFAULT NULL,
  `image` varchar(1045) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Caffee Sữa','Ngon','images/65c3512b5f2a026d620ffa967a1d6747.jpg',25000,50,'2023-11-20 02:33:38','2023-11-26 20:46:23'),(2,2,'Cơm đậu','Cơm đậu phụ rất ngon','images/16_46cc1141-54b5-4a67-aff2-4811dcd656d4_1000x1000.webp',5000,200,'2023-11-20 10:51:33','2023-11-20 10:51:33'),(3,6,'Phở','Chỉ cần ngửi mùi thơm của nước dùng cũng đủ để cảm thấy ngất ngây. Các hương vị của thịt, xương, rau thơm quyện vào nhau tạo nên mùi thơm đặc biệt đi vào lòng người. Thịt thì mềm, bánh thì dẻo, thỉnh thoảng lại thấy cái cay dịu của gừng, cái cay nồng của ớt, cái thơm nhè nhẹ của rau thơm, và mùi thơm nồng của hành lá. Tất cả hòa quyện một cảnh ngọt ngào, tạo nên vị thơm ngon đặc trưng của món phở.','images/12_90e0bfea-4701-4fd5-9e50-2f5bd3efaef6_1000x1000.webp',50000,100,'2023-11-20 11:19:39','2023-11-20 11:19:39'),(4,3,'Mỳ xào','Rất ngon','images/1asen.jpg',25000,10,'2023-11-25 07:35:57','2023-11-25 07:35:57');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_group`
--

DROP TABLE IF EXISTS `product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_group`
--

LOCK TABLES `product_group` WRITE;
/*!40000 ALTER TABLE `product_group` DISABLE KEYS */;
INSERT INTO `product_group` VALUES (1,'Đồ uống','2023-11-20 02:26:03','2023-11-20 02:26:03'),(2,'Thức ăn chay','2023-11-20 02:26:12','2023-11-20 02:26:12'),(3,'Món xào','2023-11-20 02:26:24','2023-11-20 02:26:24'),(4,'Món chiên','2023-11-20 02:26:34','2023-11-20 02:26:34'),(5,'Đồ ăn nhanh','2023-11-20 02:26:45','2023-11-20 02:26:45'),(6,'Món nước','2023-11-20 11:18:49','2023-11-20 11:18:49');
/*!40000 ALTER TABLE `product_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `from_at` timestamp NULL DEFAULT NULL,
  `to_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,1,'Khuyến mại 20/11',10,'2023-11-19 17:00:00','2023-11-25 17:00:00','2023-11-20 02:46:39','2023-11-20 02:46:39'),(2,4,'Black Friday Mỳ',5,'2023-11-24 17:00:00','2023-11-27 17:00:00','2023-11-25 07:36:36','2023-11-25 07:36:36'),(3,3,'Giam gia demo',50,'2023-11-27 17:00:00','2023-11-28 17:00:00','2023-11-27 08:25:55','2023-11-27 08:25:55');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (2,6,3755000,'2023-11-27 01:43:06','2023-11-27 01:43:06'),(3,7,200000,'2023-11-27 08:25:09','2023-11-27 08:25:09'),(4,8,0,'2023-12-07 05:42:20','2023-12-07 05:42:20'),(5,9,0,'2023-12-07 05:42:41','2023-12-07 05:42:41'),(6,10,0,'2023-12-07 05:42:48','2023-12-07 05:42:48'),(7,11,0,'2023-12-07 05:46:11','2023-12-07 05:46:11'),(8,12,0,'2023-12-07 05:49:20','2023-12-07 05:49:20'),(9,13,0,'2023-12-07 05:53:33','2023-12-07 05:53:33'),(10,14,135000,'2023-12-07 05:54:31','2023-12-07 05:54:31'),(11,15,135000,'2023-12-07 05:54:49','2023-12-07 05:54:49'),(12,16,157500,'2023-12-07 05:55:30','2023-12-07 05:55:30'),(13,17,90000,'2023-12-07 06:00:51','2023-12-07 06:00:51'),(14,18,90000,'2023-12-07 06:01:42','2023-12-07 06:01:42');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_detail`
--

DROP TABLE IF EXISTS `sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sales_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quanlity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_detail`
--

LOCK TABLES `sales_detail` WRITE;
/*!40000 ALTER TABLE `sales_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `gender` int DEFAULT '0',
  `birthday` timestamp NULL DEFAULT NULL,
  `address` varchar(1045) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(1045) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'VanThuan','thuanvuvan76@gmail.com',NULL,0,NULL,NULL,NULL,'$2y$10$PQEApq/bclWEqO1rz0ZVZ.j/noBBAhqwL8zW5gm2U1yLaT2yr4WAa','3ZOxC7Gzy9dMYCAPAybMNK42J1ix27lzrDQN3rSJn1gWrX5pBlfFnEZPf96k','2023-11-20 12:05:22','2023-11-20 12:05:22'),(2,'Ktra','ktra123@gmail.com',NULL,0,NULL,NULL,NULL,'$2y$10$LgOgi0No14I7M4UCrLCi3.2AdaRwBZiMe.fRx77IxJa2GknTOj5Py','JyibeFp00ASF1DwseGDSJHxsK0Bak6YmarhLq5tkF3FovQf4hzS560ArGNYE','2023-11-20 12:17:28','2023-11-20 12:17:28');
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

-- Dump completed on 2023-12-14  9:50:01
