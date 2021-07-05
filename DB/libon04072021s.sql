-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: libon
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `book_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (12,1,5,'2021-05-06 08:01:30','2021-05-06 08:01:30'),(13,3,5,'2021-05-06 08:01:30','2021-05-06 08:01:30'),(17,6,7,'2021-05-06 19:00:26','2021-05-06 19:00:26'),(18,6,8,'2021-05-06 19:01:19','2021-05-06 19:01:19'),(19,8,9,'2021-05-06 19:02:26','2021-05-06 19:02:26'),(20,3,10,'2021-05-06 19:03:27','2021-05-06 19:03:27'),(21,7,10,'2021-05-06 19:03:27','2021-05-06 19:03:27'),(22,3,11,'2021-05-06 19:05:38','2021-05-06 19:05:38'),(23,7,11,'2021-05-06 19:05:38','2021-05-06 19:05:38'),(24,4,12,'2021-05-06 19:06:25','2021-05-06 19:06:25'),(27,3,15,'2021-05-07 04:24:12','2021-05-07 04:24:12'),(28,4,15,'2021-05-07 04:24:12','2021-05-07 04:24:12'),(31,5,15,'2021-06-15 10:25:45','2021-06-15 10:25:45'),(32,9,5,'2021-06-15 10:38:07','2021-06-15 10:38:07'),(33,9,6,'2021-06-15 10:38:12','2021-06-15 10:38:12'),(34,5,12,'2021-06-15 10:59:27','2021-06-15 10:59:27'),(35,5,11,'2021-06-15 10:59:33','2021-06-15 10:59:33'),(36,5,10,'2021-06-15 10:59:39','2021-06-15 10:59:39'),(37,5,7,'2021-06-15 10:59:46','2021-06-15 10:59:46'),(38,9,9,'2021-06-15 10:59:52','2021-06-15 10:59:52'),(39,4,18,'2021-06-17 03:11:18','2021-06-17 03:11:18'),(40,1,6,'2021-06-17 03:29:29','2021-06-17 03:29:29');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher_id` bigint unsigned NOT NULL,
  `page_number` int NOT NULL,
  `content_summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `can_borrow` tinyint NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  `borrowed` int NOT NULL DEFAULT '0',
  `pic_link` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preview_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (5,'Giáo trình tin học đại cương',1,245,'Trình bày những kiến thức căn bản về tin học và máy tính. Giải quyết một số bài toán biểu diễn thuật toán và các thuật toán thông dụng. Giới thiệu kiến thức nền tảng của ngôn ngữ lập trình C.','Trần Đình Khang (chủ biên)',1,3,0,'[\"\\/img\\/books\\/_7fc78a4ac31155f0.png\",\"\\/img\\/books\\/_5a7da2c7d1fe41f1.png\",null,null,\"\\/img\\/books\\/_7fc78a4ac31155f4.png\"]',NULL,'2021-06-17 12:51:38','uploads/_92ff14f49b1f579.pdf'),(6,'Bài tập tin học đại cương',1,101,'Bố cục sách gồm có phần câu hỏi trắc nghiệm và phần bài tập tự luận. Phần trắc nghiệm gồm các phần: tin học căn bản, giải quyết bài toán và lập trình. Phần bài tập tự luận gồm bài tập lập trình và một số bài tập có lời giải và một số bài người đọc tự giải.','Trần Đình Khang (chủ biên)',1,1,0,'[\"\\/img\\/books\\/_b8e74c9fa2bba240.png\",null,null,null,null]',NULL,'2021-06-17 13:45:10','uploads/_ea0b8ed56487347.pdf'),(7,'Kỹ thuật điện tử',4,271,'Giới thiệu một cách hệ thống những kiến thức cơ bản và hiện đại của ngành Kỹ thuật điện tử về các vấn đề: các thông số của mạch điện, tín hiệu điện, các cấu kiện dụng cụ điện tử có hiệu ứng chỉnh lưu và khuếch đại, kĩ thuật xung- số, biến đổi điện áp và dòng điện, hệ thống vi xử lý công nghiệp...','Đỗ Xuân Thụ (chủ biên)',1,3,1,'[\"\\/img\\/books\\/_fb388f65e8867890.png\",null,null,null,null]',NULL,'2021-07-04 07:25:37','uploads/_ba7906ea63de2ac.pdf'),(8,'Bài tập kỹ thuật điện tử',4,187,'Giới thiệu tóm tắt các vấn đề cơ bản của lý thuyết và các bài tập có lời giải trong đó có các bài tập liên quan tới kỹ thuật xung - số (kỹ thuật digital).','Đỗ Xuân Thụ, Nguyễn Viết Nguyên',0,1,1,'[\"\\/img\\/books\\/_e9e472369c5d2350.png\",null,null,null,null]',NULL,'2021-06-17 13:03:42','uploads/_21f1b19539e2ce2.pdf'),(9,'Cấu trúc dữ liệu và giải thuật',3,308,'Trình bày mối quan hệ giữa cấu trúc dữ liệu và giải thuật, vấn đề thiết kế, phân tích giải thuật và giải thuật đệ qui; một số cấu trúc dữ liệu, giải thuật xử lý chúng, vài ứng dụng điển hình; các kinh nghiệm về thiết kế, cài đặt, sắp xếp và tìm kiếm.','Đỗ Xuân Lôi',0,1,1,'[\"\\/img\\/books\\/_19be5d809e3a6380.png\",null,null,null,null]',NULL,'2021-06-17 13:26:45','uploads/_a17d6f44063f1f2.pdf'),(10,'Toán học cao cấp Tập 1',4,390,'Toán học cao cấp Tập 1: Đại số và hình học giải tích \r\nTrình bày các khái niệm về toán học cao cấp: tập hợp và ánh xạ, cấu trúc đại số-số phức đa thức và phân thức hữu tỉ, định thức ma trận hệ phương trình tuyến tính đại số véctơ và hình học giải tích, không gian véctơ, không gian enclid, ánh xạ tuyến tính, tự riêng và véctơ riêng đạng toàn phương, số thực, hàm số một biến số thực, giới hạn và sự liên tục của hàm số một biến, đạo hàm và vi phân của hàm số một biến số, các định lý về giá trị trung bình, nguyên hàm và tích phân bất định, tích phân xác định chuỗi, hàm số nhiều biến số, ứng dụng của phép tính vi phân trong hình học, tích phân bội, tích phân đường, tích phân mặt, phương trình vi phân.','Nguyễn Đình Trí (chủ biên)',1,1,0,'[\"\\/img\\/books\\/_99d33de597aec990.png\",null,null,null,null]',NULL,'2021-06-17 13:21:26','uploads/_0db037e22f7a1a4.pdf'),(11,'Toán học cao cấp Tập 2',4,423,'Toán học cao cấp Tập 2: Giải tích\r\nTrình bày về phép tính giải tích của hàm một biến và hàm nhiều biến.','Nguyễn Đình Trí (chủ biên)',1,2,0,'[\"\\/img\\/books\\/_41a0804bc3297680.png\",null,null,null,null]',NULL,'2021-06-17 13:21:41','uploads/_e02edb43ef3c8ca.pdf'),(12,'Vật lý đại cương Tập 1',4,267,'Vật lý đại cương Tập 1: Cơ - Nhiệt \r\nPhần cơ học: động học chất điểm, động lực học chất điểm, động lực học hệ chất điểm động lực học vật rắn, năng lượng, trường hấp dẫn, cơ học chất lưu, thuyết tương đối hẹp Anhxtanh. Phần nhiệt học: nguyên lý thứ nhất của nhiệt động học, nguyên lý thứ hai của nhiệt động học, khí thực, chất lỏng, vật lí thống kê cổ điển.','Lương Duyên Bình (chủ biên)',1,3,0,'[\"\\/img\\/books\\/_796ea59bec71d280.png\",null,null,null,null]',NULL,'2021-06-17 13:22:01','uploads/_a381f2d57e34190.pdf'),(15,'Vật lý đại cương Tập 2',4,339,'Vật lý đại cương Tập 2: Điện - Dao động - Sóng\r\nTrình bày về trường tĩnh điện, vật dẫn, điện môi. Định luật cơ bản của dòng điện, từ trường không đổi, hiện tượng cảm ứng điện từ, vật liệu từ, trường điện từ: dao động, sóng cơ, sóng điện từ','Lương Duyên Bình (chủ biên)',1,3,0,'[\"\\/img\\/books\\/_95209cb84c7b0010.png\",null,null,null,null]',NULL,'2021-06-17 13:22:17','uploads/_395da0c388324e4.pdf'),(18,'Bài tập vật lý đại cương Tập 1',4,195,'Bài tập vật lý đại cương Tập 1: Cơ nhiệt\r\nHướng dẫn phương pháp giải bài tập vật lý đại cương, cơ học, nhiệt học. Một số công thức và định luật, các bài tập ví dụ và đề bài tập tự giải.','Lương Duyên Bình (chủ biên)',1,1,0,'[\"\\/img\\/books\\/_e630c3dcc3555b90.png\",null,null,null,null]',NULL,'2021-07-04 03:15:21','uploads/_55cb9e1effc226e.pdf');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_in_orders`
--

DROP TABLE IF EXISTS `books_in_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_in_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `the_book_id` bigint unsigned DEFAULT NULL,
  `book_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_in_orders`
--

LOCK TABLES `books_in_orders` WRITE;
/*!40000 ALTER TABLE `books_in_orders` DISABLE KEYS */;
INSERT INTO `books_in_orders` VALUES (1,1,25,15,'2021-05-07 06:01:24','2021-05-10 20:36:43',NULL),(2,1,32,18,'2021-05-07 06:01:24','2021-05-10 20:36:43',NULL),(13,16,NULL,12,'2021-05-19 15:31:22',NULL,NULL),(19,18,30,12,'2021-05-21 06:54:22','2021-06-16 08:45:59',NULL),(20,19,41,5,'2021-05-21 07:08:45','2021-06-16 08:55:56',NULL),(21,20,31,11,'2021-05-21 20:48:37','2021-06-16 09:07:59',NULL),(22,21,25,15,'2021-05-28 08:08:56','2021-06-16 09:27:51',NULL),(23,22,37,10,'2021-05-28 12:25:27','2021-05-28 12:27:30',NULL),(38,34,NULL,7,'2021-06-15 17:24:15','2021-06-16 07:51:17','2021-06-16 07:51:17'),(39,35,39,7,'2021-06-16 09:42:32',NULL,NULL),(40,36,45,7,'2021-06-16 10:18:48',NULL,NULL),(41,36,46,8,'2021-06-16 10:18:48',NULL,NULL),(42,37,47,9,'2021-06-16 10:25:29',NULL,NULL);
/*!40000 ALTER TABLE `books_in_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Tin học cơ sở','2021-05-06 04:48:40','2021-05-06 04:48:40'),(3,'Khoa học kỹ thuật','2021-05-06 04:49:25','2021-05-06 04:49:25'),(4,'Vật lý','2021-05-06 08:06:10','2021-05-06 08:06:10'),(5,'Giáo trình','2021-05-06 18:48:57','2021-05-06 18:48:57'),(6,'Điện','2021-05-06 18:54:09','2021-05-06 18:54:09'),(7,'Toán cao cấp','2021-05-06 18:54:23','2021-05-06 18:54:23'),(8,'Tin học cao cấp','2021-05-06 18:54:47','2021-05-06 18:54:47'),(9,'Công nghệ thông tin',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `book_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,1,9,'Mình thấy cuốn sách rất bổ ích',NULL,'2021-06-10 09:59:58',NULL),(4,1,9,'Minfh thasy cuon sach tam duoc','2021-06-11 09:26:43','2021-06-17 13:30:14','2021-06-17 13:30:14'),(5,1,9,'thoi gian phai dung chu','2021-06-11 10:05:44','2021-06-17 13:30:10','2021-06-17 13:30:10'),(6,1,6,'Cuốn sách này để luyện tập rất tốt khi ôn thi môn tin học đại cương','2021-06-11 12:20:23',NULL,NULL),(9,2,15,'tui binh luan','2021-06-15 08:59:40','2021-06-17 13:29:50','2021-06-17 13:29:50'),(12,3,7,'Cuốn này sẽ hơi nhiều lý thuyết với những bạn học môn kỹ thuật điện tử ở chương trình Việt Nhật. Với môn này thì nắm chắc lý thuyết cơ bản thầy dạy và xem slide là được, còn cuốn bài tập sẽ phù hợp hơn để đọc','2021-05-29 02:45:12',NULL,NULL),(13,11,8,'Đọc quyển này dễ hiểu, nhiều dạng bài tập, tiện dụng hơn quyển lý thuyết, ôn quyển này là A+ môn kỹ thuật điện tử','2021-05-27 18:23:34',NULL,NULL),(14,6,12,'sách siêu dày, đẩy đủ lý thuyết cho lý 1, slide nếu khó hiểu thì tra sách sẽ dễ hiểu hơn','2021-05-28 09:15:50',NULL,NULL),(15,7,5,'Cuốn sách có đầy đủ nội dung sẽ thi <3','2021-05-29 13:24:39',NULL,NULL),(16,16,5,'Cuốn sách rất bổ ích','2021-07-04 03:01:02','2021-07-04 03:01:25',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_08_19_000000_create_failed_jobs_table',1),(2,'2021_04_23_085002_create_books_table',1),(3,'2021_04_23_090802_create_categories_table',1),(4,'2021_04_23_091006_create_publishers_table',1),(5,'2021_04_24_024502_create_orders_table',1),(6,'2021_04_24_025958_add_user_info_to_orders_table',1),(7,'2021_05_02_115721_create_users_table',1),(8,'2021_05_03_135730_edit_categories_table',1),(9,'2021_05_07_023620_create_the_books_table',1),(10,'2021_05_07_123831_edit_orders_table',1),(11,'2021_05_07_124342_create_books_in_orders_table',1),(12,'2021_05_08_023504_edit_users_table',1),(13,'2021_05_10_035613_edit_books_in_orders_table',1),(14,'2021_05_13_145019_edit_users_table_2',1),(15,'2021_05_15_133408_create_organizations_table',1),(16,'2021_06_03_223053_edit_orders_table_2',1),(17,'2021_06_09_193526_edit_books_table',1),(18,'2021_06_10_095753_create_comments_table',1),(19,'2021_06_10_102325_edit_comments_table',1),(20,'2021_06_15_224635_edit_books_in_orders_table_2',1),(21,'2021_06_16_151734_edit_users_table_3',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint NOT NULL DEFAULT '1',
  `restore_deadline` timestamp NULL DEFAULT NULL,
  `pick_time` timestamp NULL DEFAULT NULL,
  `restore_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `delivery` tinyint NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'2021-07-10 17:00:00','2021-05-10 20:36:43','2021-07-15 02:55:09','2021-05-07 06:01:24','2021-05-11 01:55:09',2,0,NULL),(14,4,'2021-05-29 17:00:00','2021-05-13 03:02:11',NULL,'2021-05-12 03:02:11',NULL,3,0,NULL),(16,1,NULL,NULL,NULL,'2021-05-19 15:31:22',NULL,5,0,NULL),(18,5,'2021-07-20 17:00:00','2021-05-21 09:00:00','2021-05-27 08:52:00','2021-05-21 06:54:22','2021-06-16 08:52:00',6,1,NULL),(19,5,'2021-07-21 17:00:00','2021-05-22 08:55:56','2021-05-23 07:00:13','2021-05-21 07:08:45','2021-06-16 08:56:13',7,1,NULL),(20,5,'2021-07-21 17:00:00','2021-05-22 02:00:59','2021-05-22 03:00:22','2021-05-21 20:48:37','2021-06-16 09:08:22',8,1,NULL),(21,5,'2021-07-27 17:00:00','2021-05-28 09:27:51','2021-06-16 03:28:16','2021-05-28 08:08:56','2021-06-16 09:28:16',9,1,NULL),(22,5,'2021-07-28 17:00:00','2021-05-29 02:27:30','2021-05-30 09:21:57','2021-05-28 12:25:27','2021-06-16 09:21:57',10,0,NULL),(34,0,NULL,NULL,NULL,'2021-06-14 17:24:15','2021-06-16 07:51:17',2,1,NULL),(35,5,'2021-07-28 17:00:00','2021-05-29 09:15:32','2021-06-16 09:46:51','2021-05-28 09:32:32','2021-06-16 09:46:51',3,2,'Số 6 ngõ 108 Lò Đúc, phường Đồng Nhân, quận Hai Bà Trưng, Hà Nội'),(36,2,'2021-07-27 17:00:00','2021-05-28 07:00:00',NULL,'2021-05-28 04:18:48',NULL,11,2,'11 Ngõ 328 Đường Đại Mỗ Quận Nam Từ Liêm TP Hà Nội'),(37,2,'2021-07-29 17:00:00','2021-05-30 01:25:00',NULL,'2021-05-29 03:45:29',NULL,12,1,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Trường Đại học Bách khoa Hà Nội','2021-05-15 06:38:36','2021-05-15 06:38:36');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publishers_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Bách khoa Hà Nội','2021-05-06 04:44:36','2021-05-06 04:44:36'),(3,'Đại học Quốc gia Hà Nội','2021-05-06 04:44:52','2021-05-06 04:44:52'),(4,'Giáo dục Việt Nam','2021-05-06 08:06:30','2021-05-06 08:06:30');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `the_books`
--

DROP TABLE IF EXISTS `the_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `the_books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint unsigned NOT NULL,
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `publishing_year` year DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `the_books_barcode_unique` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `the_books`
--

LOCK TABLES `the_books` WRITE;
/*!40000 ALTER TABLE `the_books` DISABLE KEYS */;
INSERT INTO `the_books` VALUES (23,15,'00231',1,2011,NULL,'2021-06-16 10:46:33'),(25,15,'000000293009',1,2011,NULL,'2021-06-16 09:28:16'),(26,12,'00111',1,NULL,NULL,'2021-06-16 10:46:18'),(27,12,'00222',1,NULL,NULL,'2021-06-16 10:45:53'),(28,11,'00333',1,NULL,NULL,'2021-06-16 10:45:53'),(30,12,'000000234979',1,2011,NULL,'2021-06-16 08:52:00'),(31,11,'000000301189',1,2015,NULL,'2021-06-16 09:08:22'),(32,18,'00080',1,NULL,NULL,'2021-05-11 01:55:09'),(33,15,'00932',1,NULL,NULL,NULL),(34,5,'00123',1,NULL,NULL,'2021-06-16 10:38:03'),(36,5,'00289',1,NULL,NULL,NULL),(37,10,'000000321646',1,2017,NULL,'2021-06-16 09:21:57'),(38,6,'00224',1,NULL,NULL,'2021-06-15 15:27:49'),(39,7,'000000301145',1,2014,NULL,'2021-06-16 09:46:51'),(41,5,'000000306825',1,2016,NULL,'2021-06-16 08:56:13'),(45,7,'000000301154',0,2014,NULL,'2021-06-16 10:18:48'),(46,8,'000000274292',0,2009,NULL,'2021-06-16 10:18:48'),(47,9,'000000274252',0,2010,NULL,'2021-06-16 10:25:29'),(48,7,'9786040037589',1,2014,NULL,'2021-07-04 02:56:04');
/*!40000 ALTER TABLE `the_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint NOT NULL,
  `id_card` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL DEFAULT '1990-01-01',
  `gender` tinyint NOT NULL DEFAULT '0',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint unsigned NOT NULL,
  `career` tinyint NOT NULL,
  `id_staff_student` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_login` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_id_card_unique` (`id_card`),
  UNIQUE KEY `users_id_staff_student_unique` (`id_staff_student`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'031731429','Nguyễn Mạnh Tiến','admin@admin.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1990-01-01',0,'0945391533',1,1,'20164069',NULL,'0lq0QElFq3smEOOf6Hx1JMML5lJhffoP6QcymbqSL9W9LcR0c6fEIGeH35ou','2021-05-03 07:45:31','2021-05-13 09:41:18',NULL,'733bc789cf0b07a07f97dfb8e0a83482f97b3dbf706febaf59ba6527f4630bbc9019b3d9b5e5a35072b628dfd60acda7cdfb64cb3a48e8d3c974053100c945d7',0),(2,0,'031970067','Nguyen Manh Tien','tiennguyenbka198@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1990-01-01',0,'0945391533',1,1,'20164068',NULL,NULL,'2021-05-07 05:29:36','2021-06-17 12:42:32',NULL,'0bc3d6516681a6071062d760e21c7b7e8c454276cb150b772740b60f0d6f096df4bffad24257d65bc4da31276db9c0d959d285a500e06f267dc4f7d83ab59009',3),(3,0,'013592150','Nguyen Trong Nghia','tonytit@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1990-01-01',0,'0911551998',1,1,'20162912',NULL,NULL,NULL,'2021-06-16 10:15:19',NULL,'957bcb57d1b0b939b62beb8fd8f9d22764db8755e7cfbd7d0002bf4b7d663535d087aef8a7e95e508c7769c63882b0ba05dabc2aa6076d60eed3d526be13e260',2),(5,0,'031999777','Nguyễn Minh Tiến','tien@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1990-01-01',0,'0945391533',1,1,'20164444',NULL,NULL,NULL,'2021-05-19 14:55:10',NULL,'cb44248283e25376688d00e35b8c84b517d8b057faa2e65a39a25e8451fcbf8679f7e2e73f306c6b5c5fdbe1cbd419434715d937f464858e596e67cc13bd94cb',0),(6,0,'013490428','Vũ Khánh Ly','khanhlyvu30@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1990-01-01',0,'0862414860',1,1,'20162618',NULL,NULL,NULL,'2021-06-17 09:14:23',NULL,'49460ec93c06cc4b592a05cf1f0a45ed163c47f952346147acf0398dd46f5a80d3d5b41aa7adfdd30eec7b2876bbb2f7875811383c5f2aadddf6a59bc2da131b',3),(7,0,'001098000001','Bùi Ngọc Tú','yuridayo@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1990-01-01',0,'0959590394',1,1,'20164453',NULL,NULL,NULL,'2021-06-17 09:16:31',NULL,'3fb683d971f34b3b357278825559beabb185f37fec074ca44a431538402d64a66713280b853de11a83e1c96020534712bc4ebc0fb357cc00a3ef18829c51550d',3),(8,0,'013506298','Phạm Đại Thanh Phong','reallynigga@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1998-03-31',0,'0986758556',1,1,'20167330',NULL,NULL,NULL,'2021-06-16 10:13:31',NULL,'7714683c0b2632a3f5319083fddbb30249618eac725faeb3e31bc3d7cfe3918cb49f5a192c0b0f147ae1e980581fcf2107ebdf510338d56852f82b490ea024af',2),(9,0,'001098005682','Nguyễn Duy Nguyên','nguyennd298@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1998-08-29',0,'0961156625',1,1,'20162989',NULL,NULL,NULL,'2021-07-04 02:38:09',NULL,'64b4ee204a1783f23dfc40c2323a4cad2928cd7b88cce4dd98a427af6802450f84a893ee4e83e30036a24e87af43942ba71e0365a5d322d61b41cd801b7520f7',5),(10,0,'013557313','Lê Bá Thiên','boummm1998@gmail.com','$2y$10$2z4e/ca.1sPNyVzDelmOfeBKaMvev.PADdYCV0bVULO6S4a7E.gGa','1998-08-27',0,'0362581998',1,1,'20163885',NULL,NULL,NULL,'2021-06-17 09:06:31',NULL,'25c1d9cde72ce7786821fea5f9630a1b4791f6b15b1128ca19d8dbda8beda5e819949eba896c935400edb3682c6c435628061915373163901d587944171bda3b',5),(11,0,'001098002416','Nguyễn Đình Minh','minh.nd.901@gmail.com','$2y$10$qZDb57IxvVQG/fJ7zfK1weROq3ashBh513eN3Oo4T76PFBt.aOH8m','1998-01-09',0,'0326217555',1,1,'20162726',NULL,NULL,NULL,'2021-06-17 09:09:44',NULL,'d6f9941dae0d6517862c42dff71e21fabf0b35c58b3c449e112e6e0fbc89d45496a841f2fcd7c7b61dc7baa4ccdd3ec755ff79c8abec6e0dbc037588325fda72',3),(12,0,'031031031','Đỗ Thúy Nga','nga.dt167304@gmail.com','$2y$10$ceDXR2Fcpa2Ap02U5VqDeOw1vQtypzOyEsZ9/yx1PbWhxF7fIt6RG','1990-01-01',1,'0947564784',1,1,'20167304',NULL,NULL,NULL,'2021-06-16 10:55:12',NULL,NULL,3),(13,0,'001226438665','Hoàng Công Thành','hoangcongthanh1237d@gmail.com','$2y$10$UKzh7JosPsa7tACIsRUo/u1eBlQk/Q21KLIKli4a8cq8YuXBeolhq','1997-05-02',0,'0941863388',1,1,'20167371',NULL,NULL,NULL,NULL,NULL,NULL,1),(14,0,'00125762148','Nguyễn Văn Tâm','nguyenvantam14898@gmail.com','$2y$10$b5tOWPmJY6Uk6nm.DJDbPuUOSGKhjIUStGc5rm4a8syQLfdsQDXIi','1998-08-14',0,'0969514898',1,1,'20163616',NULL,NULL,NULL,NULL,NULL,NULL,0),(15,0,'030198000220','Hoàng Thị Thoa','hoangthithoa09041998@gmail.com','$2y$10$f6URDvd5QZbArrrgx/981ODbABmn1nTyuHd/8gnJhDhMiVKEh3oDa','1998-04-09',1,'0387602429',1,1,'20163903',NULL,NULL,NULL,NULL,NULL,NULL,1),(16,0,'125774352','Nguyễn Đức Trung','vuacao98@gmail.com','$2y$10$HlJKhnJsVpDZQUckqyxbf.ixMnDqVISnqFAonhkEnTiTVGtkBi70O','1998-12-30',0,'0969996674',1,1,'20166882',NULL,NULL,NULL,'2021-07-04 02:53:32',NULL,'cf1e3cd1c1f87c7748ea91e110e191f4948a0eebb4e05a116006307fe08bd02b18672dbfa11c81e5e534687f9cc140571b3f31d2832875d19e8f33a84950e7b1',2);
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

-- Dump completed on 2021-07-04 14:27:15
