-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 09:33 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdo_web_ban_hang`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `username`, `password`) VALUES
(1, 'minh', '123'),
(2, 'dat', '123'),
(4, 'tung', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `id_category_product` int(11) UNSIGNED NOT NULL,
  `title_category_product` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`id_category_product`, `title_category_product`) VALUES
(12, 'Oppo'),
(13, 'Iphone'),
(14, 'Samsung'),
(17, 'Xiaomi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int(11) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `customer_phone` varchar(200) NOT NULL,
  `customer_password` varchar(200) NOT NULL,
  `customer_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_address`, `customer_phone`, `customer_password`, `customer_email`) VALUES
(1, 'Nam', 'Hà Nội', '01234567', '123', 'nam@gmail.com'),
(2, 'Hoạt', 'Hà Nội', '123456', '123', 'hoat@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import_order`
--

CREATE TABLE `tbl_import_order` (
  `id_import_order` int(11) UNSIGNED NOT NULL,
  `id_admin` int(11) NOT NULL,
  `supplier` varchar(200) NOT NULL,
  `date` varchar(200) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_quantity` int(11) UNSIGNED NOT NULL,
  `product_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_import_order`
--

INSERT INTO `tbl_import_order` (`id_import_order`, `id_admin`, `supplier`, `date`, `admin_name`, `product_id`, `product_quantity`, `product_price`) VALUES
(1, 1, 'Apple', '28/06/2022 02:06:16pm', 'minh', 9, 10, 20000000),
(2, 1, 'Apple', '28/06/2022 02:06:42pm', 'minh', 9, 10, 20000000),
(3, 1, 'Apple', '28/06/2022 02:36:59pm', 'minh', 9, 2, 20000000);

--
-- Triggers `tbl_import_order`
--
DELIMITER $$
CREATE TRIGGER `import_order` AFTER INSERT ON `tbl_import_order` FOR EACH ROW UPDATE tbl_product SET tbl_product.quantity_product=tbl_product.quantity_product+NEW.product_quantity
WHERE tbl_product.id_product=NEW.product_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `order_code` varchar(100) NOT NULL,
  `order_status` int(11) NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `order_code`, `order_status`, `customer_id`, `order_date`) VALUES
(28, '1488', 1, 1, '2022-06-02 09:35:46'),
(29, '9924', 1, 1, '2022-04-02 09:36:02'),
(30, '6173', 0, 2, '2022-07-02 09:36:20'),
(31, '3400', 1, 2, '2022-07-02 09:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_code` varchar(100) NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sdt` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `diachi` varchar(200) NOT NULL,
  `noidung` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_code`, `product_id`, `product_quantity`, `name`, `sdt`, `email`, `diachi`, `noidung`) VALUES
(26, '1488', 14, 1, 'Nam', '01234567', 'nam@gmail.com', 'Hà Nội', ''),
(27, '1488', 9, 1, 'Nam', '01234567', 'nam@gmail.com', 'Hà Nội', ''),
(28, '1488', 8, 1, 'Nam', '01234567', 'nam@gmail.com', 'Hà Nội', ''),
(29, '9924', 10, 1, 'Nam', '01234567', 'nam@gmail.com', 'Hà Nội', ''),
(30, '6173', 9, 1, 'Hoạt', '123456', 'hoat@gmail.com', 'Hà Nội', ''),
(31, '3400', 10, 1, 'Hoạt', '123456', 'hoat@gmail.com', 'Hà Nội', '');

--
-- Triggers `tbl_order_details`
--
DELIMITER $$
CREATE TRIGGER `trigger_order` AFTER INSERT ON `tbl_order_details` FOR EACH ROW UPDATE tbl_product SET tbl_product.quantity_product=tbl_product.quantity_product-NEW.product_quantity WHERE tbl_product.id_product=NEW.product_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id_product` int(11) UNSIGNED NOT NULL,
  `title_product` varchar(255) NOT NULL,
  `price_product` varchar(100) NOT NULL,
  `desc_product` text NOT NULL,
  `quantity_product` int(11) NOT NULL,
  `image_product` varchar(100) NOT NULL,
  `id_category_product` int(11) UNSIGNED NOT NULL,
  `product_hot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id_product`, `title_product`, `price_product`, `desc_product`, `quantity_product`, `image_product`, `id_category_product`, `product_hot`) VALUES
(8, 'Samsung s22', '20000000', 'Samsung s22 đẹp', 8, 'ss2216554573091655735483.jpg', 14, 1),
(9, 'Iphone 13', '30000000', ' Iphone 13 chất        ', 7, 'iphone131655735514.jpg', 13, 1),
(10, 'Oppo reno 7', '20000000', ' Oppo reno 7        ', 16, 'oppo1655735588.jpg', 12, 0),
(14, 'Iphone 12', '20000000', '    Iphone 12                                ', 9, 'iphone121656745163.jpg', 13, 1),
(15, 'Redmi 11', '10000000', 'Redmi 11', 20, 'xiaomi1656773056.jpg', 17, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`id_category_product`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_import_order`
--
ALTER TABLE `tbl_import_order`
  ADD PRIMARY KEY (`id_import_order`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `customer_id_2` (`customer_id`),
  ADD KEY `customer_id_3` (`customer_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category_product` (`id_category_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `id_category_product` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_import_order`
--
ALTER TABLE `tbl_import_order`
  MODIFY `id_import_order` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id_product` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_import_order`
--
ALTER TABLE `tbl_import_order`
  ADD CONSTRAINT `tbl_import_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id_product`);

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customers` (`customer_id`);

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `tbl_order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`id_category_product`) REFERENCES `tbl_category_product` (`id_category_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
