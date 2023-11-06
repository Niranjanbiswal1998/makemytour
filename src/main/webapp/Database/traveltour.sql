-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2020 at 04:47 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traveltour`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_name`) VALUES
(1, 'Family Tours'),
(2, 'Religious Tours'),
(3, 'Adventure Tours'),
(4, 'Special Event Tours'),
(5, 'National Parks'),
(6, 'Themed Vacations'),
(7, 'Small Group Tours');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiry`
--

CREATE TABLE `tbl_enquiry` (
  `enq_id` int(11) NOT NULL,
  `fk_pack_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `days` int(20) NOT NULL,
  `child` int(20) NOT NULL,
  `adult` int(20) NOT NULL,
  `message` varchar(500) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_enquiry`
--

INSERT INTO `tbl_enquiry` (`enq_id`, `fk_pack_id`, `name`, `gender`, `mobile`, `email`, `days`, `child`, `adult`, `message`, `status`) VALUES
(1, 1, 'Haripada', 'Male', '7381584556', 'abc@gmail.com', 2, 2, 3, 'Enquiry', 'Confirm'),
(2, 1, 'Haripada', 'Male', '7381584856', 'abc@gmail.com', 2, 2, 1, 'Inquiry', 'Confirm'),
(3, 1, 'KALIPADA GIRI', 'Male', '07789901541', 'kalipadagiri32@gmail.com', 2, 2, 2, 'We want a room.', 'Confirm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `pack_id` int(11) NOT NULL,
  `fk_cat_id` int(11) NOT NULL,
  `fk_subcat_id` int(11) NOT NULL,
  `pack_name` varchar(200) NOT NULL,
  `pack_price` float NOT NULL,
  `pic1Path` varchar(200) NOT NULL,
  `pic2Path` varchar(200) NOT NULL,
  `pic3Path` varchar(200) NOT NULL,
  `pack_details` varchar(300) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_package`
--

INSERT INTO `tbl_package` (`pack_id`, `fk_cat_id`, `fk_subcat_id`, `pack_name`, `pack_price`, `pic1Path`, `pic2Path`, `pic3Path`, `pack_details`, `status`) VALUES
(1, 1, 2, 'Family Tour in Goa', 2000, 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786421.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786422.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786423.jpg', 'Family Tour in Goa', 1),
(2, 2, 3, 'Religious Tour', 4000, 'E:/Eclipse/Travel/WebContent/PackageImages/15815045036081.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045036082.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045036083.jpg', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `subcat_id` int(11) NOT NULL,
  `fk_cat_id` int(11) DEFAULT NULL,
  `subcat_name` varchar(200) DEFAULT NULL,
  `subcat_pic` varchar(500) DEFAULT NULL,
  `subcat_details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subcategory`
--

INSERT INTO `tbl_subcategory` (`subcat_id`, `fk_cat_id`, `subcat_name`, `subcat_pic`, `subcat_details`) VALUES
(1, 1, 'Family Tour in Odisha', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581503182747.jpg', 'Adventure family tour in Costal Odisha'),
(2, 1, 'Family Tour in Goa', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581501639298.jpg', 'Adventure family tour in Goa'),
(3, 2, 'Religious Tour in Odisha', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581501734165.jpg', 'Religious Tour in Odisha'),
(4, 3, 'Adventure Tour in Jammu & Kashmir', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581501802606.jpg', 'Adventure Tour in Jammu and Kashmir'),
(5, 4, 'Special Tour Event in Mumbai', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581501996532.jpg', 'Special Event Tours in Mumbai'),
(6, 5, 'National Park in Odisha', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581502052177.jpg', 'Nation park in Odisha'),
(7, 6, 'Themed Vatictions in Punjab', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581502170688.jpg', 'Themed Vacation in Punjab'),
(8, 7, 'Small Group Tour', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581502277134.jpg', 'Small Group Tour');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `Pwd` varchar(200) NOT NULL,
  `Typeofuser` varchar(200) NOT NULL,
  `Username` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `Pwd`, `Typeofuser`, `Username`) VALUES
(1, 'admin', 'Admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  ADD PRIMARY KEY (`enq_id`),
  ADD KEY `fk_pack_id` (`fk_pack_id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`pack_id`),
  ADD KEY `fk_cat_id` (`fk_cat_id`),
  ADD KEY `fk_subcat_id` (`fk_subcat_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`subcat_id`),
  ADD KEY `fk_cat_id` (`fk_cat_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  MODIFY `enq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `pack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `subcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  ADD CONSTRAINT `tbl_enquiry_ibfk_1` FOREIGN KEY (`fk_pack_id`) REFERENCES `tbl_package` (`pack_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD CONSTRAINT `tbl_package_ibfk_1` FOREIGN KEY (`fk_cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_package_ibfk_2` FOREIGN KEY (`fk_subcat_id`) REFERENCES `tbl_subcategory` (`subcat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD CONSTRAINT `tbl_subcategory_ibfk_1` FOREIGN KEY (`fk_cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
