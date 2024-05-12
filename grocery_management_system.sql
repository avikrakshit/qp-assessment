-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 06:24 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocery_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `history_inventory_store`
--

CREATE TABLE `history_inventory_store` (
  `revision` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `mrp` decimal(6,2) DEFAULT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `moment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cause` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_inventory_store`
--

INSERT INTO `history_inventory_store` (`revision`, `product_id`, `quantity`, `mrp`, `weight`, `order_id`, `moment`, `cause`) VALUES
(1, 15, 10, '120.00', '1.00', NULL, '2024-05-04 13:08:53', 1),
(2, 10, 0, '120.00', '1.00', NULL, '2024-05-04 12:10:20', 1),
(3, 17, 1, '120.00', '40.00', NULL, '2024-05-04 12:46:05', 1),
(4, 17, 10, '120.00', '1.00', NULL, '2024-05-07 17:42:55', 1),
(5, 12, 0, '120.00', '1.00', NULL, '2024-05-04 12:29:22', 1),
(6, 12, 2, '120.00', '1.00', NULL, '2024-05-08 17:39:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_store`
--

CREATE TABLE `inventory_store` (
  `product_id` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `mrp` decimal(6,2) NOT NULL,
  `weight` decimal(6,2) NOT NULL DEFAULT '1.00',
  `order_id` int(11) DEFAULT NULL,
  `moment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cause` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_store`
--

INSERT INTO `inventory_store` (`product_id`, `quantity`, `mrp`, `weight`, `order_id`, `moment`, `cause`) VALUES
(12, 2, '120.00', '1.00', NULL, '2024-05-08 17:40:32', 2),
(14, 7, '120.00', '1.00', NULL, '2024-05-04 12:34:50', 1),
(15, 15, '120.00', '1.00', NULL, '2024-05-04 13:11:34', 1),
(16, 1, '10.00', '120.00', NULL, '2024-05-04 12:44:27', 1),
(18, 15, '189.00', '1.00', NULL, '2024-05-07 18:28:58', 1),
(22, 15, '35.00', '1.00', NULL, '2024-05-08 13:58:02', 1),
(23, 15, '35.00', '1.00', NULL, '2024-05-08 14:01:13', 1),
(24, 15, '35.00', '1.00', NULL, '2024-05-08 14:01:25', 1),
(25, 15, '35.00', '1.00', NULL, '2024-05-08 14:02:48', 1),
(26, 15, '35.00', '1.00', NULL, '2024-05-08 14:05:48', 1),
(28, 15, '35.00', '1.00', NULL, '2024-05-08 15:21:02', 1),
(29, 15, '35.00', '1.00', NULL, '2024-05-08 15:30:27', 1);

--
-- Triggers `inventory_store`
--
DELIMITER $$
CREATE TRIGGER `track_inventory_store` AFTER UPDATE ON `inventory_store` FOR EACH ROW INSERT INTO history_inventory_store(
    product_id,
    quantity,
    mrp,
    weight,
    order_id,
    moment,
    cause
) VALUES(
    OLD.product_id,
    OLD.quantity,
    OLD.mrp,
    OLD.weight,
    OLD.order_id,
    OLD.moment,
    OLD.cause
)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `map_user_order_product`
--

CREATE TABLE `map_user_order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `weight` decimal(6,2) NOT NULL,
  `rate` decimal(6,2) NOT NULL,
  `total` decimal(8,2) GENERATED ALWAYS AS (((`weight` * `quantity`) * `rate`)) VIRTUAL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `map_user_order_product`
--

INSERT INTO `map_user_order_product` (`order_id`, `product_id`, `quantity`, `weight`, `rate`) VALUES
(0, 1, 10, '0.25', '15.00'),
(10, 1, 10, '1.00', '99.00'),
(10, 4, 10, '1.00', '199.99'),
(11, 1, 10, '1.00', '99.00'),
(11, 4, 10, '1.00', '199.99'),
(52, 1, 10, '1.00', '99.00'),
(52, 4, 10, '1.00', '199.99'),
(53, 1, 10, '1.00', '99.00'),
(53, 4, 10, '1.00', '199.99'),
(54, 7, 3, '1.00', '149.00'),
(54, 10, 7, '1.00', '120.00'),
(54, 22, 5, '1.00', '35.00'),
(54, 26, 6, '1.00', '35.00'),
(54, 29, 4, '1.00', '35.00'),
(55, 7, 3, '1.00', '149.00'),
(55, 10, 7, '1.00', '120.00'),
(55, 22, 5, '1.00', '35.00'),
(55, 26, 6, '1.00', '35.00'),
(55, 29, 4, '1.00', '35.00'),
(55, 7, 3, '1.00', '161.00'),
(55, 10, 7, '1.00', '82.00'),
(55, 22, 5, '1.00', '67.00'),
(55, 26, 1, '1.00', '66.00'),
(55, 29, 1, '1.00', '184.00'),
(55, 28, 10, '1.00', '123.00'),
(55, 35, 8, '1.00', '169.00'),
(55, 41, 3, '1.00', '113.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_by` smallint(6) NOT NULL,
  `created_moment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_moment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` smallint(6) NOT NULL,
  `mrp` float(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `active`, `type`, `created_by`, `created_moment`, `updated_by`, `updated_moment`, `category_id`, `mrp`) VALUES
(1, 'Colgate Toothpaste', 1, 1, 1, '2024-05-09 17:23:55', NULL, '2024-05-09 17:23:55', 1, 99.00),
(2, 'Liners - Banana, Paper', 1, 1, 1, '2023-08-27 03:27:40', NULL, '2023-12-12 01:43:01', 4, 195.00),
(3, 'Beans - French', 0, 1, 6, '2023-06-25 00:37:32', NULL, '2023-11-19 02:12:58', 7, 181.00),
(4, 'Appetizer - Smoked Salmon / Dill', 0, 1, 2, '2023-06-04 04:34:51', NULL, '2024-03-10 05:31:10', 3, 130.00),
(5, 'Grenadillo', 0, 1, 7, '2024-03-09 01:46:22', NULL, '2023-12-16 11:29:32', 9, 184.00),
(6, 'Rosemary - Dry', 1, 1, 6, '2023-06-29 13:18:41', NULL, '2023-05-25 19:53:44', 8, 74.00),
(7, 'Pastry - Baked Scones - Mini', 0, 1, 2, '2024-01-21 14:14:42', NULL, '2023-08-27 10:13:14', 7, 161.00),
(8, 'Juice - Apple 284ml', 0, 2, 2, '2023-08-25 19:25:11', NULL, '2024-02-06 21:39:41', 4, 56.00),
(9, 'Wine - Taylors Reserve', 1, 1, 1, '2024-02-27 04:03:19', NULL, '2023-12-30 03:48:44', 4, 95.00),
(10, 'Cinnamon Rolls', 0, 1, 2, '2023-11-13 19:43:54', NULL, '2023-09-01 10:31:38', 2, 82.00),
(11, 'Thyme - Lemon, Fresh', 0, 2, 2, '2023-05-24 21:49:58', NULL, '2023-05-28 18:29:10', 4, 66.00),
(12, 'Mushroom - Morels, Dry', 0, 1, 2, '2023-09-27 16:00:42', NULL, '2023-07-08 06:21:20', 6, 147.00),
(13, 'Beef - Ground Lean Fresh', 1, 2, 4, '2024-04-30 00:21:32', NULL, '2024-01-07 17:40:19', 9, 170.00),
(14, 'Crush - Grape, 355 Ml', 0, 1, 3, '2024-02-25 08:06:08', NULL, '2024-02-02 15:29:13', 6, 81.00),
(15, 'Doilies - 12, Paper', 1, 2, 1, '2023-11-21 12:59:51', NULL, '2023-07-29 16:57:12', 2, 134.00),
(16, 'Sugar - Sweet N Low, Individual', 1, 1, 8, '2023-10-01 13:35:39', NULL, '2024-04-19 00:04:46', 1, 55.00),
(17, 'Tuna - Bluefin', 1, 1, 4, '2023-11-08 05:45:55', NULL, '2023-11-27 17:20:39', 2, 157.00),
(18, 'Knife Plastic - White', 1, 2, 7, '2024-02-14 03:33:52', NULL, '2024-02-08 11:15:39', 6, 114.00),
(19, 'Veal - Round, Eye Of', 1, 1, 9, '2024-02-08 11:44:12', NULL, '2023-11-14 17:00:41', 5, 103.00),
(20, 'Wine - Acient Coast Caberne', 1, 1, 2, '2023-05-21 13:15:54', NULL, '2023-11-03 16:21:10', 9, 162.00),
(21, 'Pie Shell - 5', 0, 1, 7, '2023-08-28 02:33:37', NULL, '2023-06-28 02:28:34', 2, 103.00),
(22, 'Soup - Campbells Beef Strogonoff', 1, 1, 5, '2023-12-06 13:21:29', NULL, '2023-06-13 07:23:51', 7, 67.00),
(23, 'Ginger - Crystalized', 1, 2, 3, '2024-04-21 08:52:17', NULL, '2024-02-26 08:26:38', 5, 178.00),
(24, 'Schnappes - Peach, Walkers', 1, 1, 9, '2023-12-19 14:15:16', NULL, '2024-01-02 08:41:40', 7, 200.00),
(25, 'Cleaner - Comet', 1, 2, 3, '2024-01-03 00:15:25', NULL, '2024-04-18 20:33:38', 6, 124.00),
(26, 'Wine - Niagara Peninsula Vqa', 1, 2, 4, '2023-11-27 08:20:59', NULL, '2024-05-06 01:17:47', 5, 66.00),
(27, 'Bread Crumbs - Japanese Style', 0, 1, 2, '2023-10-16 19:25:05', NULL, '2024-01-18 03:05:07', 5, 196.00),
(28, 'Papayas', 0, 1, 5, '2023-06-21 17:08:28', NULL, '2024-05-08 00:12:27', 5, 123.00),
(29, 'Baking Soda', 1, 2, 9, '2023-08-04 11:25:46', NULL, '2024-01-22 22:21:12', 1, 184.00),
(30, 'Swordfish Loin Portions', 1, 1, 7, '2023-06-26 15:54:07', NULL, '2024-03-12 14:12:31', 8, 96.00),
(31, 'Cornstarch', 1, 1, 3, '2023-05-27 19:23:55', NULL, '2023-12-24 11:51:52', 8, 165.00),
(32, 'Bok Choy - Baby', 0, 2, 7, '2023-12-08 11:02:53', NULL, '2023-08-02 05:42:45', 8, 75.00),
(33, 'Lettuce - Escarole', 1, 2, 6, '2024-04-03 10:33:24', NULL, '2023-12-10 12:37:40', 2, 133.00),
(34, 'Chilli Paste, Hot Sambal Oelek', 1, 1, 8, '2023-07-28 12:52:01', NULL, '2023-12-20 18:58:40', 2, 77.00),
(35, 'Wooden Mop Handle', 1, 1, 6, '2023-10-31 07:38:34', NULL, '2024-03-01 18:58:13', 3, 169.00),
(36, 'Cookies - Fortune', 1, 1, 3, '2023-08-04 01:23:16', NULL, '2023-07-05 23:30:30', 8, 53.00),
(37, 'Wakami Seaweed', 1, 2, 3, '2024-04-02 12:57:42', NULL, '2024-03-02 11:28:30', 5, 146.00),
(38, 'Initation Crab Meat', 0, 1, 5, '2023-09-15 11:03:48', NULL, '2023-11-15 12:12:02', 6, 145.00),
(39, 'Tea - Decaf 1 Cup', 1, 1, 9, '2023-08-19 03:13:37', NULL, '2024-04-21 22:59:28', 6, 187.00),
(40, 'Compound - Raspberry', 1, 1, 9, '2023-05-10 00:31:52', NULL, '2023-10-01 03:16:55', 9, 200.00),
(41, 'Wine - Red, Gamay Noir', 1, 1, 9, '2023-08-19 12:36:16', NULL, '2023-09-23 13:28:29', 5, 113.00),
(42, 'Coffee - Decaffeinato Coffee', 1, 1, 6, '2024-02-23 14:07:52', NULL, '2024-01-12 05:03:42', 9, 198.00),
(43, 'Ham - Procutinni', 1, 2, 10, '2023-08-02 05:39:47', NULL, '2023-07-02 19:01:09', 5, 52.00),
(44, 'Wine - Semi Dry Riesling Vineland', 1, 1, 8, '2024-03-23 22:48:49', NULL, '2024-02-27 21:21:22', 2, 87.00),
(45, 'Veal - Chops, Split, Frenched', 0, 1, 10, '2023-10-01 19:48:13', NULL, '2024-01-30 14:38:53', 9, 155.00),
(46, 'Beef - Bones, Marrow', 0, 1, 4, '2024-01-18 18:56:26', NULL, '2024-01-05 23:15:45', 3, 84.00),
(47, 'Cup - 6oz, Foam', 1, 2, 9, '2024-04-25 18:16:02', NULL, '2023-12-13 08:16:29', 9, 142.00),
(48, 'Sugar - White Packet', 0, 2, 6, '2024-02-09 23:12:21', NULL, '2023-10-06 19:47:24', 1, 147.00),
(49, 'Wine - White, French Cross', 0, 1, 2, '2024-01-10 22:29:05', NULL, '2023-11-09 14:20:56', 3, 67.00),
(50, 'Milk 2% 500 Ml', 0, 2, 5, '2023-09-11 16:06:45', NULL, '2023-05-11 05:04:31', 5, 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`) VALUES
(1, 'Fruits'),
(2, 'Vegetables'),
(3, 'Meat'),
(4, 'Beverages'),
(5, 'Snacks'),
(6, 'Household items'),
(7, 'Personal care');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `id` int(11) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `buyer_name` varchar(50) NOT NULL,
  `buyer_phone` varchar(15) NOT NULL,
  `placed_date` date NOT NULL,
  `placed_time` time NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_moment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`id`, `total`, `buyer_name`, `buyer_phone`, `placed_date`, `placed_time`, `status`, `updated_by`, `updated_moment`) VALUES
(1, '0.00', 'avik', '9800200515', '2024-05-05', '17:11:46', 1, 1, '2024-05-05 11:41:46'),
(2, '0.00', 'avik', '9800200515', '2024-05-05', '17:12:02', 1, 1, '2024-05-05 11:42:02'),
(3, '0.00', 'avik', '9800200515', '2024-05-05', '17:12:21', 1, 1, '2024-05-05 11:42:21'),
(4, '0.00', 'avik', '9800200515', '2024-05-05', '17:12:44', 1, 1, '2024-05-05 11:42:44'),
(5, '0.00', 'avik', '9800200515', '2024-05-05', '17:13:49', 1, 1, '2024-05-05 11:43:49'),
(6, '0.00', 'avik', '9800200515', '2024-05-05', '17:30:45', 1, 1, '2024-05-05 12:00:45'),
(7, '0.00', 'avik', '9800200515', '2024-05-05', '17:31:17', 1, 1, '2024-05-05 12:01:17'),
(8, '0.00', 'avik', '9800200515', '2024-05-05', '17:36:49', 1, 1, '2024-05-05 12:06:49'),
(9, '0.00', 'avik', '9800200515', '2024-05-05', '17:40:19', 1, 1, '2024-05-05 12:10:19'),
(10, '0.00', 'avik', '9800200515', '2024-05-05', '17:56:09', 1, 1, '2024-05-05 12:26:09'),
(11, '2989.90', 'avik', '9800200515', '2024-05-05', '17:56:39', 1, 1, '2024-05-05 12:26:39'),
(12, '0.00', 'Avik', '9800200515', '2024-05-07', '14:17:44', 1, 1, '2024-05-07 08:47:44'),
(13, '0.00', 'Avik', '9800200515', '2024-05-07', '14:19:23', 1, 1, '2024-05-07 08:49:23'),
(14, '0.00', 'Avik', '9800200515', '2024-05-07', '14:20:17', 1, 1, '2024-05-07 08:50:17'),
(15, '0.00', 'Avik', '9800200515', '2024-05-07', '14:20:36', 1, 1, '2024-05-07 08:50:36'),
(16, '0.00', 'Avik', '9800200515', '2024-05-07', '14:20:57', 1, 1, '2024-05-07 08:50:57'),
(17, '0.00', 'Avik', '9800200515', '2024-05-07', '14:24:59', 1, 1, '2024-05-07 08:54:59'),
(18, '0.00', 'Avik', '9800200515', '2024-05-07', '14:25:41', 1, 1, '2024-05-07 08:55:41'),
(19, '0.00', 'Avik', '9800200515', '2024-05-07', '14:31:32', 1, 1, '2024-05-07 09:01:32'),
(20, '0.00', 'Avik', '9800200515', '2024-05-07', '14:32:24', 1, 1, '2024-05-07 09:02:24'),
(21, '0.00', 'Avik', '9800200515', '2024-05-07', '14:32:37', 1, 1, '2024-05-07 09:02:37'),
(22, '0.00', 'Avik', '9800200515', '2024-05-07', '14:35:20', 1, 1, '2024-05-07 09:05:20'),
(23, '0.00', 'Avik', '9800200515', '2024-05-07', '14:41:34', 1, 1, '2024-05-07 09:11:34'),
(24, '0.00', 'Avik', '9800200515', '2024-05-07', '14:42:03', 1, 1, '2024-05-07 09:12:03'),
(25, '0.00', 'Avik', '9800200515', '2024-05-07', '14:42:31', 1, 1, '2024-05-07 09:12:31'),
(26, '0.00', 'Avik', '9800200515', '2024-05-07', '14:43:23', 1, 1, '2024-05-07 09:13:23'),
(27, '0.00', 'Avik', '9800200515', '2024-05-07', '14:43:58', 1, 1, '2024-05-07 09:13:58'),
(28, '0.00', 'Avik', '9800200515', '2024-05-07', '14:46:28', 1, 1, '2024-05-07 09:16:28'),
(29, '0.00', 'Avik', '9800200515', '2024-05-07', '14:47:21', 1, 1, '2024-05-07 09:17:21'),
(30, '0.00', 'Avik', '9800200515', '2024-05-07', '14:49:33', 1, 1, '2024-05-07 09:19:33'),
(31, '0.00', 'Avik', '9800200515', '2024-05-07', '14:50:00', 1, 1, '2024-05-07 09:20:00'),
(32, '0.00', 'Avik', '9800200515', '2024-05-07', '14:52:07', 1, 1, '2024-05-07 09:22:07'),
(33, '0.00', 'Avik', '9800200515', '2024-05-07', '14:52:40', 1, 1, '2024-05-07 09:22:40'),
(34, '0.00', 'Avik', '9800200515', '2024-05-07', '16:04:11', 1, 1, '2024-05-07 10:34:11'),
(35, '0.00', 'Avik', '9800200515', '2024-05-07', '16:04:33', 1, 1, '2024-05-07 10:34:33'),
(36, '0.00', 'Avik', '9800200515', '2024-05-07', '16:05:27', 1, 1, '2024-05-07 10:35:27'),
(37, '0.00', 'Avik', '9800200515', '2024-05-07', '16:06:11', 1, 1, '2024-05-07 10:36:11'),
(38, '0.00', 'Avik', '9800200515', '2024-05-07', '16:06:59', 1, 1, '2024-05-07 10:36:59'),
(39, '0.00', 'Avik', '9800200515', '2024-05-07', '16:07:48', 1, 1, '2024-05-07 10:37:48'),
(40, '0.00', 'Avik', '9800200515', '2024-05-07', '16:08:09', 1, 1, '2024-05-07 10:38:09'),
(41, '0.00', 'Avik', '9800200515', '2024-05-07', '16:08:25', 1, 1, '2024-05-07 10:38:25'),
(42, '0.00', 'Avik', '9800200515', '2024-05-07', '16:10:23', 1, 1, '2024-05-07 10:40:23'),
(43, '0.00', 'Avik', '9800200515', '2024-05-07', '16:11:00', 1, 1, '2024-05-07 10:41:00'),
(44, '0.00', 'Avik', '9800200515', '2024-05-07', '16:13:30', 1, 1, '2024-05-07 10:43:30'),
(45, '0.00', 'Avik', '9800200515', '2024-05-07', '16:18:33', 1, 1, '2024-05-07 10:48:33'),
(46, '0.00', 'Avik', '9800200515', '2024-05-07', '16:20:54', 1, 1, '2024-05-07 10:50:54'),
(47, '0.00', 'Avik', '9800200515', '2024-05-07', '18:14:59', 1, 1, '2024-05-07 12:44:59'),
(48, '0.00', 'Avik', '9800200515', '2024-05-07', '18:30:48', 1, 1, '2024-05-07 13:00:48'),
(49, '0.00', 'Avik', '9800200515', '2024-05-07', '18:31:13', 1, 1, '2024-05-07 13:01:13'),
(50, '0.00', 'Avik', '9800200515', '2024-05-07', '18:31:27', 1, 1, '2024-05-07 13:01:27'),
(51, '0.00', 'Avik', '9800200515', '2024-05-07', '19:09:31', 1, 1, '2024-05-07 13:39:31'),
(52, '0.00', 'Avik', '9800200515', '2024-05-07', '19:10:02', 1, 1, '2024-05-07 13:40:02'),
(53, '2989.90', 'Avik', '9800200515', '2024-05-07', '19:20:46', 1, 1, '2024-05-07 13:50:46'),
(54, '1812.00', 'blacky', '98765420', '2024-05-09', '00:16:07', 1, 5, '2024-05-08 18:46:07'),
(55, '6375.00', 'blacky', '98765420', '2024-05-09', '00:16:33', 1, 5, '2024-05-09 18:30:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history_inventory_store`
--
ALTER TABLE `history_inventory_store`
  ADD PRIMARY KEY (`revision`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`type`,`category_id`,`mrp`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history_inventory_store`
--
ALTER TABLE `history_inventory_store`
  MODIFY `revision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
