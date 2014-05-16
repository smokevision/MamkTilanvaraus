-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Palvelin: localhost
-- Luontiaika: 16.05.2014 klo 16:35
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=332 ;

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
(121, 1, 1, 22, 120),
(122, 2, 2, 8, 100),
(123, 2, 2, 9, 100),
(124, 2, 2, 10, 100),
(125, 2, 2, 11, 100),
(126, 2, 2, 12, 100),
(127, 2, 2, 13, 100),
(128, 2, 2, 14, 100),
(129, 2, 2, 15, 100),
(130, 2, 2, 16, 120),
(131, 2, 2, 17, 120),
(132, 2, 2, 18, 120),
(133, 2, 2, 19, 120),
(134, 2, 2, 20, 120),
(135, 2, 2, 21, 120),
(136, 2, 2, 22, 120),
(137, 2, 3, 8, 100),
(138, 2, 3, 9, 100),
(139, 2, 3, 10, 100),
(140, 2, 3, 11, 100),
(141, 2, 3, 12, 100),
(142, 2, 3, 13, 100),
(143, 2, 3, 14, 100),
(144, 2, 3, 15, 100),
(145, 2, 3, 16, 120),
(146, 2, 3, 17, 120),
(147, 2, 3, 18, 120),
(148, 2, 3, 19, 120),
(149, 2, 3, 20, 120),
(150, 2, 3, 21, 120),
(151, 2, 3, 22, 120),
(152, 2, 4, 8, 100),
(153, 2, 4, 9, 100),
(154, 2, 4, 10, 100),
(155, 2, 4, 11, 100),
(156, 2, 4, 12, 100),
(157, 2, 4, 13, 100),
(158, 2, 4, 14, 100),
(159, 2, 4, 15, 100),
(160, 2, 4, 16, 120),
(161, 2, 4, 17, 120),
(162, 2, 4, 18, 120),
(163, 2, 4, 19, 120),
(164, 2, 4, 20, 120),
(165, 2, 4, 21, 120),
(166, 2, 4, 22, 120),
(167, 2, 5, 8, 100),
(168, 2, 5, 9, 100),
(169, 2, 5, 10, 100),
(170, 2, 5, 11, 100),
(171, 2, 5, 12, 100),
(172, 2, 5, 13, 100),
(173, 2, 5, 14, 100),
(174, 2, 5, 15, 100),
(175, 2, 5, 16, 100),
(176, 2, 5, 17, 120),
(177, 2, 5, 18, 120),
(178, 2, 5, 19, 120),
(179, 2, 5, 20, 120),
(180, 2, 5, 21, 120),
(181, 2, 5, 22, 120),
(182, 2, 6, 8, 100),
(183, 2, 6, 9, 100),
(184, 2, 6, 10, 100),
(185, 2, 6, 11, 100),
(186, 2, 6, 12, 100),
(187, 2, 6, 13, 100),
(188, 2, 6, 14, 100),
(189, 2, 6, 15, 100),
(190, 2, 6, 16, 100),
(191, 2, 6, 17, 120),
(192, 2, 6, 18, 120),
(193, 2, 6, 19, 120),
(194, 2, 6, 20, 120),
(195, 2, 6, 21, 120),
(196, 2, 6, 22, 120),
(197, 2, 7, 8, 120),
(198, 2, 7, 9, 120),
(199, 2, 7, 10, 120),
(200, 2, 7, 11, 120),
(201, 2, 7, 12, 120),
(202, 2, 7, 13, 120),
(203, 2, 7, 14, 120),
(204, 2, 7, 15, 120),
(205, 2, 7, 16, 120),
(206, 2, 7, 17, 120),
(207, 2, 7, 18, 120),
(208, 2, 7, 19, 120),
(209, 2, 7, 20, 120),
(210, 2, 7, 21, 120),
(211, 2, 7, 22, 120),
(212, 2, 1, 8, 120),
(213, 2, 1, 9, 120),
(214, 2, 1, 10, 120),
(215, 2, 1, 11, 120),
(216, 2, 1, 12, 120),
(217, 2, 1, 13, 120),
(218, 2, 1, 14, 120),
(219, 2, 1, 15, 120),
(220, 2, 1, 16, 120),
(221, 2, 1, 17, 120),
(222, 2, 1, 18, 120),
(223, 2, 1, 19, 120),
(224, 2, 1, 20, 120),
(225, 2, 1, 21, 120),
(226, 2, 1, 22, 120),
(227, 3, 2, 8, 100),
(228, 3, 2, 9, 100),
(229, 3, 2, 10, 100),
(230, 3, 2, 11, 100),
(231, 3, 2, 12, 100),
(232, 3, 2, 13, 100),
(233, 3, 2, 14, 100),
(234, 3, 2, 15, 100),
(235, 3, 2, 16, 120),
(236, 3, 2, 17, 120),
(237, 3, 2, 18, 120),
(238, 3, 2, 19, 120),
(239, 3, 2, 20, 120),
(240, 3, 2, 21, 120),
(241, 3, 2, 22, 120),
(242, 3, 3, 8, 100),
(243, 3, 3, 9, 100),
(244, 3, 3, 10, 100),
(245, 3, 3, 11, 100),
(246, 3, 3, 12, 100),
(247, 3, 3, 13, 100),
(248, 3, 3, 14, 100),
(249, 3, 3, 15, 100),
(250, 3, 3, 16, 120),
(251, 3, 3, 17, 120),
(252, 3, 3, 18, 120),
(253, 3, 3, 19, 120),
(254, 3, 3, 20, 120),
(255, 3, 3, 21, 120),
(256, 3, 3, 22, 120),
(257, 3, 4, 8, 100),
(258, 3, 4, 9, 100),
(259, 3, 4, 10, 100),
(260, 3, 4, 11, 100),
(261, 3, 4, 12, 100),
(262, 3, 4, 13, 100),
(263, 3, 4, 14, 100),
(264, 3, 4, 15, 100),
(265, 3, 4, 16, 120),
(266, 3, 4, 17, 120),
(267, 3, 4, 18, 120),
(268, 3, 4, 19, 120),
(269, 3, 4, 20, 120),
(270, 3, 4, 21, 120),
(271, 3, 4, 22, 120),
(272, 3, 5, 8, 100),
(273, 3, 5, 9, 100),
(274, 3, 5, 10, 100),
(275, 3, 5, 11, 100),
(276, 3, 5, 12, 100),
(277, 3, 5, 13, 100),
(278, 3, 5, 14, 100),
(279, 3, 5, 15, 100),
(280, 3, 5, 16, 100),
(281, 3, 5, 17, 120),
(282, 3, 5, 18, 120),
(283, 3, 5, 19, 120),
(284, 3, 5, 20, 120),
(285, 3, 5, 21, 120),
(286, 3, 5, 22, 120),
(287, 3, 6, 8, 100),
(288, 3, 6, 9, 100),
(289, 3, 6, 10, 100),
(290, 3, 6, 11, 100),
(291, 3, 6, 12, 100),
(292, 3, 6, 13, 100),
(293, 3, 6, 14, 100),
(294, 3, 6, 15, 100),
(295, 3, 6, 16, 100),
(296, 3, 6, 17, 120),
(297, 3, 6, 18, 120),
(298, 3, 6, 19, 120),
(299, 3, 6, 20, 120),
(300, 3, 6, 21, 120),
(301, 3, 6, 22, 120),
(302, 3, 7, 8, 120),
(303, 3, 7, 9, 120),
(304, 3, 7, 10, 120),
(305, 3, 7, 11, 120),
(306, 3, 7, 12, 120),
(307, 3, 7, 13, 120),
(308, 3, 7, 14, 120),
(309, 3, 7, 15, 120),
(310, 3, 7, 16, 120),
(311, 3, 7, 17, 120),
(312, 3, 7, 18, 120),
(313, 3, 7, 19, 120),
(314, 3, 7, 20, 120),
(315, 3, 7, 21, 120),
(316, 3, 7, 22, 120),
(317, 3, 1, 8, 120),
(318, 3, 1, 9, 120),
(319, 3, 1, 10, 120),
(320, 3, 1, 11, 120),
(321, 3, 1, 12, 120),
(322, 3, 1, 13, 120),
(323, 3, 1, 14, 120),
(324, 3, 1, 15, 120),
(325, 3, 1, 16, 120),
(326, 3, 1, 17, 120),
(327, 3, 1, 18, 120),
(328, 3, 1, 19, 120),
(329, 3, 1, 20, 120),
(330, 3, 1, 21, 120),
(331, 3, 1, 22, 120);

-- --------------------------------------------------------

--
-- Rakenne taululle `kayttaja`
--

CREATE TABLE IF NOT EXISTS `kayttaja` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `etunimi` text COLLATE utf8_swedish_ci NOT NULL,
  `sukunimi` text COLLATE utf8_swedish_ci NOT NULL,
  `katuosoite` text COLLATE utf8_swedish_ci NOT NULL,
  `postinumero` text COLLATE utf8_swedish_ci NOT NULL,
  `postitoimipaikka` text COLLATE utf8_swedish_ci NOT NULL,
  `email` text COLLATE utf8_swedish_ci NOT NULL,
  `puh` text COLLATE utf8_swedish_ci NOT NULL,
  `yritys` text COLLATE utf8_swedish_ci NOT NULL,
  `ytunnus` text COLLATE utf8_swedish_ci NOT NULL,
  `salasana` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `kayttaja`
--

INSERT INTO `kayttaja` (`id`, `etunimi`, `sukunimi`, `katuosoite`, `postinumero`, `postitoimipaikka`, `email`, `puh`, `yritys`, `ytunnus`, `salasana`) VALUES
(1, 'Matti', 'Meikäläinen', 'Kotikatu 3', '50100', 'Mikkeli', 'matti.meikalainen@mail.com', '0404856073', '', '', '5c54fe614285a0e57ecb54c05c016108'),
(2, 'Kalle', 'Virtanen', 'Olkikuja 45 A3', '50100', 'Mikkeli', 'kvirtanen@mail.com', '0506862342', '', '', '5c54fe614285a0e57ecb54c05c016108'),
(3, 'Ville', 'Lindsberg', 'Olkkolankatu 13-15 A13', '50100', 'Mikkeli', 'ville.lindsberg@windowslive.com', '0405871072', '', '', 'dad011a757b45e147dd26518d92a9336'),
(4, 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön', 'rekisteröimätön');

-- --------------------------------------------------------

--
-- Rakenne taululle `palvelu`
--

CREATE TABLE IF NOT EXISTS `palvelu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tunnus` text COLLATE utf8_swedish_ci NOT NULL,
  `nimi` text COLLATE utf8_swedish_ci NOT NULL,
  `kuvaus` text COLLATE utf8_swedish_ci,
  `hinta` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `palvelu`
--

INSERT INTO `palvelu` (`id`, `tunnus`, `nimi`, `kuvaus`, `hinta`) VALUES
(1, 'kahvi', 'Kahvi', '', 1),
(2, 'pulla', 'Pulla', '', 1),
(3, 'voileipa', 'Voileipä', '', 2),
(4, 'kakku', 'Kakku', '', 20);

-- --------------------------------------------------------

--
-- Rakenne taululle `sivukuvat`
--

CREATE TABLE IF NOT EXISTS `sivukuvat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nimi` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=4 ;

--
-- Vedos taulusta `sivukuvat`
--

INSERT INTO `sivukuvat` (`id`, `nimi`) VALUES
(3, 'ZwKtR1irD9RnkUz');

-- --------------------------------------------------------

--
-- Rakenne taululle `sivut`
--

CREATE TABLE IF NOT EXISTS `sivut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nimi` text COLLATE utf8_swedish_ci NOT NULL,
  `sisalto` text COLLATE utf8_swedish_ci NOT NULL,
  `paivitetty` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `sivut`
--

INSERT INTO `sivut` (`id`, `nimi`, `sisalto`, `paivitetty`) VALUES
(1, 'etusivu', '<h1>Hyviä kokoushetkiä Kasarmin kampuksella</h1>\n\n<p>Tervetuloa Mikkelin ammattikorkeakoulun tilanvarausjärjestelmään. Kasarmin kampuksella on nykyaikaiset ja monipuoliset tilat tapahtumajärjestäjien käyttöön. Kampuksen keskeinen ja puistomaisen rauhallinen sijainti tarjoaa ihanteellisen ympäristön niin pienille kuin suurillekin ryhmille, jopa 300 hengelle. Viihtyisät tilat ja onnistunut tarjoilu luovat mukavia muistoja. Kasarmin kampukselle on Mikkelin keskustasta vaivatonta saapua, autolla vain muutama minuutti ja kävellenkin 10-15 minuuttia.</p>\n\n<h1>Ravintolapalvelut</h1>\n\n<p>Ravintola Talli, Ravintola DeXi ja Ravintola Kasarmina tuottavat kaikki kokous- ja ravintolapalvelut ammattitaidolla ja kokemuksella Kasarmin kampusalueella. Tunnusmerkkejä ovat tilaisuuksien räätälöity toteutus, muuntautuvat ravintolatilat eri puolilla kampusaluetta, joustava palveluasenne ja lähiruoka-ajattelu. Valmiudet riittävät vaivatta niin pienten kokousten kuin suurten tapahtumien tyylikkääseen toteuttamiseen.</p>', '1397648629000'),
(2, 'ehdot', '<h1>Varausehdot<h1>', '1397648629000'),
(4, 'yhteys', '<h2>Yhteystiedot</h2>\r\n\r\n<p>\r\n<b>Johanna Räsänen</b><br/>\r\npuh. 0153 556 303<br/>\r\nsähköposti: myyntipalvelu(at)mamk.fi\r\n</p>\r\n<p>\r\n<b>Kampuskahvitus</b><br/>\r\npuh. 040 8420 588<br/>\r\nsähköposti: kahvitus(at)mamk.fi\r\n</p>\r\n<p>\r\n<b>Ravintola Talli</b><br/>\r\nPatteristonkatu 2<br/>\r\n50100 Mikkeli<br/>\r\npuh. 0153 557 419<br/>\r\nsähköposti: ravintolatalli(at)mamk.fi<br/>\r\nwww.ravintolatalli.fi\r\n</p>\r\n<p>\r\n<b>Ravintola DeXi</b><br/>\r\nPatteristonkatu 3<br/>\r\n50100 Mikkeli<br/>\r\npuh. 0153 556 090<br/>\r\nsähköposti: dexi(at)mamk.fi<br/>\r\nwww.dexi.fi\r\n</p>', '1397648629000');

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
(6, 'X124', 'Kokoustila X124', '<p>Patteristonkatu 3, X-rakennus, 1. krs., Mikkeli</p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>kiinte&auml; pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Ravintola DeXi<br />\r\np. 0153 556 090.</p>\r\n', NULL, 14),
(7, 'D133', 'Kokoustila D133', '<p><span style="line-height:1.6">Patteristonkatu 3, D-rakennus, 1. krs., Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Ravintola DeXi&nbsp;<br />\r\np. 0153 556 090.</p>\r\n', NULL, 14),
(8, 'MB124', 'Kokoustila MB124', '<p><span style="line-height:1.6">Patteristonkatu 2, Mikpoli-rakennus, 1. krs. Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>videoneuvottelulaitteisto</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>piirtoheitin</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoiluja hoitaa Kampuskahvitus<br />\r\np. 040 631 4550.</p>\r\n', NULL, 14),
(9, 'MB312', 'Kokoustila MB312', '<p><span style="line-height:1.6">Patteristonkatu 2, Mikpoli-rakennus, 3. krs, Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>mahdollisuus ulkopuoliselle pc:lle</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>valkotaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Kampuskahvitus&nbsp;<br />\r\np. 040 631 4550.</p>\r\n', NULL, 8),
(10, 'D132', 'Koulutustila D132', '<p><span style="line-height:1.6">Patteristonkatu 3, D-rak, 1. krs., Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>kiinte&auml; pc, mahdollisuus ulkopuoliselle pc:lle</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Ravintola DeXi,&nbsp;<br />\r\np. 0153 556 090.</p>\r\n', NULL, 30),
(11, 'NC153', 'Kokoustila NC153', '<p><span style="line-height:1.6">Prikaatinkatu 3, 1. krs, Tiilikasarmi C-osa, Mikkeli</span></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>tilassa ei pc:lt&auml;, oma kannettava tarvitaan</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>heijastava sein&auml;</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Kampuskahvitus,&nbsp;<br />\r\np. 040 631 4550.</p>\r\n', NULL, 14),
(12, '', 'Ravintola Tallin Pilttuukabinetti', '<p>Patteristonkatu 2, Mikkeli</p>\r\n\r\n<p>Ravintola Tallin 1. kerros</p>\r\n\r\n<p><strong>Pilttuukabinetin varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa&nbsp;<a href="http://www.ravintolatalli.fi/">Ravintola Talli</a>, p. 0153 557 419.</p>\r\n', NULL, 30),
(13, 'Tallin Vintti', 'Ravintola Tallin Vintti ', '<p><span style="line-height:1.6">Patteristonkatu 2, Mikkeli, Ravintola Tallin 2. krs.</span></p>\r\n\r\n<p><br />\r\n<strong>Tallin Vintin varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>pc</li>\r\n	<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n	<li>dataprojektori</li>\r\n	<li>valkokangas</li>\r\n	<li>fl&auml;ppitaulu</li>\r\n</ul>\r\n\r\n<p><strong>Kokoustarjoilut</strong></p>\r\n\r\n<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa<a href="http://www.ravintolatalli.fi/">&nbsp;Ravintola Talli</a>, p. 0153 557 419.</p>\r\n', NULL, 35),
(14, '', 'DeXi-stage', '<p><span style="line-height:1.6">Patteristonkatu 3, D-rakennus,&nbsp;</span><a href="http://www.dexi.fi/" style="line-height: 1.6;">Ravintola DeXi</a></p>\r\n\r\n<p>Ravintola DeXi on 150-paikkainen olohuonemainen kampuksen p&auml;&auml;kahvila, lounas- ja tapahtumaravintola. DeXin ravintolasalissa on my&ouml;s esiintymislava DeXi-stage. DeXi-stage taipuu kirjailijavierailuihin, konsertteihin, teatteriin, stand up -esityksiin ja erilaisiin teematapahtumiin.&nbsp;<br />\r\n<br />\r\n<strong>Varustus</strong></p>\r\n\r\n<ul style="list-style-type:square">\r\n	<li>HD-dataprojektori</li>\r\n	<li>&auml;&auml;nentoisto</li>\r\n	<li>20 lavamikrofonia</li>\r\n	<li>4 monitoria</li>\r\n	<li>4 kiinte&auml;&auml; valotankoa</li>\r\n	<li>langaton kosketusn&auml;ytt&ouml;paneeli</li>\r\n	<li>kiinte&auml;t esitysverhot</li>\r\n	<li>siirrelt&auml;v&auml; mikrofoni- ja mikserivaunu</li>\r\n	<li>siirrelt&auml;v&auml; lavakoroke</li>\r\n</ul>\r\n\r\n<p>DeXi-stage on k&auml;ytett&auml;viss&auml; iltaisin klo 16 alkaen. Kokoustarjoulut katetaan Ravintola DeXiin.</p>\r\n', NULL, 120),
(15, 'NC153', 'Tiilikasarmin kokoustila', '<p>Prikaatinkatu 3, 1. krs, Tiilikasarmi C-osa, Mikkeli</p>\r\n\r\n<table border="0" cellpadding="1" cellspacing="1" style="height:405px; width:650px">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<h2>Kokousvarustus</h2>\r\n\r\n			<ul style="list-style-type:square">\r\n				<li>tilassa ei pc:t&auml;, oma kannettava tarvitaan</li>\r\n				<li>internetyhteys (kiinte&auml; + WLAN)</li>\r\n				<li>dataprojektori</li>\r\n				<li>heijastava sein&auml;</li>\r\n				<li>fl&auml;ppitaulu</li>\r\n			</ul>\r\n\r\n			<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa Kampuskahvitus, p. 040 631 4550.</p>\r\n\r\n			<p><strong>Lis&auml;tiedustelut:</strong>&nbsp;myyntipalvelu@mamk.fi</p>\r\n\r\n			<h3>Kokoustarjoilut</h3>\r\n\r\n			<p>T&auml;m&auml;n tilan kokoustarjoilut hoitaa&nbsp;<a href="http://www.ravintolatalli.fi/">Ravintola Tall</a>i, p. 0153 557 419 ja Kampuskahvitus p. 040 631 4550.</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h2>Tiilikasarmin saunatilat (kokoustila ja sauna)</h2>\r\n\r\n			<p>Tiilikasarmin saunatilat on varattavissa arkisin ja lauantaisin klo 16 - 23.<br />\r\n			Hinta 40 &euro;/h. Max 20 hl&ouml;&auml;.</p>\r\n\r\n			<h3>Saunatilan vuokra sis&auml;lt&auml;&auml;:</h3>\r\n\r\n			<ul style="list-style-type:square">\r\n				<li>Tiilikasarmin kokoustilan k&auml;yt&ouml;n varusteineen</li>\r\n				<li>pefletit ja suihkushampoot</li>\r\n				<li>minikeitti&ouml;ss&auml; j&auml;&auml;kaappi omille juomille, tilassa ei anniskeluoikeuksia</li>\r\n			</ul>\r\n\r\n			<h3>Saunatarjoilut</h3>\r\n\r\n			<p>Voit tuoda itse saunatarjoilut tai tilata take away -tarjoiluna Ravintola Tallista, p. 0153 557 419.</p>\r\n\r\n			<p><strong>Lis&auml;tiedustelut ja varaukset:</strong>myyntipalvelu@mamk.fi ja p. 0153 556 303.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', NULL, 14);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=15 ;

--
-- Vedos taulusta `tilakuvat`
--

INSERT INTO `tilakuvat` (`id`, `nimi`, `tilaId`, `tyyppi`) VALUES
(1, 'J4pquylkaebPHiT', 1, 'esittely'),
(2, 'QLs9zxVbxgcnitD', 1, 'esittely'),
(5, 'uSYo1BmSnt562GH', 1, 'banneri'),
(6, 'max0fBYZlEHjjLw', 9, 'esittely'),
(7, '1DdTf5A2wzOADku', 9, 'banneri'),
(8, 'vmWzRh4VBNA26qy', 4, 'esittely'),
(9, '5BsQFwuqTTnBx9N', 4, 'esittely'),
(10, 'KS2bhslXGsVluUH', 4, 'esittely'),
(11, 'G9NENd7mqXJbL2g', 4, 'banneri'),
(12, 'Z6ryEQXwydWATya', 8, 'banneri'),
(13, 'aMM8EjfzfHsIYkH', 8, 'esittely'),
(14, 'VfwsiUcOv5yirAj', 8, 'esittely');

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
  `pvm` text COLLATE utf8_swedish_ci NOT NULL,
  `kello` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `varausnumero` (`varausnumero`),
  KEY `tilaid` (`tilaid`),
  KEY `kello` (`kello`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=84 ;

--
-- Vedos taulusta `varauksentunnit`
--

INSERT INTO `varauksentunnit` (`id`, `varausnumero`, `tilaid`, `pvm`, `kello`) VALUES
(1, 1, 1, '1397293200000', 11),
(3, 2, 1, '1397293200000', 13),
(4, 1, 1, '1397293200000', 12),
(5, 3, 1, '1398243600000', 8),
(6, 3, 1, '1398243600000', 9),
(7, 3, 1, '1398243600000', 10),
(8, 3, 1, '1398243600000', 11),
(9, 3, 1, '1398243600000', 12),
(10, 3, 1, '1398243600000', 13),
(11, 3, 1, '1398243600000', 14),
(12, 3, 1, '1398243600000', 15),
(13, 3, 1, '1398243600000', 16),
(14, 3, 1, '1398243600000', 17),
(15, 3, 1, '1398243600000', 18),
(16, 3, 1, '1398243600000', 19),
(17, 3, 1, '1398243600000', 20),
(18, 3, 1, '1398243600000', 21),
(20, 8, 1, '1398848400000', 8),
(21, 8, 1, '1398848400000', 9),
(22, 8, 1, '1398848400000', 10),
(23, 8, 1, '1398848400000', 11),
(24, 8, 1, '1398848400000', 12),
(25, 8, 1, '1398848400000', 13),
(26, 9, 1, '1398848400000', 14),
(27, 9, 1, '1398848400000', 15),
(28, 10, 1, '1398934800000', 8),
(29, 10, 1, '1398934800000', 9),
(30, 10, 1, '1398934800000', 10),
(31, 10, 1, '1398934800000', 11),
(32, 10, 1, '1398934800000', 12),
(33, 10, 1, '1398934800000', 13),
(34, 10, 1, '1398934800000', 14),
(35, 10, 1, '1398934800000', 15),
(36, 10, 1, '1398934800000', 16),
(37, 10, 1, '1398934800000', 17),
(38, 10, 1, '1398934800000', 18),
(39, 11, 3, '1399194000000', 8),
(40, 11, 3, '1399194000000', 9),
(41, 11, 3, '1399194000000', 10),
(42, 11, 3, '1399194000000', 11),
(43, 11, 3, '1399194000000', 12),
(44, 11, 3, '1399194000000', 13),
(45, 11, 3, '1399194000000', 14),
(46, 11, 3, '1399194000000', 15),
(47, 11, 3, '1399194000000', 16),
(48, 11, 3, '1399194000000', 17),
(49, 11, 3, '1399194000000', 18),
(50, 11, 3, '1399194000000', 19),
(51, 11, 3, '1399194000000', 20),
(52, 11, 3, '1399194000000', 21),
(53, 12, 1, '1400749200000', 8),
(54, 12, 1, '1400749200000', 9),
(55, 12, 1, '1400749200000', 10),
(56, 12, 1, '1400749200000', 11),
(57, 12, 1, '1400749200000', 12),
(58, 12, 1, '1400749200000', 13),
(59, 13, 1, '1401008400000', 8),
(60, 13, 1, '1401008400000', 9),
(61, 13, 1, '1401008400000', 10),
(62, 13, 1, '1401008400000', 11),
(63, 13, 1, '1401008400000', 12),
(64, 13, 1, '1401008400000', 13),
(65, 13, 1, '1401008400000', 14),
(66, 13, 1, '1401008400000', 15),
(67, 13, 1, '1401008400000', 16),
(68, 13, 1, '1401008400000', 17),
(69, 13, 1, '1401008400000', 18),
(70, 13, 1, '1401008400000', 19),
(71, 13, 1, '1401008400000', 20),
(72, 13, 1, '1401008400000', 21),
(73, 14, 1, '1401526800000', 8),
(74, 14, 1, '1401526800000', 9),
(75, 14, 1, '1401526800000', 10),
(76, 14, 1, '1401526800000', 11),
(77, 14, 1, '1401526800000', 12),
(78, 14, 1, '1401526800000', 13),
(79, 14, 1, '1401526800000', 14),
(80, 15, 1, '1401526800000', 15),
(81, 15, 1, '1401526800000', 16),
(82, 15, 1, '1401526800000', 17),
(83, 15, 1, '1401526800000', 18);

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
  `etunimi` text COLLATE utf8_swedish_ci NOT NULL,
  `sukunimi` text COLLATE utf8_swedish_ci NOT NULL,
  `katuosoite` text COLLATE utf8_swedish_ci NOT NULL,
  `postinumero` text COLLATE utf8_swedish_ci NOT NULL,
  `postitoimipaikka` text COLLATE utf8_swedish_ci NOT NULL,
  `email` text COLLATE utf8_swedish_ci NOT NULL,
  `puh` text COLLATE utf8_swedish_ci NOT NULL,
  `yritys` text COLLATE utf8_swedish_ci NOT NULL,
  `ytunnus` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `asiakasId` (`asiakasId`),
  KEY `tilaId` (`tilaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=16 ;

--
-- Vedos taulusta `varaukset`
--

INSERT INTO `varaukset` (`id`, `asiakasId`, `tilaId`, `varausaika`, `pvm`, `summa`, `maksutapa`, `maksutilanne`, `etunimi`, `sukunimi`, `katuosoite`, `postinumero`, `postitoimipaikka`, `email`, `puh`, `yritys`, `ytunnus`) VALUES
(1, 1, 1, '1397293200000', '1397293200000', 200, 'Verkkomaksu', 1, 'Matti', 'Meikäläinen', 'Kotikatu 3', '50100', 'Mikkeli', 'matti.meikalainen@mail.com', '0404856073', '', ''),
(2, 2, 1, '1397293200000', '1397293200000', 100, 'Lasku', 0, 'Kalle', 'Virtanen', 'Olkikuja 45 A3', '50100', 'Mikkeli', 'kvirtanen@gmail.com', '0506862342', '', ''),
(3, 1, 1, '1398243600000', '1398243600000', 1520, 'Verkkomaksu', 1, 'Matti', 'Meikäläinen', 'Kotikatu 3', '50100', 'Mikkeli', 'matti.meikalainen@mail.com', '0404856073', '', ''),
(8, 2, 1, '1398356079489', '1398848400000', 600, 'Verkkomaksu', 1, 'Kalle', 'Virtanen', 'Olkikuja 45 A3', '50100', 'Mikkeli', 'kvirtanen@gmail.com', '0506862342', '', ''),
(9, 2, 1, '1398692691388', '1398848400000', 200, 'Lasku', 1, 'Kalle', 'Virtanen', 'Olkikuja 45 A3', '50100', 'Mikkeli', 'kvirtanen@gmail.com', '0506862342', '', ''),
(10, 3, 1, '1398789656610', '1398934800000', 1160, 'Lasku', 0, 'Ville', 'Lindsberg', 'Olkkolankatu 13-15 A13', '50100', 'Mikkeli', 'ville.lindsberg@windowslive.com', '0405871072', '', ''),
(11, 3, 3, '1398791391516', '1399194000000', 1680, 'Verkkomaksu', 1, 'Ville', 'Lindsberg', 'Olkkolankatu 13-15 A13', '50100', 'Mikkeli', 'ville.lindsberg@windowslive.com', '0405871072', '', ''),
(12, 2, 1, '1399572360441', '1400749200000', 600, 'Verkkomaksu', 1, 'Kalle', 'Virtanen', 'Olkikuja 45 A3', '50100', 'Mikkeli', 'kvirtanen@gmail.com', '0506862342', '', ''),
(13, 2, 1, '1399572377037', '1401008400000', 1680, 'Verkkomaksu', 1, 'Kalle', 'Virtanen', 'Olkikuja 45 A3', '50100', 'Mikkeli', 'kvirtanen@gmail.com', '0506862342', '', ''),
(14, 4, 1, '1399740024392', '1401526800000', 700, 'Lasku', 0, 'Kalle', 'Koikkala', 'Jokikuja 2', '50100', 'Mikkeli', 'kalle.koikkale@mail.com', '0405486723', '', ''),
(15, 4, 1, '1399741781339', '1401526800000', 440, 'Verkkomaksu', 1, 'Pentti', 'Kallio', 'Kotikatu 31', '52700', 'Mäntyharju', 'pkallio@mail.com', '05069823424', '', '');

-- --------------------------------------------------------

--
-- Rakenne taululle `yllapito`
--

CREATE TABLE IF NOT EXISTS `yllapito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tunnus` text COLLATE utf8_swedish_ci NOT NULL,
  `salasana` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=2 ;

--
-- Vedos taulusta `yllapito`
--

INSERT INTO `yllapito` (`id`, `tunnus`, `salasana`) VALUES
(1, 'admin', '023efff6da238fb3b97281cf03b32729');

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
