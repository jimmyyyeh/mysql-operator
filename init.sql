-- MySQL dump 10.13  Distrib 5.6.49, for Linux (x86_64)
--
-- Host: localhost    Database: foo_bar_db
-- ------------------------------------------------------
-- Server version	5.6.49

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
-- Current Database: `foo_bar_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `foo_bar_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `foo_bar_db`;

--
-- Table structure for table `bar_store`
--

DROP TABLE IF EXISTS `bar_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bar_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bar_store`
--

LOCK TABLES `bar_store` WRITE;
/*!40000 ALTER TABLE `bar_store` DISABLE KEYS */;
INSERT INTO `bar_store` VALUES (1,'Best Price Modern Wholesale, Jammu & Kashmir','Wal-Mart India Private Limited, Khasra No 425, 426 & 428 \r\nToposherkhania Akhnoor Road Jammu (J&K) 180003\r\nIndia'),(2,'Best Price Modern Wholesale, Amritsar, Punjab','Wal-Mart India Private Limited. Plot No. 75/26 - 75/14, AIPL Ambuja Dream City Manawala, GT Jalandhar Highway Road\r\nAmritsar\r\nPunjab 140601\r\nIndia'),(3,'Best Price Modern Wholesale, Bhopal 1, Madhya Pradesh','Wal-Mart India Private Limited. Opp. Bhopal Memorial Hospital Raisen Bypass Road\r\nBhopal\r\nMadhya Pradesh 462038\r\nIndia'),(4,'Best Price Modern Wholesale Store, Kurnool, Andhra Pradesh','Wal-Mart India Private Limited. Survey Nos. 570, 748 & 749, Birla Gadda, Gooty Road, Kallur Village\r\nKurnool\r\nAndhra Pradesh \r\nIndia');
/*!40000 ALTER TABLE `bar_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bar_weather`
--

DROP TABLE IF EXISTS `bar_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bar_weather` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `weather` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bar_weather`
--

LOCK TABLES `bar_weather` WRITE;
/*!40000 ALTER TABLE `bar_weather` DISABLE KEYS */;
INSERT INTO `bar_weather` VALUES ('2020-01-01','sunny'),('2020-01-02','sunny'),('2020-01-03','rainy'),('2020-01-04','rainy'),('2020-01-05','cloudy');
/*!40000 ALTER TABLE `bar_weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foo_commodity`
--

DROP TABLE IF EXISTS `foo_commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foo_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foo_commodity`
--

LOCK TABLES `foo_commodity` WRITE;
/*!40000 ALTER TABLE `foo_commodity` DISABLE KEYS */;
INSERT INTO `foo_commodity` VALUES (1,'coke',10),(2,'bread',30),(3,'water',18),(4,'watch',30);
/*!40000 ALTER TABLE `foo_commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foo_user`
--

DROP TABLE IF EXISTS `foo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foo_user`
--

LOCK TABLES `foo_user` WRITE;
/*!40000 ALTER TABLE `foo_user` DISABLE KEYS */;
INSERT INTO `foo_user` VALUES (1,'Jimmy','1996-07-19'),(2,'Nicky','1998-01-31'),(3,'Penny','1990-05-07'),(4,'Nicky','1988-03-23');
/*!40000 ALTER TABLE `foo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `hello_world_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hello_world_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `hello_world_db`;

--
-- Table structure for table `bar_store`
--

DROP TABLE IF EXISTS `bar_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bar_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bar_store`
--

LOCK TABLES `bar_store` WRITE;
/*!40000 ALTER TABLE `bar_store` DISABLE KEYS */;
INSERT INTO `bar_store` VALUES (1,'Best Price Modern Wholesale, Jammu & Kashmir','Wal-Mart India Private Limited, Khasra No 425, 426 & 428 \r\nToposherkhania Akhnoor Road Jammu (J&K) 180003\r\nIndia'),(2,'Best Price Modern Wholesale,Bhopal 2, Madhya Pradesh	','Wal-Mart India Private Limited. Khasra No. 31-32, Besides Scope College Campus, Hoshangabad Road, Misrod\r\nBhopal\r\nMadhya Pradesh 462047\r\nIndia'),(3,'Best Price Modern Wholesale, Bhopal 1, Madhya Pradesh','Wal-Mart India Private Limited. Opp. Bhopal Memorial Hospital Raisen Bypass Road\r\nBhopal\r\nMadhya Pradesh 462038\r\nIndia'),(4,'Best Price Modern Wholesale, Bathinda, Punjab	','Wal-Mart India Private Limited. Near Adesh Hospital, 12 Canal Irrigated, Village Bucho Kalan, Hadbast No 201, Tehsil Nathana\r\nBathinda\r\nPunjab 151010\r\nIndia');
/*!40000 ALTER TABLE `bar_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bar_weather`
--

DROP TABLE IF EXISTS `bar_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bar_weather` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `weather` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bar_weather`
--

LOCK TABLES `bar_weather` WRITE;
/*!40000 ALTER TABLE `bar_weather` DISABLE KEYS */;
INSERT INTO `bar_weather` VALUES ('2020-02-01','windy'),('2020-02-02','rainy'),('2020-02-03','rainy'),('2020-02-04','windy'),('2020-02-05','rainy');
/*!40000 ALTER TABLE `bar_weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foo_commodity`
--

DROP TABLE IF EXISTS `foo_commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foo_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foo_commodity`
--

LOCK TABLES `foo_commodity` WRITE;
/*!40000 ALTER TABLE `foo_commodity` DISABLE KEYS */;
INSERT INTO `foo_commodity` VALUES (1,'phone',300),(2,'key chain',20),(3,'charger',50),(4,'glass',30);
/*!40000 ALTER TABLE `foo_commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foo_user`
--

DROP TABLE IF EXISTS `foo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foo_user`
--

LOCK TABLES `foo_user` WRITE;
/*!40000 ALTER TABLE `foo_user` DISABLE KEYS */;
INSERT INTO `foo_user` VALUES (1,'Jimmy','1996-07-19'),(2,'Lily','1999-03-31'),(3,'Tom','1972-05-06'),(4,'Judy','2020-08-22');
/*!40000 ALTER TABLE `foo_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-07 12:10:53
