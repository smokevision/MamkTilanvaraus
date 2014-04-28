-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 27.04.2014 klo 09:18
-- Palvelimen versio: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tilanvaraus_mamk`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `hinnasto`
--

CREATE TABLE IF NOT EXISTS `hinnasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tilaId` int(11) NOT NULL,
  `pvm` int(11) NOT NULL,
  `tunti` int(11) NOT NULL,
  `hinta` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tilaId` (`tilaId`),
  KEY `tunti` (`tunti`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=122 ;

--
-- Vedos taulusta `hinnasto`
--

INSERT INTO `hinnasto` (`id`, `tilaId`, `pvm`, `tunti`, `hinta`) VALUES
(2, 1, 2, 8, 100),
(3, 1, 2, 9, 100),
(4, 1, 2, 10, 100),
(5, 1, 2, 11, 100),
(6, 1, 2, 12, 100),
(7, 1, 2, 13, 100),
(8, 1, 2, 14, 100),
(9, 1, 2, 15, 100),
(10, 1, 2, 16, 120),
(11, 1, 2, 17, 120),
(12, 1, 2, 18, 120),
(13, 1, 2, 19, 120),
(14, 1, 2, 20, 120),
(15, 1, 2, 21, 120),
(16, 1, 2, 22, 120),
(17, 1, 3, 8, 100),
(18, 1, 3, 9, 100),
(19, 1, 3, 10, 100),
(20, 1, 3, 11, 100),
(21, 1, 3, 12, 100),
(22, 1, 3, 13, 100),
(23, 1, 3, 14, 100),
(24, 1, 3, 15, 100),
(25, 1, 3, 16, 120),
(26, 1, 3, 17, 120),
(27, 1, 3, 18, 120),
(28, 1, 3, 19, 120),
(29, 1, 3, 20, 120),
(30, 1, 3, 21, 120),
(31, 1, 3, 22, 120),
(47, 1, 4, 8, 100),
(48, 1, 4, 9, 100),
(49, 1, 4, 10, 100),
(50, 1, 4, 11, 100),
(51, 1, 4, 12, 100),
(52, 1, 4, 13, 100),
(53, 1, 4, 14, 100),
(54, 1, 4, 15, 100),
(55, 1, 4, 16, 120),
(56, 1, 4, 17, 120),
(57, 1, 4, 18, 120),
(58, 1, 4, 19, 120),
(59, 1, 4, 20, 120),
(60, 1, 4, 21, 120),
(61, 1, 4, 22, 120),
(62, 1, 5, 8, 100),
(63, 1, 5, 9, 100),
(64, 1, 5, 10, 100),
(65, 1, 5, 11, 100),
(66, 1, 5, 12, 100),
(67, 1, 5, 13, 100),
(68, 1, 5, 14, 100),
(69, 1, 5, 15, 100),
(70, 1, 5, 16, 100),
(71, 1, 5, 17, 120),
(72, 1, 5, 18, 120),
(73, 1, 5, 19, 120),
(74, 1, 5, 20, 120),
(75, 1, 5, 21, 120),
(76, 1, 5, 22, 120),
(77, 1, 6, 8, 100),
(78, 1, 6, 9, 100),
(79, 1, 6, 10, 100),
(80, 1, 6, 11, 100),
(81, 1, 6, 12, 100),
(82, 1, 6, 13, 100),
(83, 1, 6, 14, 100),
(84, 1, 6, 15, 100),
(85, 1, 6, 16, 100),
(86, 1, 6, 17, 120),
(87, 1, 6, 18, 120),
(88, 1, 6, 19, 120),
(89, 1, 6, 20, 120),
(90, 1, 6, 21, 120),
(91, 1, 6, 22, 120),
(92, 1, 7, 8, 120),
(93, 1, 7, 9, 120),
(94, 1, 7, 10, 120),
(95, 1, 7, 11, 120),
(96, 1, 7, 12, 120),
(97, 1, 7, 13, 120),
(98, 1, 7, 14, 120),
(99, 1, 7, 15, 120),
(100, 1, 7, 16, 120),
(101, 1, 7, 17, 120),
(102, 1, 7, 18, 120),
(103, 1, 7, 19, 120),
(104, 1, 7, 20, 120),
(105, 1, 7, 21, 120),
(106, 1, 7, 22, 120),
(107, 1, 1, 8, 120),
(108, 1, 1, 9, 120),
(109, 1, 1, 10, 120),
(110, 1, 1, 11, 120),
(111, 1, 1, 12, 120),
(112, 1, 1, 13, 120),
(113, 1, 1, 14, 120),
(114, 1, 1, 15, 120),
(115, 1, 1, 16, 120),
(116, 1, 1, 17, 120),
(117, 1, 1, 18, 120),
(118, 1, 1, 19, 120),
(119, 1, 1, 20, 120),
(120, 1, 1, 21, 120),
(121, 1, 1, 22, 120);

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `hinnasto`
--
ALTER TABLE `hinnasto`
  ADD CONSTRAINT `hinnasto_ibfk_1` FOREIGN KEY (`tilaId`) REFERENCES `tila` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
