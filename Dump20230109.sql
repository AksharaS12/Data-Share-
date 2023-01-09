CREATE DATABASE  IF NOT EXISTS `store_akshara_2023` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `store_akshara_2023`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: store_akshara_2023
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `address_details`
--

DROP TABLE IF EXISTS `address_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_details` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT,
  `house` varchar(45) DEFAULT NULL,
  `address_line1` varchar(45) DEFAULT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `country` int unsigned NOT NULL,
  `post_code` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_address_details_county_idx` (`country`),
  KEY `FK_address_details_customer_id_idx` (`customer_id`),
  CONSTRAINT `FK_address_details_county` FOREIGN KEY (`country`) REFERENCES `master_country` (`country_id`),
  CONSTRAINT `FK_address_details_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_details` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_details`
--

LOCK TABLES `address_details` WRITE;
/*!40000 ALTER TABLE `address_details` DISABLE KEYS */;
INSERT INTO `address_details` VALUES (1,'43','Bessingstroke ','Road',1,'RG2 0EL',NULL,NULL);
/*!40000 ALTER TABLE `address_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_details` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_type` int unsigned DEFAULT NULL,
  `cart_date` datetime DEFAULT NULL,
  `cart_by` int unsigned DEFAULT NULL,
  `cart_quantity` int DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `address_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_cart_details_cart_by_idx` (`cart_by`),
  KEY `FK_cart_details_cart_type_idx` (`cart_type`),
  KEY `FK_cart_details_product_idx` (`product_id`),
  KEY `FK_cart_details_address_id_idx` (`address_id`),
  CONSTRAINT `FK_cart_details_address_id` FOREIGN KEY (`address_id`) REFERENCES `address_details` (`address_id`),
  CONSTRAINT `FK_cart_details_cart_by` FOREIGN KEY (`cart_by`) REFERENCES `customer_details` (`customer_id`),
  CONSTRAINT `FK_cart_details_cart_type` FOREIGN KEY (`cart_type`) REFERENCES `master_cart_type` (`cart_type_id`),
  CONSTRAINT `FK_cart_details_product` FOREIGN KEY (`product_id`) REFERENCES `product_details` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
INSERT INTO `cart_details` VALUES (1,1,'2023-01-09 00:09:12',2,3,0,1,1),(2,1,'2023-01-09 00:09:50',2,2,0,2,1);
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `customer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `second_name` varchar(45) DEFAULT NULL,
  `telephone_number` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `FK_customer_details_role_id_idx` (`role_id`),
  CONSTRAINT `FK_customer_details_role_id` FOREIGN KEY (`role_id`) REFERENCES `master_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (1,'Akshu','S','0773456789','12345',0,1,'akshu@gmail.com'),(2,'Akshu','S','0773456789','123456',0,2,'akshu@gmail.com');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_cart_type`
--

DROP TABLE IF EXISTS `master_cart_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_cart_type` (
  `cart_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_description` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`cart_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_cart_type`
--

LOCK TABLES `master_cart_type` WRITE;
/*!40000 ALTER TABLE `master_cart_type` DISABLE KEYS */;
INSERT INTO `master_cart_type` VALUES (1,'Cart',0),(2,'Buy',0);
/*!40000 ALTER TABLE `master_cart_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_category`
--

DROP TABLE IF EXISTS `master_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` text,
  `is_deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_category`
--

LOCK TABLES `master_category` WRITE;
/*!40000 ALTER TABLE `master_category` DISABLE KEYS */;
INSERT INTO `master_category` VALUES (1,'Gaming',0),(2,'Book',0);
/*!40000 ALTER TABLE `master_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_country`
--

DROP TABLE IF EXISTS `master_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_country` (
  `country_id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_country`
--

LOCK TABLES `master_country` WRITE;
/*!40000 ALTER TABLE `master_country` DISABLE KEYS */;
INSERT INTO `master_country` VALUES (1,'India',0),(2,'United Kingdom',0);
/*!40000 ALTER TABLE `master_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_role`
--

DROP TABLE IF EXISTS `master_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_role` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_role`
--

LOCK TABLES `master_role` WRITE;
/*!40000 ALTER TABLE `master_role` DISABLE KEYS */;
INSERT INTO `master_role` VALUES (1,'admin',0),(2,'user',0);
/*!40000 ALTER TABLE `master_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(45) DEFAULT NULL,
  `description` text,
  `category` int unsigned DEFAULT NULL,
  `price` float unsigned DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  `added_by` int unsigned DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_product_details_added_by_idx` (`added_by`),
  KEY `FK_product_details_category_idx` (`category`),
  CONSTRAINT `FK_product_details_added_by` FOREIGN KEY (`added_by`) REFERENCES `customer_details` (`customer_id`),
  CONSTRAINT `FK_product_details_category` FOREIGN KEY (`category`) REFERENCES `master_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,'PEN001','Pen',2,10,0,1,0),(2,'Book001','HP Book',1,30,0,1,0);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'store_akshara_2023'
--

--
-- Dumping routines for database 'store_akshara_2023'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 22:51:30
