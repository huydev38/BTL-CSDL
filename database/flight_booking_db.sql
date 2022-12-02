-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 07:15 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flight_booking_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines_list`
--

CREATE TABLE `airlines_list` (
  `id` int(30) NOT NULL,
  `airlines` text NOT NULL,
  `logo_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airlines_list`
--

INSERT INTO `airlines_list` (`id`, `airlines`, `logo_path`) VALUES
(1, 'Viet Nam Airlines', '1669052100_9d8ed5_a5c0219027ac495a8926bbd6f01d1c42_mv2.jpg'),
(2, 'VietJet Air', '1669052100_1571733729-logo-vietjet-air-15-13-34-40.jpg'),
(3, 'Bamboo Airways', '1669825980_Logo-Bamboo-Airways-V.webp'),
(4, 'Jetstar ', '1669826040_jetstar-logo-inkythuatso-14-10-44-31.jpg'),
(5, 'VietTravel Airlines', '1669826100_Logo_của_Vietravel_Airlines.png');

-- --------------------------------------------------------

--
-- Table structure for table `airport_list`
--

CREATE TABLE `airport_list` (
  `id` int(30) NOT NULL,
  `airport` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport_list`
--

INSERT INTO `airport_list` (`id`, `airport`, `location`) VALUES
(1, 'Noi Bai', 'Ha Noi, Viet Nam\r\n'),
(2, 'Tan Son Nhat', 'Ho Chi Minh, Viet Nam'),
(3, 'Cam Ranh', 'Khanh Hoa, Viet Nam'),
(4, 'Tân Khương', 'Lâm Đồng, Việt Nam'),
(5, 'Vân Đồn', 'Quảng Ninh, Việt Nam\r\n'),
(6, 'Đà Nẵng', 'Quảng Nam, Việt Nam');

-- --------------------------------------------------------

--
-- Table structure for table `booked_flight`
--

CREATE TABLE `booked_flight` (
  `id` int(30) NOT NULL,
  `flight_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `buyerTele` varchar(11) NOT NULL,
  `date_booked` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked_flight`
--

INSERT INTO `booked_flight` (`id`, `flight_id`, `name`, `address`, `contact`, `buyerTele`, `date_booked`) VALUES
(22, 1, 'Vũ Hương Giang', 'La Khe Ha Dong', '0376551641', '0376551641', '2022-11-30 06:53:12'),
(38, 5, 'Huy Nguyen Quang', 'La Khe Ha Dong', '0376551641', '0376551641', '2022-11-30 06:55:56'),
(39, 6, 'James Smiths', 'America', '0012345678', '0376551642', '2022-12-01 09:11:46'),
(40, 7, 'Huy Nguyen Quang', 'La Khe Ha Dong', '0376551641', '0012', '2022-12-02 06:14:28'),
(41, 7, 'Huy Nguyen Quang', 'La Khe Ha Dong', '0376551641', '0012', '2022-12-02 06:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `flight_list`
--

CREATE TABLE `flight_list` (
  `id` int(30) NOT NULL,
  `airline_id` int(30) NOT NULL,
  `plane_no` text NOT NULL,
  `departure_airport_id` int(30) NOT NULL,
  `arrival_airport_id` int(30) NOT NULL,
  `departure_datetime` datetime NOT NULL,
  `arrival_datetime` datetime NOT NULL,
  `seats` int(10) NOT NULL DEFAULT 0,
  `price` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_list`
--

INSERT INTO `flight_list` (`id`, `airline_id`, `plane_no`, `departure_airport_id`, `arrival_airport_id`, `departure_datetime`, `arrival_datetime`, `seats`, `price`, `date_created`) VALUES
(1, 2, 'Airbus326', 1, 2, '2022-11-29 13:34:00', '2022-12-03 13:34:00', 100, 200, '2022-11-25 13:33:29'),
(2, 1, 'Airbus327', 1, 2, '2022-11-29 13:34:00', '2022-12-03 13:34:00', 100, 200, '2022-11-25 13:34:24'),
(4, 1, 'ajf;as', 3, 2, '2022-11-26 13:52:00', '2022-11-27 13:52:00', 100, 500, '2022-11-25 13:52:34'),
(5, 2, 'safsf', 3, 1, '2022-12-01 13:55:00', '2022-12-16 13:55:00', 100, 100, '2022-11-30 13:54:59'),
(6, 1, 'Airbus A320', 1, 6, '2022-12-02 16:10:00', '2022-12-02 19:00:00', 100, 300, '2022-12-01 16:10:49'),
(7, 3, 'Airbus', 5, 6, '2022-12-03 13:13:00', '2022-12-03 16:00:00', 100, 200, '2022-12-02 13:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Online Flight Booking System', 'bookingcenter@email.vn', '+84 234567890', '1669792320_1287373.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot;&gt;&lt;b&gt;Welcome to Flight Booking System. This sample system is an assignment of Database course, made by group 9.&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = doctor,3=patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airlines_list`
--
ALTER TABLE `airlines_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `airport_list`
--
ALTER TABLE `airport_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_flight`
--
ALTER TABLE `booked_flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `flight_list`
--
ALTER TABLE `flight_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airline_id` (`airline_id`),
  ADD KEY `arrival_airport_id` (`arrival_airport_id`),
  ADD KEY `departure_airport_id` (`departure_airport_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `booked_flight`
--
ALTER TABLE `booked_flight`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked_flight`
--
ALTER TABLE `booked_flight`
  ADD CONSTRAINT `booked_flight_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight_list` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `flight_list`
--
ALTER TABLE `flight_list`
  ADD CONSTRAINT `flight_list_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airlines_list` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_list_ibfk_2` FOREIGN KEY (`arrival_airport_id`) REFERENCES `airport_list` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_list_ibfk_3` FOREIGN KEY (`departure_airport_id`) REFERENCES `airport_list` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
