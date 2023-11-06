-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2020 at 07:35 PM
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
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(11) NOT NULL,
  `fk_pack_id` int(11) NOT NULL,
  `travel_date` varchar(250) NOT NULL,
  `cust_name` varchar(250) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `check_in` varchar(250) NOT NULL,
  `check_out` varchar(250) NOT NULL,
  `room_type` varchar(250) NOT NULL,
  `room_no` int(11) NOT NULL,
  `adult_no` int(11) NOT NULL,
  `children_no` int(11) NOT NULL,
  `grand_total_price` float NOT NULL,
  `booking_date` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `fk_pack_id`, `travel_date`, `cust_name`, `mobile`, `email`, `address`, `check_in`, `check_out`, `room_type`, `room_no`, `adult_no`, `children_no`, `grand_total_price`, `booking_date`, `status`) VALUES
(4, 1, '31-03-2020', 'Haripada Jena', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, '', 'Confirmed'),
(5, 1, '02-04-2020', 'Bhabani', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, '', 'Confirmed'),
(6, 1, '02-04-2020', 'Sonu', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, '', 'Confirmed'),
(7, 1, '02-04-2020', 'Deepa', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, '', 'Confirmed'),
(8, 1, '02-04-2020', 'Haripada Bhuaban', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, '', 'Confirmed'),
(9, 1, '02-04-2020', 'New', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, '', 'Confirmed'),
(10, 1, '02-04-2020', 'HiiiDemo', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, '', 'Confirmed'),
(11, 1, '09-04-2020', 'P Jena', '9937897356', 'purnajena@gmail.com', 'AT/PO-AMBIKI VIA-ERASAMA DIST-JAGATSINGHPUR, PIN-754139', '', '', '', 1, 2, 1, 4000, '', 'Confirmed'),
(12, 1, '08-04-2020', 'Laxmipriya Jena', '07789901541', 'laxmipriya@gmail.com', 'AMBIKI\r\njAGATSINGHPUR\r\n', '', '', '', 2, 4, 0, 8000, '', 'Confirmed'),
(13, 2, '16-04-2020', 'Haripada Jena', '7381584856', 'jenaharipada@gmail.com', 'At/Po-Ambiki Ps-Erasama Dist-Jagatsinghpur Pin-754139', '', '', '', 3, 5, 0, 20000, 'Wed Apr 08 20:43:24 IST 2020', 'Confirmed'),
(14, 1, '16-04-2020', 'KALIPADA GIRI123', '07789901541', 'kalipadagiri32@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, 'Wed Apr 08 21:08:04 IST 2020', 'Confirmed'),
(15, 1, '16-04-2020', 'KALIPADA GIRI123', '07789901541', 'jenaharipada@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, 'Wed Apr 08 21:09:17 IST 2020', 'Confirmed'),
(16, 2, '08-04-2020', 'Haripada Jena', '07789901541', 'jenaharipada@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 2, 0, 8000, 'Wed Apr 08 21:13:11 IST 2020', 'Confirmed'),
(17, 1, '08-04-2020', 'Haripada', '7381584856', 'jenaharipada@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 1, 0, 2000, 'Wed Apr 08 21:25:02 IST 2020', 'Confirmed'),
(18, 1, '10-04-2020', 'Final Test', '07789901541', 'jenaharipada@gmail.com', '0\r\nBAGHADI\r\nAMBIKI', '', '', '', 1, 3, 0, 6000, 'Wed Apr 08 23:29:50 IST 2020', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `cat_img_path` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_name`, `cat_img_path`) VALUES
(1, 'Family Tours', 'E:/Eclipse/Travel/WebContent/CategoryImages/15848517842841.jpg'),
(2, 'Religious Tours', 'E:/Eclipse/Travel/WebContent/CategoryImages/15848518683671.jpg'),
(3, 'Adventure Tours', 'E:/Eclipse/Travel/WebContent/CategoryImages/15848535819331.jpg'),
(4, 'Special Event Tours', 'E:/Eclipse/Travel/WebContent/CategoryImages/15848413835341.jpg'),
(5, 'National Parks', 'E:/Eclipse/Travel/WebContent/CategoryImages/15849030690541.jpg'),
(6, 'Themed Vacations', 'E:/Eclipse/Travel/WebContent/CategoryImages/15849036776621.jpg'),
(7, 'Small Group Tours', 'E:/Eclipse/Travel/WebContent/CategoryImages/15849037393161.jpg'),
(8, 'Special Group Tour', 'E:/Eclipse/Travel/WebContent/CategoryImages/15848413835341.jpg'),
(9, 'Special Adventure ', 'E:/Eclipse/Travel/WebContent/CategoryImages/15848413835341.jpg'),
(10, 'Holiday Special', 'E:/Eclipse/Travel/WebContent/CategoryImages/15848525949571.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiry`
--

CREATE TABLE `tbl_enquiry` (
  `enq_id` int(11) NOT NULL,
  `fk_pack_id` int(11) NOT NULL,
  `ref_id` varchar(250) NOT NULL,
  `name` varchar(200) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `doj` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `duration` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_enquiry`
--

INSERT INTO `tbl_enquiry` (`enq_id`, `fk_pack_id`, `ref_id`, `name`, `mobile`, `email`, `doj`, `city`, `duration`, `message`, `status`) VALUES
(1, 2, '1586323071964', 'KALIPADA GIRI', '07789901541', 'jenaharipada@gmail.com', '14-04-2020', 'JAGATSINGHPUR', 3, 'TestEmail', 'Confirmed'),
(2, 2, '1586323346295', 'Haripada Jena', '07789901541', 'jenaharipada@gmail.com', '20-04-2020', 'JAGATSINGHPUR', 5, 'Email', 'pending');

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
(2, 2, 3, 'Religious Tour', 4000, 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786422.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786422.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786422.jpg', NULL, 1),
(3, 1, 13, 'Package Family', 200, 'E:/EclipE:/Eclipse/Travel/WebContent/PackageImages/15815045786422.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786422.jpg', 'E:/Eclipse/Travel/WebContent/PackageImages/15815045786422.jpg', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(11) NOT NULL,
  `fk_booking_id` int(11) NOT NULL,
  `trans_id` varchar(250) NOT NULL,
  `payment_type` varchar(200) NOT NULL,
  `cardhld_name` varchar(200) NOT NULL,
  `card_no` varchar(12) NOT NULL,
  `expiry_date` varchar(11) NOT NULL,
  `cvv_no` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `fk_booking_id`, `trans_id`, `payment_type`, `cardhld_name`, `card_no`, `expiry_date`, `cvv_no`, `status`) VALUES
(6, 8, '1586187918674', 'Debit Card', 'Bhuban', '123', '123', 123, 'Confirmed'),
(7, 9, '1586188333769', 'Debit Card', 'Subha', '1234', '123', 123, 'Confirmed'),
(8, 10, '1586191919976', 'Debit Card', 'Chandi', '123', '123', 122, 'Confirmed'),
(9, 11, '1586307711625', 'Debit Card', 'P Ch Jena', '789456123753', '2020-03-05', 123, 'Confirmed'),
(10, 12, '1586313238601', 'Credit Card', 'LAXMI JENA', '789456123741', '2020-02-04', 123, 'Confirmed'),
(11, 13, '1586358894585', 'Debit Card', 'Haripada Jena', '123456789963', '2020-04-08', 456, 'Confirmed'),
(12, 15, '1586360420180', 'Debit Card', 'Kalipada Giru', '147896325815', '2020-04-04', 123, 'Confirmed'),
(13, 16, '1586360638944', 'Debit Card', 'Haripada', '147899325896', '2020-04-04', 123, 'Confirmed'),
(14, 17, '1586361331894', 'Debit Card', 'Haripada', '789456123123', '09-04-2020', 123, 'Confirmed'),
(15, 18, '1586368826866', 'Debit Card', 'Final Test', '789456123014', '16-04-2020', 456, 'Confirmed');

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
(8, 7, 'Small Group Tour', 'E:/Eclipse/Travel/WebContent/SubcatImages/1581502277134.jpg', 'Small Group Tour'),
(11, 1, 'Family Tour in Mumbai', 'E:/Eclipse/Travel/WebContent/SubcatImages/1582091699982.jpg', 'Family Tour In Mumbai'),
(12, 1, 'DEmo', 'E:/Eclipse/Travel/WebContent/SubcatImages/1582092513710.jpg', 'Demo'),
(13, 1, 'Family2', 'E:/Eclipse/Travel/WebContent/SubcatImages/1582092875395.jpg', 'Family2');

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
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_pack_id` (`fk_pack_id`);

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
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_booking_id` (`fk_booking_id`);

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
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  MODIFY `enq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `pack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `subcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD CONSTRAINT `tbl_booking_ibfk_1` FOREIGN KEY (`fk_pack_id`) REFERENCES `tbl_package` (`pack_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD CONSTRAINT `tbl_payment_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `tbl_booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD CONSTRAINT `tbl_subcategory_ibfk_1` FOREIGN KEY (`fk_cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
