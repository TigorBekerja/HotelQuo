-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 02:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelquo`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `price` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `status`, `price`) VALUES
(26, 31, 4, '2024-12-09', '2024-12-12', 'pending', 3360000);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `rating` float DEFAULT 0,
  `description` text DEFAULT '',
  `image_url` varchar(255) DEFAULT '',
  `facilities` text DEFAULT '',
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `name`, `location`, `rating`, `description`, `image_url`, `facilities`, `price`) VALUES
(1, 'Grand Paradise', 'Jakarta', 4.5, 'Luxury hotel located in the heart of Jakarta.', 'foto/1.jpg', 'Free WiFi, Swimming Pool, Gym', 1000000.00),
(2, 'Ocean Breeze', 'Bali', 4.7, 'Beachfront hotel with stunning ocean views.', 'foto/2.jpg', 'Free WiFi, Pool, Gym', 2000000.00),
(3, 'Mountain Escape', 'Bandung', 4.3, 'Nestled in the mountains, perfect for relaxation.', 'foto/bandung.png', 'Free WiFi, Free Parking, Free Breakfast, Pool, Gym', 1800000.00),
(4, 'City Central Inn', 'Surabaya', 4.2, 'Located in the city center, ideal for business trips.', 'foto/surabaya.png', 'Free WiFi, Free Parking, Free Breakfast, Private Pool, Spa', 1000000.00),
(5, 'Cultural Stay', 'Yogyakarta', 4.6, 'Immerse yourself in the culture of Yogyakarta.', 'foto/yogya.png', 'Free WiFi, Free Parking, Free Breakfast, Airport Shuttle, Restaurant', 1300000.00),
(6, 'Urban Oasis', 'Semarang', 4.1, 'Modern hotel with a touch of nature.', 'foto/semarang.png', 'Free WiFi, Free Parking, Free Breakfast, Rooftop Bar, Lounge', 1700000.00),
(7, 'Heritage Haven', 'Medan', 4.4, 'Preserving heritage with luxury accommodation.', 'foto/3.jpg', 'Free WiFi, Free Parking, Free Breakfast, Pet-Friendly, Garden', 1200000.00),
(8, 'Seaside Retreat', 'Lombok', 4.8, 'Ultimate retreat by the sea in Lombok.', 'foto/4.jpg', 'Free WiFi, Free Parking, Free Breakfast, Kids’ Playground, Game Room', 3000000.00),
(9, 'Forest Lodge', 'Bogor', 4.3, 'Experience the tranquility of nature.', 'foto/5.jpg', 'Free WiFi, Free Parking, Free Breakfast, Business Center, Meeting Room', 1400000.00),
(10, 'Riverside Inn', 'Palembang', 4.5, 'Cozy inn by the riverside.', 'foto/6.jpg', 'Free WiFi, Free Parking, Free Breakfast, Beach Access, Water Sports', 2000000.00),
(11, 'Sunset Paradise', 'Bali', 4.9, 'A serene retreat overlooking the sunset.', 'foto/7.jpg', 'Free Breakfast, Pool, Spa', 2500000.00),
(12, 'Alpine Retreat', 'Bandung', 4.6, 'Experience the cool mountain breeze.', 'foto/8.jpg', 'Free WiFi, Fireplace', 3500000.00),
(13, 'Urban Luxe', 'Jakarta', 4.8, 'Premium stay in the heart of the city.', 'foto/9.jpg', 'Free Parking, Gym, Restaurant', 4500000.00),
(14, 'Beach Bliss', 'Lombok', 4.7, 'Stunning beachfront location with private villas.', 'foto/10.png', 'Private Pool, Bar, Free WiFi', 5500000.00),
(15, 'Jungle Escape', 'Bogor', 4.5, 'Nestled in lush greenery for a perfect getaway.', 'foto/11.jpg', 'Free Parking, Hiking Trails', 2500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `hotel_id`, `type`, `price`, `description`, `image_url`) VALUES
(1, 1, 'Deluxe Room', 1500000.00, 'Spacious room with king-sized bed and city view.', 'foto/a.jpg'),
(2, 1, 'Standard Room', 1000000.00, 'Comfortable room with essential amenities.', 'foto/b.jpg'),
(3, 2, 'Suite', 2000000.00, 'Luxurious suite with private balcony and ocean view.', 'foto/c.jpg'),
(4, 3, 'Family Room', 1800000.00, 'Ideal for families with two queen-sized beds.', 'foto/e.jpg'),
(5, 4, 'Business Room', 1200000.00, 'Equipped with work desk and high-speed internet.', 'foto/g.jpg'),
(6, 5, 'Cultural Room', 1300000.00, 'Themed room with traditional Javanese decor.', 'foto/i.jpg'),
(7, 6, 'Modern Suite', 1700000.00, 'Contemporary design with premium facilities.', 'foto/k.jpg'),
(8, 7, 'Heritage Suite', 2500000.00, 'Preserving the essence of heritage with luxury.', 'foto/m.jpg'),
(9, 8, 'Retreat Villa', 3000000.00, 'Private villa with direct beach access.', 'foto/o.jpg'),
(10, 9, 'Nature Room', 1400000.00, 'Surrounded by lush greenery and fresh air.', 'foto/q.jpg'),
(11, 10, 'Riverside Suite', 2000000.00, 'Suite with panoramic river view.', 'foto/s.jpg'),
(12, 2, 'Penthouse Suite', 4000000.00, 'Exclusive suite with rooftop access and city view.', 'foto/d.jpg'),
(13, 3, 'Luxury Villa', 3500000.00, 'Private villa with infinity pool and garden.', 'foto/f.jpg'),
(14, 4, 'Economy Room', 1000000.00, 'Budget-friendly room with basic amenities.', 'foto/h.jpg'),
(15, 5, 'Executive Suite', 2200000.00, 'Spacious suite with executive work area.', 'foto/j.jpg'),
(16, 6, 'Honeymoon Suite', 2800000.00, 'Romantic suite with jacuzzi and ocean view.', 'foto/l.jpg'),
(17, 7, 'Classic Room', 1200000.00, 'Simple room with cozy interior.', 'foto/n.jpg'),
(18, 8, 'Presidential Suite', 5000000.00, 'Premium suite with private lounge and butler service.', 'foto/p.jpg'),
(19, 9, 'Garden Room', 1600000.00, 'Room surrounded by vibrant garden views.', 'foto/r.jpg'),
(20, 10, 'Sky Loft', 3000000.00, 'Loft with panoramic skyline view.', 'foto/t.jpg'),
(21, 11, 'Deluxe Suite', 2500000.00, 'Luxury suite with private balcony and city view.', 'foto/u.jpg'),
(22, 11, 'Family Suite', 3000000.00, 'Spacious family suite with modern amenities.', 'foto/v.jpg'),
(23, 12, 'Executive Suite', 3500000.00, 'Premium suite with executive workspace and river view.', 'foto/w.jpg'),
(24, 12, 'Honeymoon Suite', 4000000.00, 'Romantic suite with jacuzzi and mountain view.', 'foto/x.jpg'),
(25, 13, 'Garden Villa', 4500000.00, 'Private villa surrounded by vibrant garden.', 'foto/y.jpg'),
(26, 13, 'Presidential Suite', 5000000.00, 'Exclusive suite with private lounge and butler service.', 'foto/z.jpg'),
(27, 14, 'Beachfront Villa', 5500000.00, 'Luxurious villa with direct beach access and infinity pool.', 'foto/a.jpg'),
(28, 14, 'Sky Loft', 6000000.00, 'Modern loft with panoramic skyline views.', 'foto/b.jpg'),
(29, 15, 'Eco Lodge', 3000000.00, 'Eco-friendly lodge with stunning forest views.', 'foto/c.jpg'),
(30, 15, 'Adventure Cabin', 2500000.00, 'Rustic cabin perfect for adventurers.', 'foto/d.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'ID User',
  `username` varchar(255) NOT NULL COMMENT 'Username User',
  `password` varchar(255) NOT NULL COMMENT 'Password User',
  `full_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Nama lengkap User',
  `email` varchar(255) NOT NULL COMMENT 'Email User',
  `DOB` date DEFAULT NULL COMMENT 'Tanggal lahir User',
  `phone_number` varchar(13) NOT NULL DEFAULT '' COMMENT 'Nomor telepon, maks 13',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT 'Negara User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Table User';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `full_name`, `email`, `DOB`, `phone_number`, `country`) VALUES
(31, 'vandika tegar', '670525806', 'Muhammad Vandika Tegar Siswanto', 'vandikategar@gmail.com', '2004-12-10', '081251101511', 'Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID User', AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
