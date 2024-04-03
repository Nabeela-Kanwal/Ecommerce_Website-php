-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2024 at 07:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(2, 'Beauty Product', 1),
(3, 'Women', 1),
(5, 'Cat6', 0),
(7, 'Children', 1),
(8, 'Man', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(5, 'Dakota May', 'nowyretak@mailinator.com', 'Fugiat natus ac', 'Dolor distinctio Co', '2024-03-28 05:53:56'),
(6, 'Dakota May', 'nowyretak@mailinator.com', 'Fugiat natus ac', 'Dolor distinctio Co', '2024-03-28 06:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`) VALUES
(1, 4, 'Khan bela', 'khan bela', 1122, 'easypaisa', 4400, 'pending', 3, '2024-04-02 04:56:46'),
(2, 4, 'Khan bela', 'khan bela', 1122, 'easypaisa', 11000, 'pending', 0, '2024-04-03 04:15:07'),
(3, 4, 'Sit vel deserunt per', 'Ratione dignissimos', 1122, 'easypaisa', 6600, 'success', 1, '2024-04-03 06:18:22'),
(4, 4, 'Perferendis dolore t', 'Ratione dignissimos', 677, 'easypaisa', 11000, 'Success', 5, '2024-04-03 06:25:48'),
(5, 4, 'Sit vel deserunt per', 'Ratione dignissimos', 677, 'easypaisa', 2200, 'success', 1, '2024-04-03 06:29:15'),
(6, 4, 'Khan bela', 'Ratione dignissimos', 1122, 'easypaisa', 2200, 'success', 8, '2024-04-03 06:32:17'),
(7, 4, 'Khan bela', 'khan bela', 3344, 'easypaisa', 2363, 'success', 4, '2024-04-03 07:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`, `added_on`) VALUES
(1, 1, 12, 2, 2200, '0000-00-00 00:00:00'),
(2, 2, 12, 5, 2200, '0000-00-00 00:00:00'),
(3, 3, 12, 3, 2200, '0000-00-00 00:00:00'),
(4, 4, 12, 5, 2200, '0000-00-00 00:00:00'),
(5, 5, 12, 1, 2200, '0000-00-00 00:00:00'),
(6, 6, 12, 1, 2200, '0000-00-00 00:00:00'),
(7, 7, 19, 1, 1400, '0000-00-00 00:00:00'),
(8, 7, 18, 1, 963, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'pending'),
(2, 'Shipping'),
(4, 'processing'),
(5, 'cancelled'),
(8, 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(12, 2, 'hijab', 1000, 2200, 12, '807032513_FB_IMG_1703515948695.jpg', 'Ea praesentium sint', 'Est dolor quas sunt', 'Laborum iste recusan', '', 'Obcaecati irure nobi', 1),
(13, 8, 'Shirt', 1000, 2000, 8, '296552407_rabbit-4988412.jpg', 'Elit esse dolores', 'Sed sunt aperiam ame', 'Hic est voluptatum', 'Sint qui aut duis of', 'Ad suscipit deserunt', 1),
(14, 3, 'dress', 1200, 915, 570, '130687210_hangers-1850082.jpg', 'Recusandae Voluptat', 'Adipisicing totam ni', 'Sed sunt molestiae p', 'Esse dolore ipsa m', 'Eaque occaecat illum', 1),
(15, 7, 'Shoes', 2000, 1000, 159, '125398323_hipster-958805.jpg', 'Ullam in ut exercita', 'Ipsum nostrum delect', 'Eligendi aut magni d', 'Asperiores ut ut sed', 'Enim ducimus aut et', 1),
(16, 2, 'makeup', 5008, 2160, 623, '750501122_cosmetics-5700385.png', 'Modi optio laborum', 'Nisi explicabo Ea c', 'Dolor rerum veniam', 'Atque pariatur Dolo', 'Cupiditate dolore ir', 1),
(17, 8, 'Check Shirt', 6000, 631, 908, '236787853_shirts-591750.jpg', 'Adipisicing in at re', 'Ab et eligendi deser', 'Autem distinctio As', 'Ut commodo dolore to', 'Id proident et omn', 1),
(18, 7, 'Boy Shirt', 599, 963, 490, '801083881_the-last-shirt-1510597.jpg', 'Modi minim incidunt', 'Nostrud tempora cons', 'Nesciunt proident', 'Inventore dolorum ea', 'Elit repellendus V', 1),
(19, 7, 'baby Frock', 1233, 1400, 990, '604263117__7eea58ba-7a9e-42e1-9cd8-786dd6f8577b.jpeg', 'Ratione duis quod mo', 'Qui possimus volupt', 'Velit minima nostrud', '', 'Repellendus Et iust', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(2, 'Admin', '12345678', 'Test@gmail.com', '0987655', '2024-04-01 08:59:57'),
(3, 'Admin', '1234', 'nabeela@gmail.com', '0987655', '2024-04-02 04:36:54'),
(4, 'Admin', '1234', 'chanda@gmail.com', '0987655', '2024-04-02 04:37:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
