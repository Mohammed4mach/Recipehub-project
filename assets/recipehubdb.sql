CREATE DATABASE  IF NOT EXISTS `recipehub` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipehub`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: recipehub
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int unsigned NOT NULL,
  `email` varchar(130) NOT NULL,
  `username` varchar(130) NOT NULL,
  `password` varchar(150) NOT NULL,
  `country` varchar(52) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` int unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `country` varchar(52) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comm_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `prod_id` int unsigned NOT NULL,
  `content` text,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comm_id`),
  KEY `user_id` (`user_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (8077884,179963589,2106044989,'Add edwqd','2022-05-30 17:32:41'),(54633362,2030334903,332479617,'7labesa is very good.','2022-05-15 09:13:00'),(57586144,892936854,1781404377,'very nice\r\ni tried it once and i cant resist eating more','2022-05-21 22:28:27'),(140281383,1858541347,332479617,'I have some kitties.\r\nI will make one.','2022-05-17 20:43:45'),(227655431,2030334903,1496406585,'Moons jodqw','2022-05-16 03:34:59'),(289756209,1412319400,332479617,'تبا','2022-05-21 16:16:07'),(332765612,700914481,1692618218,'Noon','2022-05-30 11:18:46'),(491007630,424955306,1207578797,'إزاي يعم ؟!ي','2022-05-16 10:50:17'),(620071767,179963589,1496406585,'asfqw','2022-05-30 18:09:58'),(708888644,2030334903,332479617,'Ok I\'will','2022-05-15 09:42:46'),(717472807,2030334903,332479617,'Ok','2022-05-15 09:42:18'),(743873313,2030334903,332479617,'dqa','2022-05-16 03:05:03'),(857300859,2030334903,1207578797,'Like it','2022-05-16 03:41:10'),(998139985,2030334903,332479617,'wqdqw','2022-05-15 09:42:10'),(1168056758,424955306,332479617,'Kawai','2022-05-16 10:49:08'),(1194616126,424955306,1915614083,'Don\'t be late.','2022-05-17 00:07:55'),(1291472270,1529274963,1496406585,'Like !','2022-05-16 08:11:13'),(1331786830,892936854,1781404377,'very nice\\n\r\n232442324','2022-05-21 22:29:49'),(1335347567,2030334903,1207578797,'How to make?','2022-05-16 03:41:23'),(1422628910,834352193,332479617,'Good 7alabesa.','2022-05-16 08:18:46'),(1436047799,424955306,1915614083,'Don\'t be late.','2022-05-17 00:15:40'),(1577624437,2030334903,332479617,'dqwdwqd','2022-05-16 03:25:23'),(1602647707,892936854,332479617,'I was very happy to hear that 7alabessa is popular in Egypt','2022-05-21 22:39:35'),(1790739004,1529274963,332479617,'Ok','2022-05-16 08:15:14');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `user_id` int unsigned NOT NULL,
  `prod_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`prod_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (424955306,170054081),(625940493,170054081),(892936854,170054081),(1412319400,170054081),(179963589,332479617),(424955306,332479617),(834352193,332479617),(892936854,332479617),(1004346776,332479617),(1412319400,332479617),(1529274963,332479617),(1858541347,332479617),(834352193,398893286),(179963589,1207578797),(834352193,1207578797),(1529274963,1207578797),(179963589,1273226656),(179963589,1496406585),(424955306,1496406585),(834352193,1496406585),(1529274963,1496406585),(2030334903,1496406585),(424955306,1627467599),(2030334903,1627467599),(1412319400,1712635497),(892936854,1781404377),(424955306,1915614083),(179963589,2106044989);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_res`
--

DROP TABLE IF EXISTS `follow_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_res` (
  `flwr_user_id` int unsigned NOT NULL,
  `flw_res_id` int unsigned NOT NULL,
  PRIMARY KEY (`flwr_user_id`,`flw_res_id`),
  KEY `flw_res_id` (`flw_res_id`),
  CONSTRAINT `follow_res_ibfk_1` FOREIGN KEY (`flwr_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `follow_res_ibfk_2` FOREIGN KEY (`flw_res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_res`
--

LOCK TABLES `follow_res` WRITE;
/*!40000 ALTER TABLE `follow_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_usr`
--

DROP TABLE IF EXISTS `follow_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_usr` (
  `flwr_user_id` int unsigned NOT NULL,
  `flw_user_id` int unsigned NOT NULL,
  PRIMARY KEY (`flwr_user_id`,`flw_user_id`),
  KEY `flw_user_id` (`flw_user_id`),
  CONSTRAINT `follow_usr_ibfk_1` FOREIGN KEY (`flwr_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `follow_usr_ibfk_2` FOREIGN KEY (`flw_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_usr`
--

LOCK TABLES `follow_usr` WRITE;
/*!40000 ALTER TABLE `follow_usr` DISABLE KEYS */;
INSERT INTO `follow_usr` VALUES (2030334903,376779900),(625940493,424955306),(892936854,424955306),(1412319400,424955306),(2030334903,424955306),(2030334903,606685886),(892936854,625940493),(2030334903,625940493),(892936854,834352193),(1529274963,834352193),(2030334903,834352193),(1004346776,892936854),(2030334903,1529274963),(625940493,1655858036),(892936854,1655858036),(2030334903,1655858036),(892936854,1858541347),(2030334903,1858541347),(424955306,2030334903),(625940493,2030334903),(834352193,2030334903),(892936854,2030334903),(1412319400,2030334903),(1529274963,2030334903),(1655858036,2030334903);
/*!40000 ALTER TABLE `follow_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_id` int unsigned NOT NULL,
  `prod_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`prod_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (424955306,1207578797),(625940493,1207578797),(2030334903,1207578797),(424955306,1496406585),(2030334903,1496406585),(424955306,1627467599),(2030334903,1627467599),(892936854,1781404377),(179963589,2106044989);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_usr`
--

DROP TABLE IF EXISTS `message_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_usr` (
  `id` int unsigned NOT NULL,
  `sender` int unsigned NOT NULL,
  `receiver` int unsigned NOT NULL,
  `content` text,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `message_usr_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `message_usr_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_usr`
--

LOCK TABLES `message_usr` WRITE;
/*!40000 ALTER TABLE `message_usr` DISABLE KEYS */;
INSERT INTO `message_usr` VALUES (44216075,2030334903,1004346776,'How are You?\r\nHow is that?','2022-05-30 14:34:15',0),(245509588,1004346776,1529274963,'Hey\r\n','2022-05-30 16:47:43',0),(323042888,1004346776,1004346776,'fr','2022-05-30 16:45:15',0),(417627486,179963589,2030334903,']ا مرحبات','2022-05-30 18:11:59',0),(707501675,2030334903,179963589,'أهلا','2022-05-30 18:11:40',0),(852167802,1004346776,1004346776,'ref\r\n','2022-05-30 16:45:11',0),(1033404865,179963589,2030334903,'fweqf','2022-05-30 17:35:00',0),(1187926114,1529274963,1004346776,'How are You?\r\nHuh..','2022-05-30 16:48:13',0),(1233603408,179963589,2030334903,'Hello','2022-05-30 17:34:25',0),(1473446795,1004346776,2030334903,'Hi','2022-05-30 14:25:48',0),(1688766216,2030334903,179963589,'dwqdq','2022-05-30 17:34:53',0),(1752647889,2030334903,179963589,'شسبيصضب\r\nاثقاثق\r\nضصي','2022-05-30 18:12:06',0),(1780222059,179963589,2030334903,'dwqd','2022-05-30 17:34:56',0),(1887777224,1004346776,2030334903,'dwsdwqw,qdl','2022-05-30 14:25:40',0),(1976692103,2030334903,179963589,'Hi','2022-05-30 17:34:46',0),(2048212340,1004346776,1529274963,'I am Fine Thanks','2022-05-30 16:48:43',0);
/*!40000 ALTER TABLE `message_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `res_id` int unsigned DEFAULT NULL,
  `cat_id` int unsigned DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `picture` varchar(255) DEFAULT NULL,
  `create_date` timestamp NOT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `favorites` int DEFAULT '0',
  `comments` int DEFAULT '0',
  `likes` int DEFAULT '0',
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `picture` (`picture`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE,
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (170054081,424955306,NULL,NULL,'Chocolate ','For all Computers and Information students, next Sunday one piece free.\r\nFaculty make you sad, and Sultan make you happy.','./uploads/pictures/products/170054081.jpg','2022-05-17 00:16:08',500.00,4,0,0),(332479617,2030334903,NULL,NULL,'7alabesa','7alabesa is best known in Alexandria and coastal cities. Homos with spicy hot water and lemon.','./uploads/pictures/products/332479617.jpg','2022-05-15 06:34:59',10.00,8,12,0),(398893286,834352193,NULL,NULL,'Meteoroid Cake ','From distant spaces, the earth almighty destroyer come.\r\nVery Delicious !','./uploads/pictures/products/398893286.jpg','2022-05-17 02:22:52',53.00,1,0,0),(1207578797,2030334903,NULL,NULL,'Nile Cake','Nile cake from space.','./uploads/pictures/products/1207578797.jpg','2022-05-16 03:40:36',70.00,3,3,3),(1269549437,179963589,NULL,NULL,'Elias','dwd','./uploads/pictures/products/1269549437.png','2022-05-30 18:09:09',NULL,0,0,0),(1273226656,179963589,NULL,NULL,'Sky','dwqdq1','./uploads/pictures/products/1273226656.jpg','2022-05-30 17:39:21',NULL,1,0,0),(1496406585,2030334903,NULL,NULL,'Moons','dwdqwdqw/asd\' \" <','./uploads/pictures/products/1496406585.jpg','2022-05-16 02:32:28',NULL,5,3,2),(1627467599,424955306,NULL,NULL,'Chicken','Chicken on coal. Delicious.\r\n','./uploads/pictures/products/1627467599.jpg','2022-05-16 10:40:32',40.00,2,0,2),(1692618218,700914481,NULL,NULL,'Recipehub Team','Team that behind recipehub.','./uploads/pictures/products/1692618218.jpg','2022-05-30 11:18:26',1.00,0,1,0),(1712635497,1412319400,NULL,NULL,'Gazale','Nice meat','./uploads/pictures/products/1712635497.jpg','2022-05-21 16:11:49',100.00,1,0,0),(1781404377,892936854,NULL,NULL,'Horse stew','A very tasty halal horse stew with chunks of its meat','./uploads/pictures/products/1781404377.jpg','2022-05-21 22:26:00',1080.00,1,2,1),(1788267851,1004346776,NULL,NULL,'Vea','Equalizeeer','./uploads/pictures/products/1788267851.jpg','2022-05-30 11:33:28',NULL,0,0,0),(1915614083,424955306,NULL,NULL,'Chocolate ','For all Computers and Information students, next Sunday one piece free.\r\nFaculty make you sad, and Sultan make you happy.','./uploads/pictures/products/1915614083.jpg','2022-05-17 00:05:12',NULL,1,2,0),(2106044989,179963589,NULL,NULL,'dwqdq','dqwf','./uploads/pictures/products/2106044989.jpg','2022-05-30 17:32:32',NULL,1,1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `rec_id` int unsigned NOT NULL,
  `prod_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `res_id` int unsigned DEFAULT NULL,
  `ingredients` text NOT NULL,
  `time` int DEFAULT NULL,
  `cost` decimal(6,2) DEFAULT NULL,
  `method` text,
  `video` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rec_id`),
  KEY `prod_id` (`prod_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_ibfk_3` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (55236089,332479617,1858541347,NULL,'- Camel milk, Pineapple',40,50.00,'Cut the pineapple from the top.\r\nTake the head and place it in camel milk for 2 days. Inject the hard areas of with more milk.\r\nPlant it in a shell. Water it every day and wait 12 months.\r\nHow is it ?','','./uploads/pictures/products/55236089.jpg','2022-05-17 22:00:53'),(186334958,1692618218,700914481,NULL,'Ing',NULL,NULL,'Meth','','./uploads/pictures/products/186334958.jpg','2022-05-30 11:19:23'),(488695742,2106044989,179963589,NULL,'dqwdwq',NULL,NULL,'ewfewf','','./uploads/pictures/products/488695742.png','2022-05-30 17:33:00'),(618249428,1788267851,1004346776,NULL,'olcfeb',NULL,NULL,'kkkr','','./uploads/pictures/products/618249428.jpg','2022-05-30 11:33:54'),(775827964,1269549437,179963589,NULL,'wfq',NULL,NULL,'gqgqw','','./uploads/pictures/products/775827964.jpg','2022-05-30 18:09:24'),(892581501,1207578797,834352193,NULL,'- Car, Bag and sunglasses',30,75.00,'Go to station. Ask for 6 October cars. Ride and enjoy the beach.','','./uploads/pictures/products/892581501.jpg','2022-05-16 08:23:25'),(1027962919,1273226656,179963589,NULL,'wqfqw',NULL,NULL,'wegewf','','./uploads/pictures/products/1027962919.jpg','2022-05-30 17:39:40'),(1212567367,332479617,1858541347,NULL,'- Tree branch, good cleaver, fire and a knife\r\n',40,NULL,'Want to hunt some kitties to make 7alabesa. \r\nFind a good big tree and cut off one of its branch.\r\nTrim the branch until its color becomes pale green.\r\nTrim with the knife to make it pointy.\r\nPass the spear on the fire for 10 minutes (be careful do not burn it) to make it dry and strong. Good Hunting !','','./uploads/pictures/products/1212567367.jpg','2022-05-17 21:26:48'),(1246146003,1496406585,2030334903,NULL,'Little star girl.',NULL,NULL,'NaN','','./uploads/pictures/products/1246146003.jpg','2022-05-17 06:28:32'),(1279117266,1496406585,2030334903,NULL,'dqwdg2',NULL,NULL,'dwqdwqd212\'\"  \'dqwd21/\\\\',NULL,'./uploads/pictures/products/1279117266.jpg','2022-05-16 02:52:45'),(1288370739,1627467599,424955306,NULL,'- Chicken, Salt, Spices, Salad, Ranch',40,32.00,'Put spicy and salt on chicken.\r\nPrepare some salad.\r\nPut chicken on hot coal.\r\nWait 35 minutes.\r\nCall Karam El-Sham.\r\nBuy a prepared one.\r\nEnjoy the meal.','','./uploads/pictures/products/1288370739.jpg','2022-05-16 10:47:07'),(1403748852,1781404377,892936854,NULL,'SELECT * FROM user \r\n',NULL,NULL,'ljflgsajflsje','','./uploads/pictures/products/1403748852.jpg','2022-05-21 22:33:17'),(1541635576,1496406585,1858541347,NULL,'- Moon and Saturn',NULL,NULL,'Looking at sky from the beach','','./uploads/pictures/products/1541635576.jpg','2022-05-17 21:54:09'),(1710040644,1496406585,1858541347,NULL,'- Moon and Saturn',300,NULL,'Look at the sky','','./uploads/pictures/products/1710040644.jpg','2022-05-17 21:52:45'),(1853519832,1269549437,179963589,NULL,'wfqfqwf',34,54.00,'gqgqw','','./uploads/pictures/products/1853519832.jpg','2022-05-30 18:09:40'),(1952132231,1712635497,892936854,NULL,'chicken meat, coal, dragon fruit, egg plant',30,70.00,'do what you want man ,its holiday!!','https://www.youtube.com','./uploads/pictures/products/1952132231.jpg','2022-05-21 22:58:57'),(2139810878,1712635497,1412319400,NULL,'Ghazala',90,2.00,'Edb7ha','','./uploads/pictures/products/2139810878.jpg','2022-05-21 16:13:38');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_location`
--

DROP TABLE IF EXISTS `res_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_location` (
  `res_id` int unsigned NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `country` varchar(52) NOT NULL,
  `city` varchar(35) NOT NULL,
  PRIMARY KEY (`res_id`),
  CONSTRAINT `res_location_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_location`
--

LOCK TABLES `res_location` WRITE;
/*!40000 ALTER TABLE `res_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_menu`
--

DROP TABLE IF EXISTS `res_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_menu` (
  `res_id` int unsigned NOT NULL,
  `menu_id` int unsigned NOT NULL,
  `prod_id` int unsigned NOT NULL,
  PRIMARY KEY (`res_id`,`menu_id`,`prod_id`),
  KEY `menu_id` (`menu_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `res_menu_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE,
  CONSTRAINT `res_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE,
  CONSTRAINT `res_menu_ibfk_3` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_menu`
--

LOCK TABLES `res_menu` WRITE;
/*!40000 ALTER TABLE `res_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_phone`
--

DROP TABLE IF EXISTS `res_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_phone` (
  `res_id` int unsigned NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`res_id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `res_phone_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_phone`
--

LOCK TABLES `res_phone` WRITE;
/*!40000 ALTER TABLE `res_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `res_id` int unsigned NOT NULL,
  `email` varchar(130) NOT NULL,
  `username` varchar(130) NOT NULL,
  `password` varchar(150) NOT NULL,
  `create_date` timestamp NOT NULL,
  `date_of_creation` timestamp NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `picture` (`picture`),
  UNIQUE KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL,
  `email` varchar(130) NOT NULL,
  `username` varchar(130) NOT NULL,
  `password` varchar(150) NOT NULL,
  `birth_date` timestamp NOT NULL,
  `create_date` timestamp NOT NULL,
  `gender` char(1) NOT NULL,
  `country` varchar(52) NOT NULL,
  `city` varchar(35) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `age` int NOT NULL,
  `followers` int DEFAULT '0',
  `following` int DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (179963589,'Ebrahim@gmail.com','Ebrahim','AAFDC23870ECBCD3D557B6423A8982134E17927E','2000-04-12 22:00:00','2022-05-30 17:31:54','M','Cyprus','A CoruÃ±a (La CoruÃ±a)','./uploads/pictures/users/179963589.jpg',22,0,0),(376779900,'struct@gmail.com','Muhammed Struct','AAFDC23870ECBCD3D557B6423A8982134E17927E','2003-10-03 22:00:00','2022-05-18 06:15:44','M','Egypt','Kafr al-Shaykh','./uploads/pictures/users/376779900.png',19,1,0),(424955306,'soso55@gmail.com','Sohieb El Malahy','AAFDC23870ECBCD3D557B6423A8982134E17927E','2002-10-27 22:00:00','2022-05-16 10:37:18','M','Saudi Arabia','Jedda','./uploads/pictures/users/424955306.png',20,4,1),(444759921,'ahmed@gmail.com','Ahmed','AAFDC23870ECBCD3D557B6423A8982134E17927E','2022-05-09 22:00:00','2022-05-30 17:29:27','M','Egypt','Alexandria','./uploads/pictures/users/444759921.jpg',0,0,0),(606685886,'ahmednasr@gmail.com','Ahmed Nasr','AAFDC23870ECBCD3D557B6423A8982134E17927E','2000-05-18 22:00:00','2022-05-17 08:39:21','M','Oman','Bacabal',NULL,22,1,0),(625940493,'kabbary22@gmail.com','Ahmed Kabbary','AAFDC23870ECBCD3D557B6423A8982134E17927E','2002-02-13 22:00:00','2022-05-18 05:58:25','M','India','Ahmedabad','./uploads/pictures/users/625940493.jpg',20,2,3),(700914481,'RT@recipehub.com','RT','AAFDC23870ECBCD3D557B6423A8982134E17927E','2000-04-12 22:00:00','2022-05-30 11:16:31','M','Egypt','Kafr al-Shaykh','./uploads/pictures/users/700914481.jpg',22,0,0),(834352193,'amrmmlk@gmail.com','Amr Mamlook','AAFDC23870ECBCD3D557B6423A8982134E17927E','2002-03-05 22:00:00','2022-05-14 01:54:11','M','Bahrain','Abilene',NULL,20,3,1),(892936854,'rbkhg3@gmail.com','Abdullah mahrous','18F29D93864D5C3D4F764789A4A6FCF88CFEBA1D','2002-07-13 22:00:00','2022-05-21 22:20:26','M','Egypt','Alexandria','./uploads/pictures/users/892936854.jpg',20,1,6),(1004346776,'pk@gmail.com','PK','AAFDC23870ECBCD3D557B6423A8982134E17927E','2000-04-12 22:00:00','2022-05-30 11:32:30','M','Egypt','Alexandria','./uploads/pictures/users/1004346776.jpg',22,0,1),(1412319400,'Disha_eLsayed@gmail.com','Disha eLsayed','AAFDC23870ECBCD3D557B6423A8982134E17927E','2002-03-20 22:00:00','2022-05-21 16:10:15','M','United States','Alexandria','./uploads/pictures/users/1412319400.jpg',20,0,2),(1529274963,'mahrousoko@gmail.com','Abdo Mahrous','AAFDC23870ECBCD3D557B6423A8982134E17927E','2002-03-11 22:00:00','2022-05-14 01:14:31','M','Afghanistan','A CoruÃ±a (La CoruÃ±a)',NULL,20,1,2),(1655858036,'saadol@gmail.com','Muhammed Saad','AAFDC23870ECBCD3D557B6423A8982134E17927E','2002-11-07 22:00:00','2022-05-17 08:38:08','M','Armenia','Votkinsk','./uploads/pictures/users/1655858036.jpg',20,3,1),(1858541347,'moha5mach@gmail.com','Moha4Mach','AAFDC23870ECBCD3D557B6423A8982134E17927E','2000-04-12 22:00:00','2022-05-17 20:42:09','M','Egypt','Alexandria','./uploads/pictures/users/1858541347.png',22,2,0),(2030334903,'moha4mach@gmail.com','Muhammed Abdulsalam','AAFDC23870ECBCD3D557B6423A8982134E17927E','2000-04-12 22:00:00','2022-05-14 01:13:13','M','Afghanistan','A CoruÃ±a (La CoruÃ±a)','./uploads/pictures/users/2030334903.jpg',22,7,8);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 16:10:31
