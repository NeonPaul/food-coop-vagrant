-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 03, 2017 at 11:27 AM
-- Server version: 10.0.29-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `unit_weight` int(11) NOT NULL COMMENT 'grams',
  `unit_weight_unit` varchar(5) NOT NULL,
  `wholesale_qtty` int(11) NOT NULL,
  `wholesale_cost` int(11) NOT NULL COMMENT 'pence',
  `splittable` tinyint(1) NOT NULL DEFAULT '0',
  `unavailable` tinyint(1) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `overspend` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `permissions` int(11) NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  `constitution` tinyint(1) NOT NULL DEFAULT '0',
  `machine_pass` varchar(100) DEFAULT NULL,
  `deposit` int(11) NOT NULL,
  `passwd` varchar(256) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `overwrite_price` int(11) DEFAULT NULL,
  `current` tinyint(1) NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` text NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2958 ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `user_agent` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  `created` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

