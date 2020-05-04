-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2020 at 05:00 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `idea`
--

CREATE TABLE `idea` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `idea_title` varchar(255) NOT NULL,
  `source_of_idea` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `potential_customer` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `idea_description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `idea`
--

INSERT INTO `idea` (`id`, `name`, `email`, `mobile`, `idea_title`, `source_of_idea`, `domain`, `potential_customer`, `file`, `idea_description`, `created`, `status`) VALUES
(1, 'Diwaker Mishra', 'diwaker@gmail.com', '9876543210', 'title', '', '', '', 'http://ottbucketbyted.s3.amazonaws.com/ted_website_ideas/title_1573113620.jpg', 'mysqli_query($mysqli, $sql)mysqli_query($mysqli, $sql)mysqli_query($mysqli, $sql)mysqli_query($mysqli, $sql)mysqli_query($mysqli, $sql)mysqli_query($mysqli, $sql)mysqli_query($mysqli, $sql)', '2019-11-07 08:00:23', 1),
(2, 'Diwaker Mishra', 'diwaker@gmail.com', '9876543210', 'title', '', '', '', '', 'isset($successMsg) && $succeisset($successMsg) && $successMsgasdajksdbkajsssMsg', '2019-11-07 08:39:56', 1),
(3, 'Diwaker Mishra', 'diwaker@gmail.com', '9876543210', 'title', '', '', '', '', 'header( \"refresh:5;url=wherever.php\" ); header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );', '2019-11-07 08:41:28', 1),
(4, 'Diwaker Mishra', 'diwaker@gmail.com', '9876543210', 'title', '', '', '', '', 'header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );', '2019-11-07 08:42:28', 1),
(5, 'Diwaker Mishra', 'diwaker@gmail.com', '9876543210', 'title', '', '', '', '', 'header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );header( \"refresh:5;url=wherever.php\" );', '2019-11-07 08:44:28', 1),
(6, 'Diwaker Mishra', 'diwaker@gmail.com', '9876543210', 'title', '', '', '', '', '<?php if(!isset($successMsg) && !$successMsg){ ?><?php if(!isset($successMsg) && !$successMsg){ ?><?php if(!isset($successMsg) && !$successMsg){ ?><?php if(!isset($successMsg) && !$successMsg){ ?>', '2019-11-07 08:44:55', 1),
(7, 'Diwaker Mishra', 'diwaker@gmail.com', '9876543210', 'title', '', '', '', '', '<?php if(!isset($successMsg) && !$successMsg){ ?><?php if(!isset($successMsg) && !$successMsg){ ?><?php if(!isset($successMsg) && !$successMsg){ ?><?php if(!isset($successMsg) && !$successMsg){ ?>', '2019-11-07 08:48:06', 1),
(8, 'test_3nov_3_24pm', 'test@test.com', '9876054321', 'test_3nov_3_24pm', '', '', '', 'http://ottbucketbyted.s3.amazonaws.com/ted_website_ideas/test_3nov_3_24pm_1573120562.jpg', 'test_3nov_3_24pm test_3nov_3_24pm test_3nov_3_24pm test_3nov_3_24pm', '2019-11-07 09:56:04', 1),
(9, 'test_3nov_3_27pm', 'test@test.com', '8976543212', 'test_3nov_3_24pm', '', '', '', '', 'test_3nov_3_24pm test_3nov_3_24pm', '2019-11-07 09:57:38', 1),
(10, 'test_3nov_3_27pm', 'test@test.com', '8976543212', 'test_3nov_3_24pm', '', '', '', '', 'test_3nov_3_24pm test_3nov_3_24pm', '2019-11-07 10:00:16', 1),
(11, 'test_3nov_3_27pm', 'test@test.com', '8976543212', 'test_3nov_3_24pm', '', '', '', '', 'test_3nov_3_24pm test_3nov_3_24pm', '2019-11-07 10:00:59', 1),
(12, 'test_3nov_3_27pm', 'test@test.com', '8976543212', 'test_3nov_3_24pm', '', '', '', '', 'test_3nov_3_24pm test_3nov_3_24pm', '2019-11-07 10:04:36', 1),
(13, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:24:54', 1),
(14, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:28:40', 1),
(15, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:31:19', 1),
(16, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:35:58', 1),
(17, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:40:37', 1),
(18, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:43:47', 1),
(19, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:43:49', 1),
(20, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:45:19', 1),
(21, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:45:53', 1),
(22, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:49:13', 1),
(23, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:50:17', 1),
(24, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:51:04', 1),
(25, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:57:59', 1),
(26, 'test_354Pm', 'test@test.com', '9807654321', 'test_354pm', '', '', '', '', 'test_354pm test_354pm test_354pm test_354pm test_354pm test_354pmtest_354pm', '2019-11-07 10:58:56', 1),
(27, 'dfgh', 'test@test.com', '9807654321', 'd23', '', '', '', '', 'dfgdgdfgdfg sdjkfsnfjksdjk  dfjksdbfjs sdjhfsbdfjs d', '2019-11-07 11:00:10', 1),
(28, 'test_8nov_149', 'test@test.com', '9876543210', 'test_8nov_149', '', '', '', 'http://ottbucketbyted.s3.amazonaws.com/ted_website_ideas/test_8nov_149_1573201244.jpg', 'test_8nov_149 test_8nov_149 test_8nov_149 test_8nov_149 test_8nov_149 test_8nov_149', '2019-11-08 08:20:47', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `idea`
--
ALTER TABLE `idea`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `idea`
--
ALTER TABLE `idea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
