-- MySQL dump 10.15  Distrib 10.0.24-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: checkin
-- ------------------------------------------------------
-- Server version	10.0.24-MariaDB-7

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
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
  `BookID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BookRecordID` bigint(20) NOT NULL,
  `TeacherID` bigint(20) NOT NULL,
  PRIMARY KEY (`BookID`),
  KEY `BookRecordID` (`BookRecordID`),
  KEY `TeacherID` (`TeacherID`),
  CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`BookRecordID`) REFERENCES `BookRecord` (`BookRecordID`) ON DELETE CASCADE,
  CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `Teacher` (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BookRecord`
--

DROP TABLE IF EXISTS `BookRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookRecord` (
  `BookRecordID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(512) NOT NULL,
  `Author` varchar(256) DEFAULT NULL,
  `ISBN` char(13) DEFAULT NULL,
  `ARPoints` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`BookRecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BorrowAction`
--

DROP TABLE IF EXISTS `BorrowAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BorrowAction` (
  `BorrowActionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `StudentID` bigint(20) NOT NULL,
  `CheckoutTime` datetime DEFAULT NULL,
  `ReturnTime` datetime DEFAULT NULL,
  `BookID` bigint(20) NOT NULL,
  PRIMARY KEY (`BorrowActionID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `BorrowAction_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `StudentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Username` varchar(10) NOT NULL,
  `TeacherID` bigint(20) NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `TeacherID` (`TeacherID`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `Teacher` (`TeacherID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `TeacherID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Username` varchar(10) NOT NULL,
  `Password` char(80) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `Title` char(5) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Verified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeacherID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-03  2:40:59
