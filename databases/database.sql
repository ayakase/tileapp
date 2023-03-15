CREATE DATABASE  IF NOT EXISTS `tileweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tileweb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tileweb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('123a','123456','Vũ Văn An','23092001anvu@gmail.com','0866939899'),('1a','123456','Vũ Văn An','23092001anvu@gmail.com','0866939899'),('a123','123456','Vũ Văn An','23092001anvu@gmail.com','0866939899'),('a1234','123','Vũ Văn An','23092001anvu@gmail.com','0866939899'),('abc123','123456','Tôi Là Tét','test@abc.com','0123456789'),('an1','123456','hanh','23092001anvu@gmail.com','0866939899'),('an2309','123456','Vũ Văn An','23092001anvu@gmail.com','0866939899'),('as','123456','Vũ Văn An','23092001anvu@gmail.com','0866939899'),('hoang0807','123456','Hoàng Lưu','viethoang080701@gmail.com','0971455201'),('undefined','undefined','undefined','undefined','undefined'),('vuvanan2309','123456','Vũ Văn An','23092001anvu','0866939899');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_no` int NOT NULL,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Gạch ốp tường'),(2,'Gạch lát nền'),(3,'Gạch sàn nước'),(4,'Gạch trang trí');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` varchar(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_brand` varchar(100) NOT NULL,
  `product_image` char(50) NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `product_status` varchar(50) NOT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `category_no` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_no` (`category_no`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_no`) REFERENCES `category` (`category_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('10015_D','GẠCH ỐP TƯỜNG 10015_D','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10015_Gạch Bộ','GẠCH ỐP TƯỜNG 10015_gạch bộ','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10015_L1','GẠCH ỐP TƯỜNG 10015_L1','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10016_HL1','GẠCH ỐP TƯỜNG 10016_HL1','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10016_L','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10016F','GẠCH SÀN NƯỚC NHẬP KHẨU','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',3),('10016HL-1','GẠCH ỐP TƯỜNG 10016_HL1','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10017_F','GẠCH SÀN NƯỚC NHẬP KHẨU','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',3),('10017_HL-1','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10017_HL-2','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10018_BỘ 1','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10018_BỘ HL2','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10018_HL1','GẠCH ỐP TƯỜNG 10018_HL1','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10018_HL1	','GẠCH TRANG TRÍ 10018_HL1','(unknown)','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','(unknown)',4),('10018_HL2','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('10018_L','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('1080_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('1082_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('1083_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('1137','GẠCH ỐP TƯỜNG 1137','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('1137_BỘ','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','','Ấn Độ',1),('1137_D','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('1137_FD','GẠCH SÀN NƯỚC NHẬP KHẨU','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',3),('1137_L','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('1137_LA','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('1167_BỘ','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('1167_FD','GẠCH SÀN NƯỚC NHẬP KHẨU','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',3),('1167_H-LA-LB','GẠCH ỐP TƯỜNG NHẬP KHẨU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',4),('1167_L','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('1167-D','GẠCH ỐP TƯỜNG NHẬP KHẢU','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('2083_D','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('2083_HL','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('2083_L','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('3051_(60-120)','GẠCH ỐP TƯỜNG NHẬP KHẢU 60X120 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('3052_(60-120)','GẠCH ỐP TƯỜNG NHẬP KHẢU 60X120 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('3053_(60-120)','GẠCH ỐP TƯỜNG NHẬP KHẢU 60X120 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('GLACIER WHITE_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('HP 0266-5002','ĐÁ BÓNG KIẾNG TOÀN PHẦN 60X60 NICE','NICE CERAMIC','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('HP 0266-6003','ĐÁ BÓNG KIẾNG TOÀN PHẦN 60X60 NICE','NICE CERAMIC','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('HP 0266-6006','ĐÁ BÓNG KIẾNG TOÀN PHẦN 60X60 NICE','NICE CERAMIC','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('INDIAN_STONE_BEIGE_P','INDIAN_STONE_BEIGE_P_','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('LAFAYETE_BEIGE_P','GẠCH LÁT NỀN NHẬP KHẨU 80X80 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('LAFAYETE_BROWN_P','LAFAYETE_BROWN_P_','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('LK 0166-6003','ĐÁ BÓNG KIẾNG TOÀN PHẦN 60X60 NICE','NICE CERAMIC','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('LK 0166-6011','ĐÁ BÓNG KIẾNG TOÀN PHẦN 60X60 NICE','NICE CERAMIC','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('LK 0166-6012','ĐÁ BÓNG KIẾNG TOÀN PHẦN 60X60 NICE','NICE CERAMIC','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('LK 0166-6014','ĐÁ BÓNG KIẾNG TOÀN PHẦN 60X60 NICE','NICE CERAMIC','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('NB5053D','GẠCH LÁT NỀN 50X50 CM, KỸ THUẬT SỐ','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('NUT WOOD_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('PIEDRA_Bộ','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PIEDRA_D','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PIEDRA_F','GẠCH SÀN NƯỚC NHẬP KHẨU','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',3),('PIEDRA_L','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PIEDRA-DECOR_1','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PISTANO_BỘ','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PISTANO_D','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM\r\n\r\n','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PISTANO_DE','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PISTANO_F','GẠCH SÀN NƯỚC NHẬP KHẨU','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',3),('PISTANO_L','GẠCH ỐP TƯỜNG NHẬP KHẢU 30X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',1),('PREMILUM_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('SANDAL-WOOD_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('SPARATAN BEIGE_60','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('SPATAN OLIVER','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Ấn Độ',2),('SPRING GLOD PREMIUM_','GẠCH LÁT NỀN NHẬP KHẨU 60X60 CM','Ấn Độ','https://gachoplatcaocaphathinhphat.com/gach-lat-ne','Thương lượng','Còn hàng','Ấn Độ',2),('SV4603M','GẠCH LÁT NỀN 50X50 CM, KỸ THUẬT SỐ','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('V5611','GẠCH LÁT NỀN 50X50 CM, MÀI CẠNH','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('V5818M','GẠCH LÁT NỀN 50X50 CM, KỸ THUẬT SỐ','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',2),('W2413VB','GẠCH ỐP TƯỜNG 25X40 CM','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',1),('W2500','GẠCH ỐP TƯỜNG 25X40 CM','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',1),('W2608D','GẠCH TRANG TRÍ 25X40 CM','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',4),('W2612D','GẠCH ỐP TƯỜNG 25X40, KỸ THUẬT SỐ','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',1),('W3485V','GẠCH ỐP TƯỜNG 30X45, KỸ THUẬT SỐ, MÀI CẠNH','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',1),('W3674V','GẠCH ỐP TƯỜNG 30X60, KỸ THUẬT SỐ, MÀI CẠNH','Vitaly','https://gachoplatcaocaphathinhphat.com/datafiles/8','Thương lượng','Còn hàng','Việt Nam',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tileweb'
--

--
-- Dumping routines for database 'tileweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18 21:58:16
