-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tutoring
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Current Database: `tutoring`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tutoring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tutoring`;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `Course_Number` varchar(10) NOT NULL,
  PRIMARY KEY (`Course_Number`),
  UNIQUE KEY `Course_Number_UNIQUE` (`Course_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('CS101'),('CS102'),('CS202'),('CS210'),('CS215'),('CS250'),('CS309'),('CS336'),('MATH102'),('MATH103E'),('MATH104'),('MATH105'),('MATH111E'),('MATH118E'),('MATH119'),('MATH119E'),('MATH120'),('MATH121'),('MATH206'),('MATH207'),('MATH208'),('MATH222'),('MATH310'),('MATH408'),('MATH415');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `Serial` int NOT NULL AUTO_INCREMENT,
  `Student_ID` varchar(9) NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Course_Number` varchar(45) NOT NULL,
  `Section` varchar(45) NOT NULL,
  `Duration_Min` int unsigned NOT NULL,
  PRIMARY KEY (`Serial`),
  UNIQUE KEY `Serial_UNIQUE` (`Serial`),
  KEY `Course_Number_idx` (`Course_Number`),
  KEY `Student_ID_idx` (`Student_ID`),
  CONSTRAINT `Course_Number` FOREIGN KEY (`Course_Number`) REFERENCES `courses` (`Course_Number`),
  CONSTRAINT `Student_ID` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'A00000001','John','Smith','MATH119','1.5',100),(4,'A00000053','Thea','Valenzuela','MATH222','3.1',64),(5,'A00000004','Jacob','Painter','MATH208','5.1',62),(6,'A00000003','Todd','Fowler','CS210','6.2',20),(7,'A00000027','Lia','Nixon','MATH121','1.3',111),(8,'A00000009','Virgil','Flores','MATH408','5.3',82),(9,'A00000023','Anisha','Shepherd','MATH118E','9.1',107),(10,'A00000050','Alice','Leonard','MATH105','5.7',84),(11,'A00000037','Tina','Andrade','MATH208','1.2',60),(12,'A00000010','Annabel','Zuniga','MATH208','7.6',84),(13,'A00000002','Zach','Smith','CS102','6.3',110),(14,'A00000015','Honey','Young','CS336','5.6',80),(15,'A00000040','Asma','Beltran','CS215','1.2',77),(16,'A00000021','Tianna','Herrera','CS309','8.3',79),(17,'A00000028','Yasmine','Jensen','CS250','2.6',88),(18,'A00000012','Rayhan','Jimenez','MATH222','5.3',55),(19,'A00000007','Ayesha','Castillo','MATH208','5.1',98),(20,'A00000045','Harriet','Molina','CS202','7.6',43),(21,'A00000054','Aleesha','Hubbard','MATH118E','6.2',59),(22,'A00000049','Eliot','Patterson','MATH104','6.2',117),(23,'A00000040','Asma','Beltran','CS102','2.3',114),(24,'A00000028','Yasmine','Jensen','CS336','9.3',114),(25,'A00000054','Aleesha','Hubbard','CS101','5.6',59),(26,'A00000008','Fay','Mcconnell','MATH111E','9.5',103),(27,'A00000005','Bella','Mcknight','MATH415','1.2',116),(28,'A00000050','Alice','Leonard','MATH208','5.5',92),(29,'A00000018','Leia','Blankenship','CS210','9.5',118),(30,'A00000019','Lewis','Vargas','CS210','1.3',29),(31,'A00000009','Virgil','Flores','MATH310','4.3',50),(32,'A00000050','Alice','Leonard','MATH119E','2.6',40),(33,'A00000050','Alice','Leonard','MATH207','1.3',63),(34,'A00000030','Joshua','Kline','MATH222','2.2',79),(35,'A00000014','Claude','Perkins','CS210','2.3',29),(36,'A00000044','Issac','Valencia','MATH119','5.6',72),(37,'A00000045','Harriet','Molina','MATH415','6.2',18),(38,'A00000004','Jacob','Painter','CS102','8.1',27),(39,'A00000018','Leia','Blankenship','MATH206','3.3',38),(40,'A00000039','Alysha','O\'Sullivan','CS250','1.5',98),(41,'A00000001','John','Smith','CS215','5.7',107),(42,'A00000007','Ayesha','Castillo','MATH119','2.1',25),(43,'A00000030','Joshua','Kline','MATH111E','3.2',61),(44,'A00000050','Alice','Leonard','MATH119','2.5',85),(45,'A00000015','Honey','Young','MATH207','2.7',115),(46,'A00000019','Lewis','Vargas','MATH105','3.1',91),(47,'A00000044','Issac','Valencia','MATH105','7.1',61),(48,'A00000038','Maariyah','Wallace','MATH103E','1.2',24),(49,'A00000018','Leia','Blankenship','MATH408','7.1',55),(50,'A00000021','Tianna','Herrera','MATH208','1.5',44),(51,'A00000004','Jacob','Painter','MATH104','1.5',72),(52,'A00000016','Jayson','Murphy','MATH102','7.6',108),(53,'A00000043','Aditya','Gaines','MATH120','3.1',111),(54,'A00000041','Rachel','Velasquez','MATH222','3.3',84),(55,'A00000047','Chiara','Burns','MATH310','3.4',20),(56,'A00000010','Annabel','Zuniga','MATH119','2.1',63),(57,'A00000002','Zach','Smith','CS210','9.1',32),(58,'A00109241','John','Smith','MATH103E','8.1',37),(59,'A00000038','Maariyah','Wallace','MATH310','8.2',26),(60,'A00000021','Tianna','Herrera','MATH118E','1.1',89),(61,'A00109241','John','Smith','MATH104','1.2',110),(62,'A00000016','Jayson','Murphy','MATH118E','5.5',17),(63,'A00000013','Belle','Rodgers','CS210','1.1',51),(64,'A00000002','Zach','Smith','CS336','4.1',88),(65,'A00000017','Saoirse','Deleon','MATH104','3.1',93),(66,'A00000020','Yasir','Higgins','MATH208','2.1',95),(67,'A00000033','Aiden','Owens','MATH102','2.5',92),(68,'A00000039','Alysha','O\'Sullivan','MATH104','5.6',68),(69,'A00000006','Mohamed','Osborn','CS309','2.7',70),(70,'A00000024','Hamish','Estes','MATH121','5.5',18),(71,'A00000007','Ayesha','Castillo','MATH310','8.3',93),(72,'A00000008','Fay','Mcconnell','MATH408','2.1',91),(73,'A00000043','Aditya','Gaines','MATH111E','5.7',49),(74,'A00000044','Issac','Valencia','MATH206','9.5',91),(75,'A00000025','Otto','Levine','CS215','6.2',31),(76,'A00000022','Alina','Lindsey','MATH103E','2.1',96),(77,'A00000036','Rajan','Day','MATH119E','8.2',38),(78,'A00000013','Belle','Rodgers','MATH206','5.1',42),(79,'A00000003','Todd','Fowler','CS101','2.3',66),(80,'A00000008','Fay','Mcconnell','MATH310','2.4',112),(81,'A00000005','Bella','Mcknight','MATH310','2.8',112),(82,'A00000003','Todd','Fowler','CS309','1.4',85),(83,'A00000014','Claude','Perkins','MATH111E','2.1',27),(84,'A00000032','Keira','Li','MATH118E','5.6',30),(85,'A00000028','Yasmine','Jensen','MATH104','7.6',20),(86,'A00000015','Honey','Young','MATH121','6.2',68),(87,'A00000036','Rajan','Day','MATH102','8.3',68),(88,'A00000032','Keira','Li','MATH207','1.5',77),(89,'A00000019','Lewis','Vargas','CS202','2.2',102),(90,'A00000027','Lia','Nixon','CS309','2.2',53),(91,'A00000039','Alysha','O\'Sullivan','MATH105','8.3',72),(92,'A00000005','Bella','Mcknight','MATH310','4.3',119),(93,'A00000021','Tianna','Herrera','MATH105','2.5',44),(94,'A00000019','Lewis','Vargas','CS101','2.5',31),(95,'A00000006','Mohamed','Osborn','CS215','8.1',97),(96,'A00000026','Edna','Hines','CS202','5.5',77),(97,'A00000040','Asma','Beltran','CS215','5.5',100),(98,'A00000010','Annabel','Zuniga','MATH118E','2.5',39),(99,'A00000046','Nellie','Livingston','CS202','1.2',66),(100,'A00000034','Arun','Levy','MATH105','9.5',53),(101,'A00000054','Aleesha','Hubbard','MATH207','2.1',51),(102,'A00000006','Mohamed','Osborn','CS309','5.6',30),(103,'A00000009','Virgil','Flores','MATH103E','3.4',31),(104,'A00000037','Tina','Andrade','MATH222','4.1',64),(105,'A00000024','Hamish','Estes','MATH310','1.4',70),(106,'A00000039','Alysha','O\'Sullivan','MATH102','9.5',62),(107,'A00000010','Annabel','Zuniga','MATH408','8.1',97),(108,'A00000016','Jayson','Murphy','MATH310','4.1',21),(109,'A00000035','Guy','Macdonald','CS215','2.2',24),(110,'A00000038','Maariyah','Wallace','CS210','1.5',97),(111,'A00000025','Otto','Levine','MATH207','6.3',88),(112,'A00000040','Asma','Beltran','MATH119E','4.3',62),(113,'A00000051','Usman','Meadows','CS101','8.2',24),(114,'A00000005','Bella','Mcknight','CS336','2.8',96),(115,'A00000038','Maariyah','Wallace','CS250','5.6',73),(116,'A00000048','Katherine','Marquez','MATH207','3.1',79),(117,'A00000025','Otto','Levine','CS336','5.5',40),(118,'A00000051','Usman','Meadows','CS215','2.6',74),(119,'A00000036','Rajan','Day','CS101','3.2',93),(120,'A00000032','Keira','Li','CS250','1.1',67),(121,'A00000054','Aleesha','Hubbard','CS102','2.3',117),(122,'A00000048','Katherine','Marquez','CS250','8.2',59),(123,'A00000028','Yasmine','Jensen','MATH102','8.5',17),(124,'A00000025','Otto','Levine','CS215','4.3',65),(125,'A00000023','Anisha','Shepherd','CS102','8.5',44),(126,'A00000027','Lia','Nixon','MATH415','8.2',88),(127,'A00000001','John','Smith','CS102','9.5',53),(128,'A00000020','Yasir','Higgins','MATH102','6.2',39),(129,'A00000039','Alysha','O\'Sullivan','MATH103E','1.1',62),(130,'A00000029','Charlotte','Haines','MATH310','1.2',117),(131,'A00000032','Keira','Li','MATH222','5.6',55),(132,'A00000044','Issac','Valencia','CS202','3.1',67),(133,'A00000028','Yasmine','Jensen','MATH222','8.1',41),(134,'A00000009','Virgil','Flores','MATH120','4.2',118),(135,'A00000007','Ayesha','Castillo','MATH119E','9.1',85),(136,'A00000011','Huw','Cuevas','MATH415','5.6',109),(137,'A00000012','Rayhan','Jimenez','CS250','6.2',97),(138,'A00000016','Jayson','Murphy','MATH206','8.1',78),(139,'A00000003','Todd','Fowler','MATH118E','8.1',117),(140,'A00000030','Joshua','Kline','MATH119E','2.5',111),(141,'A00000009','Virgil','Flores','CS336','2.8',40),(142,'A00000019','Lewis','Vargas','MATH208','2.7',39),(143,'A00000008','Fay','Mcconnell','MATH119','8.5',53),(144,'A00000010','Annabel','Zuniga','MATH208','8.3',103),(145,'A00000023','Anisha','Shepherd','MATH415','1.1',56),(146,'A00000019','Lewis','Vargas','MATH408','4.3',87),(147,'A00000048','Katherine','Marquez','MATH310','1.3',96),(148,'A00000027','Lia','Nixon','CS210','2.1',112),(149,'A00000013','Belle','Rodgers','CS101','2.4',39),(150,'A00000021','Tianna','Herrera','MATH102','4.1',64),(151,'A00000018','Leia','Blankenship','MATH222','5.7',91),(152,'A00000021','Tianna','Herrera','MATH119E','1.3',81),(153,'A00000002','Zach','Smith','CS309','4.3',43),(154,'A00000053','Thea','Valenzuela','MATH119','8.5',71),(155,'A00000017','Saoirse','Deleon','MATH121','9.5',27),(156,'A00109241','John','Smith','CS309','8.1',43),(157,'A00000003','Todd','Fowler','MATH103E','8.2',61),(158,'A00000038','Maariyah','Wallace','CS210','3.4',84),(159,'A00000007','Ayesha','Castillo','MATH119E','1.3',87),(160,'A00000042','Ishaq','Church','MATH121','4.3',37),(161,'A00000036','Rajan','Day','CS210','5.6',15),(162,'A00000051','Usman','Meadows','MATH208','4.1',44),(163,'A00000013','Belle','Rodgers','MATH103E','2.5',83),(164,'A00000033','Aiden','Owens','MATH105','1.1',23),(165,'A00000028','Yasmine','Jensen','CS215','3.3',28),(166,'A00000023','Anisha','Shepherd','CS101','3.4',80),(167,'A00000002','Zach','Smith','MATH118E','1.3',21),(168,'A00000018','Leia','Blankenship','CS336','1.3',63),(169,'A00000026','Edna','Hines','MATH103E','1.4',68),(170,'A00000014','Claude','Perkins','CS101','2.5',15),(171,'A00000043','Aditya','Gaines','MATH408','9.5',81),(172,'A00000004','Jacob','Painter','CS101','1.4',111),(173,'A00000039','Alysha','O\'Sullivan','MATH222','9.1',119),(174,'A00000031','Jackson','Mcmahon','MATH103E','2.3',83),(175,'A00000045','Harriet','Molina','CS250','2.3',93),(176,'A00000019','Lewis','Vargas','CS309','5.6',83),(177,'A00000030','Joshua','Kline','CS309','8.3',43),(178,'A00000003','Todd','Fowler','MATH120','2.2',119),(179,'A00000012','Rayhan','Jimenez','MATH119','3.1',112),(180,'A00000054','Aleesha','Hubbard','MATH103E','9.5',95),(181,'A00000030','Joshua','Kline','MATH207','1.2',83),(182,'A00000001','John','Smith','MATH119','5.7',62),(183,'A00000053','Thea','Valenzuela','MATH111E','5.6',37),(184,'A00000005','Bella','Mcknight','CS309','2.2',66),(185,'A00000026','Edna','Hines','CS336','6.2',15),(186,'A00000028','Yasmine','Jensen','CS250','2.8',115),(187,'A00000046','Nellie','Livingston','CS250','8.2',22),(188,'A00000022','Alina','Lindsey','CS336','8.3',116),(189,'A00000009','Virgil','Flores','MATH102','7.1',110),(190,'A00000019','Lewis','Vargas','CS210','4.2',50),(191,'A00000041','Rachel','Velasquez','CS101','3.4',36),(192,'A00000002','Zach','Smith','MATH118E','2.8',103),(193,'A00000033','Aiden','Owens','MATH119','8.2',72),(194,'A00000050','Alice','Leonard','CS101','5.3',100),(195,'A00000008','Fay','Mcconnell','MATH415','2.8',46),(196,'A00000014','Claude','Perkins','MATH207','2.6',110),(197,'A00000040','Asma','Beltran','MATH310','1.2',86),(198,'A00000043','Aditya','Gaines','CS210','3.4',116),(199,'A00000016','Jayson','Murphy','CS250','2.4',44),(200,'A00000049','Eliot','Patterson','CS210','6.3',100),(201,'A00000035','Guy','Macdonald','MATH408','8.2',114),(202,'A00000031','Jackson','Mcmahon','CS101','5.5',72),(203,'A00000017','Saoirse','Deleon','CS210','8.3',55),(204,'A00109241','John','Smith','MATH207','3.1',33),(205,'A00000039','Alysha','O\'Sullivan','MATH111E','5.1',41),(206,'A00000010','Annabel','Zuniga','MATH105','2.4',104),(207,'A00000005','Bella','Mcknight','CS202','5.5',16),(208,'A00000016','Jayson','Murphy','MATH310','5.7',113),(209,'A00000017','Saoirse','Deleon','MATH208','5.3',74),(210,'A00000042','Ishaq','Church','MATH103E','8.3',27),(211,'A00000001','John','Smith','MATH408','2.2',31),(212,'A00000007','Ayesha','Castillo','MATH118E','3.4',102),(213,'A00000003','Todd','Fowler','MATH121','9.5',27),(214,'A00000047','Chiara','Burns','MATH121','8.1',30),(215,'A00000010','Annabel','Zuniga','CS101','6.3',70),(216,'A00000005','Bella','Mcknight','MATH208','5.1',64),(217,'A00000035','Guy','Macdonald','CS202','5.6',32),(218,'A00000003','Todd','Fowler','MATH118E','5.7',77),(219,'A00000018','Leia','Blankenship','MATH105','6.3',37),(220,'A00000027','Lia','Nixon','MATH103E','2.5',72),(221,'A00000003','Todd','Fowler','MATH222','8.3',115),(222,'A00000010','Annabel','Zuniga','MATH111E','5.3',28),(223,'A00000052','Eliza','Hodge','MATH310','5.5',80),(224,'A00000042','Ishaq','Church','MATH105','2.1',100),(225,'A00000040','Asma','Beltran','MATH208','8.5',105),(226,'A00000028','Yasmine','Jensen','MATH222','6.2',61),(227,'A00000053','Thea','Valenzuela','MATH105','4.1',46),(228,'A00000009','Virgil','Flores','MATH222','7.6',102),(229,'A00000003','Todd','Fowler','MATH105','6.2',55),(230,'A00000041','Rachel','Velasquez','MATH206','2.8',109),(231,'A00000043','Aditya','Gaines','MATH206','3.2',79),(232,'A00000001','John','Smith','MATH111E','2.4',30),(233,'A00000014','Claude','Perkins','MATH102','2.4',28),(234,'A00000044','Issac','Valencia','CS202','2.6',115),(235,'A00000005','Bella','Mcknight','CS309','2.4',63),(236,'A00000053','Thea','Valenzuela','MATH408','2.2',53),(237,'A00000005','Bella','Mcknight','MATH105','4.2',105),(238,'A00000050','Alice','Leonard','CS215','6.3',87),(239,'A00000040','Asma','Beltran','CS101','5.3',93),(240,'A00000036','Rajan','Day','CS102','3.1',94),(241,'A00000024','Hamish','Estes','MATH102','8.2',30),(242,'A00000022','Alina','Lindsey','MATH105','2.1',109),(243,'A00000048','Katherine','Marquez','MATH121','4.3',65),(244,'A00000011','Huw','Cuevas','MATH222','8.3',50),(245,'A00000018','Leia','Blankenship','CS202','2.6',40),(246,'A00000019','Lewis','Vargas','MATH102','5.7',17),(247,'A00000022','Alina','Lindsey','MATH120','2.6',44),(248,'A00000044','Issac','Valencia','MATH415','2.7',94),(249,'A00000001','John','Smith','MATH102','2.3',39),(250,'A00000001','John','Smith','MATH111E','5.5',27),(251,'A00000007','Ayesha','Castillo','CS336','1.2',17),(252,'A00000002','Zach','Smith','CS202','1.2',28),(254,'A00109255','Ahsanur','Rahman','CS250','2.1',50),(255,'A00109240','Tyler','Fowler','MATH119E','2.5',30),(256,'A00109240','Tyler','Fowler','MATH119E','2.9',30),(257,'A00109240','Tyler','Fowler','MATH119E','5.8',120),(258,'A00109240','Tyler','Fowler','CS101','1.5',30),(259,'A00109240','Tyler','Fowler','CS101','2.9',80),(260,'A00109240','Tyler','Fowler','CS101','3.5',60),(261,'A00109240','Tyler','Fowler','CS101','5.8',60),(262,'A00109240','Tyler','Fowler','CS336','4.3',60),(263,'A00109240','Tyler','Fowler','CS336','3.7',20),(264,'A00109240','Tyler','Fowler','CS336','8.2',90),(265,'A00109240','Tyler','Fowler','CS210','3.2',30),(266,'A00109240','Tyler','Fowler','CS210','5.2',90),(267,'A00109240','Tyler','Fowler','CS210','3.4',30);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `Student_ID` varchar(10) NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Student_ID_UNIQUE` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('A00000001','John','Smith'),('A00000002','Zach','Smith'),('A00000003','Todd','Fowler'),('A00000004','Jacob','Painter'),('A00000005','Bella','Mcknight'),('A00000006','Mohamed','Osborn'),('A00000007','Ayesha','Castillo'),('A00000008','Fay','Mcconnell'),('A00000009','Virgil','Flores'),('A00000010','Annabel','Zuniga'),('A00000011','Huw','Cuevas'),('A00000012','Rayhan','Jimenez'),('A00000013','Belle','Rodgers'),('A00000014','Claude','Perkins'),('A00000015','Honey','Young'),('A00000016','Jayson','Murphy'),('A00000017','Saoirse','Deleon'),('A00000018','Leia','Blankenship'),('A00000019','Lewis','Vargas'),('A00000020','Yasir','Higgins'),('A00000021','Tianna','Herrera'),('A00000022','Alina','Lindsey'),('A00000023','Anisha','Shepherd'),('A00000024','Hamish','Estes'),('A00000025','Otto','Levine'),('A00000026','Edna','Hines'),('A00000027','Lia','Nixon'),('A00000028','Yasmine','Jensen'),('A00000029','Charlotte','Haines'),('A00000030','Joshua','Kline'),('A00000031','Jackson','Mcmahon'),('A00000032','Keira','Li'),('A00000033','Aiden','Owens'),('A00000034','Arun','Levy'),('A00000035','Guy','Macdonald'),('A00000036','Rajan','Day'),('A00000037','Tina','Andrade'),('A00000038','Maariyah','Wallace'),('A00000039','Alysha','O\'Sullivan'),('A00000040','Asma','Beltran'),('A00000041','Rachel','Velasquez'),('A00000042','Ishaq','Church'),('A00000043','Aditya','Gaines'),('A00000044','Issac','Valencia'),('A00000045','Harriet','Molina'),('A00000046','Nellie','Livingston'),('A00000047','Chiara','Burns'),('A00000048','Katherine','Marquez'),('A00000049','Eliot','Patterson'),('A00000050','Alice','Leonard'),('A00000051','Usman','Meadows'),('A00000052','Eliza','Hodge'),('A00000053','Thea','Valenzuela'),('A00000054','Aleesha','Hubbard'),('A00109240','Tyler','Fowler'),('A00109241','John','Smith'),('A00109255','Ahsanur','Rahman');
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

-- Dump completed on 2023-12-02 19:47:50
