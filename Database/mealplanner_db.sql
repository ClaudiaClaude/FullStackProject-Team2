-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2021 at 11:09 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mealplanner_db`
--
CREATE DATABASE IF NOT EXISTS `mealplanner_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mealplanner_db`;

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `fk_user_id_id` int(11) DEFAULT NULL,
  `dish_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nutrition_facts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calories` int(11) NOT NULL,
  `dish_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `fk_user_id_id`, `dish_name`, `image`, `description`, `nutrition_facts`, `ingredients`, `recipe`, `type`, `category`, `calories`, `dish_status`) VALUES
(1, 1, 'test', 'pancakes-6138fabfbd6f5.jpg', 'Pancakes', 'somethin', 'noo', 'yee', 'Vegan', 'cool', 31, 'yee'),
(5, 1, 'Macarons', 'macarons-2548827_1280-6138ef7ecd430.jpg', 'Heavenly fancy cookies that I\'ve never tried.', 'Once you eat one you get a french accent', 'Sugar, Almond Flour, salt, egg whites etc..', 'Open the pastry box, place them on a plate, tell everyone you made them!', 'Vegan', 'Dessert', 173, 'yee');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210907091954', '2021-09-07 11:20:02', 39),
('DoctrineMigrations\\Version20210914090808', '2021-09-14 11:08:22', 2231);

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` int(11) NOT NULL,
  `fk_user_id_id` int(11) NOT NULL,
  `fk_dish_id_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`, `avatar`) VALUES
(1, 'user@gmail.com', '[]', '$2y$13$uaiYUf7//n4RAvWAkmkh9uYivtTct4lPUVvAH5nQRXUQQC3hPnVEW', 'trial1', ''),
(2, 'mealadmin@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$SkiF2S.tRgA98107s7Q1C.nyOm5lREgc0pN9Mcb/d8iT8D1wazE0u', 'trial2', 'girl-1867092_1280-613f1a93389fa.jpg'),
(3, 'test@mail.com', '[\"ROLE_BLOCKED\"]', '$2y$13$WKCIfle37G3cXp0dC50F5O5Rfhcq6U4p8H3v0ZTxE2iITkQeCaeOO', 'hi', 'image.jpg'),
(4, 'test2@mail.com', '[]', '$2y$13$LXfymmQAe8aRxcaeh.BNienVjZ91MTtH/5yCMNCCUM1FSCIzdUUIO', 'test2@mail.com', 'https://www.w3schools.com/howto/img_avatar.png'),
(5, 'admin@mail.com', '[]', '$2y$13$7eiJFdTqP41FhznQGcLuS.CekkUyr8iOrcsohUTrP1aSdeO2W/Umi', 'the admin', 'https://cdn.pixabay.com/photo/2014/03/25/17/01/key-297850_960_720.png'),
(6, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Xd0k9/o0dVpHjAxJiY8tE.y1jBbyfPqmmfZTnR4UsXtx2/czWKgm2', 'the admin', 'https://cdn.pixabay.com/photo/2014/03/25/17/01/key-297850_960_720.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_584DD35D6DE8AF9C` (`fk_user_id_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E229E6EA6DE8AF9C` (`fk_user_id_id`),
  ADD KEY `IDX_E229E6EAE5107689` (`fk_dish_id_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `FK_584DD35D6DE8AF9C` FOREIGN KEY (`fk_user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `FK_E229E6EA6DE8AF9C` FOREIGN KEY (`fk_user_id_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E229E6EAE5107689` FOREIGN KEY (`fk_dish_id_id`) REFERENCES `dishes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
