-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: padvoc
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT 'Where O_id is order id',
  `uid` bigint DEFAULT NULL COMMENT 'this is user id',
  `order_date` datetime DEFAULT NULL COMMENT 'this order date',
  `qty` int DEFAULT NULL COMMENT 'this is quantity',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp`
--

DROP TABLE IF EXISTS `otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp` (
  `g_date` datetime DEFAULT NULL COMMENT 'this is otp genrate date',
  `otp` int DEFAULT NULL COMMENT 'this is user otp',
  `uid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp`
--

LOCK TABLES `otp` WRITE;
/*!40000 ALTER TABLE `otp` DISABLE KEYS */;
INSERT INTO `otp` VALUES ('2023-03-04 17:32:15',180533,216),('2023-03-13 16:50:31',718446,217),('2023-03-13 16:52:19',227743,218),('2023-03-14 11:53:19',309577,219),('2023-03-14 12:15:46',440259,220),('2023-03-14 12:29:42',542161,221),('2023-03-14 13:15:57',240953,222),('2023-03-14 16:11:56',134243,223),('2023-03-15 15:57:13',730068,226),('2023-03-15 15:58:28',188406,227),('2023-03-15 16:19:53',740984,228),('2023-03-15 16:22:22',334791,229),('2023-03-15 16:32:07',563151,230),('2023-03-15 16:32:40',440170,231),('2023-03-15 16:39:58',452680,232),('2023-03-15 16:40:20',360282,233),('2023-03-15 16:42:05',927476,234),('2023-03-15 16:42:35',228867,235),('2023-03-15 16:43:26',951821,236),('2023-03-15 16:52:30',264186,237),('2023-03-15 17:32:55',976786,238),('2023-03-17 13:22:22',964379,239);
/*!40000 ALTER TABLE `otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` bigint NOT NULL AUTO_INCREMENT COMMENT 'where P_id is product id',
  `name` text COMMENT 'this is product name',
  `price` float DEFAULT NULL COMMENT 'this is product price',
  `status` tinyint DEFAULT NULL COMMENT 'this is product status',
  `description` text COMMENT 'this is product Description',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'pencil',200,NULL,'it is a pencil'),(2,'mobile',250,1,'it\'s a mobile');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user2`
--

DROP TABLE IF EXISTS `user2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user2` (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT 'this is user id',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pwd` text,
  `salt` text,
  `role` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user2`
--

LOCK TABLES `user2` WRITE;
/*!40000 ALTER TABLE `user2` DISABLE KEYS */;
INSERT INTO `user2` VALUES (61,NULL,'abc@gmail.com','$2b$10$ZZYgv412/ZQNMkqRKYhh8ezLcuPRWTZCe.W.C2zGF9CuX1xmXKgfe','$2b$10$ZZYgv412/ZQNMkqRKYhh8e',0,1,NULL);
/*!40000 ALTER TABLE `user2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT 'where U_id is user id',
  `name` varchar(255) DEFAULT NULL COMMENT 'this is user name',
  `email` varchar(100) DEFAULT NULL COMMENT 'this is user email',
  `pwd` varchar(20) DEFAULT NULL COMMENT 'where pwd is password',
  `salt` text COMMENT 'this is salt',
  `role` tinyint DEFAULT NULL COMMENT 'this is role',
  `status` tinyint DEFAULT NULL COMMENT 'this is status of user',
  `mobile` varchar(10) DEFAULT NULL COMMENT 'this is mobile number',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-03-18 18:20:28
