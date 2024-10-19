-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: dumna
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `adopter`
--

DROP TABLE IF EXISTS `adopter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopter` (
  `adopter_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `adoption_date` date NOT NULL,
  `amount_for_adoption` decimal(10,2) NOT NULL,
  `mode_of_transaction` varchar(50) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `animal_id` int DEFAULT NULL,
  PRIMARY KEY (`adopter_id`),
  KEY `username` (`username`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `adopter_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `adopter_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopter`
--

LOCK TABLES `adopter` WRITE;
/*!40000 ALTER TABLE `adopter` DISABLE KEYS */;
INSERT INTO `adopter` VALUES (1,'Aarav Singh','aarav.singh@example.com','9876543210','2023-01-15',1000.00,'Credit Card','TXN12345','Aarav',1),(2,'Maya Sharma','maya.sharma@example.com','9876543211','2023-02-10',1200.00,'Debit Card','TXN12346','Maya',3),(3,'Vivaan Rao','vivaan.rao@example.com','9876543212','2023-03-05',1500.00,'Net Banking','TXN12347','Vivaan',5),(4,'Riya Kapoor','riya.kapoor@example.com','9876543213','2023-04-20',1800.00,'UPI','TXN12348','Riya',7),(5,'Zara Khan','zara.khan@example.com','9876543214','2023-05-12',2000.00,'Credit Card','TXN12349','Zara',9);
/*!40000 ALTER TABLE `adopter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `species_type` varchar(50) NOT NULL,
  `arrival_date` date NOT NULL,
  `health_status` enum('Healthy','Sick','Injured') NOT NULL,
  `staff_id` int DEFAULT NULL,
  `habitat_id` int DEFAULT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `staff_id` (`staff_id`),
  KEY `habitat_id` (`habitat_id`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`habitat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Leo',3,'Lion','2022-01-15','Healthy',1,1),(2,'Ella',2,'Elephant','2022-03-10','Healthy',2,2),(3,'Zara',4,'Zebra','2022-02-22','Sick',3,3),(4,'Kavi',5,'Kangaroo','2022-04-12','Injured',4,4),(5,'Ravi',2,'Tiger','2022-05-18','Healthy',5,5),(6,'Nina',1,'Giraffe','2022-06-25','Healthy',1,1),(7,'Simba',6,'Lion','2022-07-30','Injured',2,2),(8,'Maya',3,'Elephant','2022-08-14','Healthy',3,3),(9,'Daisy',4,'Zebra','2022-09-01','Sick',4,4),(10,'Tara',2,'Kangaroo','2022-10-20','Healthy',5,5),(11,'Chester',7,'Tiger','2022-11-03','Injured',1,NULL),(12,'Bella',2,'Giraffe','2022-12-16','Healthy',2,NULL),(13,'Rocky',5,'Lion','2023-01-25','Healthy',3,NULL),(14,'Sophie',4,'Elephant','2023-02-19','Sick',4,NULL),(15,'Lily',3,'Zebra','2023-03-11','Injured',5,NULL),(16,'Max',2,'Kangaroo','2023-04-07','Healthy',1,NULL),(17,'Leo',5,'Tiger','2023-05-15','Healthy',2,NULL),(18,'Ella',4,'Giraffe','2023-06-20','Sick',3,NULL),(19,'Zara',1,'Lion','2023-07-25','Injured',4,NULL),(20,'Kavi',3,'Elephant','2023-08-30','Healthy',5,NULL),(21,'Ravi',2,'Zebra','2023-09-14','Healthy',1,NULL),(22,'Nina',4,'Kangaroo','2023-10-01','Injured',2,NULL),(23,'Simba',3,'Tiger','2023-11-05','Healthy',3,NULL),(24,'Maya',2,'Giraffe','2023-12-12','Sick',4,NULL),(25,'Daisy',4,'Lion','2024-01-20','Healthy',5,NULL),(26,'Tara',1,'Elephant','2024-02-18','Injured',1,NULL);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_care`
--

DROP TABLE IF EXISTS `animal_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_care` (
  `care_id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `veterinary_support` varchar(100) NOT NULL,
  `animal_health_status` varchar(100) NOT NULL,
  `care_duration_days` int NOT NULL,
  PRIMARY KEY (`care_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `animal_care_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_care`
--

LOCK TABLES `animal_care` WRITE;
/*!40000 ALTER TABLE `animal_care` DISABLE KEYS */;
INSERT INTO `animal_care` VALUES (1,1,'On-site Veterinarian','Stable',30),(2,3,'External Clinic','Recovering',15),(3,5,'On-site Veterinarian','Critical',45),(4,7,'Mobile Vet Team','Under Observation',20),(5,9,'External Clinic','Stable',10);
/*!40000 ALTER TABLE `animal_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `deptid` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Wildlife Conservation','Focused on preserving and protecting wildlife and their habitats.'),(2,'Visitor Services','Handles visitor inquiries, tours, and educational programs for guests.'),(3,'Research and Education','Conducts research on local ecosystems and provides educational outreach.'),(4,'Habitat Management','Responsible for maintaining and restoring natural habitats within the sanctuary.'),(5,'Animal Care and Rehabilitation','Cares for injured wildlife and rehabilitates them for release into the wild.');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `development`
--

DROP TABLE IF EXISTS `development`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `development` (
  `development_id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `project_name` varchar(100) NOT NULL,
  `project_lead` varchar(100) NOT NULL,
  `project_completion_date` date NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  PRIMARY KEY (`development_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `development_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `development`
--

LOCK TABLES `development` WRITE;
/*!40000 ALTER TABLE `development` DISABLE KEYS */;
INSERT INTO `development` VALUES (1,1,'New Enclosure Construction','John Doe','2023-09-15',50000.00),(2,3,'Visitor Center Renovation','Jane Smith','2023-11-01',70000.00),(3,5,'Habitat Expansion','Emily Davis','2024-01-20',90000.00),(4,7,'Cafeteria Extension','Michael Brown','2024-02-10',40000.00),(5,9,'Zoo Security Upgrade','Sarah Lee','2024-03-30',60000.00);
/*!40000 ALTER TABLE `development` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donar`
--

DROP TABLE IF EXISTS `donar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donar` (
  `donar_id` int NOT NULL AUTO_INCREMENT,
  `donar_name` varchar(100) NOT NULL,
  `donar_contact` varchar(15) NOT NULL,
  `donar_email` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`donar_id`),
  KEY `username` (`username`),
  CONSTRAINT `donar_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donar`
--

LOCK TABLES `donar` WRITE;
/*!40000 ALTER TABLE `donar` DISABLE KEYS */;
INSERT INTO `donar` VALUES (1,'Ayaan Kumar','9876543215','ayaan.kumar@example.com','Ayaan'),(2,'Kian Sharma','9876543216','kian.sharma@example.com','Kian'),(3,'Tara Bansal','9876543217','tara.bansal@example.com','Tara'),(4,'Nina Desai','9876543218','nina.desai@example.com','Nina'),(5,'Saanvi Malhotra','9876543219','saanvi.malhotra@example.com','Saanvi'),(6,'Vihaan Joshi','9876543220','vihaan.joshi@example.com','Vihaan'),(7,'Disha Verma','9876543221','disha.verma@example.com','Disha'),(8,'Misha Thakur','9876543222','misha.thakur@example.com','Misha'),(9,'Kavi Kapoor','9876543223','kavi.kapoor@example.com','Kavi'),(10,'Ritika Patel','9876543224','ritika.patel@example.com','Ritika'),(11,'Lakshmi Gupta','9876543225','lakshmi.gupta@example.com','Lakshmi'),(12,'Shiv Narayan','9876543226','shiv.narayan@example.com','Shiv'),(13,'Aditi Jain','9876543227','aditi.jain@example.com','Aditi'),(14,'Pooja Mehra','9876543228','pooja.mehra@example.com','Pooja'),(15,'Soniya Arora','9876543229','soniya.arora@example.com','Soniya');
/*!40000 ALTER TABLE `donar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `facility_id` int NOT NULL AUTO_INCREMENT,
  `date_of_implementation` date NOT NULL,
  `amount_utilised` decimal(10,2) NOT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'2023-01-10',10000.00),(2,'2023-01-20',12000.00),(3,'2023-02-15',15000.00),(4,'2023-02-28',18000.00),(5,'2023-03-10',11000.00),(6,'2023-03-20',14000.00),(7,'2023-04-05',13000.00),(8,'2023-04-25',16000.00),(9,'2023-05-10',19000.00),(10,'2023-05-30',20000.00),(11,'2023-06-15',17000.00),(12,'2023-06-28',22000.00),(13,'2023-07-10',25000.00),(14,'2023-07-25',30000.00),(15,'2023-08-05',28000.00);
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitat` (
  `habitat_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(100) NOT NULL,
  `capacity` int NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`habitat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
INSERT INTO `habitat` VALUES (1,'Savannah Exhibit',20,'Open'),(2,'Rainforest Enclosure',15,'Covered'),(3,'Desert Habitat',10,'Open'),(4,'Aquatic Center',25,'Water'),(5,'Mountain Range',12,'Open');
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `maintenance_id` int NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `equipment_used` varchar(100) NOT NULL,
  `maintenance_duration_days` int NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`maintenance_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,2,'Cleaning Machines',7,5000.00),(2,4,'Repair Tools',10,8000.00),(3,6,'Fencing Equipment',12,10000.00),(4,8,'Water Pumps',5,3000.00),(5,10,'Generator Repair Kit',8,4500.00);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Aarav','managerpass1',1),(2,'Vivaan','managerpass2',2),(3,'Reya','managerpass3',3),(4,'Maya','managerpass4',4),(5,'Aria','managerpass5',5);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `role` varchar(100) NOT NULL,
  `shift` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `hiredate` date NOT NULL,
  `contact` varchar(15) NOT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `dept_id` (`dept_id`),
  KEY `username` (`username`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`deptid`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Aarav','Aarav','Raj','Sharma','Wildlife Biologist','Day',50000.00,'Male','2022-01-15','9876543210',1),(2,'Vivaan','Vivaan','Kumar','Sharma','Visitor Services Coordinator','Day',40000.00,'Male','2022-02-10','9876543211',2),(3,'Reya','Reya','Ali','Khan','Conservation Officer','Night',55000.00,'Female','2022-03-22','9876543212',1),(4,'Maya','Maya','Riya','Desai','Education Officer','Day',42000.00,'Female','2022-04-05','9876543213',3),(5,'Aria','Aria','Anil','Verma','Animal Care Specialist','Day',48000.00,'Female','2022-01-25','9876543214',5),(6,'Ayaan','Ayaan','Ravi','Kumar','Habitat Manager','Night',52000.00,'Male','2022-06-12','9876543215',4),(7,'Kian','Kian','Neha','Gupta','Wildlife Photographer','Day',43000.00,'Male','2022-07-19','9876543216',2),(8,'Riya','Riya','Amit','Singh','Research Scientist','Night',60000.00,'Female','2022-08-15','9876543217',3),(9,'Tara','Tara','Poonam','Chopra','Marketing Coordinator','Day',45000.00,'Female','2022-09-30','9876543218',2),(10,'Nina','Nina','Kishore','Nair','Animal Behaviorist','Day',55000.00,'Male','2022-10-21','9876543219',1),(11,'Saanvi','Saanvi','Ananya','Dutta','Visitor Guide','Day',39000.00,'Female','2022-11-10','9876543200',2),(12,'Zara','Zara','Ravi','Mishra','Conservation Volunteer','Day',30000.00,'Male','2022-12-01','9876543201',1),(13,'Vihaan','Vihaan','Ritika','Malhotra','Administrative Assistant','Day',37000.00,'Female','2023-01-14','9876543202',2),(14,'Kavi','Kavi','Shiv','Bansal','Wildlife Educator','Night',44000.00,'Male','2023-02-20','9876543203',3),(15,'Disha','Disha','Priti','Bhatt','Field Researcher','Day',51000.00,'Female','2023-03-10','9876543204',3),(16,'Misha','Misha','Vikas','Yadav','Sanctuary Manager','Day',75000.00,'Male','2023-04-25','9876543205',4),(17,'Ravi','Ravi','Aditi','Kaur','Wildlife Rehabilitation Specialist','Night',53000.00,'Female','2023-05-18','9876543206',5),(18,'Neha','Neha','Vinay','Choudhary','Community Outreach Coordinator','Day',40000.00,'Male','2023-06-02','9876543207',2),(19,'Rohan','Rohan','Sonia','Tripathi','Wildlife Policy Analyst','Day',52000.00,'Female','2023-07-14','9876543208',1),(20,'Anya','Anya','Dev','Rawat','Animal Enrichment Coordinator','Night',47000.00,'Female','2023-08-30','9876543209',5),(21,'Diya','Diya','Arjun','Bhatia','Environmental Educator','Day',39000.00,'Male','2023-09-19','9876543210',3),(22,'Isha','Isha','Harsh','Shukla','Wildlife Technician','Night',45000.00,'Male','2023-10-10','9876543211',1),(23,'Kiran','Kiran','Neelam','Soni','Volunteer Coordinator','Day',36000.00,'Female','2023-11-12','9876543212',2),(24,'Ritika','Ritika','Rani','Jain','Sustainability Officer','Day',43000.00,'Female','2023-12-01','9876543213',4),(25,'Akash','Akash','Sunil','Goel','Wildlife Tour Manager','Day',46000.00,'Male','2024-01-15','9876543214',2),(26,'Simran','Simran','Aarti','Sharma','Outreach Program Leader','Day',48000.00,'Female','2024-02-14','9876543215',3);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `donar_id` int DEFAULT NULL,
  `date_of_transaction` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `mode_of_payment` varchar(50) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `donar_id` (`donar_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`donar_id`) REFERENCES `donar` (`donar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,'2023-06-01',5000.00,'Credit Card'),(2,2,'2023-06-05',4500.00,'Debit Card'),(3,3,'2023-06-10',3000.00,'Net Banking'),(4,4,'2023-06-15',3500.00,'UPI'),(5,5,'2023-06-20',4000.00,'Credit Card'),(6,6,'2023-07-01',2500.00,'UPI'),(7,7,'2023-07-05',6000.00,'Net Banking'),(8,8,'2023-07-10',7000.00,'Credit Card'),(9,9,'2023-07-15',8000.00,'Debit Card'),(10,10,'2023-07-20',5500.00,'Credit Card'),(11,11,'2023-08-01',9000.00,'UPI'),(12,12,'2023-08-05',7500.00,'Net Banking'),(13,13,'2023-08-10',9500.00,'Debit Card'),(14,14,'2023-08-15',6500.00,'Credit Card'),(15,15,'2023-08-20',5000.00,'UPI');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aarav','aarav@example.com','password123'),(2,'Vivaan','vivaan@example.com','password456'),(3,'Reya','reya@example.com','password789'),(4,'Maya','maya@example.com','password101'),(5,'Aria','aria@example.com','password202'),(6,'Ayaan','ayaan@example.com','password303'),(7,'Kian','kian@example.com','password404'),(8,'Riya','riya@example.com','password505'),(9,'Tara','tara@example.com','password606'),(10,'Nina','nina@example.com','password707'),(11,'Saanvi','saanvi@example.com','password808'),(12,'Zara','zara@example.com','password909'),(13,'Vihaan','vihaan@example.com','password010'),(14,'Kavi','kavi@example.com','password111'),(15,'Disha','disha@example.com','password212'),(16,'Misha','misha@example.com','password313'),(17,'Ravi','ravi@example.com','password414'),(18,'Neha','neha@example.com','password515'),(19,'Rohan','rohan@example.com','password616'),(20,'Anya','anya@example.com','password717'),(21,'Diya','diya@example.com','password818'),(22,'Isha','isha@example.com','password919'),(23,'Kiran','kiran@example.com','password020'),(24,'Ritika','ritika@example.com','password121'),(25,'Akash','akash@example.com','password222'),(26,'Simran','simran@example.com','password323'),(27,'Aditi','aditi@example.com','password424'),(28,'Lakshmi','lakshmi@example.com','password525'),(29,'Tanvi','tanvi@example.com','password626'),(30,'Nidhi','nidhi@example.com','password727'),(31,'Shiv','shiv@example.com','password828'),(32,'Asha','asha@example.com','password929'),(33,'Pooja','pooja@example.com','password030'),(34,'Soniya','soniya@example.com','password131'),(35,'Gaurav','gaurav@example.com','password232'),(36,'Kajal','kajal@example.com','password333'),(37,'Dev','dev@example.com','password434'),(38,'Priya','priya@example.com','password535'),(39,'Rhea','rhea@example.com','password636'),(40,'Samir','samir@example.com','password737'),(41,'Kavya','kavya@example.com','password838'),(42,'Anil','anil@example.com','password939'),(43,'Sita','sita@example.com','password040');
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

-- Dump completed on 2024-10-20  0:09:07
