-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 14, 2018 at 12:59 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freelance`
--

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
CREATE TABLE IF NOT EXISTS `bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `proposal` text NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`id`, `job_id`, `user_id`, `price`, `deadline`, `proposal`, `accepted`, `closed`, `created`) VALUES
(1, 9, 13, 44.00, '', 'Hi.\r\n\r\nI can make this for you. \r\n\r\nBest regards,\r\nBoris', 1, 1, NULL),
(2, 5, 13, 49.00, '', 'I have TW12...\r\n\r\nBr,\r\nBoris', 0, 0, '2017-11-24 12:49:53'),
(3, 9, 14, 66.00, '', 'Hi.\r\n\r\nI can make this for you!\r\n\r\nBoris', 0, 0, '2018-02-08 07:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `bid2`
--

DROP TABLE IF EXISTS `bid2`;
CREATE TABLE IF NOT EXISTS `bid2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `proposal` text NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid2`
--

INSERT INTO `bid2` (`id`, `job_id`, `user_id`, `price`, `deadline`, `proposal`, `accepted`, `closed`, `created`) VALUES
(1, 9, 13, 44, '', 'Hi.\r\n\r\nI can make this for you. \r\n\r\nBest regards,\r\nBoris', 1, 1, NULL),
(2, 5, 13, 49, '', 'I have TW12...\r\n\r\nBr,\r\nBoris', 0, 0, '2017-11-24 12:49:53'),
(3, 9, 14, 66, '', 'Hi.\r\n\r\nI can make this for you!\r\n\r\nBoris', 0, 0, '2018-02-08 07:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Web Development'),
(2, 'Web Design');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_id` int(11) NOT NULL,
  `client_rate` tinyint(1) DEFAULT NULL COMMENT 'Rate for client posted by contractor',
  `client_feedback` text COMMENT 'Feedback for client posted by contractor',
  `contractor_rate` tinyint(1) DEFAULT NULL COMMENT 'Rate for contractor posted by client',
  `contractor_feedback` text COMMENT 'Feedback for contractor posted by client',
  PRIMARY KEY (`id`),
  KEY `bid_id` (`bid_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `bid_id`, `client_rate`, `client_feedback`, `contractor_rate`, `contractor_feedback`) VALUES
(1, 1, 5, 'Great client - highly recommended.', 3, 'Awesome dev, highly recommended.');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `budget` double(10,2) DEFAULT NULL,
  `type` enum('fixed','hourly') NOT NULL DEFAULT 'fixed',
  `expertize_level` enum('beginner','intermediate','expert') DEFAULT 'beginner',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `title`, `description`, `budget`, `type`, `expertize_level`, `created`, `category_id`, `author_id`) VALUES
(1, 'Need an experienced Java Spring developer', 'Looking for experienced developers in projects with Java backend, Java/GWT, Javascript for on-going project. \r\n\r\n<br><br>\r\n\r\nExperienced with Atlassian tools: Jira, Bitbucket, Bamboo, Git Spanish knowledge will be valued', 40.00, 'hourly', 'intermediate', '2017-07-04 12:47:00', 1, 1),
(2, 'Software using Java, Spring, MongoDB, Javascript and AngularJS', 'Experience in all these technologies is a must:<br><br> Java, Spring, MongoDB, Javascript and AngularJS. Experience with SB Admin template is a plus.', 5000.00, 'fixed', 'expert', '2017-07-04 13:21:40', 1, 1),
(3, 'Sap ABAP developer', 'Required ABAP developer for monthly support. More details in PM.\r\n\r\nRegards\r\nBoris', NULL, 'hourly', 'intermediate', '2018-02-14 11:09:31', 1, 1),
(4, 'Java Spring developer', 'Experience required...', NULL, 'fixed', 'intermediate', '2018-02-14 11:09:31', 1, 1),
(5, 'SAP ABAP developer', 'Certificate TW10 required...', NULL, 'fixed', 'beginner', '2018-02-14 11:09:31', 1, 1),
(6, 'Needed designer for 2 months project', 'Design new company brand...', 5000.00, 'fixed', 'intermediate', '2018-02-14 11:09:31', 2, 1),
(7, 'adadasda', 'cdczcs', 1999.00, 'fixed', 'intermediate', '2018-02-14 11:09:31', 1, 13),
(8, 'Design of flyers', 'Around 20 different marketing materials.', 10000.00, 'fixed', 'intermediate', '2018-02-14 11:09:31', 2, 1),
(9, 'Golang developer', 'Needed for long-term cooperation.', 15000.00, 'fixed', 'intermediate', '2018-02-14 11:09:31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job2`
--

DROP TABLE IF EXISTS `job2`;
CREATE TABLE IF NOT EXISTS `job2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `budget` double(10,2) DEFAULT NULL,
  `type` enum('fixed','hourly') NOT NULL DEFAULT 'fixed',
  `expertize_level` enum('beginner','intermediate','expert') DEFAULT 'beginner',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job2`
--

INSERT INTO `job2` (`id`, `title`, `description`, `budget`, `type`, `expertize_level`, `created`, `category_id`, `author_id`) VALUES
(1, 'Need an experienced Java Spring developer', 'Looking for experienced developers in projects with Java backend, Java/GWT, Javascript for on-going project. \r\n\r\n<br><br>\r\n\r\nExperienced with Atlassian tools: Jira, Bitbucket, Bamboo, Git Spanish knowledge will be valued', 40.00, 'hourly', 'intermediate', '2017-07-04 12:47:00', 1, 1),
(2, 'Software using Java, Spring, MongoDB, Javascript and AngularJS', 'Experience in all these technologies is a must:<br><br> Java, Spring, MongoDB, Javascript and AngularJS. Experience with SB Admin template is a plus.', 5000.00, 'fixed', 'expert', '2017-07-04 13:21:40', 1, 1),
(3, 'Sap ABAP developer', 'Required ABAP developer for monthly support. More details in PM.\r\n\r\nRegards\r\nBoris', NULL, 'hourly', 'intermediate', '2018-02-14 10:45:30', 1, 1),
(4, 'Java Spring developer', 'Experience required...', NULL, 'fixed', 'intermediate', '2018-02-14 10:45:30', 1, 1),
(5, 'SAP ABAP developer', 'Certificate TW10 required...', NULL, 'fixed', 'beginner', '2018-02-14 10:45:30', 1, 1),
(6, 'Needed designer for 2 months project', 'Design new company brand...', 5000.00, 'fixed', 'intermediate', '2018-02-14 10:45:30', 2, 1),
(7, 'adadasda', 'cdczcs', 1999.00, 'fixed', 'intermediate', '2018-02-14 10:45:30', 1, 13),
(8, 'Design of flyers', 'Around 20 different marketing materials.', 10000.00, 'fixed', 'intermediate', '2018-02-14 10:45:30', 2, 1),
(9, 'Golang developer', 'Needed for long-term cooperation.', 15000.00, 'fixed', 'intermediate', '2018-02-14 10:45:30', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `job_id`, `text`, `created`) VALUES
(1, 1, 13, 9, 'Hi.\r\n\r\nCan you write me more details about your past projects?\r\n\r\nThanks\r\nBoris', '2017-12-12 14:34:26'),
(2, 13, 1, 9, 'Sure. Check my Linkedin please.\r\n\r\nBest,\r\nAA', '2017-12-12 14:35:20'),
(3, 13, 1, 9, 'It works', '2017-12-12 14:48:12'),
(4, 1, 13, 9, 'Yes.', '2017-12-12 14:48:29'),
(5, 13, 1, 9, 'test', '2018-02-14 12:40:25');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `biography` text,
  `linkedin` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `biography`, `linkedin`, `location`) VALUES
(2, 1, 'ABAP developer since 2017. Java dev. since 2009', '', 'Novi Sad, Serbia'),
(10, 13, 'Test', 'http://google.com', 'Beograd');

-- --------------------------------------------------------

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE IF NOT EXISTS `schema_version` (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`),
  KEY `schema_version_vr_idx` (`version_rank`),
  KEY `schema_version_ir_idx` (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_version`
--

INSERT INTO `schema_version` (`version_rank`, `installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, 1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2018-02-08 09:47:32', 0, 1),
(2, 2, '2', '20180208 close job and feedback', 'SQL', 'V2__20180208_close_job_and_feedback.sql', -786970581, 'root', '2018-02-08 10:20:05', 113, 1),
(3, 3, '3', '20180214 job created db fix', 'SQL', 'V3__20180214_job_created_db_fix.sql', 853392699, 'root', '2018-02-14 11:09:31', 103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `created`) VALUES
(1, 'triva89@yahoo.com', 'Boris Trivic', '$2a$10$mLEUNc9NDc03kBA3uUgJ6eG8bWiQSD1C78QP0aifT.IjVhHgS1j1K', NULL),
(13, 'aabb@mail.com', 'AA BB', '$2a$10$mLEUNc9NDc03kBA3uUgJ6eG8bWiQSD1C78QP0aifT.IjVhHgS1j1K', NULL),
(14, 'marko@mail.com', 'Marko Markovic', '$2a$10$rbRcauO9nJu.hqSwG5nM/OR6xhT/3.FAE6DppM6zDVu1QjTZ5YE6W', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `job_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
