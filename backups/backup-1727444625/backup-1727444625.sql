-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbattendance
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `attendanceid` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `status` enum('in','out') NOT NULL,
  `time_status` enum('morning','afternoon') NOT NULL,
  `semester` tinyint(1) NOT NULL,
  `schoolyear` varchar(10) NOT NULL,
  `dateadded` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`attendanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup` (
  `backupid` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `backup_date` datetime NOT NULL,
  `schoolyear` varchar(10) NOT NULL,
  PRIMARY KEY (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(150) NOT NULL,
  `departmentid` int(11) NOT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'BSED',3),(2,'BSIS',1),(3,'BEED',3),(4,'BSCE',1),(5,'BSIT',1),(6,'AB Social Science',2),(7,'BSHRM',1),(8,'AB English',2),(9,'BS Psychology',2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(150) NOT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'CIT'),(2,'CAS'),(3,'COED');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(150) NOT NULL,
  `event_place` varchar(150) NOT NULL,
  `event_start_date` date NOT NULL,
  `event_end_date` date NOT NULL,
  `event_starttime_am` time NOT NULL,
  `event_endtime_am` time NOT NULL,
  `event_starttime_pm` time NOT NULL,
  `event_endtime_pm` time NOT NULL,
  `event_starttime_am_in` time NOT NULL,
  `event_endtime_am_in` time NOT NULL,
  `event_starttime_am_out` time NOT NULL,
  `event_endtime_am_out` time NOT NULL,
  `event_starttime_pm_in` time NOT NULL,
  `event_endtime_pm_in` time NOT NULL,
  `event_starttime_pm_out` time NOT NULL,
  `event_endtime_pm_out` time NOT NULL,
  `status` enum('wholeday','morning','afternoon') NOT NULL,
  `semester` tinyint(1) NOT NULL,
  `schoolyear` varchar(10) NOT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Test Wedding','SILAY CITY','2018-08-05','2018-08-05','07:00:00','11:00:00','13:00:00','16:00:00','07:00:00','08:00:00','10:00:00','11:00:00','13:00:00','14:00:00','15:00:00','16:00:00','wholeday',1,'2018-2019');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_officer`
--

DROP TABLE IF EXISTS `event_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_officer` (
  `eventid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `days` varchar(100) NOT NULL,
  `status` enum('wholeday','morning','afternoon') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_officer`
--

LOCK TABLES `event_officer` WRITE;
/*!40000 ALTER TABLE `event_officer` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanction`
--

DROP TABLE IF EXISTS `sanction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanction` (
  `sanction_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `no_of_absences` tinyint(2) NOT NULL,
  PRIMARY KEY (`sanction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanction`
--

LOCK TABLES `sanction` WRITE;
/*!40000 ALTER TABLE `sanction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `image` varchar(70) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Firstname 1','Middlename 1','Lastname 1','9258692271','','2018-08-05 15:50:52'),(2,'Firstname 2','Middlename 2','Lastname 2','9258692272','','2018-08-05 15:50:52'),(3,'Firstname 3','Middlename 3','Lastname 3','9258692273','','2018-08-05 15:50:52'),(4,'Firstname 4','Middlename 4','Lastname 4','9258692274','','2018-08-05 15:50:53'),(5,'Firstname 5','Middlename 5','Lastname 5','9258692275','','2018-08-05 15:50:53'),(6,'Firstname 6','Middlename 6','Lastname 6','9258692276','','2018-08-05 15:50:53'),(7,'Firstname 7','Middlename 7','Lastname 7','9258692277','','2018-08-05 15:50:53'),(8,'Firstname 8','Middlename 8','Lastname 8','9258692278','','2018-08-05 15:50:53'),(9,'Firstname 9','Middlename 9','Lastname 9','9258692279','','2018-08-05 15:50:53'),(10,'Firstname 10','Middlename 10','Lastname 10','9258692280','','2018-08-05 15:50:53'),(11,'Firstname 11','Middlename 11','Lastname 11','9258692281','','2018-08-05 15:50:54'),(12,'Firstname 12','Middlename 12','Lastname 12','9258692282','','2018-08-05 15:50:54'),(13,'Firstname 13','Middlename 13','Lastname 13','9258692283','','2018-08-05 15:50:54'),(14,'Firstname 14','Middlename 14','Lastname 14','9258692284','','2018-08-05 15:50:54'),(15,'Firstname 15','Middlename 15','Lastname 15','9258692285','','2018-08-05 15:50:54'),(16,'Firstname 16','Middlename 16','Lastname 16','9258692286','','2018-08-05 15:50:54'),(17,'Firstname 17','Middlename 17','Lastname 17','9258692287','','2018-08-05 15:50:54'),(18,'Firstname 18','Middlename 18','Lastname 18','9258692288','','2018-08-05 15:50:54'),(19,'Firstname 19','Middlename 19','Lastname 19','9258692289','','2018-08-05 15:50:54'),(20,'Firstname 20','Middlename 20','Lastname 20','9258692290','','2018-08-05 15:50:54');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_academic_details`
--

DROP TABLE IF EXISTS `student_academic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_academic_details` (
  `studentacademicdetailid` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `year` tinyint(1) NOT NULL,
  `section` varchar(5) NOT NULL,
  `schoolyear` varchar(10) NOT NULL,
  PRIMARY KEY (`studentacademicdetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_academic_details`
--

LOCK TABLES `student_academic_details` WRITE;
/*!40000 ALTER TABLE `student_academic_details` DISABLE KEYS */;
INSERT INTO `student_academic_details` VALUES (1,1,2,4,'A','2018-2019'),(2,2,2,4,'A','2018-2019'),(3,3,2,4,'A','2018-2019'),(4,4,2,4,'A','2018-2019'),(5,5,2,4,'A','2018-2019'),(6,6,2,4,'A','2018-2019'),(7,7,2,4,'A','2018-2019'),(8,8,2,4,'A','2018-2019'),(9,9,2,4,'A','2018-2019'),(10,10,2,4,'A','2018-2019'),(11,11,2,4,'A','2018-2019'),(12,12,2,4,'A','2018-2019'),(13,13,2,4,'A','2018-2019'),(14,14,2,4,'A','2018-2019'),(15,15,2,4,'A','2018-2019'),(16,16,2,4,'A','2018-2019'),(17,17,2,4,'A','2018-2019'),(18,18,2,4,'A','2018-2019'),(19,19,2,4,'A','2018-2019'),(20,20,2,4,'A','2018-2019');
/*!40000 ALTER TABLE `student_academic_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_barcode`
--

DROP TABLE IF EXISTS `student_barcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_barcode` (
  `studentid` int(11) NOT NULL,
  `barcode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_barcode`
--

LOCK TABLES `student_barcode` WRITE;
/*!40000 ALTER TABLE `student_barcode` DISABLE KEYS */;
INSERT INTO `student_barcode` VALUES (1,'27000001'),(2,'27000002'),(3,'27000003'),(4,'27000004'),(5,'27000005'),(6,'27000006'),(7,'27000007'),(8,'27000008'),(9,'27000009'),(10,'27000010'),(11,'27000011'),(12,'27000012'),(13,'27000013'),(14,'27000014'),(15,'27000015'),(16,'27000016'),(17,'27000017'),(18,'27000018'),(19,'27000019'),(20,'27000020');
/*!40000 ALTER TABLE `student_barcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_yearlevel_update`
--

DROP TABLE IF EXISTS `student_yearlevel_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_yearlevel_update` (
  `studentyearlevelupdateid` int(11) NOT NULL AUTO_INCREMENT,
  `schoolyear` varchar(10) NOT NULL,
  PRIMARY KEY (`studentyearlevelupdateid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_yearlevel_update`
--

LOCK TABLES `student_yearlevel_update` WRITE;
/*!40000 ALTER TABLE `student_yearlevel_update` DISABLE KEYS */;
INSERT INTO `student_yearlevel_update` VALUES (1,'2018-2019');
/*!40000 ALTER TABLE `student_yearlevel_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `image` varchar(70) NOT NULL,
  `position` enum('admin','officer') NOT NULL DEFAULT 'officer',
  `position_description` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `isdeleted` tinyint(1) NOT NULL,
  `semester` tinyint(1) NOT NULL,
  `schoolyear` varchar(10) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','8ead58753335bb936bac6033b400c7f6f61f36ebc10660883de78ce070efe75a','Admin','Admin','Admin','1234567890','6ca9adb48926f04929b1b351a9f7275c.jpeg','admin','System Administrator','2018-02-07 21:41:16',0,0,''),(2,'test','4c74c99afe579d5de34e75ffedbb5870f418ff37c5b55f02581b5b7df14c2911','Test','Test','Test','9258692275','94866f1d0444a3818c77747b4374a5b6.jpeg','officer','Senator','2018-07-29 19:32:49',0,1,'2018-2019');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `userlogid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `datelog` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`userlogid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (1,2,'Logged Out','2018-08-01 11:51:00'),(2,1,'Logged In','2018-08-01 12:16:42'),(3,1,'Logged In','2018-08-05 15:08:24'),(4,1,'Logged In','2018-08-05 18:31:45'),(5,1,'Logged Out','2018-08-05 18:34:36'),(6,1,'Logged Out','2018-08-06 19:20:05'),(7,1,'Logged In','2018-08-06 19:20:07'),(8,1,'Logged Out','2018-08-06 19:45:12'),(9,1,'Logged In','2018-08-08 09:23:50'),(10,1,'Logged Out','2018-08-08 09:27:17');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27 21:43:45
