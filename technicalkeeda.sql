-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 28, 2020 at 05:44 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technicalkeeda`
--

-- --------------------------------------------------------

--
-- Table structure for table `nse_bhavcopy`
--

DROP TABLE IF EXISTS `nse_bhavcopy`;
CREATE TABLE IF NOT EXISTS `nse_bhavcopy` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `series` char(2) NOT NULL,
  `open` decimal(8,2) UNSIGNED NOT NULL,
  `high` decimal(8,2) UNSIGNED NOT NULL,
  `low` decimal(8,2) UNSIGNED NOT NULL,
  `close` decimal(8,2) UNSIGNED NOT NULL,
  `last` decimal(8,2) UNSIGNED NOT NULL,
  `prevclose` decimal(8,2) UNSIGNED NOT NULL,
  `tottrdqty` bigint(20) UNSIGNED NOT NULL,
  `tottrdval` bigint(20) UNSIGNED NOT NULL,
  `timestamp` date NOT NULL,
  `totaltrades` mediumint(8) UNSIGNED NOT NULL,
  `isin` char(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `symbol` (`symbol`),
  KEY `isin` (`isin`),
  KEY `series` (`series`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
