-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: reservation_fields
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Current Database: `reservation_fields`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `reservation_fields` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `reservation_fields`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `ava_url` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `last_edited` datetime NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin','admin','08990821878','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-02-28 15:09:18','2024-02-28 15:09:18'),('adminrofif','Dev Example','adminrofif','08123456789','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-03-27 08:11:31','2024-03-27 08:11:31'),('devexample','Dev Example','examplepass','08123456789','http://rofif.my.id/static/pic_source/admin_profile/admin_devexample_234847943.jpg','2024-02-25 01:18:09','2024-02-25 01:18:09'),('wakacipuy','Dev Example','wakacipuy','08123456789','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-03-03 18:19:00','2024-03-03 18:19:00'),('wakacipuya','Dev Example','wakacipuya','08123456789','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-03-03 20:51:35','2024-03-03 20:51:35');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_login_token`
--

DROP TABLE IF EXISTS `admin_login_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_login_token` (
  `token` varchar(128) NOT NULL,
  `Admin_username` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `Virtual_Device_ID_id` varchar(32) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `Admin_token_idx` (`Admin_username`),
  KEY `Admin_device_id_idx` (`Virtual_Device_ID_id`),
  CONSTRAINT `Admin_device_id` FOREIGN KEY (`Virtual_Device_ID_id`) REFERENCES `virtual_device_id` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Admin_token` FOREIGN KEY (`Admin_username`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_login_token`
--

LOCK TABLES `admin_login_token` WRITE;
/*!40000 ALTER TABLE `admin_login_token` DISABLE KEYS */;
INSERT INTO `admin_login_token` VALUES ('tokendev','devexample','2024-04-10 02:26:16','w+6pny1/hSgLF(wq*bE277)4I>81rum9'),('tokenexample','admin','2024-03-31 01:17:40','q5ou1+Zt<7HXm35QdO*2uBdHBmv0Tl2B');
/*!40000 ALTER TABLE `admin_login_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_schedule`
--

DROP TABLE IF EXISTS `blacklist_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist_schedule` (
  `id` varchar(36) NOT NULL,
  `Field_id` varchar(36) NOT NULL,
  `date` date NOT NULL,
  `fromTime` time NOT NULL,
  `toTime` time NOT NULL,
  `is_every_week` tinyint NOT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_blacklist_schedule_idx` (`Field_id`),
  CONSTRAINT `field_blacklist_schedule` FOREIGN KEY (`Field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_schedule`
--

LOCK TABLES `blacklist_schedule` WRITE;
/*!40000 ALTER TABLE `blacklist_schedule` DISABLE KEYS */;
INSERT INTO `blacklist_schedule` VALUES ('33cef3d9-8ec3-499e-8d6c-c4a148d21031','d28aa20b-d982-4b53-b56d-7307a4410336','2024-03-29','08:00:00','13:00:00',1,'Jadwal Sholat Jumat','2024-03-16 03:01:10','2024-03-16 03:01:10'),('659dbbbd-ce60-42bd-b101-edc1039779a2','a6d01bda-89b1-42b0-be6e-9164f5b8f03d','2024-03-29','08:00:00','13:00:00',1,'Jadwal Sholat Jumat','2024-03-16 03:00:08','2024-03-16 03:00:08'),('a8fe3d53-dc50-48f7-b23f-2c53c479f5da','5c8a3b2a-de9e-431f-bd4f-98558ec26264','2024-05-21','08:00:00','10:59:59',1,'Cuti Perayaan','2024-03-16 02:31:02','2024-03-16 02:31:02'),('bb658096-d5d8-46fb-b823-00513c412111','5c8a3b2a-de9e-431f-bd4f-98558ec26264','2024-03-29','08:00:00','13:00:00',1,'Jadwal Sholat Jumat','2024-03-16 02:43:13','2024-03-16 02:43:13');
/*!40000 ALTER TABLE `blacklist_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bubble_chat`
--

DROP TABLE IF EXISTS `bubble_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bubble_chat` (
  `id` varchar(73) NOT NULL,
  `Chat_Match_id` varchar(36) NOT NULL,
  `post_time` timestamp NOT NULL,
  `from_role` varchar(45) NOT NULL,
  `from_name` varchar(120) NOT NULL,
  `message` text NOT NULL,
  `is_deleted_in_player` tinyint NOT NULL DEFAULT '0',
  `is_deleted_in_admin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chat_bubbles_idx` (`Chat_Match_id`),
  CONSTRAINT `chat_bubbles` FOREIGN KEY (`Chat_Match_id`) REFERENCES `chat_match` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bubble_chat`
--

LOCK TABLES `bubble_chat` WRITE;
/*!40000 ALTER TABLE `bubble_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bubble_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_match`
--

DROP TABLE IF EXISTS `chat_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_match` (
  `id` varchar(36) NOT NULL,
  `Admin_username` varchar(75) NOT NULL,
  `Player_username` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_chat_idx` (`Admin_username`),
  KEY `player_chat_idx` (`Player_username`),
  CONSTRAINT `admin_chat` FOREIGN KEY (`Admin_username`) REFERENCES `admin` (`username`),
  CONSTRAINT `player_chat` FOREIGN KEY (`Player_username`) REFERENCES `player` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_match`
--

LOCK TABLES `chat_match` WRITE;
/*!40000 ALTER TABLE `chat_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` varchar(36) NOT NULL,
  `Sport_Field_id` varchar(36) NOT NULL,
  `number` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sport_Field_idx` (`Sport_Field_id`),
  CONSTRAINT `Sport_Field` FOREIGN KEY (`Sport_Field_id`) REFERENCES `sport_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES ('5c8a3b2a-de9e-431f-bd4f-98558ec26264','fd5780b2-134c-42a3-8d6e-c4403f82b743',1,'2024-03-03 21:11:11'),('a6d01bda-89b1-42b0-be6e-9164f5b8f03d','d28aa20b-d982-4b53-b56d-7307a4410339',5,'2024-03-03 17:02:50'),('d28aa20b-d982-4b53-b56d-7307a4410336','d28aa20b-d982-4b53-b56d-7307a4410339',3,'2024-03-03 15:38:49'),('d28aa20b-d982-4b53-b56d-7307a4410338','d28aa20b-d982-4b53-b56d-7307a4410339',1,'2024-03-03 15:38:49'),('e372d66d-7ee7-4229-915a-c899e8476357','d28aa20b-d982-4b53-b56d-7307a4410339',4,'2024-03-03 19:09:36');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_history`
--

DROP TABLE IF EXISTS `match_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_history` (
  `id` varchar(36) NOT NULL,
  `Reservation_id` varchar(36) NOT NULL,
  `number` int NOT NULL,
  `score_a` int NOT NULL DEFAULT '0',
  `score_b` int NOT NULL DEFAULT '0',
  `is_done` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `history_match_reservation_idx` (`Reservation_id`),
  CONSTRAINT `history_match_reservation` FOREIGN KEY (`Reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_history`
--

LOCK TABLES `match_history` WRITE;
/*!40000 ALTER TABLE `match_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_player`
--

DROP TABLE IF EXISTS `match_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_player` (
  `Match_History_id` varchar(36) NOT NULL,
  `Player_username` varchar(75) NOT NULL,
  `team` char(1) NOT NULL,
  KEY `match_player_history_idx` (`Match_History_id`),
  KEY `match_player_user_idx` (`Player_username`),
  CONSTRAINT `match_player_history` FOREIGN KEY (`Match_History_id`) REFERENCES `match_history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `match_player_user` FOREIGN KEY (`Player_username`) REFERENCES `player` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_player`
--

LOCK TABLES `match_player` WRITE;
/*!40000 ALTER TABLE `match_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `username` varchar(30) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ava_url` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `last_edited` datetime NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('denannn','examplepass','Dev Example','http://rofif.my.id/static/pic_source/player_profile/player_denannn_000731496.gif','2024-03-07 03:12:51','2024-03-07 03:12:51','08123456789'),('devexample','examplepass','Dev Example','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-02-24 03:13:39','2024-02-24 03:13:39','08123456789'),('devexample2','examplepass','Dev Example 2','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-02-17 04:38:39','2024-02-17 04:38:39','08123456789'),('devexample3','examplepass','Dev Example 3','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-02-22 16:41:36','2024-02-22 16:41:36','08123456789'),('examplerofif','bcfb3112d6931f318977a06823f9fe825c97bcb5ad8e593a28cb27f7382319bf98006babed5dde60fe56bdc53655b6ec4d7ad5926a5ace365286e45ce2d653ba','Dev Example','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-03-27 08:10:20','2024-03-27 08:10:20','08123456789'),('wakacipuyp','wakacipuyp','Dev Example','http://rofif.my.id/static/pic_source/hamtarooo.jpg','2024-03-03 20:50:06','2024-03-03 20:50:06','08123456789');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_login_token`
--

DROP TABLE IF EXISTS `player_login_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_login_token` (
  `token` varchar(128) NOT NULL,
  `Player_username` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `Virtual_Device_ID_id` varchar(32) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `player_token_idx` (`Player_username`),
  KEY `device_id_idx` (`Virtual_Device_ID_id`),
  CONSTRAINT `device_id` FOREIGN KEY (`Virtual_Device_ID_id`) REFERENCES `virtual_device_id` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_token` FOREIGN KEY (`Player_username`) REFERENCES `player` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_login_token`
--

LOCK TABLES `player_login_token` WRITE;
/*!40000 ALTER TABLE `player_login_token` DISABLE KEYS */;
INSERT INTO `player_login_token` VALUES ('tokendenan','denannn','2024-03-31 02:31:28','w+6pny1/hSgLF(wq*bE277)4I>81rum9'),('tokenexample2','devexample2','2024-03-31 02:31:28',',C0RA1TJiiZ0GoXr<969+p,I=GHUI<2P'),('tokenrofif','examplerofif','2024-03-31 02:31:28','l8+;a4rmaF*7S>w>yAq.?h:9/2e9>55Y');
/*!40000 ALTER TABLE `player_login_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` varchar(36) NOT NULL,
  `Field_id` varchar(36) NOT NULL,
  `Player_username` varchar(30) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mabar_type` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `booking_status` varchar(25) NOT NULL DEFAULT 'payment',
  `payment_credential_url` varchar(200) DEFAULT NULL,
  `is_public` tinyint NOT NULL DEFAULT '0',
  `is_open_member` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `upload_payment_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_field_idx` (`Field_id`),
  KEY `res_player_idx` (`Player_username`),
  CONSTRAINT `res_field` FOREIGN KEY (`Field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `res_player` FOREIGN KEY (`Player_username`) REFERENCES `player` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('8239dc8d-8db0-4768-a3bf-18f238fc2621','5c8a3b2a-de9e-431f-bd4f-98558ec26264','denannn','WADIDAW','competitive','2024-05-02','14:00:00','15:59:59','approved','http://rofif.my.id/static/pic_source/payments/denan_8239dc8d-8db0-4768-a3bf-18f238fc264e_190929153.gif',1,1,'2024-04-11 03:15:05','2024-04-11 03:15:05','2024-04-11 03:15:05'),('8239dc8d-8db0-4768-a3bf-18f238fc264e','a6d01bda-89b1-42b0-be6e-9164f5b8f03d','denannn','MABAR UWU','friendly','2024-05-01','14:00:00','15:59:59','waiting_approval','http://rofif.my.id/static/pic_source/payments/denan_8239dc8d-8db0-4768-a3bf-18f238fc264e_160624074.png',1,1,'2024-04-11 03:15:05','2024-05-28 16:06:24','2024-05-28 16:06:24'),('8239dc8d-8db0-4768-a3bf-18f238fc2655','a6d01bda-89b1-42b0-be6e-9164f5b8f03d','examplerofif','MABAR UWU','friendly','2024-05-01','16:00:00','19:59:59','approved','http://rofif.my.id/static/pic_source/payments/denan_8239dc8d-8db0-4768-a3bf-18f238fc264e_190929153.gif',0,0,'2024-04-11 03:15:05','2024-04-12 02:35:40','2024-04-11 19:09:29');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_member`
--

DROP TABLE IF EXISTS `reservation_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_member` (
  `Reservation_id` varchar(36) NOT NULL,
  `Player_username` varchar(45) NOT NULL,
  KEY `member_reservation_idx` (`Reservation_id`),
  KEY `member_player_idx` (`Player_username`),
  CONSTRAINT `member_player` FOREIGN KEY (`Player_username`) REFERENCES `player` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_reservation` FOREIGN KEY (`Reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_member`
--

LOCK TABLES `reservation_member` WRITE;
/*!40000 ALTER TABLE `reservation_member` DISABLE KEYS */;
INSERT INTO `reservation_member` VALUES ('8239dc8d-8db0-4768-a3bf-18f238fc264e','devexample2'),('8239dc8d-8db0-4768-a3bf-18f238fc2655','devexample3'),('8239dc8d-8db0-4768-a3bf-18f238fc2655','devexample'),('8239dc8d-8db0-4768-a3bf-18f238fc2655','denannn'),('8239dc8d-8db0-4768-a3bf-18f238fc2655','devexample2');
/*!40000 ALTER TABLE `reservation_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_qr`
--

DROP TABLE IF EXISTS `reservation_qr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_qr` (
  `Reservation_id` varchar(36) NOT NULL,
  `url` varchar(200) NOT NULL,
  KEY `qr_reservation_idx` (`Reservation_id`),
  CONSTRAINT `qr_reservation` FOREIGN KEY (`Reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_qr`
--

LOCK TABLES `reservation_qr` WRITE;
/*!40000 ALTER TABLE `reservation_qr` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_qr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport_field`
--

DROP TABLE IF EXISTS `sport_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sport_field` (
  `id` varchar(36) NOT NULL,
  `Admin_username` varchar(30) NOT NULL,
  `Sport_Kind_id` varchar(36) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `last_edited` datetime NOT NULL,
  `geo_coordinate` varchar(100) DEFAULT NULL,
  `is_bike_parking` tinyint DEFAULT NULL,
  `is_car_parking` tinyint DEFAULT NULL,
  `is_public` tinyint DEFAULT NULL,
  `description` longtext,
  `rules` longtext,
  `time_open` time DEFAULT NULL,
  `time_closed` time DEFAULT NULL,
  `price_per_hour` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Admin_SportField_idx` (`Admin_username`),
  KEY `Kind_Sport_idx` (`Sport_Kind_id`),
  CONSTRAINT `Admin_SportField` FOREIGN KEY (`Admin_username`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Kind_Sport` FOREIGN KEY (`Sport_Kind_id`) REFERENCES `sport_kind` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport_field`
--

LOCK TABLES `sport_field` WRITE;
/*!40000 ALTER TABLE `sport_field` DISABLE KEYS */;
INSERT INTO `sport_field` VALUES ('2454c84f-51a1-437a-a396-018f0bd5c3e3','admin','2b607252-3c94-432f-9275-a86331483uu3','Gor Wakacipuy','2024-03-03 20:18:03','2024-03-03 20:18:03','-6.300012, 107.164228',1,1,0,'Lapang Badminton dengan 3 lapang yang sudah menggunakan karpet sintetis','Wajib menggunakan sepatu badminton, tidak boleh menggunakan sepatu berdebu','08:00:00','23:00:00',40000),('d28aa20b-d982-4b53-b56d-7307a4410339','devexample','2b607252-3c94-432f-9275-a86304363cf3','Gor Gears','2024-02-26 04:58:41','2024-02-28 04:49:24','-6.889537, 107.617464',1,1,1,'Lapang Badminton dengan 3 lapang yang sudah menggunakan karpet sintetis','Wajib menggunakan sepatu badminton, tidak boleh menggunakan sepatu berdebu','08:00:00','23:00:00',37500),('fd5780b2-134c-42a3-8d6e-c4403f82b743','wakacipuya','2b607252-3c94-432f-9275-a86304363cf3','Gor Edit 2','2024-03-03 20:55:19','2024-03-03 21:09:46','-6.890162, 107.615230',1,1,1,'Lapang Badminton dengan 3 lapang yang sudah menggunakan karpet sintetis','Wajib menggunakan sepatu badminton, tidak boleh menggunakan sepatu berdebu','08:00:00','23:00:00',36500);
/*!40000 ALTER TABLE `sport_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport_kind`
--

DROP TABLE IF EXISTS `sport_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sport_kind` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport_kind`
--

LOCK TABLES `sport_kind` WRITE;
/*!40000 ALTER TABLE `sport_kind` DISABLE KEYS */;
INSERT INTO `sport_kind` VALUES ('003ab2f8-936d-4a25-a409-7e7828466f30','unittest_sport'),('00752561-b29b-49df-9b93-8d267dffdadd','unittest_sport'),('03270059-fea6-4050-92c8-69e39bfcb7bb','unittest_sport'),('03f41aa6-4e52-4ed3-8013-fa83d50fe173','unittest_sport'),('040b6aa1-c43b-4859-9830-979d70663f8b','unittest_sport'),('06f7c3ab-7205-4875-b850-a5af703d355e','unittest_sport'),('095c25ba-1e8e-460a-a017-dd44e9b5f669','unittest_sport'),('0fe2b17b-0e81-464c-a291-ecca98ed26f6','unittest_sport'),('1046c1ec-68d3-4d75-b736-b0ac5a0dd33d','unittest_sport'),('10fd3a66-1132-4e32-a2d5-52db51ef79a5','unittest_sport'),('11dc62e7-39b9-438c-be5d-4e92b265be65','unittest_sport'),('13e56986-24fe-42bb-90c7-1e90830d03ea','unittest_sport'),('14509be8-35ff-412f-af43-f486ee74c9f2','unittest_sport'),('1d8129ed-a794-44b8-984d-257f8aa06c00','unittest_sport'),('1e199de1-e3aa-4943-8284-6ebb336ef060','unittest_sport'),('1eecfb04-950c-412d-8f87-f56b892a12ef','unittest_sport'),('1ffe0477-8d96-4735-822a-b438c5758ce7','unittest_sport'),('22450ab9-d7e5-4f29-b551-a16066226490','unittest_sport'),('24027671-3435-4a2a-a68d-d88ff07c4285','unittest_sport'),('262e3cc8-29c1-4f0d-a1a8-523f43829708','unittest_sport'),('2b607252-3c94-432f-9275-a86304363cf3','Badminton'),('2b607252-3c94-432f-9275-a86331483uu3','Futsal'),('2d1cef19-2e57-49de-973f-7ab930368da6','unittest_sport'),('33fea898-1351-4402-9bad-adc0bef78f5e','unittest_sport'),('345788ab-b3fd-4b3f-b7c5-8aef5ab8e908','unittest_sport'),('38b74ac8-f36c-4b4e-8d5d-6ebe4ae43555','unittest_sport'),('3951f58c-df44-4aba-8e0a-f23c88133dcb','unittest_sport'),('3b0fd70a-2243-47c2-9700-79838d577a1d','unittest_sport'),('3cd9ffab-bb35-474c-b9f0-69ad838cf769','unittest_sport'),('3fac6a75-c7bb-47e4-8d0a-00233e3269dd','unittest_sport'),('400e4a85-e31a-4000-a768-55026786b189','unittest_sport'),('450a3af5-1ee7-4d16-9b10-6c5719dfd30f','unittest_sport'),('465a5dcc-71f4-4d57-9c1e-0a9c122b33b3','unittest_sport'),('48f8102e-0c9f-4e53-8e88-709885bd05ec','unittest_sport'),('4b8e826a-5090-46b9-979f-60c870b9aa16','unittest_sport'),('4cfb4f34-6ee4-462f-b7e0-4efb7772a82a','unittest_sport'),('4fb6fafb-55f1-4ad5-8204-08973a166d5a','unittest_sport'),('5618cbf5-2b8a-4e2e-8e8a-0948fbc5eed6','unittest_sport'),('56916e58-ca36-438e-8448-09c6335ff610','unittest_sport'),('57a7be85-86c6-4168-9119-c978bbf9206a','unittest_sport'),('5a84ccfe-a7d0-4945-a9ba-5ed7fa904072','unittest_sport'),('5b09d825-85b6-4118-b5da-800ad14610a7','unittest_sport'),('5d9f0052-0471-4afc-9549-5a274f452bf8','unittest_sport'),('5e76ee11-b416-453e-95d7-77930d6a4399','unittest_sport'),('5e7d9aba-41ca-47ec-8cf9-b6746dd37279','unittest_sport'),('603c9a6a-22e7-4dc8-9d1c-4dbb9f7d96d7','unittest_sport'),('623dba8c-e610-4738-8cc0-955ebb41fcf5','unittest_sport'),('630c5424-7eea-473c-9901-a1c206d669dc','unittest_sport'),('641acd21-c71a-4dfa-b495-6f7c5effb5d7','unittest_sport'),('64226bff-237d-4733-8466-d3c86540fa14','unittest_sport'),('6ba05c85-8c46-45b6-9603-e0ab32298779','unittest_sport'),('6c8acea2-5b72-4709-9daf-390a84a2ade3','unittest_sport'),('701bd656-1699-441d-ac5f-890e6c544210','unittest_sport'),('70646152-d8cd-4924-83a9-5f75c7483268','unittest_sport'),('721d606c-0d78-48b1-9ea7-e9542c38fd04','unittest_sport'),('74884cbf-a913-4af7-9b00-894b2be8dec3','unittest_sport'),('75d72639-0b5d-49d5-94e8-51b490cf1853','unittest_sport'),('7676ded0-8caf-4055-abe9-33b1167bd886','unittest_sport'),('7a810f4d-1793-4374-bb63-6383f5f2a24f','unittest_sport'),('7c929bb1-b46b-49ce-89c8-a266a2c341c1','unittest_sport'),('7d336d78-70e1-4d2e-8010-914eca7f8721','unittest_sport'),('7d702678-1441-48ac-9eaf-d7d3ae0c6374','unittest_sport'),('7e33634f-e32c-440b-9611-4c00fde60099','unittest_sport'),('7f978976-ea71-4175-9f53-81f400df98ed','unittest_sport'),('86b910c5-7e2c-4fca-9a90-7bd69b6b171b','unittest_sport'),('8a9652ba-332c-45dc-acf8-2e784376d3f6','unittest_sport'),('8c17c051-db42-4847-a45c-abbfd36d56c2','unittest_sport'),('8c6e50ae-9020-4b36-9dc3-7615d4f4bc1d','unittest_sport'),('8fac2288-1d13-4e45-ab4e-e8d056cde862','unittest_sport'),('8fd488c8-6e7f-4676-9fe0-a4a754360104','unittest_sport'),('94039f19-1d01-4c07-a57e-1b2b972b358e','unittest_sport'),('98299a53-032c-4d1b-8cbb-5c2dc5272eed','unittest_sport'),('98b1faf9-9a63-4bed-9a42-0711923e5111','unittest_sport'),('9b665bb7-ceea-40ad-8e94-2565ca483337','unittest_sport'),('9bbb1176-5eca-46ad-8184-a721ccb5e720','unittest_sport'),('9bfce9b3-3899-4378-b9e6-386ca3f96ae0','unittest_sport'),('a2f9df3e-434a-4b94-9b13-c7ff00249457','unittest_sport'),('a41c4fc0-9271-419c-9125-a51d677dfb1f','unittest_sport'),('a9a8a0cd-cd5b-4a59-a5c5-6f81ff4d854f','unittest_sport'),('ab4397c0-2ca8-4583-b9dc-e9e73add3ed2','unittest_sport'),('ab703d31-1e4f-43af-ad72-431973d33d10','unittest_sport'),('accef74d-12a8-4d7c-8f75-b2e4419299f5','unittest_sport'),('b04efe12-111d-4122-ace2-22c6964ed05a','unittest_sport'),('b0a9d126-fa2d-4ec7-8846-0aa6db0337b0','unittest_sport'),('b2a16bce-17b4-44cd-afd3-497f0fe02240','unittest_sport'),('b7232688-74a0-4259-955e-0e26a5cac559','unittest_sport'),('b81aad09-3a0e-4f67-ae83-a639175c540f','unittest_sport'),('c20edb0e-1f3a-450a-b745-0834183b5e72','unittest_sport'),('c21cf666-e240-483e-96d3-2920d6bdf60f','unittest_sport'),('c697cbfc-a7f8-4f68-86be-dd271824553a','unittest_sport'),('c7065b3e-e4a2-40a9-97e4-72538796bf3c','unittest_sport'),('c92da75f-766f-4887-8e08-948068d7c77f','unittest_sport'),('cdaf888e-5547-4be0-a60d-9abed89c0a66','unittest_sport'),('d15b2f91-e570-4910-a9c6-7641b4f148f5','unittest_sport'),('d712eb4d-5511-490d-9902-3da85a7a2207','unittest_sport'),('dd170f69-fffd-465c-b3f2-66f02759c41d','unittest_sport'),('dd2a103d-7dd9-4d53-a5cf-66742b1fd7c0','unittest_sport'),('e2a6050d-b4f9-4577-b706-2d77066cbded','unittest_sport'),('e32137d9-b901-4aa2-99fa-2ce0861a3957','unittest_sport'),('e333fa52-e8e5-4690-8753-3e3db4cdd49f','unittest_sport'),('e3bd1fed-4ae0-4c54-8301-9d27967b9106','unittest_sport'),('e4cdb10d-a540-429f-accf-9472b8a0970f','unittest_sport'),('e7e65fb6-1728-4b35-a4b2-1dc20f2c4453','unittest_sport'),('e7fee407-1c0c-4690-8988-7f147b6128c2','unittest_sport'),('e8796ae1-5ac7-4649-9c91-af6e1106af83','unittest_sport'),('ea181b22-fe95-4665-a160-e8b0f722561a','unittest_sport'),('edaf3d44-23cb-47b9-85a1-ea4779fc37ea','unittest_sport'),('ee095e53-767d-4115-afb7-02524cdc2bc0','unittest_sport'),('ee0dd3ea-494e-4e0e-9f87-ef38ba856b2a','unittest_sport'),('f49ac8b2-917d-4842-908d-26d580463a67','unittest_sport'),('f6d34644-d1f2-475b-bc9d-d901ea35cb7b','unittest_sport'),('f723efae-fc18-4b40-996e-376c2b96521c','unittest_sport'),('f8ce82dc-d916-4c46-a78d-9a4c7c7fa86c','unittest_sport'),('f9f75867-ba50-4e9f-93a7-e486b09df894','unittest_sport'),('fd7268b6-dc55-4bcc-9a2d-3157c3c6ad5d','unittest_sport'),('fef73d68-2f6a-4197-a679-1c14501247ab','unittest_sport');
/*!40000 ALTER TABLE `sport_kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_album`
--

DROP TABLE IF EXISTS `venue_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue_album` (
  `Sport_Field_id` varchar(36) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `uploaded_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `venue_album_idx` (`Sport_Field_id`),
  CONSTRAINT `venue_album` FOREIGN KEY (`Sport_Field_id`) REFERENCES `sport_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_album`
--

LOCK TABLES `venue_album` WRITE;
/*!40000 ALTER TABLE `venue_album` DISABLE KEYS */;
INSERT INTO `venue_album` VALUES ('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_155429388.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_155429388.jpg','2024-05-28 08:54:29','2024-05-28 17:27:20'),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_155429401.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_155429401.jpg','2024-05-28 08:54:29',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_155429438.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_155429438.png','2024-05-28 08:54:29',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_155527548.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_155527548.jpg','2024-05-28 08:55:27',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_155527573.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_155527573.jpg','2024-05-28 08:55:27',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_155527591.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_155527591.png','2024-05-28 08:55:27',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_160235252.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_160235252.png','2024-05-28 09:02:35',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_160704681.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_160704681.png','2024-05-28 09:07:04',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_160810894.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_160810894.png','2024-05-28 09:08:10',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_160956049.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_160956049.png','2024-05-28 09:09:56',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161114536.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161114536.png','2024-05-28 09:11:14',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161114546.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161114546.jpg','2024-05-28 09:11:14',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161114572.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161114572.jpg','2024-05-28 09:11:14',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161114591.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161114591.png','2024-05-28 09:11:14',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161210843.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161210843.png','2024-05-28 09:12:10',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161210875.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161210875.jpg','2024-05-28 09:12:10',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161210894.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161210894.jpg','2024-05-28 09:12:10',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161210922.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161210922.png','2024-05-28 09:12:10',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161235030.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161235030.png','2024-05-28 09:12:35',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161235059.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161235059.jpg','2024-05-28 09:12:35',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161235102.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161235102.jpg','2024-05-28 09:12:35',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_161235122.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_161235122.png','2024-05-28 09:12:35',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162457410.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162457410.png','2024-05-28 09:24:57',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162457418.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162457418.jpg','2024-05-28 09:24:57',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162457454.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162457454.jpg','2024-05-28 09:24:57',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162457476.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162457476.png','2024-05-28 09:24:57',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162532507.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162532507.png','2024-05-28 09:25:32',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162532539.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162532539.jpg','2024-05-28 09:25:32',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162532589.jpg','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162532589.jpg','2024-05-28 09:25:32',NULL),('2454c84f-51a1-437a-a396-018f0bd5c3e3','2454c84f-51a1-437a-a396-018f0bd5c3e3_162532602.png','http://rofif.my.id/static/pic_source/venue_album/2454c84f-51a1-437a-a396-018f0bd5c3e3_162532602.png','2024-05-28 09:25:32',NULL),('d28aa20b-d982-4b53-b56d-7307a4410339','d28aa20b-d982-4b53-b56d-7307a4410339_002959120.png','http://rofif.my.id/static/pic_source/venue_album/d28aa20b-d982-4b53-b56d-7307a4410339_002959120.png','2024-05-28 17:29:59',NULL),('d28aa20b-d982-4b53-b56d-7307a4410339','d28aa20b-d982-4b53-b56d-7307a4410339_002959130.jpg','http://rofif.my.id/static/pic_source/venue_album/d28aa20b-d982-4b53-b56d-7307a4410339_002959130.jpg','2024-05-28 17:29:59','2024-05-28 17:32:00');
/*!40000 ALTER TABLE `venue_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_device_id`
--

DROP TABLE IF EXISTS `virtual_device_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtual_device_id` (
  `id` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_device_id`
--

LOCK TABLES `virtual_device_id` WRITE;
/*!40000 ALTER TABLE `virtual_device_id` DISABLE KEYS */;
INSERT INTO `virtual_device_id` VALUES ('-;F6P3m9YB5vglQQr4XMdNIZO3wuW8.t','2024-04-19 00:02:31'),('-9PA802yu*7pM2:9fU72aoD/5Eqg>gOk','2024-06-06 23:17:53'),('-j>?=+p8SA:4ylN2yTEdVhm;)6Nw740G','2024-06-06 23:17:45'),('-Uwt7VrmJ/<;XUtMT9E;dka>kJ4BMPRX','2024-06-06 23:17:45'),('-z4jy0f0sWGlClJPWFF1DKR+v.?pkR<5','2024-06-06 23:17:29'),(',<U1qZ-7K;wS9y5=N3RDwyXhqdi2GnhV','2024-06-02 02:46:15'),(',C0RA1TJiiZ0GoXr<969+p,I=GHUI<2P','2024-03-29 23:59:26'),(',H-i)8pU6BVl:0=PTDxigh3.uFcwm1?S','2024-04-19 00:01:55'),(',l2Q<C)ZUdYk20i0xl.d9G0IKB7p+Q9c','2024-07-11 14:12:25'),(';60YlmIWQ*49*W7J,J-ug-=gJqFbE5dk','2024-04-17 23:36:53'),(';6qoqs1IQpJxF5RiW5KL-H9f6S12I31b','2024-04-10 02:21:23'),(';Dl8>*Y-q-(82:=6Ip5pViB/DlCM;qbA','2024-06-06 23:17:39'),(';WQi6StV41/4+Zqa3=GH)WQk4rL4O;/r','2024-06-06 23:17:30'),(':3Y,A?KV/7CDTx(YR8NZM5,dVvoOX6.Y','2024-04-17 23:36:51'),(':rDoo.Nh>:p6-04o95NkSQ?hHnX3cZ6s','2024-04-19 00:03:40'),('?bnc6Ip8L9hfL0xG0a3JYUwpD=)E/=jv','2024-04-17 23:36:53'),('?GYQsDT,6eq?zlO2W.8(7L,4c1=D.1yM','2024-05-15 21:50:25'),('?T59o0RXn2uaw(?/trhw;urk?he4n2c;','2024-06-06 23:17:44'),('.?Tlt3GV35R,JXe9s:-CgMLMfziMBIj3','2024-05-15 21:50:23'),('.+6vW)LRFcq41<L/SH591EVmIsv5Ybl,','2024-06-06 23:17:51'),('.Dv7TLlD,zVfKtEG11NT2m;/cWZSo6AA','2024-04-17 23:36:55'),('.QN1gtMZM(,3>U3hl4MUFXx-/ZG7g799','2024-04-17 23:34:31'),('.Xh,d97uw8pGja4NgU)=7y622cs(Ntt0','2024-06-02 02:49:20'),('(2rb>2-O>R)PClv57iTGmzLA9C3DTWtY','2024-05-15 21:50:26'),('(6DuxG0/n5dg91bkq;d+vnzujj./LYXt','2024-06-06 23:17:41'),('(FZ5ts/X6uR7nUDU909hPf3?h=o8xE0W','2024-06-06 23:17:31'),('(U5K610t5HJCI?Q560t-0Ezujg5qTg5y','2024-06-06 23:17:31'),('(xDgB.0mUuU2VLvh2Fg<D?.anvmn0LDC','2024-04-23 22:32:04'),(')?69?3H4y::G>FeQ2lzp.up90V..m4.1','2024-04-19 00:03:40'),(')=S(7U0t2Rea??ZP/ReIw28M70L>VEb1','2024-06-06 23:17:34'),(')>Vy:p=2uDB820-AK=v3o,Vbydek65t7','2024-03-30 00:08:20'),(')C:4btCO1c9ag7702L4BxXOlCi8G-h1w','2024-04-19 00:10:25'),(')H0Pu88iX359<21*80W35GcxmEN:Ra-O','2024-06-06 23:17:29'),(')Ot;5y?QRT0(9o5R=C*11;0po1X6bcLB','2024-04-17 23:38:01'),('*03206Ubr0+-6.i,f/*z-YX-58>0tcmt','2024-04-17 23:36:51'),('*076R1*z+zmGNj5y.1-P;+rcP1y3M*W+','2024-06-02 02:46:15'),('*amlwJf<M:tU2z?S9369qZ*1J8AqV+SZ','2024-04-19 00:09:05'),('*khIiFA7ob7hCxc2HDZ9R4rxp?l/PQX+','2024-04-19 00:07:26'),('/>21mbdChOD?ve?*4Jl4+h0e6.*pk844','2024-06-06 23:17:47'),('/zmfwBvdPR3FPoYW*mJn29F>Bi89VkJ(','2024-06-06 23:17:40'),('+>PircZJt5:?9.4wta=LZ9.1fCyc(r);','2024-06-06 23:17:32'),('+8ywEoU<R;n>rC0e6Tkhn5oLdwnHVqd3','2024-04-19 00:00:51'),('+9VOz,82?u.FckG9BdHexh-XqS=;zV3j','2024-04-19 00:09:05'),('+JdLmM2WC*HIu(:4.Y7DCIC8Kl?B;)rR','2024-05-15 21:50:27'),('+Rna+OiLa5r<J,WG(0z7V-48z2-xQSv-','2024-05-28 22:48:13'),('<-lliXOvc3AO9ODF65It43y7G)s33Nb3','2024-04-17 23:36:15'),('<ayEc+zk6rCzc:SG*G8SKeL(I,51(M3h','2024-03-30 00:08:21'),('<sKj8e2qo25WN44042AJQhVZVSbzS-t1','2024-06-02 02:49:19'),('=2XL8C*527d8B;BUwC:-rH8Mn9/3gotG','2024-06-06 23:17:47'),('=K517Q3X1sdVt0ISF0;OYe5mf,73PEZY','2024-04-17 23:36:16'),('>N*ue70F825Y(12-:19cV?24qd>leECx','2024-06-06 23:17:55'),('>x8k14ewli:<n6aI75fT.HzYl0Lob6RR','2024-05-15 21:50:22'),('0-ySK8eK52c:UYk62*kL.7oR5LroHXp?','2024-04-23 22:33:01'),('0:+?P/rvB6+oi+9O1v3Tv)-JT4pnrj2K','2024-06-06 23:17:47'),('03m2F7hlLce4Ar?qagT?2M5Uwk78L/*3','2024-04-17 23:36:17'),('0DhT,gf*OE4fX?yDXvz=/tg36wdFBc-t','2024-04-19 00:05:33'),('1-q9=w6yQHa9?A2:/Yxn3,7i396R23/8','2024-06-06 23:17:29'),('1?2q/9iTHuio+2=D9c6It9+L7ZPG.Ds;','2024-06-06 23:17:42'),('1aJnQgnB23tadYoI?i1daIHmdP47u7Ja','2024-06-06 23:17:50'),('1F:ZK19?unRVG,itsuxf5aIyqRA2moBJ','2024-04-17 23:36:54'),('1O=LM>6v8X2Wn3n.RP:piD36d;Hxp4J1','2024-04-17 23:36:51'),('1QC(37N9E=V4?N6OHItSB:13E/YNH3.,','2024-06-06 23:17:53'),('1s8zaihv6B<TRf917:vXz5clt;E.jzR0','2024-06-06 23:17:40'),('2?ey3o73M5V(mmjPEKxLn*d=Xz075Wxi','2024-06-06 23:17:27'),('2+9d1aLtpDI5tLOV;1f5t:SEfK,=q)p>','2024-04-17 23:36:15'),('29KEqUPjj0WNc49nlmK/IZq1vaS)Y2QM','2024-04-23 22:32:05'),('2B4<?C8=dN3ys4cv89ArQz0uJzew7DRi','2024-06-06 23:17:45'),('2CPh/gaI3=G5yI6Egj4xl8(Z+pjNZ1yj','2024-05-15 21:48:54'),('2DOAAqBf8y>np*45VePRX5NG3./2JHh0','2024-04-23 22:32:05'),('2IhC70CX=UyEaCe?l9YO;L0nW95U9e7>','2024-03-29 23:58:51'),('2L02DVCKy3h<)?YXnx;iT(ZponE+;75V','2024-06-06 23:17:36'),('2z5TrEIo1BJ.ZDW50Ig5Cr.CUNc5HiV/','2024-04-17 23:36:53'),('2zn2Fk<6t6QqnNMEiSpMOBB552NRbVTO','2024-06-06 23:17:38'),('3=-xh.cZE-qby6lNsBjK5eyILT81>=h4','2024-04-19 00:05:33'),('3=NGs?w9*G73*jry?50eyI=C1Bvjkfrb','2024-06-06 23:17:43'),('33:zCT=NzRcDiS8)pxbZYb1;D1497c+h','2024-06-06 23:17:50'),('34/JXU6X5+91Hlt4r5euirY87Xjmem=L','2024-04-19 00:07:27'),('37EpbP)=4:0NO1u443,gYGulY4/1MN6T','2024-04-19 00:10:25'),('3fUFeaZ9?,:h1ofBZ?sf*9*R3FIIQoF8','2024-04-19 00:03:40'),('3rEDby*<04(mBtwcs),4y1ICiQE7g9>i','2024-04-19 00:05:33'),('3rwu5/w3AH2r<nvntwciyvRDk114PdQT','2024-06-06 23:17:35'),('445V:06Z+Ki>2(B9,J7n+-40:<IlR9g8','2024-04-17 23:36:18'),('44MX6Z-T;))IoUmJ;9V4GLp?VNAM12zF','2024-04-19 00:01:54'),('46R5RTo>q<V3z5SaTky99ufkf2e.ZVj0','2024-05-15 21:50:25'),('4B2MwdpKl,ZZ6>rzcOksr=18?t5Q5D=h','2024-04-17 23:38:02'),('4O9*wPm6Tploot3ZeXmlO7S1U-l7ypn-','2024-06-06 23:17:40'),('53me66dXbu6hAD7Zx9Y2.5oB6s8=u3pp','2024-06-06 23:17:27'),('57)5xy*3s:5B517pkPF/GaHqF(?SZctg','2024-04-17 23:36:53'),('5a7+Udj(Xkv:x4Ju.4S71*ij>=5Tq9)i','2024-05-15 21:50:26'),('5a8<<CWG5(cyQ7s)7p666QWZ.t.y,p=j','2024-06-06 23:17:55'),('5EX747Z-7=yc=jL5gY5G6Dq.5dFO-P/k','2024-04-19 00:02:31'),('5r?fj,kKHbN0:5*b=TJ0s3P12C,aVPr(','2024-06-15 12:37:01'),('5S6Hxr*8ch325q6U19t6wDn/RR93q27s','2024-04-19 00:02:31'),('5TFf?6*Iy91xB1Cu;YunNCV1v=cx1/c5','2024-04-23 22:31:36'),('5xWBJ3815/)b9v-2yP68B4KlgGDcj5kf','2024-06-06 23:17:32'),('6+7Q9QpZm29IPqgn4e8zt-9?3,VMMlmT','2024-04-17 23:36:52'),('6EF76cmybN)Xg0QbhcjL>jylQh4C?/Qx','2024-04-17 23:38:02'),('6FR9m(92YT1(*eyD9KnfT<X*Piub3oM4','2024-05-15 21:50:25'),('6H.sec3SGL=T/RMfT8bvj4*)b4C/?<sO','2024-06-06 23:17:48'),('6H0ZFb7X8JNO*8NGr5M((mKKkD<v999<','2024-04-19 00:03:40'),('6k+q6Sy-9NU8Ipsv-=V0?e,-:(H9t4+/','2024-05-15 21:50:19'),('6tPAr0R75t,M?*3vJR-r*5hWc0)NLFA<','2024-05-15 21:50:24'),('6ulRx(2j=.HH2a4KwQ>S/nXT2mNP<N>v','2024-05-28 22:48:13'),('6Zf8Fj2+1)<-P/N7K5dk9(>yg=-/0Rga','2024-04-17 23:36:14'),('72(z2VM5/76HN3lVG0P8132;u51mJNNM','2024-04-17 23:36:53'),('7cTt2FSSm400ug-e)Rwn7kcKpdF3h:1:','2024-04-19 00:01:55'),('7H-IcL90ZB60u21FL7Gd4W0W07a6-k-I','2024-04-19 00:01:56'),('7lwK48<ysB,>-c8bk.1)EJ7GDy;85YI+','2024-06-06 23:15:37'),('7XHpLqEF;ZVq2ucu=3T92Tpg?(ZfamXC','2024-04-23 22:32:02'),('7xxUx+bI,Wqd,dOO3Cybm(l:,63-4O1E','2024-06-06 23:17:44'),('7z<=>yuKBg,/14AalQ2ydJM6uZN?3QPT','2024-04-23 22:32:02'),('8/WT(3n>JesuIhu4*I0D6dcJBJE-FibK','2024-04-19 00:01:56'),('82vZl/p3<us6U1oepgWapa7-l653A1F?','2024-04-17 23:36:50'),('82W60Ds09C1rVBcJa8eLYc4M4op2PQJh','2024-06-06 23:17:49'),('87)3B;:j<m<9;5?*9J2<SC70qT3L121Y','2024-06-06 23:17:32'),('8Agw1m35Qf8otb,NB2WJib9y9Bqh1e7X','2024-06-06 23:17:36'),('8t3gmx+9Gk/*zMu80:41-YkCchx9F,:5','2024-06-06 23:17:32'),('9.1TiHCQC8vf5Yypl2WEa,*Dgma1k5gk','2024-06-06 23:17:28'),('92A5N<4HQ-LmK2F9d*M1)CTRBF.IT.58','2024-04-17 23:36:18'),('94BrFl+pq3o;38+,9s(i5m88,J+Ts51j','2024-04-23 22:32:03'),('97fQGaekO)2Gjz41ckw<mr7Qs+6f7.S,','2024-05-15 21:50:24'),('98p7is4nnN/DM*.Ni.f2FVrF;77q95G(','2024-04-19 00:01:56'),('99cV5HW=t,E(lZKbRW5p*xg-rI9T>W8Y','2024-04-19 00:09:05'),('9G0-3Zp:IoV?Txd7?QrX3n8Tsj:V6v.D','2024-04-19 00:02:32'),('9KjI4UU/Ha33;sSGxfApV/-9nnSk5eoA','2024-04-23 22:32:04'),('9M*8Zh0Q7QtFn5ck98e+1n:Z>TtH7dmu','2024-06-06 23:17:51'),('9p91Mip<x7D?-;wwi1B1.T?(7qd9M0tY','2024-03-30 00:08:20'),('9rvlz/zISG1rrA1Y4mC?q2nMJ8mz1OZ.','2024-06-06 23:17:46'),('9Vj7<55HixDW*5DmOP8Lc.5f30.UDy*1','2024-04-19 00:05:33'),('9WsRH9wRHag7Rrp9ojdRX710Mao*+:?,','2024-04-19 00:00:52'),('9ZkKq1,ZR<Dj0POzx18(8b6C8grS+6li','2024-04-19 00:00:51'),('aS/8c)2*5s5ivcsQNeTDO3?W?nbr82Ja','2024-06-06 23:14:22'),('ATPMN>L1Ie=06b<1.zGa(38)zBFlkXk/','2024-04-23 22:32:03'),('Ay3Zb2(YA3>Rl261kMs9mbAq*3X9VU*0','2024-04-17 23:38:01'),('b77m;Mx2*y4.MTk4rM1Pl6s1D2523NAV','2024-06-06 23:17:43'),('BjXG7u2mNF.,*e=qX3;vD09l2Ld2.<0t','2024-06-02 02:49:19'),('c?ZZQ<A;CccQcp5t71JgcdYjkm6x>89z','2024-04-19 00:09:05'),('c5zzO>U).IHQ5tCgq9;.5Xgm<*qyS+(1','2024-04-17 23:36:54'),('Cb1*fKU;cY.Lac,S2Qh0babYJ6JeHZ8i','2024-04-19 00:03:40'),('cGrQNuDBIvH:,>8AhhD)+4uQF73d4kSd','2024-04-17 23:36:16'),('CJsCz3hk)T3fQc>+l*ZI3CCrb0+P1OwD','2024-04-23 22:32:05'),('Cw8<J30lgdu?g:;lG9BZ<tlZ+N*tygbA','2024-04-19 00:07:26'),('d=pn/9GBsHgpvH,3f6.rd6=PNUbD6e?A','2024-04-17 23:36:16'),('d1n*LoBC(7We+b73aJg*639s9wLyN<6f','2024-04-19 00:07:27'),('dhr)sNK1b6wAW<A56DJvK;,PA90XEX7e','2024-06-06 23:17:47'),('dkm1W6G7MCqRHOW0>VG9m2+JeFEd61SP','2024-06-06 23:17:37'),('dL2TF5,,0AO7bZ>1/(oi(rd-EXCThFEO','2024-04-17 23:34:31'),('Do8P<i5t7u62(G3ToQ,J-0)K3IYN8D0b','2024-06-06 23:17:36'),('dshIZtqu7TA7ASB60oYo5d5W3X8fu,11','2024-04-17 23:36:50'),('Dugu6Ms9,?+0C/QYE1JGpWl8mXWX,jz,','2024-05-15 21:50:21'),('duj),(KF0iXQ).281v*2bh,letT9gm56','2024-06-06 23:17:27'),('dwNUk<BQq):*qa)QgX7,FBr2vQ1MSi;C','2024-06-06 23:17:46'),('E:6dCBZH*8ABeBum(f7ECaDVtV<7B40O','2024-04-17 23:36:14'),('E?P*SSF6/3,s4o9R)XW5V3wvtj>HQ0:=','2024-06-06 23:17:49'),('e3:zJO6GVCpMM1nqjwoObxCw1MK5F;hh','2024-06-06 23:17:39'),('e8YE8qvdIh-48=g:O3udWipLy5wfCnCD','2024-05-15 21:50:26'),('eVWamEkXZhIKrNfa,fS(VE7R20Y)T55o','2024-06-06 23:17:48'),('F,TlmgE+6sR,=y.U7SUGc2GF7j7T8iAM','2024-05-15 21:50:21'),('f)9p90Rx)?Bg2:1z:6KD<,U-4QF45pWt','2024-05-15 21:50:22'),('f/y3Kg*1r9YJBZ02sWGU3RZ6SmorebA(','2024-04-17 23:36:14'),('f2:3v7rA0ki.DuKEPg-9-C9=(F:1QIk?','2024-04-23 22:32:05'),('f6W7Av(L>k)u)o3=O8R+I22Gp1;8v:+*','2024-04-23 22:32:02'),('fC=i<sjG,<eMqSke0yCkJ2B58jd:3959','2024-06-06 23:17:30'),('fsHWW,g/CpO65nW+82I-(w0nbs0YGq=B','2024-06-06 23:17:49'),('fZR9WqC,Pms0b3ADHZN?-*2SI7?AG8oi','2024-04-19 00:12:49'),('g)Klx>c17J+A3n0f7d2O6q-+7WlgYrXF','2024-04-17 23:36:54'),('g*?Sq3ufoX5UYcA7jSn0VOt>11P;,6U4','2024-06-06 23:17:36'),('gj-f.tG)E=rVZW99uJ,VtQKS8.B,5OYG','2024-04-17 23:36:18'),('GmM<2x/3CQVwlECdxoB4TmdYQL5u(Je1','2024-04-19 00:09:05'),('GMY;O6eTFNYHA5fDoaE3i7Y,B77Xvt8O','2024-05-15 21:50:24'),('Gt>fK=2gG9,z?4=0PlTj/hB2d?0U:?0C','2024-06-06 23:17:39'),('gYK)gt8o.7OWeVV1MOu>X58F/1E3L-D.','2024-06-06 23:17:41'),('H)9E8BpCzu6g0:u7YtN<9;62OAes76iu','2024-04-19 00:12:49'),('hb-M/R1RSy6dj51*uFd**9j6LgU)oWpx','2024-04-19 00:12:48'),('hF?4mC*Aj9C/0:,jG5MeM9*<S=->7K6T','2024-06-15 12:34:17'),('hkbAu++2jpy5mVN1rJ2FvdMr83=,9MB7','2024-04-19 00:12:48'),('Hm8nXZ.F*28,1-28ri1QAq8+qfG1/hWE','2024-04-23 22:31:36'),('hqq2djAo;5co<53<=LiMF+T:1?EeV=yj','2024-06-06 23:17:48'),('hSY)m:MOSA.A350qjoXm27)m50=;ykE>','2024-04-17 23:34:30'),('HwiXDn24C61avyF17Q>aORK+413H=7Mx','2024-04-23 22:32:04'),('Hx?utJ/l>wt>eUvm5oR*CRT.2DO:36nD','2024-06-06 23:17:54'),('HxgRhuzCY-1Ben6>wZ/5Ntvw3mUA5JvO','2024-04-23 22:35:28'),('hZwwD77Y.RXrrFYmjdf=dtPGI923a>i4','2024-04-19 00:03:40'),('I+Mb2:MB304Q9YrWs;:2WcAtXp6J93.,','2024-04-17 23:36:14'),('I0JWD:<5CcAPd*OX632,VZAv<J24fW88','2024-04-23 22:32:06'),('IB5?23CJMLRX2Hk/)QfNa10Sp445(QJ3','2024-06-06 23:17:36'),('icZ/y8q1167/s,85DfUb+94CG>?nBfX3','2024-06-06 23:17:51'),('io5=0dcLJVM;<X6gorVhCKzxb3Ofm4Hu','2024-04-19 00:02:31'),('iRZ)*w/lPMeE8>ABb,x9epW6U9ubLahl','2024-06-15 12:41:41'),('iZT6:j57(IWzmB5:HAIlN3WOWFTgESjE','2024-04-19 00:01:54'),('jDHFAlr3QOZo542HUyW9VVh*0xjj+y5V','2024-04-19 00:12:48'),('JI.Q98*4y6F(N8/gaPN6Pj.??b49SA25','2024-06-06 23:17:34'),('Jjtj2QSfbb>;7i>4bXT*KCG<QegFgQ4N','2024-04-17 23:36:55'),('JK:2sV0S+8G1NQkaj-GaXxI3)>/)j9Mu','2024-06-06 23:17:33'),('JYnL0vM0o/bV4JGS95qhuskls<+T:PIc','2024-06-06 23:17:52'),('k0ljQzc3mdr;BIH-327OaTOj?ICKjtgW','2024-04-17 23:36:51'),('kAEb3-A7I<cD8hF<fSKDVN)yyP1z54DG','2024-04-17 23:36:52'),('Kn,9ir7K)KO?Ev4zA9GV0kuI:h8A1oQ0','2024-05-15 21:50:22'),('KoO8<b6U>4T44-Ks:P.2yT8R146Q-y6c','2024-05-28 22:57:55'),('ktGOy-N1</t?VBNKt<N5colN1r0zIZDc','2024-05-15 21:50:23'),('KuYk9W?sb(A1qx,k83qVjvUxSdopjK+p','2024-06-06 23:17:52'),('Kv,qSW68ysZ(R+T8h)5HRdP.6X939.vG','2024-06-06 23:14:22'),('KvG=J)73,(ppKPsM)(X.d.8F+:W7q9bD','2024-04-17 23:36:15'),('KZf=sd;lBzsNO+<=dPi8LWu4<o<-km*N','2024-06-06 23:17:42'),('l3k(+3C9X3c9v:G*CvlG0(<eCJ7+P2zv','2024-04-17 23:36:52'),('l8+;a4rmaF*7S>w>yAq.?h:9/2e9>55Y','2024-04-19 00:02:30'),('lcPlZ7ym6(Ewaeog+/3)9DV)Rd+*7yj?','2024-04-19 00:07:27'),('LI90dQ-HDyWxPRD2n8R5eIng6:j0A0a9','2024-04-17 23:36:17'),('Ljx4ZiIln4?HF9I+8a60+Ym8JBwCvhK3','2024-06-06 23:17:38'),('lO5w.1-QT*8Y5EuSx7:8j0tqaYD5KdTf','2024-06-06 23:17:26'),('lsf5vjtXsDx..)E9)J0q2/X75Z.-IWs-','2024-05-15 21:50:20'),('lUdpZK6a6Ne1y(Owc-ePPp;fQ(DokbLs','2024-04-17 23:36:54'),('LUkVj,Q?INeQ6At35vWp0Qnz?A.4/J7:','2024-06-06 23:17:52'),('m,jf<lZKh.utbo0u=lV,LbKRLoQT5lo<','2024-06-02 02:46:15'),('m+6ApBGfmpLeI?Zl8obiQ.HeGt5NI2Pz','2024-05-28 22:57:55'),('M899-2tg56Mk1J35RR/KZXCio11=7g9R','2024-05-15 21:50:22'),('m8n3qojaLmW?h02j0esfHJ;dHn0;yDT+','2024-06-02 02:46:16'),('MbPdlp),S,,(uD(+/<S.q-5YXJt/ZP4n','2024-06-06 23:17:26'),('mmrGcLZvmZ:><lvHmXE0tP<QrXn0qi>n','2024-04-17 23:36:55'),('mO9Jk6TxyuFyI8lg4-c6U4h/?D>H)V8)','2024-04-23 22:32:03'),('MYHLFbamR:5aU9SGwK(9XNchXOq9i8.-','2024-05-15 21:50:21'),('N0nD8+x9owp=NJkb>HO,25CdxiBD7+4=','2024-06-06 23:17:28'),('N54TPK.4MGeD8dE<;sLA9mY?XAk3adsu','2024-06-06 23:17:52'),('ns03Vy983AiEBVJfs2Mi+MVko8*<1f1q','2024-04-19 00:00:52'),('NTP2?rNs>BfOQR/0<uzWg8u7i76U0w7E','2024-04-17 23:36:50'),('ntu5.,;vdhTEMAw96DM<q-k362CD*4TX','2024-04-23 22:32:03'),('nx,;wX)Sl221hkq<K,cl=1WGq6Q-4Y9e','2024-04-17 23:36:16'),('O+O3DsJedjC20P97MvM5O2l4ET278mj8','2024-04-17 23:36:51'),('o115-gDQm*4aGtd0Jr8D1w1V0:4g0zpR','2024-06-06 23:17:44'),('O4p1jG?.NP8k0G:bwVpD:HRtWu*atAM+','2024-06-06 23:17:42'),('o6Fb4,)9BXc:/9voSpH8Ew1U:pA1DOZ2','2024-06-06 23:17:34'),('oF=U;pF8>B111D1lp0zlGXs.rv011n3r','2024-04-17 23:36:16'),('OI4-k9FGWn>14D7d.MiZ89x=4my,.VeB','2024-06-06 23:17:38'),('OMOPaP79V>35Cb*8jji=<Sc+ws9V8.T+','2024-04-23 22:32:04'),('OZmIXU9qZV92.3(9nk0k:HHruxE-oN6a','2024-04-17 23:36:19'),('ozvBuu6vVCBiJHsbY)1ywQr?()E;?Q30','2024-04-23 22:32:03'),('p;Zwm.-I33k6=hhfMOyWJ5=031mFq0St','2024-05-28 22:57:56'),('pBMl-j8TR+9B?OQQ6JL31aVI97c-K81r','2024-05-24 07:23:57'),('PdzK5,CGC74h1Leno=M76dgCPaN0G1L8','2024-04-17 23:36:19'),('PE9H-9yx-=347IenWH/32WA67YfOP;L2','2024-06-06 23:17:33'),('pEgv*yFl8/Ssg9IH20t=-uk?1ltkmF-3','2024-06-06 23:17:45'),('PqE>)(K>:z1>*j97rH4M;<cLl2XrT9W7','2024-06-06 23:17:53'),('prp:WH4nG2;4E7gHC34XWKUY,GPrXoC?','2024-04-17 23:36:17'),('q(xTF5)?Q:<=zBG:,aBi7E69B195E8fh','2024-05-15 21:50:27'),('Q*be:F6UYg5xX7D8FE4c3ME=ww4I/9-z','2024-04-17 23:38:02'),('q5ou1+Zt<7HXm35QdO*2uBdHBmv0Tl2B','2024-03-29 23:58:52'),('q6Oo4*5A(hIG=u0m?Fdhb0180hTPslst','2024-06-06 23:17:44'),('Q7T*yb3il+yJ5c<d?87)f3>6y/QE3Q51','2024-07-10 23:02:48'),('qBN*6k)qf+2r;/5>4g(0Agr,3OgD)4z2','2024-04-10 02:21:23'),('qg?0A14Fmq5T)f.oSSpBtUXo60;s?.2T','2024-05-29 00:04:01'),('QIWn6=qULe6055(k7T<dH,mRnotx*Lr*','2024-04-19 00:05:33'),('Qkum93,1F>f<N1;WcJ7?B>r4ckzm5JOn','2024-06-06 23:17:30'),('QPBTI=/e6V3R.bGe5;i2>2ph.I05ONC5','2024-06-06 23:17:46'),('qUmag;1ySUFi?5M3O+8.rUj?x4PTS76z','2024-06-06 23:17:54'),('r**ya1qCS*S/93*J9rW6nPb+S+V*V9s2','2024-04-17 23:36:18'),('R3H?75Y;Q6O06Yet?Atrf?2U)t3ous<e','2024-06-06 23:17:35'),('R6S0W0C9E-bZ3vRBi/K6G5Teh0?ZS+V=','2024-04-19 00:07:27'),('r9plDa8.4l53y2.N75spFnXHrcv11b4B','2024-04-17 23:36:55'),('RC(5Jwy7jiW3zERfCl5ji843EDI<yI63','2024-06-06 23:17:51'),('Rem6?qi,930(SGhPpXNwCKCn5sM3jwev','2024-06-06 23:17:50'),('Rp7>tl+950rVS)6IV9?/n9pmh8U?XO28','2024-06-06 23:17:28'),('rpTGaa3MXgLRSu06n7dXMjUX::Y3FSE1','2024-06-06 23:17:27'),('rwvIAcpZTCHtky1Pi7KeK48CsUi22xl0','2024-05-15 21:50:20'),('rY)V0UsNHidR2PImPI6dw.m0woT0.287','2024-04-19 00:09:05'),('S2Ip=*k87s85F745A7U>?nA6K>9LM894','2024-04-19 00:00:52'),('sCBnqpBMkKUClj>L7m1Q,c4OmDe+aB/h','2024-05-15 21:50:27'),('ses-Z=Yd4A8584qJ0569Xf3L)0i;5qU<','2024-06-06 23:17:41'),('Su?1HQO8dqZhm)70I/;)j2LLcV3WwS<+','2024-06-06 23:17:43'),('Sy1?MOx7E/t-70U2ubAvNC.cygBB95lH','2024-06-06 23:17:35'),('SzKQSAt8Cl=Q5Ouw8.2,3Re124-6+NP;','2024-04-23 22:32:05'),('T-X4mwCpWdHB4(oM1zfA>1xam:AhQ<UG','2024-04-23 22:32:04'),('t?n1oI3x;9.jHnv(m93W24EZZz3<0mfI','2024-06-06 23:15:37'),('t+NxCadV9CzrA4FF>I;I>57rDx8M1S64','2024-06-06 23:17:33'),('t<2*bE5lqi(;1;4>=ljblSSo5Hkde60,','2024-06-06 23:17:54'),('t72tjD86<8,815JfIq.A>W/89i2E6>nV','2024-04-19 00:10:25'),('TG2-laE3<=EzvjgE0i7qA3gwTv=cD8:o','2024-05-15 21:48:53'),('TL1xyPT2KGDZs3eN2yeY0)78axYqeLH4','2024-04-17 23:36:15'),('tS964tJfYTr8T39R34KYrxBU>+8<TbcC','2024-06-15 12:40:52'),('TwHs+lZvoL2mPmbca=MQVU?dX7YM91EN','2024-06-06 23:17:53'),('U,(jY6fw443p,ivN*lrT1r0aDQq)*9Qh','2024-06-06 23:17:37'),('u5QS0qMmsg-A7731Qt*qPK9(*<535H+C','2024-06-06 23:17:37'),('uCeQ6Cwaw;9;4136W;2U?0hIfIJu1+y=','2024-04-19 00:01:55'),('Uht6V+k)o101I9.7?ItT,R>g0+XtrTH4','2024-03-29 23:58:51'),('uoE(w8w133o,03:1x68871VyG/5am2F)','2024-04-19 00:02:30'),('UV<qPL87zXL3l5m8zYZW*.Q=j10gK3Ck','2024-04-17 23:36:19'),('UX:crfq2G5tEmPIL;ABBLfmUg-Ug3p4=','2024-06-06 23:17:30'),('uY7Hyk80c=wcRGJI6h*F7G28G6MDDsDR','2024-06-06 23:17:37'),('V()SssV,b58AT4MIkXTGys1h-hA-Vf(u','2024-06-06 23:17:39'),('V4IUy.U(5=8U?Wm0c)tLZHPuiMu;WTe*','2024-06-02 02:49:19'),('V9674aX9w?42-(5S:0W9Y0rZF8Cn(.G6','2024-06-06 23:17:50'),('Vc=Sb:V4<Ts>tt-2Pg3Y1Luo0ea=1=7k','2024-04-17 23:36:56'),('vJ6?1SB7u8/EzM19w?-QqN)EUbHxv430','2024-04-17 23:36:17'),('VkV;4L,V1ea/q60Ykz68D7kAB159dHSE','2024-07-21 23:57:00'),('VtubqmI2*:M2qUXllDqX->VV?QrHBcfP','2024-04-19 00:02:30'),('w+6pny1/hSgLF(wq*bE277)4I>81rum9','2024-03-29 23:59:27'),('w55PmYsFT:(B,1Gi7D6wr77e9x(iY?7H','2024-03-29 23:59:26'),('Wvc9y)H4L:;n8bSW9.8(MwYTZ)S2Y1iK','2024-06-06 23:17:37'),('x-.7F9Ag31LK76bca5Rn3NdTjcqN<f0n','2024-06-06 23:17:55'),('x;FzXi89Lmoy5gDq3agi>K:VZZk,6FZ6','2024-04-17 23:36:52'),('X5u63:>rq27ShJKzQO:9?sZEoev7YN:9','2024-04-23 22:35:27'),('X5u63:>rq27ShJKzQO:9?sZEoev7YN:9','2024-04-23 22:35:28'),('xA*tX8RA=Y04K995akVlT7.CMp6UMbkP','2024-04-19 00:10:26'),('xaqV0Fhwxls<)L5ze>b:lyeCflt()kQN','2024-04-19 00:00:52'),('xC25x)7)=u5Lu98:2w8-m3v4<DxONGFs','2024-05-15 21:50:26'),('xDUxeoqcJ;9oua041<223wqQ9S1>dq=Z','2024-05-15 21:48:54'),('XE=3g8Pen2AZs51PQtFI;-5rT8x*8odx','2024-04-19 00:12:48'),('XJIUHK4Y8B2;Jsoq9D?qd3czi4vm=UuK','2024-06-06 23:17:34'),('XkPG5dY53x:UXH>5Ff1xn7(91-JNXkEv','2024-04-19 00:02:32'),('XwP,Wo:7SK,g5euU0BZKY91=0o-n(46o','2024-04-19 00:10:25'),('y1):tX0+IWAphS/+O2Yb3ag077,bMc4v','2024-05-29 00:04:01'),('y9MoA1l4Ae?5W(<vYn2naH9675;Hs8c:','2024-04-17 23:36:17'),('Yb>LnzMg/si+r)XL;6UQ0Dt4W8Z+uc46','2024-06-06 23:17:40'),('YF37hYGB;bZH98jhn<80Sjl8m2*d31>6','2024-04-23 22:33:01'),('YgkOFlXcqJRE5139-8092a6*r>7A1:Jv','2024-06-06 23:17:36'),('yk:.NBP/UUTIFgbxo-3*(yhP(s5h0M24','2024-06-06 23:17:38'),('yOIU4Aq/2Twd=I4cp0PCEadt4s0s6K<N','2024-06-06 23:17:33'),('yWi=3GftWVm:RiGj2xvcdED9w;>Z=7d)','2024-06-06 23:17:49'),('Yz54yNu4AkWXyZa=pZM<swR7I>b7il3<','2024-07-21 23:56:50'),('Z,4B<dIn)Ya989t+,f;4S)8*=/IA),AO','2024-04-17 23:34:30'),('z+=b09MzE6<Tuw)v82jf=h0Grn(l1Hg,','2024-04-19 00:01:55'),('z=/PQfgTp:fs1RDm,TB1+ia?al4JtG.L','2024-05-15 21:50:20'),('Z4nEgoT08dZ+QV;=9w>20cLYZ+=Xc7TA','2024-05-15 21:50:23'),('z7xYh)qU7QX7<4WE95PY6zEGX8Imqkh6','2024-06-06 23:17:41'),('zaCnizcJ99j37oB2gzEy<*g+gVpy61bB','2024-04-19 00:10:26'),('zbrd747OryXNpW>Y:2iC0bd/OEQ2ul.-','2024-04-19 00:01:55'),('zCQKyBiaI6XaeE2aidq<Wk,tRDx2Gnh2','2024-04-19 00:02:32'),('ZE/3H>L6L1-+5.7:5F4Zp77zR)s6B2wc','2024-05-15 21:50:21'),('zjc3g(Z)I>1eB1P56+FbDs8VJwu*9VY(','2024-06-06 23:17:31'),('Zl4a*CNV8vXB3N5YDx2dUi3Z95kr(3/V','2024-06-06 23:17:41'),('ZzLg:Jd9P2Gbu1Mu1Ab?D374/HGOr0hH','2024-04-19 00:05:33');
/*!40000 ALTER TABLE `virtual_device_id` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20 10:29:43
