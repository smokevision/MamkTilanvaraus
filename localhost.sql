-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Palvelin: localhost
-- Luontiaika: 03.04.2014 klo 11:51
-- Palvelimen versio: 5.6.12-log
-- PHP:n versio: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Tietokanta: `tilanvaraus_mamk`
--
CREATE DATABASE IF NOT EXISTS `tilanvaraus_mamk` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `tilanvaraus_mamk`;

-- --------------------------------------------------------

--
-- Rakenne taululle `kayttaja`
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
-- Rakenne taululle `kuva`
--

CREATE TABLE IF NOT EXISTS `kuva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `polku` text COLLATE utf8_swedish_ci NOT NULL,
  `tilaId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Rakenne taululle `palvelu`
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
-- Rakenne taululle `tila`
--

CREATE TABLE IF NOT EXISTS `tila` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tunnus` text COLLATE utf8_swedish_ci,
  `nimi` text COLLATE utf8_swedish_ci,
  `kuvaus` text COLLATE utf8_swedish_ci,
  `hinta` text COLLATE utf8_swedish_ci,
  `henkilomaara` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=7 ;

--
-- Vedos taulusta `tila`
--

INSERT INTO `tila` (`id`, `tunnus`, `nimi`, `kuvaus`, `hinta`, `henkilomaara`) VALUES
(1, 'Mikpolisali', 'Mikpolisali', 'Mikpolisali on Kasarmin kampuksen digitaalinen esitysauditorio, jossa on 117 kiinteää istumapaikkaa. Salissa on elokuvatasoiset kuva-, ääni- ja tietojärjestelmät.', '0', 177),
(2, 'Kampussali A', 'Kampussali A', 'Patteristonkatu 3, A-rakennus, Mikkeli', '0', 269),
(3, 'Kampussali D', 'Kampussali D', 'Patteristonkatu 3, D-rakennus, Mikkeli', '0', 70),
(4, '', 'Kokoustila Kuitula', 'Mikpoli-rakennus, 3. kerros, Patteristonkatu 2, Mikkeli', '0', 22),
(6, 'X124', 'Kokoustila X124', '<p>Patteristonkatu 3, X-rakennus, 1. krs., Mikkeli</p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>kiinte&auml; pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Ravintola DeXi<br />\r\np. 0153 556 090.</p>\r\n', '0', 14);

-- --------------------------------------------------------

--
-- Rakenne taululle `varauksenpalvelut`
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
-- Rakenne taululle `varaus`
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
-- Rakenne taululle `yllapito`
--

CREATE TABLE IF NOT EXISTS `yllapito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tunnus` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `salasana` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `oikeus` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=2 ;

--
-- Vedos taulusta `yllapito`
--

INSERT INTO `yllapito` (`id`, `tunnus`, `salasana`, `oikeus`) VALUES
(1, 'admin', '023efff6da238fb3b97281cf03b32729', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
