-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: student_attendance
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,'Om','om@gmail.com','om@123','om123'),(4,'Aarav Sharma','aarav@gmail.com','aarav@123','aarav'),(5,'Aisha Patel','aisha@gmail.com','aisha@123','aisha'),(6,'Diya Mehta','diya@gmail.com','diya@123','diya'),(7,'admin','admin@gmail.com','admin','admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (1,'Harsh Ubale','1234567890','harsh@gmail.com','We will check and solve or update your issue','harsh@21');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_attendance`
--

LOCK TABLES `student_attendance` WRITE;
/*!40000 ALTER TABLE `student_attendance` DISABLE KEYS */;
INSERT INTO `student_attendance` VALUES (1,'present','2023-12-20'),(2,'present','2023-12-20'),(4,'present','2023-12-20'),(5,'absent','2023-12-20'),(6,'present','2023-12-20'),(7,'present','2023-12-20'),(8,'absent','2023-12-20'),(9,'absent','2023-12-20'),(10,'present','2023-12-20'),(11,'present','2023-12-20'),(12,'present','2023-12-20'),(13,'present','2023-12-20'),(14,'present','2023-12-20'),(15,'present','2023-12-20'),(16,'present','2023-12-20'),(17,'present','2023-12-20'),(18,'present','2023-12-20'),(19,'present','2023-12-20'),(20,'present','2023-12-20'),(21,'present','2023-12-20'),(22,'present','2023-12-20'),(23,'present','2023-12-20'),(24,'present','2023-12-20'),(25,'present','2023-12-20'),(26,'absent','2023-12-20'),(27,'present','2023-12-20'),(28,'present','2023-12-20'),(29,'present','2023-12-20'),(30,'present','2023-12-20'),(31,'present','2023-12-20'),(33,'present','2023-12-20'),(34,'present','2023-12-20'),(35,'absent','2023-12-20'),(36,'present','2023-12-20'),(37,'absent','2023-12-20'),(38,'present','2023-12-20'),(39,'present','2023-12-20'),(40,'present','2023-12-20'),(41,'present','2023-12-20'),(43,'present','2023-12-20'),(44,'present','2023-12-20'),(45,'present','2023-12-20'),(46,'absent','2023-12-20'),(47,'present','2023-12-20'),(48,'present','2023-12-20'),(49,'present','2023-12-20'),(50,'absent','2023-12-20'),(53,'present','2023-12-20'),(54,'present','2023-12-20'),(56,'present','2023-12-20'),(57,'present','2023-12-20'),(58,'present','2023-12-20'),(60,'present','2023-12-20'),(61,'present','2023-12-20'),(63,'present','2023-12-20'),(64,'present','2023-12-20'),(65,'present','2023-12-20');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_feedback`
--

LOCK TABLES `student_feedback` WRITE;
/*!40000 ALTER TABLE `student_feedback` DISABLE KEYS */;
INSERT INTO `student_feedback` VALUES (1,'Avani Ubale','786567890','Feedback regarding the \"Human Rights Indian Judiciary System and the constitution of India\". It was a great workshop. I have got a lot of information about Human Rights. It is necessary that every individual know their rights. Hope for getting more such workshops further.\r\nThank You,\r\nAvani Ubale','avani@123');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_leave`
--

LOCK TABLES `student_leave` WRITE;
/*!40000 ALTER TABLE `student_leave` DISABLE KEYS */;
INSERT INTO `student_leave` VALUES (1,'Harsh Ubale','Respected Mam, \r\nI have a Function at my home, so I wanted a 2 days leave on 21st and 22nd Dec,2023. I assure you that I will complete the work of these two days missed. Kindly please grant me this leave.\r\nThank You,\r\nHarsh Ubale',2,'Pending','2023-12-20'),(2,'Gauri Vinod Paturkar','Respected Mam, \r\nI have been taking treatment for Micrane. Due to the treatment, I will not be able to attend the college for 4 days. I want a leave of 4 days. Hope you will grant me this 4 days leave.\r\nThank you,\r\nGauri Paturkar',4,'Approved','2023-12-20');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Harsh Ubale','FY, A','1234567890','Pune','harsh@gmail.com','harsh@21','Bs4BEGz69n',1),(2,'Avani Ubale','FY, C','786567890','Pune','avani@gmail.com','avani@123','233VpMxcPB',1),(3,'Abhishek Kumar Singh','FY, B','9134567432','123, Green AvenueCity: New DelhiPin Code: 110001','abhishek@gmail.com','abhishek@123','qZZHJ5PNBR',0),(4,'Akshad Sharad Mali','FY, C','9368935673','456, Jasmine StreetCity: MumbaiPin Code: 400001','akshad@gmail.com','akshad@123','8Vds8ZHFxH',1),(5,'Amarjeet Babu','FY, B','8745290867','789, Lotus ColonyCity: BangalorePin Code: 560001','amarjeet@gmail.com','amarjeet@123','5jzWWN2PN3',1),(6,'Amisha Sunil Mandekar','FY, A','7865389709','234, River View Apartments, Pune','amisha@gmail.com','amisha@123','S4h9Y2TyFh',1),(7,'Amol Dilip Chavan','FY, B','8720876578','567, Saffron Nagar, Sambaji Nagar','amol@gmail.com','amol@123','NJEGnFsFe4',1),(8,'Aniket Gajanan Kalaskar','FY, C','9634097867','890, Pine Tree Lane, Pune','aniket@gmail.com','aniket@123','fqTkXV55RA',1),(9,'Aniket Mishra','FY, C','9327836567','321, Sunflower Gardens, Pune','aniket2@gmail.com','aniket2@123','EfbAnt2@XT',1),(10,'Anurang Singh Yadav','FY, B','9876036789','876, Orchid Terrace, Nagar','anurang@gmail.com','anurang@123','ZhNkXpmUSp',1),(11,'Ashutosh Dhanaji Shivane','FY, B','9231087890','109, Silk Road, Pune','ashutosh@gmail.com','ashutosh@123','sgbB32mrEC',1),(12,'Bhavesh Anil Patil','FY, C','7635098765','432, Ivory Tower, Pune','bhavesh@gmail.com','bhavesh@123','p5q@bEwu2n',1),(13,'Chaudhari Manish Ganesh','FY, C','9206547845','765, Golden Crescent, Pune','manish@gmail.com','Manish','YtfKmCgKZU',1),(14,'Chinmay Duryodhan Darekar','FY, A','9803478657','210, Moonlight Avenue, Pune','chinmay@gmail.com','chinmay','3D@TDf3MTZ',1),(15,'Deep Santosh Dhebe','FY, B','8730879898','543, Silver Springs, Pune','deep@gmail.com','Deep','cFsZHve47n',1),(16,'Gaurav Raju Takale','FY, A','9807878889','876, Ruby PlazaCity: Nagpur','gaurav@gmail.com','Gaurav','@KnjGnuwPJ',1),(17,'Gauri Vinod Paturkar','FY, B','9048909089','123, Emerald Street, Nagpur','gauri@gmail.com','Gauri','gauri',1),(18,'Isha Sanjay Birajdar','FY, B','9087877887','456, Sapphire Circle, Pune','isha@gmail.com','Isha','ncvWbCs87t',1),(19,'Janhavi Jagannath Chitade','FY, C','8787878787','789, Topaz Tower, Pune','janhavi@gmail.com','Janhavi','aVCUgp5ZpW',1),(20,'Jogdand Deepakkumar Marutirao','FY, A','9090808089','234, Crystal Colony, Pune','deepak@gmail.com','Deepak','HpqNc8ASx5',1),(21,'Kalpesh Shivaji Jadhav','FY, B','8989768787','567, Diamond Lane, Nagpur','kalpesh@gmail.com','Kalpesh','6ShG7YKv9Q',1),(22,'Karan Sanjay Toge','FY, C','9823232333','876, Sapphire Springs, Nanded','karan@gmail.com','Karan','QWaD8BQBR5',1),(23,'Karpur Kranti Kabi','FY, C','9821112345','432, Jasmine Junction, Pune','karpur@gmail.com','Karpur','hQMdZxw8KS',1),(24,'Kunal Rajkumar Yenge','FY, B','9111777888','765, Pearl Path, Nagpur','kunal@gmail.com','Kunal','3xaTGJKg78',1),(25,'Mahesh Manik Kambke','FY, A','8744477788','210, Coral Cove, Pune','mahesh@gmail.com','Mahesh','waxEQGFQjx',1),(26,'Meenakshi Sharad Sawarkar','FY, C','920909023','876, Amethyst Avenue, Pune','meenakshi@gmail.com','Meenakshi','pys7FkqtDG',1),(27,'Mehak Jain','FY, B','9348777777','543, Ruby Ridge, Pune','mehak@gmail.com','Mehak','XRj2ANdHFy',1),(28,'Mithila Santosh Patil','FY, A','9366666634','123, Maple Lane, Pune','mithila@gmail.com','Mithila','tHhJ9bSJtG',1),(29,'Monika Murlidhar Salunke','FY, A','9666655544','456, Azure Apartments, Pune','monika@gmail.com','Monika','FbWnXxxFxg',1),(30,'Mrudul Dattatray Bangaiya','FY, A','8787878786','789, Marigold Meadows, Pune','mrudul@gmail.com','Mrudul','MehpsCcTU4',1),(31,'Mukul Shankar Shedge','FY, B','9666633388','234, Ebony Enclave, Pune','mukul@gmail.com','Mukul','gmkfqfZXwD',1),(32,'Nandini Sanjay Taru','FY, C','8888888767','567, Opal Orchards, Pune','nandini@gmail.com','Nandini','wsw4nNpMr5',0),(33,'Prajakta Marut Dorugade','FY, B','8888337756','890, Tangerine Terrace, Pune','prajakta@gmail.com','Prajakta','PS8SFw4F3g',1),(34,'Pranav Dilip Patil','FY, C','9867677777','321, Rainbow Residency, Nagar','pranav@gmail.com','Pranav','afQZ2usdgJ',1),(35,'Prathamesh Dnyandeo Phadtare','FY, B','8888777666','654, Olive Oasis, Pune','prathamesh@gmail.com','Prathamesh','eRrrAM66WR',1),(36,'Pratik Kumar Dodmani','FY, A','8777666554','876, Garnet Gardens, Pune','pratik@gmail.com','Pratik','A6U6PtKumA',1),(37,'Priti Sadashiv Thube','FY, C','8676767565','109, Crimson Colony, Pune','priti2@gmail.com','Priti@123','3Wyu9UEbYp',1),(38,'Rushikesh Shankar Changle','FY, A','7867564534','432, Lavender Lane, Pune','rushikesh@gmail.com','Rushikesh','FXGcvuX7A8',1),(39,'Rutuja Balasaheb Dhotre','FY, B','7686957645','765, Chestnut Circle, Pune','rutuja@gmail.com','Rutuja','UpmFNwEbKj',1),(40,'Sahil Jitendrabhai Patil','FY, A','8723656787','210, Cobalt Crescent, Pune','sahil@gmail.com','Sahil','aZbEwPpCbP',1),(41,'Sairaj Meghnath Tandel','FY, B','8767565555','543, Crimson Cove, Pune','sairaj@gmail.com','Sairaj','wcsPFHvVFp',1),(42,'Samruddhi Shrish Deshmukh ','FY, A','9111166645','876, Sapphire Square, Pune','samruddhi@gmail.com','Samruddhi','2pB@jvy2Nj',0),(43,'Sanket Deepak Tidke','FY, B','7676554333','109, Coral Court, Pune','sanket@gmail.com','Sanket','VcNrjYSrbc',1),(44,'Sarvesh Krishnakumar Ujalambe','FY, B','8267560989','654, Goldfish Gardens, Pune','sarvesh@gmail.com','Sarvesh','KkG5rmRaQt',1),(45,'Sayali Tukaram Rahinj','FY, C','9000888789','890, Cedar Colony, Pune','sayali@gmail.com','Sayali','N8qn4QBJRZ',1),(46,'Sayali Shrikant Powar','FY, C','8763678987','321, Moonstone Manor, Pune','sayali2@gmail.com','Sayali@123','UtCgZM2YY9',1),(47,'Shivam Gajanan Zoting','FY, B','7777565654','234, Turquoise Towers, Pune','shivam@gmail.com','Shivam','QB6Ub9HNSq',1),(48,'Shivanjali Hemant Dhumal','FY, B','7777444435','567, Magnolia Lane, Pune','shivanjali@gmail.com','Shivanjali','j2G@Zep54p',1),(49,'Shravani Umesh Inamdar','FY, A','8666664455','890, Quartz Quarters, Pune','shravani@gmail.com','Shravani','KuJAwFzqER',1),(50,'Shreyash Praful Ingle','FY, C','8722277556','321, Topaz Terrace, Pune','shreyash@gmail.com','Shreyash','9QkBdhkAgn',1),(51,'Shruti Kushal Belgamwar','FY, A','7637856453','654, Silver Springs, Pune','shruti@gmail.com','Shruti','cb8hE3jGa7',0),(52,'Shruti Sanjayrao Bhuyar','FY, C','7772277564','876, Orchid Oasis, Pune','shruti2@gmail.com','Shruti2','EJ6sC4EKcg',0),(53,'Shubham Vasudev Sathe','FY, C','8777553376','109, Crimson Court, Pune','shubham@gmail.com','Shubham','8mEc3EjWsr',1),(54,'Siddharth Yashwant Chavan','FY, A','8787676767','432, Emerald Enclave, Pune','siddharth@gmail.com','Siddharth','FTYZUHxdVY',1),(55,'Sidhi Vinod Ubale','FY, C','7675365675','765, Ruby Ridge, Pune','sidhi@gmail.com','Sidhi','7SgzTHHG9Q',0),(56,'Sonal Sudhakar Wankhade','FY, B','8765126789','210, Golden Gardens, Pune','sonal@gmail.com','Sonal','cMUVVj4fGJ',1),(57,'Subodh Sandeep Nadhe','FY, A','7777336665','543, Ivory Isle, Pune','subodh@gmail.com','Subodh','3xt4zPvGVE',1),(58,'Sumedha Adimath Mandhare','FY, B','90000777898','210, Golden Gardens, Pune','sumedha@gmail.com','Sumedha','YYxGMp8Dap',1),(59,'Swapnil Sanjay Kale','FY, B','9222111656','654, Silver Springs, Pune','swapnil@gmail.com','Swapnil','AMC8pxmFfP',0),(60,'Swapnil Vithal Gaikwad','FY, C','7777222656','567, Magnolia Lane, Pune','swapnil2@gmail.com','Swapnil','dCD5HJfUbb',1),(61,'Swarup Sunil Gaikwad','FY, B','7666622256','321, Topaz Terrace, Pune','swarup@gmail.com','Swarup','Dvnjvbqwr5',1),(62,'Tushar Umesh Lanjewar','FY, C','8777222888','654, Silver Springs, Pune','tushar@gmail.com','Tushar','xNWJ@2PzDu',0),(63,'Vidira Rajaram Vibhute','FY, C','9777555333','876, Orchid Oasis, Pune','vidira@gmail.com','Vidira','CMTkBA7SjP',1),(64,'Vijay Dnyanoba Sable','FY, B','9999966778','432, Emerald Enclave, Pune','vijay@gmail.com','Vijay','tXyWxX9VKW',1),(65,'Vishwajit Marotrao Bhosle','FY, B','9997775554','210, Golden Gardens, Pune','vishwajit@gmail.com','Vishwajit','ZZThvFaxk@',1),(66,'Vivek Chandrakant Ugale','FY, A','8833667873','543, Ivory Isle, Pune','vivek@gmail.com','Vivek','sBNmt3Tjx8',0),(67,'Yash Sanjay Mahajan','FY, B','7775554645','109, Crimson Court, Pune','yash@gmail.com','Yash','vXEZVS6bnR',0),(68,'Zeba Adil Patel','FY, C','9934567665','432, Emerald Enclave, Pune','zeba@gmail.com','Zeba','QZND8AhYKG',0);
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

-- Dump completed on 2024-03-23 21:15:09
