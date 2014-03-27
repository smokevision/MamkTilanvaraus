-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2014 at 10:51 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tilanvaraus_mamk`
--
CREATE DATABASE IF NOT EXISTS `tilanvaraus_mamk` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `tilanvaraus_mamk`;

-- --------------------------------------------------------

--
-- Table structure for table `kaupunki`
--

CREATE TABLE IF NOT EXISTS `kaupunki` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kayttaja`
--

CREATE TABLE IF NOT EXISTS `kayttaja` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `sukunimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `puh` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `yritys` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `salasana` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kuva`
--

CREATE TABLE IF NOT EXISTS `kuva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tilaId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `palvelu`
--

CREATE TABLE IF NOT EXISTS `palvelu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `kuvaus` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `hinta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tila`
--

CREATE TABLE IF NOT EXISTS `tila` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kaupunkiId` int(10) unsigned NOT NULL,
  `tunnus` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `nimi` varchar(75) COLLATE utf8_swedish_ci DEFAULT NULL,
  `kuvaus` varchar(200) COLLATE utf8_swedish_ci DEFAULT NULL,
  `hinta` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `varauksenpalvelut`
--

CREATE TABLE IF NOT EXISTS `varauksenpalvelut` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `varausid` int(10) unsigned NOT NULL,
  `palveluid` int(10) unsigned NOT NULL,
  `maara` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `varaus`
--

CREATE TABLE IF NOT EXISTS `varaus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tilaid` int(10) unsigned NOT NULL,
  `asiakasid` int(10) unsigned NOT NULL,
  `aika` int(10) unsigned NOT NULL,
  `maksutilanne` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yllapito`
--

CREATE TABLE IF NOT EXISTS `yllapito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tunnus` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `salasana` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `oikeus` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
