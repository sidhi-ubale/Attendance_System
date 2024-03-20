-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: student_attendance
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Kishor Kadam','kadamk33@gmail.com','kadamk33','java@1991'),(2,'Sagar Kharmale','sagarkharmale88@gmail.com','sagar','sagar@123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry` (
  `inquiry_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` varchar(400) DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (1,'Kishor Kadam','7276763516','kadamk33@gmail.com','We will check and solve or update your issue','kishor'),(2,'Arun Pandit','9011540658','arunpandit89@yahoomail.com','We will check and solve or update your issue','arun'),(3,'Balasaheb Kadam','9423755823','kadam.bk123@gmail.com','We will check and solve or update your issue','balu'),(4,'Aniket Kadam','7734521200','kadamk329@yahoo.com','We will check and solve or update your issue','aniket'),(5,'Kishor Kadam','7276763516','kadamk33@gmail.com','We will check and solve or update your issue','kishor'),(6,'Kishor Kadam','7276763516','kadamk33@gmail.com','We will check and solve or update your issue','kishor'),(7,'Kishor Kadam','7276763516','kadamk33@gmail.com','We will check and solve or update your issue','kishor'),(8,'Aniket Kadam','7734521200','kadamk329@yahoo.com','We will check and solve or update your issue','aniket'),(9,'Kishor Kadam','7276763516','kadamk33@gmail.com','We will check and solve or update your issue','kishor'),(10,'Mayur Mahale','9028990955','mayurmahale04@gmail.com','We will check and solve or update your issue','mayur');
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_attendance` (
  `student_id` int DEFAULT NULL,
  `attendance` varchar(100) DEFAULT NULL,
  `system_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_attendance`
--

LOCK TABLES `student_attendance` WRITE;
/*!40000 ALTER TABLE `student_attendance` DISABLE KEYS */;
INSERT INTO `student_attendance` VALUES (1001,'absent','2018-12-25'),(1001,'present','2018-12-26'),(1001,'present','2018-12-27'),(1001,'present','2018-12-28'),(1001,'present','2018-12-30'),(1001,'present','2018-12-31'),(1001,'present','2019-01-03'),(1001,'absent','2019-01-04'),(1001,'present','2019-01-07'),(1001,'present','2019-01-09'),(1001,'present','2019-01-14'),(1001,'present','2019-01-21'),(1001,'present','2019-01-25'),(1001,'present','2019-01-27'),(1001,'absent','2019-01-28'),(1001,'absent','2019-01-29'),(1001,'present','2019-01-31'),(1001,'present','2019-02-03'),(1001,'absent','2019-02-04'),(1001,'present','2019-02-05'),(1001,'present','2019-02-06'),(1001,'present','2019-02-07'),(1001,'present','2019-02-08'),(1001,'present','2019-02-11'),(1001,'present','2019-02-12'),(1001,'present','2019-02-13'),(1001,'absent','2019-02-14'),(1001,'present','2019-02-15'),(1001,'present','2019-02-16'),(1001,'present','2019-02-18'),(1001,'present','2019-02-21'),(1001,'present','2019-02-22'),(1001,'present','2019-02-28'),(1001,'present','2019-03-02'),(1001,'present','2019-03-04'),(1001,'present','2019-03-08'),(1001,'present','2019-03-09'),(1001,'absent','2019-03-10'),(1001,'present','2019-03-11'),(1001,'present','2019-03-17'),(1001,'present','2019-03-18'),(1001,'absent','2019-03-19'),(1001,'present','2019-03-28'),(1001,'present','2019-03-30'),(1001,'absent','2019-03-31'),(1001,'absent','2019-04-01'),(1025,'present','2019-04-01'),(1026,'present','2019-04-01'),(1027,'present','2019-04-01'),(1028,'present','2019-04-01'),(1029,'present','2019-04-01'),(1030,'present','2019-04-01'),(1031,'present','2019-04-01'),(1032,'present','2019-04-01'),(1033,'present','2019-04-01'),(1034,'present','2019-04-01'),(1001,'present','2019-04-02'),(1024,'present','2019-04-02'),(1025,'present','2019-04-02'),(1026,'present','2019-04-02'),(1027,'present','2019-04-02'),(1028,'present','2019-04-02'),(1029,'present','2019-04-02'),(1030,'present','2019-04-02'),(1031,'present','2019-04-02'),(1032,'present','2019-04-02'),(1033,'present','2019-04-02'),(1034,'present','2019-04-02'),(1001,'present','2019-04-03'),(1024,'present','2019-04-03'),(1025,'present','2019-04-03'),(1026,'present','2019-04-03'),(1027,'present','2019-04-03'),(1028,'present','2019-04-03'),(1029,'present','2019-04-03'),(1030,'present','2019-04-03'),(1031,'present','2019-04-03'),(1032,'absent','2019-04-03'),(1033,'present','2019-04-03'),(1034,'present','2019-04-03'),(1001,'present','2019-04-04'),(1024,'present','2019-04-04'),(1025,'present','2019-04-04'),(1026,'present','2019-04-04'),(1027,'present','2019-04-04'),(1028,'present','2019-04-04'),(1029,'present','2019-04-04'),(1030,'present','2019-04-04'),(1031,'present','2019-04-04'),(1032,'present','2019-04-04'),(1033,'present','2019-04-04'),(1034,'present','2019-04-04'),(1001,'present','2019-04-05'),(1024,'present','2019-04-05'),(1025,'present','2019-04-05'),(1026,'present','2019-04-05'),(1027,'present','2019-04-05'),(1028,'present','2019-04-05'),(1029,'present','2019-04-05'),(1030,'present','2019-04-05'),(1031,'present','2019-04-05'),(1032,'present','2019-04-05'),(1033,'present','2019-04-05'),(1034,'present','2019-04-05'),(1001,'present','2019-04-06'),(1024,'present','2019-04-06'),(1025,'present','2019-04-06'),(1026,'present','2019-04-06'),(1027,'present','2019-04-06'),(1028,'present','2019-04-06'),(1029,'absent','2019-04-06'),(1030,'present','2019-04-06'),(1031,'present','2019-04-06'),(1032,'present','2019-04-06'),(1033,'present','2019-04-06'),(1034,'present','2019-04-06'),(1001,'present','2019-04-07'),(1024,'present','2019-04-07'),(1025,'present','2019-04-07'),(1026,'present','2019-04-07'),(1027,'present','2019-04-07'),(1028,'absent','2019-04-07'),(1029,'present','2019-04-07'),(1030,'present','2019-04-07'),(1031,'present','2019-04-07'),(1032,'present','2019-04-07'),(1033,'present','2019-04-07'),(1034,'present','2019-04-07'),(1001,'present','2019-04-08'),(1024,'present','2019-04-08'),(1025,'present','2019-04-08'),(1026,'present','2019-04-08'),(1027,'present','2019-04-08'),(1028,'present','2019-04-08'),(1029,'present','2019-04-08'),(1030,'present','2019-04-08'),(1031,'present','2019-04-08'),(1032,'present','2019-04-08'),(1033,'present','2019-04-08'),(1034,'present','2019-04-08'),(1001,'present','2019-04-09'),(1024,'present','2019-04-09'),(1025,'present','2019-04-09'),(1026,'present','2019-04-09'),(1027,'present','2019-04-09'),(1028,'present','2019-04-09'),(1029,'present','2019-04-09'),(1030,'present','2019-04-09'),(1031,'present','2019-04-09'),(1032,'present','2019-04-09'),(1033,'present','2019-04-09'),(1034,'present','2019-04-09'),(1001,'present','2019-04-11'),(1024,'present','2019-04-11'),(1025,'present','2019-04-11'),(1026,'absent','2019-04-11'),(1027,'present','2019-04-11'),(1028,'present','2019-04-11'),(1029,'present','2019-04-11'),(1030,'present','2019-04-11'),(1031,'present','2019-04-11'),(1032,'present','2019-04-11'),(1033,'present','2019-04-11'),(1034,'present','2019-04-11'),(1001,'present','2019-04-12'),(1024,'present','2019-04-12'),(1025,'present','2019-04-12'),(1026,'present','2019-04-12'),(1027,'present','2019-04-12'),(1028,'present','2019-04-12'),(1029,'present','2019-04-12'),(1030,'present','2019-04-12'),(1031,'present','2019-04-12'),(1032,'present','2019-04-12'),(1033,'present','2019-04-12'),(1034,'present','2019-04-12'),(1001,'present','2019-04-14'),(1024,'present','2019-04-14'),(1025,'present','2019-04-14'),(1026,'present','2019-04-14'),(1027,'present','2019-04-14'),(1028,'present','2019-04-14'),(1029,'present','2019-04-14'),(1030,'present','2019-04-14'),(1031,'present','2019-04-14'),(1032,'present','2019-04-14'),(1033,'present','2019-04-14'),(1034,'present','2019-04-14'),(1001,'present','2019-04-15'),(1024,'present','2019-04-15'),(1025,'present','2019-04-15'),(1026,'present','2019-04-15'),(1027,'present','2019-04-15'),(1028,'present','2019-04-15'),(1029,'present','2019-04-15'),(1030,'present','2019-04-15'),(1031,'present','2019-04-15'),(1032,'present','2019-04-15'),(1033,'present','2019-04-15'),(1034,'present','2019-04-15'),(1001,'present','2019-04-20'),(1024,'present','2019-04-20'),(1025,'present','2019-04-20'),(1026,'present','2019-04-20'),(1027,'present','2019-04-20'),(1028,'present','2019-04-20'),(1029,'present','2019-04-20'),(1030,'present','2019-04-20'),(1031,'absent','2019-04-20'),(1032,'present','2019-04-20'),(1033,'present','2019-04-20'),(1034,'present','2019-04-20'),(1001,'present','2019-04-30'),(1024,'present','2019-04-30'),(1025,'present','2019-04-30'),(1026,'present','2019-04-30'),(1027,'present','2019-04-30'),(1028,'present','2019-04-30'),(1029,'present','2019-04-30'),(1030,'present','2019-04-30'),(1031,'present','2019-04-30'),(1032,'present','2019-04-30'),(1033,'present','2019-04-30'),(1034,'present','2019-04-30'),(1001,'present','2019-05-03'),(1024,'present','2019-05-03'),(1025,'present','2019-05-03'),(1026,'present','2019-05-03'),(1027,'present','2019-05-03'),(1028,'present','2019-05-03'),(1029,'present','2019-05-03'),(1030,'present','2019-05-03'),(1031,'present','2019-05-03'),(1032,'present','2019-05-03'),(1033,'present','2019-05-03'),(1034,'present','2019-05-03'),(1001,'present','2019-05-22'),(1024,'present','2019-05-22'),(1025,'absent','2019-05-22'),(1026,'present','2019-05-22'),(1027,'present','2019-05-22'),(1028,'present','2019-05-22'),(1029,'present','2019-05-22'),(1030,'present','2019-05-22'),(1031,'present','2019-05-22'),(1032,'present','2019-05-22'),(1033,'present','2019-05-22'),(1034,'present','2019-05-22'),(1001,'present','2019-06-10'),(1024,'present','2019-06-10'),(1025,'present','2019-06-10'),(1026,'present','2019-06-10'),(1027,'present','2019-06-10'),(1028,'present','2019-06-10'),(1029,'present','2019-06-10'),(1030,'present','2019-06-10'),(1031,'present','2019-06-10'),(1032,'present','2019-06-10'),(1033,'absent','2019-06-10'),(1034,'present','2019-06-10'),(1001,'present','2019-06-27'),(1024,'present','2019-06-27'),(1025,'present','2019-06-27'),(1026,'present','2019-06-27'),(1027,'present','2019-06-27'),(1028,'present','2019-06-27'),(1029,'present','2019-06-27'),(1030,'present','2019-06-27'),(1031,'present','2019-06-27'),(1032,'present','2019-06-27'),(1033,'present','2019-06-27'),(1034,'present','2019-06-27'),(1001,'present','2019-08-26'),(1024,'present','2019-08-26'),(1025,'present','2019-08-26'),(1026,'present','2019-08-26'),(1027,'present','2019-08-26'),(1028,'present','2019-08-26'),(1029,'present','2019-08-26'),(1030,'present','2019-08-26'),(1031,'present','2019-08-26'),(1032,'present','2019-08-26'),(1033,'present','2019-08-26'),(1034,'present','2019-08-26'),(1001,'present','2019-09-20'),(1024,'present','2019-09-20'),(1025,'present','2019-09-20'),(1026,'absent','2019-09-20'),(1027,'absent','2019-09-20'),(1028,'absent','2019-09-20'),(1029,'present','2019-09-20'),(1030,'present','2019-09-20'),(1031,'present','2019-09-20'),(1032,'present','2019-09-20'),(1033,'present','2019-09-20'),(1034,'present','2019-09-20'),(1001,'present','2019-10-13'),(1024,'present','2019-10-13'),(1025,'absent','2019-10-13'),(1026,'present','2019-10-13'),(1027,'present','2019-10-13'),(1028,'present','2019-10-13'),(1029,'present','2019-10-13'),(1030,'present','2019-10-13'),(1031,'present','2019-10-13'),(1032,'present','2019-10-13'),(1033,'present','2019-10-13'),(1034,'present','2019-10-13'),(1001,'present','2019-11-18'),(1024,'present','2019-11-18'),(1025,'present','2019-11-18'),(1026,'present','2019-11-18'),(1027,'present','2019-11-18'),(1028,'present','2019-11-18'),(1029,'present','2019-11-18'),(1030,'present','2019-11-18'),(1031,'present','2019-11-18'),(1032,'present','2019-11-18'),(1033,'absent','2019-11-18'),(1034,'present','2019-11-18'),(1001,'present','2020-01-10'),(1024,'present','2020-01-10'),(1025,'present','2020-01-10'),(1026,'present','2020-01-10'),(1027,'present','2020-01-10'),(1028,'present','2020-01-10'),(1029,'present','2020-01-10'),(1030,'present','2020-01-10'),(1031,'present','2020-01-10'),(1032,'present','2020-01-10'),(1033,'present','2020-01-10'),(1034,'present','2020-01-10'),(1001,'present','2020-02-10'),(1024,'present','2020-02-10'),(1025,'present','2020-02-10'),(1026,'absent','2020-02-10'),(1027,'absent','2020-02-10'),(1028,'present','2020-02-10'),(1029,'present','2020-02-10'),(1030,'present','2020-02-10'),(1031,'present','2020-02-10'),(1032,'present','2020-02-10'),(1033,'present','2020-02-10'),(1034,'present','2020-02-10'),(1001,'absent','2020-02-11'),(1024,'present','2020-02-11'),(1025,'present','2020-02-11'),(1026,'present','2020-02-11'),(1027,'present','2020-02-11'),(1028,'present','2020-02-11'),(1029,'present','2020-02-11'),(1030,'present','2020-02-11'),(1031,'present','2020-02-11'),(1032,'present','2020-02-11'),(1033,'present','2020-02-11'),(1034,'present','2020-02-11'),(1001,'present','2020-04-06'),(1024,'present','2020-04-06'),(1025,'absent','2020-04-06'),(1026,'present','2020-04-06'),(1027,'present','2020-04-06'),(1028,'present','2020-04-06'),(1029,'present','2020-04-06'),(1030,'present','2020-04-06'),(1031,'present','2020-04-06'),(1032,'present','2020-04-06'),(1033,'present','2020-04-06'),(1034,'present','2020-04-06'),(1001,'present','2020-04-09'),(1024,'present','2020-04-09'),(1025,'present','2020-04-09'),(1026,'present','2020-04-09'),(1027,'present','2020-04-09'),(1028,'present','2020-04-09'),(1029,'present','2020-04-09'),(1030,'present','2020-04-09'),(1031,'present','2020-04-09'),(1032,'present','2020-04-09'),(1033,'present','2020-04-09'),(1034,'present','2020-04-09'),(1001,'present','2020-04-13'),(1024,'present','2020-04-13'),(1026,'present','2020-04-13'),(1027,'present','2020-04-13'),(1028,'absent','2020-04-13'),(1029,'present','2020-04-13'),(1030,'present','2020-04-13'),(1031,'present','2020-04-13'),(1032,'present','2020-04-13'),(1033,'present','2020-04-13'),(1034,'present','2020-04-13');
/*!40000 ALTER TABLE `student_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_feedback`
--

DROP TABLE IF EXISTS `student_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_feedback` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `feedback` varchar(400) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_feedback`
--

LOCK TABLES `student_feedback` WRITE;
/*!40000 ALTER TABLE `student_feedback` DISABLE KEYS */;
INSERT INTO `student_feedback` VALUES (1,'Kishor Kadam','7276763516','Awesome this student attendance portal and interactive interface as well as good functionality.','kishor'),(2,'Aniket Kadam','8855774145','Fabulous web base application.','aniket'),(3,'Kishor Kadam','7276763516','Project logic & development is awesome. ','kishor'),(4,'Kishor Kadam','9404308673','Project is so awesome, awesome development as well as attractive design.','kishor');
/*!40000 ALTER TABLE `student_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_leave`
--

DROP TABLE IF EXISTS `student_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_leave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `leave_reasone` varchar(400) DEFAULT NULL,
  `no_of_days` int DEFAULT NULL,
  `leave_status` varchar(45) DEFAULT NULL,
  `leave_apply_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_leave`
--

LOCK TABLES `student_leave` WRITE;
/*!40000 ALTER TABLE `student_leave` DISABLE KEYS */;
INSERT INTO `student_leave` VALUES (2,'Aniket Kadam','For sick reason.',5,'Leave Rejected','2019-04-02'),(3,'Sanket kadam','Health Problem.',4,'Leave Rejected','2019-04-02'),(4,'Raju Kadam','For family function.',2,'Leave Rejected','2019-04-02'),(6,'Aniket Kadam','for social function.',3,'Leave Rejected','2019-04-02'),(7,'Sagar Kharmale','For sick reason',4,'Pending','2019-04-02'),(8,'Shashi Bhure','I want  one day leave ',1,'Pending','2019-04-02'),(12,'Kishor Kadam','For health check up reason.',1,'Approved','2019-04-02'),(13,'Kishor Kadam','Friend marriage ceremony.',2,'Approved','2019-04-02'),(14,'Kishor Kadam','For social functions.',2,'Pending','2019-04-02'),(15,'Aniket Kadam','For family functions.',1,'Leave Rejected','2019-04-03'),(16,'Kishor Kadam','For familiar function.',2,'Approved','2019-04-06'),(17,'Mayur Mahale','Sick leave',2,'Approved','2019-10-15');
/*!40000 ALTER TABLE `student_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `stud_name` varchar(100) DEFAULT NULL,
  `college_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1001,'Kishor Kadam','Indira Institute of Management,Pune','9404308673','A/P: Bhalawani Tal: Parner Dist: Ahmednagar','kadamk33@gmail.com','kishor','Jks@Q3GMNQ',1),(1024,'David Smith  ','Indira Institute of Management,Pune','9404308601','Kothrud,Pune','davidjose94@gmail.com ','david','ZRFT7t9rpy',1),(1025,'Rogers Johnson','Indira Institute of Management,Pune','9404308602','Kalyani Nagar,Pune','rogers12@yahoomail.com','rogers','wjwqepwfQA',0),(1026,'David Williams  ','Indira Institute of Management,Pune','9404308603','Kothrud,Pune','david58@gmail.com','david','PDmAQcsDn5',1),(1027,'Maria Jones','Indira Institute of Management,Pune','9404308604','Dange Chowk,Pune','mariadecosta@yahoomail.com','maria','easbpgj9zN',1),(1028,'Morris Brown','Indira Institute of Management,Pune','9404308605','Hinjewadi,Pune','morrisjames@gmail.com','morris','bzxsPyHy8S',1),(1029,'Daniel Davis','Indira Institute of Management,Pune','9404308606','Wakad,Pune','danielvictori@yahoomail.com','daniel','K8ydzpYXfc',1),(1030,'Sanders Miller','Indira Institute of Management,Pune','9404308607','Sadashiv Peth,Pune','sanders56@gmail.com','sanders','Gr58HexBgy',1),(1031,'Mark Stoinis','Indira Institute of Management,Pune','9404308608','Malwadi,Pune','mark334@gmail.com','mark','tQWRGftGvD',1),(1032,'Morgan Moore','Indira Institute of Management,Pune','9404308609','Koregaon Park,Pune','morganwillams@gmail.com','morgan','HfX2yZCRwF',1),(1033,'Paul Taylor','Indira Institute of Management,Pune','9404308610','Hadapsar,Pune','paul@gmail.com','paul','XGXxUxxH89',1),(1034,'David Anderson','Indira Institute of Management,Pune','9404308611','Kothrud,Pune','david90@yahoomail.com','david','5s2T8qWv5q',1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-13 20:05:55
