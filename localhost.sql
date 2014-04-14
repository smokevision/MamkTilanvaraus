-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Palvelin: localhost
-- Luontiaika: 14.04.2014 klo 17:50
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

-- --------------------------------------------------------

--
-- Rakenne taululle `kayttaja`
--

CREATE TABLE IF NOT EXISTS `kayttaja` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `sukunimi` text COLLATE utf8_swedish_ci NOT NULL,
  `katuosoite` text COLLATE utf8_swedish_ci NOT NULL,
  `postinumero` int(11) NOT NULL,
  `postitoimipaikka` text COLLATE utf8_swedish_ci NOT NULL,
  `email` text COLLATE utf8_swedish_ci NOT NULL,
  `puh` text COLLATE utf8_swedish_ci NOT NULL,
  `yritys` text COLLATE utf8_swedish_ci,
  `salasana` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=3 ;

--
-- Vedos taulusta `kayttaja`
--

INSERT INTO `kayttaja` (`id`, `etunimi`, `sukunimi`, `katuosoite`, `postinumero`, `postitoimipaikka`, `email`, `puh`, `yritys`, `salasana`) VALUES
(1, 'Matti', 'Meikäläinen', 'Kotikatu 3', 50100, 'Mikkeli', 'matti.meikalainen@mail.com', '0404856073', '', '5c54fe614285a0e57ecb54c05c016108'),
(2, 'Kalle', 'Virtanen', 'Olkikuja 45 A3', 50100, 'Mikkeli', 'kvirtanen@gmail.com', '0506862342', '', '5c54fe614285a0e57ecb54c05c016108');

-- --------------------------------------------------------

--
-- Rakenne taululle `palvelu`
--

CREATE TABLE IF NOT EXISTS `palvelu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `kuvaus` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `hinta` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `palvelu`
--

INSERT INTO `palvelu` (`id`, `nimi`, `kuvaus`, `hinta`) VALUES
(1, 'Kahvi', '', 1),
(2, 'Pulla', '', 1),
(3, 'Voileipä', '', 2),
(4, 'Kakku', '', 20);

-- --------------------------------------------------------

--
-- Rakenne taululle `sivukuvat`
--

CREATE TABLE IF NOT EXISTS `sivukuvat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nimi` text COLLATE utf8_swedish_ci NOT NULL,
  `tyyppi` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Rakenne taululle `tila`
--

CREATE TABLE IF NOT EXISTS `tila` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tunnus` text COLLATE utf8_swedish_ci,
  `nimi` text COLLATE utf8_swedish_ci,
  `kuvaus` text COLLATE utf8_swedish_ci,
  `hinta` text COLLATE utf8_swedish_ci,
  `henkilomaara` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=16 ;

--
-- Vedos taulusta `tila`
--

INSERT INTO `tila` (`id`, `tunnus`, `nimi`, `kuvaus`, `hinta`, `henkilomaara`) VALUES
(1, 'Mikpolisali', 'Mikpolisali', '<p>Mikpoli-rakennus, Patteristonkatu 2, Mikkeli</p>\r\n\r\n<p>Mikpolisali on Kasarmin kampuksen digitaalinen esitysauditorio, jossa on 117 kiinte&auml;&auml; istumapaikkaa. Salissa on elokuvatasoiset kuva-, &auml;&auml;ni- ja tietoj&auml;rjestelm&auml;t.</p>\r\n\r\n<p><strong>Mikpolisalin varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>2 data/videoprojektoria</li>\r\n	<li>kiinte&auml; pc, mahdollisuus my&ouml;s ulkopuoliselle pc:lle</li>\r\n	<li>dokumenttikamera</li>\r\n	<li>digitv-viritin</li>\r\n	<li>dvd-soitin</li>\r\n	<li>langattomat ja langalliset mikrofonit</li>\r\n	<li>8 x 5 m valkokangas</li>\r\n	<li>videoneuvottelulaitteisto</li>\r\n	<li>3 tv-kameraa tilaisuuksien taltiointiin monikameratuotantona</li>\r\n	<li>2 piirtoheitint&auml;</li>\r\n	<li>piano</li>\r\n</ul>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa&nbsp;<a href="http://www.ravintolatalli.fi/">Ravintola Talli</a>, p. 0153 557 419</p>\r\n', NULL, 177),
(2, 'Kampussali A', 'Kampussali A', '<p>Patteristonkatu 3, A-rakennus, Mikkeli</p>\r\n\r\n<p><strong>Kampussali A:n varusteet</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>kiinte&auml; pc, mahdollisuus ulkopuoliselle pc:lle</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>langattomat ja langalliset mikrofonit</li>\r\n	<li>Blue-Ray -soitin</li>\r\n	<li>digiboxi</li>\r\n</ul>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Mikkelin Ammattikorkeakoulu Oy:n Kampuskahvitus, p. 040 842 0588.</p>\r\n', NULL, 269),
(3, 'Kampussali D', 'Kampussali D', '<p>Patteristonkatu 3, D-rakennus, Mikkeli</p>\r\n\r\n<p>Kampussali D on Kasarmin kampuksen intiimi auditorio pienemmille ryhmille. Salissa on 70 istumapaikkaa.</p>\r\n\r\n<p><strong>Kampussali D:n varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>kiinte&auml; pc, mahdollisuus ulkopuoliselle pc:lle</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>2 valkokangasta</li>\r\n	<li>piirtoheitin</li>\r\n	<li>liitutaulu</li>\r\n</ul>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Mikkelin Ammattikorkeakoulu Oy:n Kampuskahvitus, p. 040 842 0588.</p>\r\n', NULL, 70),
(4, '', 'Kokoustila Kuitula', '<p>Mikpoli-rakennus, 3. kerros, Patteristonkatu 2, Mikkeli</p>\r\n\r\n<p><strong>Kuitulan varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc, mahdollisuus ulkopuoliselle pc:lle</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>videoneuvottelulaitteisto</li>\r\n	<li>digitv-viritin</li>\r\n	<li>BluRay-soitin</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>piirtoheitin</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p><strong>Lis&auml;tiedustelut:</strong>&nbsp;myyntipalvelu@mamk.fi</p>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa&nbsp;<a href="http://www.ravintolatalli.fi/">Ravintola Tall</a>i, p. 0153 557 419 ja Kampuskahvitus p. 040 631 4550.</p>\r\n', NULL, 22),
(6, 'X124', 'Kokoustila X124', '<p>Patteristonkatu 3, X-rakennus, 1. krs., Mikkeli</p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>kiinte&auml; pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Ravintola DeXi<br />\r\np. 0153 556 090.</p>\r\n', '0', 14),
(7, 'D133', 'Kokoustila D133', '<p><span style="line-height:1.6">Patteristonkatu 3, D-rakennus, 1. krs., Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Ravintola DeXi&nbsp;<br />\r\np. 0153 556 090.</p>\r\n', NULL, 14),
(8, 'MB124', 'Kokoustila MB124', '<p><span style="line-height:1.6">Patteristonkatu 2, Mikpoli-rakennus, 1. krs. Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>videoneuvottelulaitteisto</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>piirtoheitin</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Kampuskahvitus<br />\r\np. 040 631 4550.</p>\r\n', NULL, 14),
(9, 'MB312', 'Kokoustila MB312', '<p><span style="line-height:1.6">Patteristonkatu 2, Mikpoli-rakennus, 3. krs, Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>mahdollisuus ulkopuoliselle pc:lle</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>valkotaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Kampuskahvitus&nbsp;<br />\r\np. 040 631 4550.</p>\r\n', NULL, 8),
(10, 'D132', 'Koulutustila D132', '<p><span style="line-height:1.6">Patteristonkatu 3, D-rak, 1. krs., Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>kiinte&auml; pc, mahdollisuus ulkopuoliselle pc:lle</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Ravintola DeXi,&nbsp;<br />\r\np. 0153 556 090.</p>\r\n', NULL, 30),
(11, 'NC153', 'Kokoustila NC153', '<p><span style="line-height:1.6">Prikaatinkatu 3, 1. krs, Tiilikasarmi C-osa, Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>tilassa ei pc:lt&auml;, oma kannettava tarvitaan</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Kampuskahvitus,&nbsp;<br />\r\np. 040 631 4550.</p>\r\n', NULL, 14),
(12, '', 'Ravintola Tallin Pilttuukabinetti', '<p><span style="line-height:1.6">Patteristonkatu 2, Mikkeli</span></p>\r\n\r\n<p>Ravintola Tallin 1. kerros</p>\r\n\r\n<p><strong>Pilttuukabinetin varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa&nbsp;<a href="http://www.ravintolatalli.fi/">Ravintola Talli</a>, p. 0153 557 419.</p>\r\n', NULL, 30),
(13, 'Tallin Vintti', 'Ravintola Tallin Vintti ', '<p><span style="line-height:1.6">Patteristonkatu 2, Mikkeli, Ravintola Tallin 2. krs.</span></p>\r\n\r\n<p><br />\r\n<strong>Tallin Vintin varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa<a href="http://www.ravintolatalli.fi/">&nbsp;Ravintola Talli</a>, p. 0153 557 419.</p>\r\n', NULL, 35),
(14, '', 'DeXi-stage', '<p><span style="line-height:1.6">Patteristonkatu 3, D-rakennus,&nbsp;</span><a href="http://www.dexi.fi/" style="line-height: 1.6;">Ravintola DeXi</a></p>\r\n\r\n<p>Ravintola DeXi on 150-paikkainen olohuonemainen kampuksen p&auml;&auml;kahvila, lounas- ja tapahtumaravintola. DeXin ravintolasalissa on my&ouml;s esiintymislava DeXi-stage. DeXi-stage taipuu kirjailijavierailuihin, konsertteihin, teatteriin, stand up -esityksiin ja erilaisiin teematapahtumiin.&nbsp;<br />\r\n<br />\r\n<strong>Varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>HD-dataprojektori</li>\r\n	<li>&auml;&auml;nentoisto</li>\r\n	<li>20 lavamikrofonia</li>\r\n	<li>4 monitoria</li>\r\n	<li>4 kiinte&auml;&auml; valotankoa</li>\r\n	<li>langaton kosketusn&auml;ytt&ouml;paneeli</li>\r\n	<li>kiinte&auml;t esitysverhot</li>\r\n	<li>siirrelt&auml;v&auml; mikrofoni- ja mikserivaunu</li>\r\n	<li>siirrelt&auml;v&auml; lavakoroke</li>\r\n</ul>\r\n\r\n<p>DeXi-stage on k&auml;ytett&auml;viss&auml; iltaisin klo 16 alkaen. Kokoustarjoulut katetaan Ravintola DeXiin.</p>\r\n', NULL, 120),
(15, 'NC153', 'Tiilikasarmin kokoustila', '<p><span style="line-height:1.6">Prikaatinkatu 3, 1. krs, Tiilikasarmi C-osa, Mikkeli</span></p>\r\n\r\n<table border="0" cellpadding="1" cellspacing="1" style="height:405px; width:650px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<h2>Kokousvarustus</h2>\r\n\r\n			<ul style="list-style-type:square">\r\n				<li>tilassa ei pc:t&auml;, oma kannettava tarvitaan</li>\r\n				<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n				<li>dataprojektori</li>\r\n				<li>heijastava sein&auml;</li>\r\n				<li>fl&auml;ppitaulu</li>\r\n			</ul>\r\n\r\n			<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Kampuskahvitus, p. 040 631 4550.</p>\r\n\r\n			<p><strong>Lis&auml;tiedustelut:</strong>&nbsp;myyntipalvelu@mamk.fi</p>\r\n\r\n			<h3>Kokoustarjoilut</h3>\r\n\r\n			<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa&nbsp;<a href="http://www.ravintolatalli.fi/">Ravintola Tall</a>i, p. 0153 557 419 ja Kampuskahvitus p. 040 631 4550.</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h2>Tiilikasarmin saunatilat (kokoustila ja sauna)</h2>\r\n\r\n			<p>Tiilikasarmin saunatilat on varattavissa arkisin ja lauantaisin klo 16 - 23.<br />\r\n			Hinta 40 &euro;/h. Max 20 hl&ouml;&auml;.</p>\r\n\r\n			<h3>Saunatilan vuokra sis&auml;lt&auml;&auml;:</h3>\r\n\r\n			<ul style="list-style-type:square">\r\n				<li>Tiilikasarmin kokoustilan k&auml;yt&ouml;n varusteineen</li>\r\n				<li>pefletit ja suihkushampoot</li>\r\n				<li>minikeitti&ouml;ss&auml; j&auml;&auml;kaappi omille juomille, tilassa ei anniskeluoikeuksia</li>\r\n			</ul>\r\n\r\n			<h3>Saunatarjoilut</h3>\r\n\r\n			<p>Voit tuoda itse saunatarjoilut tai tilata take away -tarjoiluna Ravintola Tallista, p. 0153 557 419.</p>\r\n\r\n			<p><strong>Lis&auml;tiedustelut ja varaukset:</strong>myyntipalvelu@mamk.fi ja p. 0153 556 303.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', NULL, 14);

-- --------------------------------------------------------

--
-- Rakenne taululle `tilakuvat`
--

CREATE TABLE IF NOT EXISTS `tilakuvat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nimi` text COLLATE utf8_swedish_ci NOT NULL,
  `tilaId` int(10) NOT NULL,
  `tyyppi` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tilaId` (`tilaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=3 ;

--
-- Vedos taulusta `tilakuvat`
--

INSERT INTO `tilakuvat` (`id`, `nimi`, `tilaId`, `tyyppi`) VALUES
(1, 'f34rnksndmf34', 1, 'esittely'),
(2, 'dasd32adsef4q', 1, 'esittely');

-- --------------------------------------------------------

--
-- Rakenne taululle `varauksenpalvelut`
--

CREATE TABLE IF NOT EXISTS `varauksenpalvelut` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `varausid` int(10) NOT NULL,
  `palveluid` int(10) NOT NULL,
  `maara` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `varausid` (`varausid`),
  KEY `palveluid` (`palveluid`),
  KEY `palveluid_2` (`palveluid`),
  KEY `varausid_2` (`varausid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Rakenne taululle `varauksentunnit`
--

CREATE TABLE IF NOT EXISTS `varauksentunnit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varausnumero` int(11) NOT NULL,
  `tilaid` int(10) NOT NULL,
  `asiakasid` int(10) NOT NULL,
  `pvm` text COLLATE utf8_swedish_ci NOT NULL,
  `kello` int(11) NOT NULL,
  `hinta` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `varausnumero` (`varausnumero`),
  KEY `asiakasid` (`asiakasid`),
  KEY `tilaid` (`tilaid`),
  KEY `kello` (`kello`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=19 ;

--
-- Vedos taulusta `varauksentunnit`
--

INSERT INTO `varauksentunnit` (`id`, `varausnumero`, `tilaid`, `asiakasid`, `pvm`, `kello`, `hinta`) VALUES
(1, 1, 1, 1, '1397293200000', 11, 100),
(3, 2, 1, 2, '1397293200000', 13, 100),
(4, 1, 1, 1, '1397293200000', 12, 100),
(5, 3, 1, 1, '1398243600000', 8, 100),
(6, 3, 1, 1, '1398243600000', 9, 100),
(7, 3, 1, 1, '1398243600000', 10, 100),
(8, 3, 1, 1, '1398243600000', 11, 100),
(9, 3, 1, 1, '1398243600000', 12, 100),
(10, 3, 1, 1, '1398243600000', 13, 100),
(11, 3, 1, 1, '1398243600000', 14, 100),
(12, 3, 1, 1, '1398243600000', 15, 100),
(13, 3, 1, 1, '1398243600000', 16, 120),
(14, 3, 1, 1, '1398243600000', 17, 120),
(15, 3, 1, 1, '1398243600000', 18, 120),
(16, 3, 1, 1, '1398243600000', 19, 120),
(17, 3, 1, 1, '1398243600000', 20, 120),
(18, 3, 1, 1, '1398243600000', 21, 120);

-- --------------------------------------------------------

--
-- Rakenne taululle `varaukset`
--

CREATE TABLE IF NOT EXISTS `varaukset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asiakasId` int(11) NOT NULL,
  `tilaId` int(11) NOT NULL,
  `varausaika` text COLLATE utf8_swedish_ci NOT NULL,
  `pvm` text COLLATE utf8_swedish_ci NOT NULL,
  `summa` double NOT NULL,
  `maksutapa` text COLLATE utf8_swedish_ci NOT NULL,
  `maksutilanne` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `asiakasId` (`asiakasId`),
  KEY `tilaId` (`tilaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=4 ;

--
-- Vedos taulusta `varaukset`
--

INSERT INTO `varaukset` (`id`, `asiakasId`, `tilaId`, `varausaika`, `pvm`, `summa`, `maksutapa`, `maksutilanne`) VALUES
(1, 1, 1, '1397293200000', '1397293200000', 200, 'Verkkomaksu', 1),
(2, 2, 1, '1397293200000', '1397293200000', 100, 'Lasku', 0),
(3, 1, 1, '1398243600000', '1398243600000', 1520, 'Verkkomaksu', 1);

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

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `hinnasto`
--
ALTER TABLE `hinnasto`
  ADD CONSTRAINT `hinnasto_ibfk_1` FOREIGN KEY (`tilaId`) REFERENCES `tila` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `tilakuvat`
--
ALTER TABLE `tilakuvat`
  ADD CONSTRAINT `tilakuvat_ibfk_1` FOREIGN KEY (`tilaId`) REFERENCES `tila` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `varauksenpalvelut`
--
ALTER TABLE `varauksenpalvelut`
  ADD CONSTRAINT `varauksenpalvelut_ibfk_1` FOREIGN KEY (`varausid`) REFERENCES `varaukset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `varauksenpalvelut_ibfk_2` FOREIGN KEY (`palveluid`) REFERENCES `palvelu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `varauksentunnit`
--
ALTER TABLE `varauksentunnit`
  ADD CONSTRAINT `varauksentunnit_ibfk_1` FOREIGN KEY (`varausnumero`) REFERENCES `varaukset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `varauksentunnit_ibfk_2` FOREIGN KEY (`asiakasid`) REFERENCES `kayttaja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `varauksentunnit_ibfk_3` FOREIGN KEY (`tilaid`) REFERENCES `tila` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `varauksentunnit_ibfk_4` FOREIGN KEY (`kello`) REFERENCES `hinnasto` (`tunti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `varaukset`
--
ALTER TABLE `varaukset`
  ADD CONSTRAINT `varaukset_ibfk_1` FOREIGN KEY (`asiakasId`) REFERENCES `kayttaja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `varaukset_ibfk_2` FOREIGN KEY (`tilaId`) REFERENCES `tila` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
