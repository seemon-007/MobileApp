-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.6.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mydata
CREATE DATABASE IF NOT EXISTS `mydata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `mydata`;

-- Dumping structure for table mydata.banner
CREATE TABLE IF NOT EXISTS `banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.banner: ~11 rows (approximately)
REPLACE INTO `banner` (`ID`, `image`) VALUES
	(1, 'https://example.com/uploads/image1.jpg'),
	(2, 'https://example.com/uploads/image1.jpg'),
	(3, 'https://example.com/uploads/image1.jpg'),
	(4, 'https://example.com/uploads/image1.jpg'),
	(5, 'https://apipic.bxoks.online/public/uploads/Hg7qAKUGD1wl0zmDhwcKx.png'),
	(6, 'https://apipic.bxoks.online/public/uploads/wjhk00ML65juNhj5eop8E.jpg'),
	(7, 'https://apipic.bxoks.online/public/uploads/wjhk00ML65juNhj5eop8E.jpg'),
	(8, 'https://apipic.bxoks.online/public/uploads/wjhk00ML65juNhj5eop8E.jpg'),
	(9, 'https://apipic.bxoks.online/public/uploads/wjhk00ML65juNhj5eop8E.jpg'),
	(10, 'https://apipic.bxoks.online/public/uploads/wjhk00ML65juNhj5eop8E.jpg'),
	(11, 'https://apipic.bxoks.online/public/uploads/wjhk00ML65juNhj5eop8E.jpg');

-- Dumping structure for table mydata.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_ID` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  KEY `fk_order_cart` (`order_ID`) USING BTREE,
  KEY `fk_customer_cart` (`customer_id`) USING BTREE,
  KEY `fk_product_cart` (`product_id`) USING BTREE,
  CONSTRAINT `fk_customer_cart` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_order_cart` FOREIGN KEY (`order_ID`) REFERENCES `order` (`order_ID`),
  CONSTRAINT `fk_product_cart` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID_product`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.cart: ~9 rows (approximately)
REPLACE INTO `cart` (`cart_id`, `order_ID`, `customer_id`, `product_id`, `quantity`, `price`) VALUES
	(6, NULL, 1001, 37, 2, 400.00),
	(7, NULL, 1001, 37, 2, 400.00),
	(8, NULL, 1001, 30, 1, 10.00),
	(9, NULL, 1001, 31, 1, 500.00),
	(10, NULL, 1001, 37, 2, 400.00),
	(11, NULL, 1001, 37, 2, 400.00),
	(12, NULL, 1001, 37, 2, 400.00),
	(13, NULL, 1001, 37, 2, 400.00),
	(14, NULL, 1001, 37, 2, 400.00);

-- Dumping structure for table mydata.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_ID` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.categories: ~0 rows (approximately)

-- Dumping structure for table mydata.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `Password` varchar(50) NOT NULL DEFAULT '0',
  `Email` varchar(50) NOT NULL DEFAULT '0',
  `Phone` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) DEFAULT NULL,
  `order_ID` int(11) DEFAULT 10,
  `role` enum('admin','user') DEFAULT 'user',
  PRIMARY KEY (`customer_id`),
  KEY `order_id` (`order_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.customer: ~43 rows (approximately)
REPLACE INTO `customer` (`customer_id`, `name`, `Password`, `Email`, `Phone`, `address`, `order_ID`, `role`) VALUES
	(10, 'fdohjof', 'jkgkhjgk', 'dfdf', '1242', 'dfdf', NULL, 'user'),
	(11, 'fdohjof', 'jkgkhjgk', 'dfdf', '1242', 'dfdf', NULL, 'user'),
	(12, 'fdohjof', 'jkgkhjgk', 'dfdf', '1242', 'dfdf', NULL, 'user'),
	(13, 'fdohjofeffe', 'jkgkhjgkfefe', 'dfdfefef', '1242efef', 'dfdfefefe', NULL, 'user'),
	(14, 'fdohjofeffe', 'jkgkhjgkfefe', 'dfdfefef', '1242efef', 'dfdfefefe', NULL, 'user'),
	(15, 'fdohjofeffe', 'jkgkhjgkfefe', 'dfdfefef', '1242efef', 'dfdfefefe', NULL, 'user'),
	(16, 'fdohjofeffe', 'jkgkhjgkfefe', 'dfdfefef', '1242efef', 'dfdfefefehthth', NULL, 'user'),
	(17, 'ffff', 'dfdfds', 'asdsfdefsdf', 'gfsgs', 'sddgdg', NULL, 'user'),
	(18, 'John Doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'user'),
	(19, 'John Doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'user'),
	(20, 'John Doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'user'),
	(21, 'John Doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'user'),
	(22, 'John Doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'user'),
	(23, 'John Doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'user'),
	(24, 'John Doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', 2, 'user'),
	(25, 'bas', '12345', 'john.doe@example.com', '1234567890', '123 Main St', 1, 'user'),
	(26, 'bas', '12345', 'john.doe@example.com', '1234567890', '123 Main St', 10, 'user'),
	(27, 'bas', '12345', 'john.doe@example.com', '1234567890', '123 Main St', 10, 'user'),
	(28, 'bas', '12345', 'john.doe@example.com', '1234567890', '123 Main St', 10, 'user'),
	(29, 'bas', '12345', 'john.doe@example.com', '1234567890', '123 Main St', 10, 'user'),
	(30, 'bbb', '4555', 'tttt', '3333', 'gggg', 10, 'user'),
	(31, 'bbb', '4555', 'tttt', '3333', 'gggg', 10, 'user'),
	(32, 'bas', '123', 'ggg', '12345', 'bggb', 10, 'user'),
	(33, 'bas', '123', 'ggg', '12345', 'bggb', 10, 'user'),
	(34, 'bbb', 'qqwe', 'sdf', 'dfs', 'fsd', 10, 'user'),
	(35, 'bbb', 'qqwe', 'sdf', 'dfs', 'fsd', 10, 'user'),
	(36, 'nnnn', '34234', 'dfgfd', '324324', 'fdgfdg', 10, 'user'),
	(37, 'bas', '1111', 'gyugyug', '858765', 'hou;\\hu', 10, 'user'),
	(38, 'bbb', '1234', 'rfegerg', '24124124', 'rgwergre', 10, 'user'),
	(39, 'bas', '12345', 'john.doe@example.com', '1234567890', '123 Main St', 10, 'user'),
	(40, 'bas', '12345', 'john.doe@example.com', '1234567890', '123 Main St', 10, 'user'),
	(41, 'erqewr', '2332', 'errwe', 'eree', 'wrew', 10, 'user'),
	(42, 'fdfdf', '31232', 'ewfewf', '232131', 'ewfewf', 10, 'admin'),
	(43, 'John Doe', 'password123', 'johndoe@example.com', '123456789', '123 Main St', 10, 'admin'),
	(44, 'John Doe', 'password123', 'admin@123e.com', '123456789', '123 Main St', 10, 'admin'),
	(45, 'kjhfkuhuik', '123', 'rfgerg', 'reger', 'regerg', 10, 'admin'),
	(46, 'John Doe', 'password123', 'admin@123e.com', '123456789', '123 Main St', 10, 'admin'),
	(47, 'John Doe', 'password123', 'admin@123e.com', '123456789', '123 Main St', 10, 'admin'),
	(48, 'John Doe', 'password123', 'admin@123e.com', '123456789', '123 Main St', 10, 'admin'),
	(49, 'John Doe', 'password123', 'admin@123e.com', '123456789', '123 Main St', 10, 'admin'),
	(50, 'John Doe', 'password123', 'admin@123e.com', '123456789', '123 Main St', 10, 'admin'),
	(51, 'John Doe', 'password123', 'admin@123e.com', '123456789', '123 Main St', 10, 'admin'),
	(1001, 'Test User', '0', 'test@example.com', '0', NULL, 10, 'user');

-- Dumping structure for table mydata.order
CREATE TABLE IF NOT EXISTS `order` (
  `order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `ID_product` int(11) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `shipping_rate` decimal(10,2) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`order_ID`),
  KEY `customer_id` (`customer_id`),
  KEY `ID_product` (`ID_product`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product` FOREIGN KEY (`ID_product`) REFERENCES `product` (`ID_product`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.order: ~7 rows (approximately)
REPLACE INTO `order` (`order_ID`, `customer_id`, `ID_product`, `product_name`, `shipping_rate`, `order_date`, `total`) VALUES
	(14, NULL, NULL, NULL, 50.00, '2025-02-05 00:58:15', 0.00),
	(17, 14, NULL, 'สินค้า A, สินค้า B', 50.00, '2025-02-08 12:10:06', 1345.00),
	(18, 14, NULL, 'สินค้า A, สินค้า B', 50.00, '2025-02-08 12:32:27', 1345.00),
	(19, 14, NULL, NULL, 50.00, '2025-02-08 20:00:22', 1385.00),
	(20, 14, NULL, NULL, 50.00, '2025-02-08 20:00:52', 1385.00),
	(21, 14, NULL, NULL, 50.00, '2025-02-08 20:12:12', 1385.00),
	(22, 14, NULL, NULL, 50.00, '2025-02-08 20:14:01', 1385.00);

-- Dumping structure for table mydata.orderdetail
CREATE TABLE IF NOT EXISTS `orderdetail` (
  `orderdetails_ID` int(11) NOT NULL AUTO_INCREMENT,
  `order_ID` int(11) NOT NULL DEFAULT 0,
  `Q1uantity` int(11) NOT NULL DEFAULT 0,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `product_ID` int(11) NOT NULL DEFAULT 0,
  `customer_ID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`orderdetails_ID`),
  KEY `order_ID` (`order_ID`),
  KEY `product_ID` (`product_ID`),
  KEY `customer_ID` (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.orderdetail: ~0 rows (approximately)

-- Dumping structure for table mydata.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_ID` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_id`),
  KEY `order_ID` (`order_ID`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_ID`) REFERENCES `order` (`order_ID`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.payment: ~0 rows (approximately)

-- Dumping structure for table mydata.product
CREATE TABLE IF NOT EXISTS `product` (
  `ID_product` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL DEFAULT '0',
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `Category` varchar(50) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT 0,
  `size` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_product`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.product: ~10 rows (approximately)
REPLACE INTO `product` (`ID_product`, `product_name`, `price`, `Category`, `stock`, `size`, `image_url`) VALUES
	(30, 'อาหารหมา', 10.000000, '0', 20, ' L', '1738858294485.jpg'),
	(31, 'อาหารหมา', 500.000000, '0', 10, ' M', '1738858321962.webp'),
	(32, ' อาหารหมา', 800.000000, '0', 10, ' L', '1738858361432.webp'),
	(33, 'อาหารแมว', 25.000000, '0', 50, 'M', '1738858572782.webp'),
	(34, 'อาหารหมา', 20.000000, '0', 10, 'L', '1738859821804.jpg'),
	(35, 'อาหารหมา', 1000.000000, '0', 10, 'M', '1738859844129.jpg'),
	(36, 'อาหารหมา', 15.000000, '0', 10, 'S', '1738859866086.jpg'),
	(37, ' อาหารแมว', 400.000000, '0', 10, 'L', '1738870630119.webp'),
	(38, 'bbbb', 2.000000, '0', 3, 'S', '1738966391201.webp'),
	(39, 'hhh', 210.000000, '0', 1, 'l', '1738980985516.jpg');

-- Dumping structure for table mydata.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.settings: ~0 rows (approximately)

-- Dumping structure for table mydata.totalday
CREATE TABLE IF NOT EXISTS `totalday` (
  `category_ID` int(11) DEFAULT NULL,
  `product_ID` int(11) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  KEY `category_ID` (`category_ID`),
  KEY `product_ID` (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table mydata.totalday: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
