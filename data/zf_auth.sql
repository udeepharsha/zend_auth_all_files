-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2016 at 04:10 AM
-- Server version: 5.7.9
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zf_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usr_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usr_email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `usrl_id` int(11) DEFAULT NULL,
  `lng_id` int(11) DEFAULT NULL,
  `usr_active` tinyint(1) NOT NULL,
  `usr_question` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_answer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_password_salt` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'dynamicSalt',
  `usr_registration_date` datetime DEFAULT NULL COMMENT 'Registration moment',
  `usr_registration_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unique id sent by e-mail',
  `usr_email_confirmed` tinyint(1) NOT NULL COMMENT 'e-mail confirmed by user',
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_password`, `usr_email`, `usrl_id`, `lng_id`, `usr_active`, `usr_question`, `usr_answer`, `usr_picture`, `usr_password_salt`, `usr_registration_date`, `usr_registration_token`, `usr_email_confirmed`) VALUES
(1, 'admin3', '9ebb1c3c0c2450a304a39580a369e41c', 'admin@gmail.com', 1, 1, 1, 'asa', 'rtr', 'asa', '1', '2016-08-10 00:00:00', 'rt', 1),
(2, 'udeepharsha', '9ebb1c3c0c2450a304a39580a369e41c', 'udeephara@gmail.com', 2, 1, 1, 'asa', 'rtr', 'asa', '1', '2016-08-10 00:00:00', 'rt', 1),
(6, 'udeep2', '9ebb1c3c0c2450a304a39580a369e41c', 'udeepharawe@gmail.com', 6, 1, 1, NULL, NULL, NULL, '1', '2016-08-14 22:01:32', '481a178ffad1355c55a04d5c4a14c533', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
