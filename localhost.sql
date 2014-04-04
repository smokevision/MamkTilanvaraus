-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Palvelin: localhost
-- Luontiaika: 04.04.2014 klo 07:20
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
  `sukunimi` text COLLATE utf8_swedish_ci NOT NULL,
  `email` text COLLATE utf8_swedish_ci NOT NULL,
  `puh` text COLLATE utf8_swedish_ci NOT NULL,
  `yritys` text COLLATE utf8_swedish_ci,
  `salasana` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=3 ;

--
-- Vedos taulusta `kayttaja`
--

INSERT INTO `kayttaja` (`id`, `etunimi`, `sukunimi`, `email`, `puh`, `yritys`, `salasana`) VALUES
(1, 'Matti', 'Meikäläinen', 'matti.meikalainen@mail.com', '0404856073', '', '023efff6da238fb3b97281cf03b32729'),
(2, 'Kalle', 'Virtanen', 'kvirtanen@gmail.com', '0506862342', '', '5c54fe614285a0e57ecb54c05c016108');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=18 ;

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
