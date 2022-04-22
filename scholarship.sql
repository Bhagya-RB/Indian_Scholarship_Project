-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2022 at 04:17 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `demooffavproject`
--
CREATE DATABASE IF NOT EXISTS `demooffavproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `demooffavproject`;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add site', 7, 'add_site'),
(26, 'Can change site', 7, 'change_site'),
(27, 'Can delete site', 7, 'delete_site'),
(28, 'Can view site', 7, 'view_site'),
(29, 'Can add email address', 8, 'add_emailaddress'),
(30, 'Can change email address', 8, 'change_emailaddress'),
(31, 'Can delete email address', 8, 'delete_emailaddress'),
(32, 'Can view email address', 8, 'view_emailaddress'),
(33, 'Can add email confirmation', 9, 'add_emailconfirmation'),
(34, 'Can change email confirmation', 9, 'change_emailconfirmation'),
(35, 'Can delete email confirmation', 9, 'delete_emailconfirmation'),
(36, 'Can view email confirmation', 9, 'view_emailconfirmation'),
(37, 'Can add social account', 10, 'add_socialaccount'),
(38, 'Can change social account', 10, 'change_socialaccount'),
(39, 'Can delete social account', 10, 'delete_socialaccount'),
(40, 'Can view social account', 10, 'view_socialaccount'),
(41, 'Can add social application', 11, 'add_socialapp'),
(42, 'Can change social application', 11, 'change_socialapp'),
(43, 'Can delete social application', 11, 'delete_socialapp'),
(44, 'Can view social application', 11, 'view_socialapp'),
(45, 'Can add social application token', 12, 'add_socialtoken'),
(46, 'Can change social application token', 12, 'change_socialtoken'),
(47, 'Can delete social application token', 12, 'delete_socialtoken'),
(48, 'Can view social application token', 12, 'view_socialtoken'),
(49, 'Can add product model', 13, 'add_productmodel'),
(50, 'Can change product model', 13, 'change_productmodel'),
(51, 'Can delete product model', 13, 'delete_productmodel'),
(52, 'Can view product model', 13, 'view_productmodel'),
(53, 'Can add contact model', 14, 'add_contactmodel'),
(54, 'Can change contact model', 14, 'change_contactmodel'),
(55, 'Can delete contact model', 14, 'delete_contactmodel'),
(56, 'Can view contact model', 14, 'view_contactmodel'),
(57, 'Can add supplier model', 15, 'add_suppliermodel'),
(58, 'Can change supplier model', 15, 'change_suppliermodel'),
(59, 'Can delete supplier model', 15, 'delete_suppliermodel'),
(60, 'Can view supplier model', 15, 'view_suppliermodel'),
(61, 'Can add supplier verify model', 16, 'add_supplierverifymodel'),
(62, 'Can change supplier verify model', 16, 'change_supplierverifymodel'),
(63, 'Can delete supplier verify model', 16, 'delete_supplierverifymodel'),
(64, 'Can view supplier verify model', 16, 'view_supplierverifymodel'),
(65, 'Can add consumer feedback model', 17, 'add_consumerfeedbackmodel'),
(66, 'Can change consumer feedback model', 17, 'change_consumerfeedbackmodel'),
(67, 'Can delete consumer feedback model', 17, 'delete_consumerfeedbackmodel'),
(68, 'Can view consumer feedback model', 17, 'view_consumerfeedbackmodel'),
(69, 'Can add consumer model', 18, 'add_consumermodel'),
(70, 'Can change consumer model', 18, 'change_consumermodel'),
(71, 'Can delete consumer model', 18, 'delete_consumermodel'),
(72, 'Can view consumer model', 18, 'view_consumermodel'),
(73, 'Can add order model', 19, 'add_ordermodel'),
(74, 'Can change order model', 19, 'change_ordermodel'),
(75, 'Can delete order model', 19, 'delete_ordermodel'),
(76, 'Can view order model', 19, 'view_ordermodel'),
(77, 'Can add cart model', 20, 'add_cartmodel'),
(78, 'Can change cart model', 20, 'change_cartmodel'),
(79, 'Can delete cart model', 20, 'delete_cartmodel'),
(80, 'Can view cart model', 20, 'view_cartmodel'),
(81, 'Can add cart items model', 21, 'add_cartitemsmodel'),
(82, 'Can change cart items model', 21, 'change_cartitemsmodel'),
(83, 'Can delete cart items model', 21, 'delete_cartitemsmodel'),
(84, 'Can view cart items model', 21, 'view_cartitemsmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `consumer_details`
--

CREATE TABLE IF NOT EXISTS `consumer_details` (
  `consumer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `email` varchar(1000) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `password` varchar(2000) NOT NULL,
  `status` varchar(500) NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`consumer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `consumer_details`
--

INSERT INTO `consumer_details` (`consumer_id`, `name`, `mobile`, `email`, `profile`, `address`, `password`, `status`, `reg_date`) VALUES
(1, 'Soumya C N', 9740045314, 'soumya@gmail.com', 'download_lA2HWzS.png', 'Lb nagar', '12345', 'Accepted', '2022-04-08'),
(2, 'Jyothi', 9458126311, 'jyo@gmail.com', 'download_XLkY59V.png', 'Bidar', '12345', 'pending', '2022-04-08'),
(3, 'Priya', 7894561251, 'pri@gmail.com', 'download_1trsICw.png', 'Gulbarga', '12345', 'Rejected', '2022-04-08'),
(4, 'Bhagyashree', 9740045314, 'bhagyashreeb191@gmail.com', 'download_5jrZVEe.png', 'L.B Nagar', 'admin', 'pending', '2022-04-08'),
(5, 'Bhagyashree', 9740045314, 'vinayvinnu5132@gmail.com', 'ASSIGNMENT_1_-python_flas.docx', 'L.B Nagar', 'naser', 'pending', '2022-04-09'),
(6, 'Bhagyashree', 9740045314, 'vinayvinnu5132@gmail.com', 'ASSIGNMENT_1_-python_flas_FcZrSo6.docx', 'L.B Nagar', 'naser', 'pending', '2022-04-09'),
(7, 'Bhagyashree', 9740045314, 'vinayvinnu5132@gmail.com', 'ASSIGNMENT_1_-python_flas_3zL00KQ.docx', 'L.B Nagar', 'naser', 'pending', '2022-04-09'),
(8, 'Bhagyashree', 9740045314, 'vinayvinnu5132@gmail.com', 'ASSIGNMENT_1_-python_flas_NCVefLE.docx', 'L.B Nagar', 'naser', 'pending', '2022-04-09'),
(9, 'Bhagyashree', 9740045314, 'vinayvinnu5132@gmail.com', 'ASSIGNMENT_1_-python_flas_H782NBC.docx', 'L.B Nagar', 'naser', 'pending', '2022-04-09'),
(10, 'Bhagyashree', 9740045314, 'vinayvinnu5132@gmail.com', 'ASSIGNMENT_1_-python_flas_4miueaq.docx', 'L.B Nagar', 'naser', 'pending', '2022-04-09'),
(11, 'Bhagyashree', 9740045314, 'vinayvinnu5132@gmail.com', 'ASSIGNMENT_1_-python_flas_ebXZBZG.docx', 'L.B Nagar', 'naser', 'pending', '2022-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_feedback_details`
--

CREATE TABLE IF NOT EXISTS `consumer_feedback_details` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `message` longtext NOT NULL,
  `feedback_date` date DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `consumer_feedback_details`
--

INSERT INTO `consumer_feedback_details` (`feedback_id`, `first_name`, `last_name`, `email`, `message`, `feedback_date`) VALUES
(1, 'Soumya', 'C N', 'soumya@gmail.com', 'hiiiiiiiiiiiiii', '2022-04-08'),
(2, 'Soumya', 'C N', 'soumya@gmail.com', 'hiiiiiiiiiiiiii', '2022-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE IF NOT EXISTS `contact_details` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`contact_id`, `name`, `email`, `subject`, `message`, `reg_date`) VALUES
(1, 'Bhagyashree', 'bhagyashreeb191@gmail.com', 'Need Details of products', 'Want to know the products details .', '2022-04-08'),
(2, 'Shreeshail', 'shree@gmail.com', 'Need the details of products', 'The organically grown fruits details.', '2022-04-08'),
(3, 'Shradha', 'Shradha@gmail.com', 'Products details', 'To know the details of organic farming products', '2022-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'account', 'emailaddress'),
(9, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(13, 'adminapp', 'productmodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(21, 'consumerapp', 'cartitemsmodel'),
(20, 'consumerapp', 'cartmodel'),
(17, 'consumerapp', 'consumerfeedbackmodel'),
(18, 'consumerapp', 'consumermodel'),
(19, 'consumerapp', 'ordermodel'),
(5, 'contenttypes', 'contenttype'),
(14, 'mainapp', 'contactmodel'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(10, 'socialaccount', 'socialaccount'),
(11, 'socialaccount', 'socialapp'),
(12, 'socialaccount', 'socialtoken'),
(15, 'supplierapp', 'suppliermodel'),
(16, 'supplierapp', 'supplierverifymodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'adminapp', '0001_initial', '2022-04-08 12:13:49.180276'),
(2, 'mainapp', '0001_initial', '2022-04-08 12:14:16.836189'),
(3, 'consumerapp', '0001_initial', '2022-04-08 12:14:54.210861'),
(4, 'supplierapp', '0001_initial', '2022-04-08 12:15:29.388119'),
(5, 'contenttypes', '0001_initial', '2022-04-08 12:16:05.756896'),
(6, 'auth', '0001_initial', '2022-04-08 12:16:06.087001'),
(7, 'account', '0001_initial', '2022-04-08 12:16:07.102919'),
(8, 'account', '0002_email_max_length', '2022-04-08 12:16:07.450940'),
(9, 'admin', '0001_initial', '2022-04-08 12:16:07.583641'),
(10, 'admin', '0002_logentry_remove_auto_add', '2022-04-08 12:16:07.816322'),
(11, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-08 12:16:07.880406'),
(12, 'contenttypes', '0002_remove_content_type_name', '2022-04-08 12:16:08.156166'),
(13, 'auth', '0002_alter_permission_name_max_length', '2022-04-08 12:16:08.315999'),
(14, 'auth', '0003_alter_user_email_max_length', '2022-04-08 12:16:08.467435'),
(15, 'auth', '0004_alter_user_username_opts', '2022-04-08 12:16:08.549349'),
(16, 'auth', '0005_alter_user_last_login_null', '2022-04-08 12:16:08.709989'),
(17, 'auth', '0006_require_contenttypes_0002', '2022-04-08 12:16:08.749770'),
(18, 'auth', '0007_alter_validators_add_error_messages', '2022-04-08 12:16:08.837769'),
(19, 'auth', '0008_alter_user_username_max_length', '2022-04-08 12:16:08.986186'),
(20, 'auth', '0009_alter_user_last_name_max_length', '2022-04-08 12:16:09.154886'),
(21, 'auth', '0010_alter_group_name_max_length', '2022-04-08 12:16:09.304087'),
(22, 'auth', '0011_update_proxy_permissions', '2022-04-08 12:16:09.405054'),
(23, 'sessions', '0001_initial', '2022-04-08 12:16:09.509049'),
(24, 'sites', '0001_initial', '2022-04-08 12:16:09.648069'),
(25, 'sites', '0002_alter_domain_unique', '2022-04-08 12:16:09.742110'),
(26, 'socialaccount', '0001_initial', '2022-04-08 12:16:10.172920'),
(27, 'socialaccount', '0002_token_max_lengths', '2022-04-08 12:16:11.053490'),
(28, 'socialaccount', '0003_extra_data_default_dict', '2022-04-08 12:16:11.139393');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ost103ugro3s4mhtz0zkiol0wc4k5op3', 'MzBjZDljMzM4MWI4NTNhMzc1MjE4OTUyNmJlYjczZmI0ZDIwNTZmMzp7ImNvbnN1bWVyX2lkIjoxLCJzdXBwbGllcl9pZCI6NH0=', '2022-04-24 05:52:51.209868');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `user_id`, `cart_id`, `order_status`, `payment_mode`, `order_date`) VALUES
(1, 1, 1, 'pending', 'pending', '2022-04-08 12:24:31.182391'),
(2, 1, 2, 'pending', 'pending', '2022-04-08 12:53:57.400917'),
(3, 1, 6, 'pending', 'pending', '2022-04-10 05:56:30.424179');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE IF NOT EXISTS `product_details` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` varchar(10) NOT NULL,
  `prod_category` varchar(10) NOT NULL,
  `prod_name` varchar(50) NOT NULL,
  `prod_price` int(11) NOT NULL,
  `prod_units` varchar(20) NOT NULL,
  `prod_description` longtext NOT NULL,
  `prod_image` varchar(100) NOT NULL,
  `prod_status` varchar(50) NOT NULL,
  `prod_date` date NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`p_id`, `prod_id`, `prod_category`, `prod_name`, `prod_price`, `prod_units`, `prod_description`, `prod_image`, `prod_status`, `prod_date`) VALUES
(2, 'V1', 'Vegetables', 'Beans', 25, 'Per Kg', 'Best', 'images/product-3.jpg', 'available', '2022-04-08'),
(3, 'V2', 'Vegetables', 'Tomatoes', 150, 'Per 5Kg', 'Good', 'images/product-5_s4qM4dW.jpg', 'available', '2022-04-08'),
(4, 'F2', 'Fruits', 'Strawberry', 50, 'Per Kg', 'Good', 'images/f2_fK2Db3a.jpg', 'available', '2022-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_details`
--

CREATE TABLE IF NOT EXISTS `supplier_details` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `password` varchar(55) NOT NULL,
  `status` varchar(500) NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `supplier_details`
--

INSERT INTO `supplier_details` (`supplier_id`, `name`, `mobile`, `email`, `profile`, `address`, `password`, `status`, `reg_date`) VALUES
(1, 'Ramya', 9740045314, 'ramya@gmail.com', 'download_UjmsBf0.png', 'Hubli', 'ramya', 'Accepted', '2022-04-08'),
(2, 'Soumya C N', 8974561230, 'soumyacn@gmail.com', 'download_kA8kiNI.png', 'Gulbarga', 'soumya', 'Rejected', '2022-04-08'),
(3, 'Ambika', 9741236580, 'ambika@gmail.com', 'download_b6rY2ta.png', 'Gulbarga', '12345', 'Rejected', '2022-04-08'),
(4, 'Bhagyashree', 9740045314, 'bhagyashreeb191@gmail.com', 'download_9BCSbWe.png', 'L.B Nagar', 'admin', 'Accepted', '2022-04-08'),
(5, 'Bhagya', 9874561230, 'shgdhshdbsh@gmail.com', 'download_UmHwoFI.png', 'pune', 'bhagya', 'Rejected', '2022-04-09'),
(6, 'bhagya', 8971203654, 'bhagya@gmail.com', 'Asana_Frh0RMM.exe', 'Gulbarga', '12345', 'pending', '2022-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_verified_details`
--

CREATE TABLE IF NOT EXISTS `supplier_verified_details` (
  `supplierverify_id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor_name` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phonenumber` bigint(20) DEFAULT NULL,
  `address` longtext NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `isimark` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `status` varchar(500) NOT NULL,
  `verify_date` date DEFAULT NULL,
  PRIMARY KEY (`supplierverify_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `supplier_verified_details`
--

INSERT INTO `supplier_verified_details` (`supplierverify_id`, `distributor_name`, `company_name`, `email`, `phonenumber`, `address`, `country`, `state`, `pincode`, `isimark`, `logo`, `status`, `verify_date`) VALUES
(1, 'codebook', 'codebook', 'codebook@gmail.com', 9740045314, 'pune', 'India', 'Maharastra', 585105, 'Yes', 'Asana.exe', 'Accepted', '2022-04-09'),
(2, 'Technoelixir', 'Techno', 'techno@gmail.com', 9841023657, 'Bangalore', 'India', 'Karnataka', 581025, 'Yes', 'Asana_B97hIKC.exe', 'pending', '2022-04-09'),
(3, 'Akash Technologies', 'Ankpro', 'ankpro@gmail.com', 8012365479, 'Bangalore', 'India', 'Karnataka', 595001, 'Yes', 'Asana_00fugmW.exe', 'Rejected', '2022-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `user_cart`
--

CREATE TABLE IF NOT EXISTS `user_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `completed` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `user_cart_user_id_6e18b40e_fk_Consumer_Details_consumer_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user_cart`
--

INSERT INTO `user_cart` (`cart_id`, `completed`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_cart_items`
--

CREATE TABLE IF NOT EXISTS `user_cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_cart_items_cart_id_277cd51b_fk_user_cart_cart_id` (`cart_id`),
  KEY `user_cart_items_product_id_9413f5ea_fk_product_details_p_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user_cart_items`
--

INSERT INTO `user_cart_items` (`id`, `user`, `quantity`, `price`, `cart_id`, `product_id`) VALUES
(1, 1, 1, 25, 1, 2),
(2, 1, 1, 25, 1, 2),
(3, 1, 1, 25, 1, 2),
(5, 1, 1, 150, 1, 3),
(6, 1, 1, 150, 1, 3),
(7, 1, 1, 150, 1, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `user_cart`
--
ALTER TABLE `user_cart`
  ADD CONSTRAINT `user_cart_user_id_6e18b40e_fk_Consumer_Details_consumer_id` FOREIGN KEY (`user_id`) REFERENCES `consumer_details` (`consumer_id`);

--
-- Constraints for table `user_cart_items`
--
ALTER TABLE `user_cart_items`
  ADD CONSTRAINT `user_cart_items_cart_id_277cd51b_fk_user_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `user_cart` (`cart_id`),
  ADD CONSTRAINT `user_cart_items_product_id_9413f5ea_fk_product_details_p_id` FOREIGN KEY (`product_id`) REFERENCES `product_details` (`p_id`);
--
-- Database: `scholarshipproject`
--
CREATE DATABASE IF NOT EXISTS `scholarshipproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `scholarshipproject`;

-- --------------------------------------------------------

--
-- Table structure for table `application_details`
--

CREATE TABLE IF NOT EXISTS `application_details` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_scholarship` varchar(155) NOT NULL,
  `type_of_scheme` varchar(100) DEFAULT NULL,
  `name_of_scholarship` varchar(111) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `eligibility` varchar(111) NOT NULL,
  `application_date` date DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add contact model', 7, 'add_contactmodel'),
(26, 'Can change contact model', 7, 'change_contactmodel'),
(27, 'Can delete contact model', 7, 'delete_contactmodel'),
(28, 'Can view contact model', 7, 'view_contactmodel'),
(29, 'Can add provider registration model', 8, 'add_providerregistrationmodel'),
(30, 'Can change provider registration model', 8, 'change_providerregistrationmodel'),
(31, 'Can delete provider registration model', 8, 'delete_providerregistrationmodel'),
(32, 'Can view provider registration model', 8, 'view_providerregistrationmodel'),
(33, 'Can add post scholarship model', 9, 'add_postscholarshipmodel'),
(34, 'Can change post scholarship model', 9, 'change_postscholarshipmodel'),
(35, 'Can delete post scholarship model', 9, 'delete_postscholarshipmodel'),
(36, 'Can view post scholarship model', 9, 'view_postscholarshipmodel'),
(37, 'Can add students registration model', 10, 'add_studentsregistrationmodel'),
(38, 'Can change students registration model', 10, 'change_studentsregistrationmodel'),
(39, 'Can delete students registration model', 10, 'delete_studentsregistrationmodel'),
(40, 'Can view students registration model', 10, 'view_studentsregistrationmodel'),
(41, 'Can add feedback model', 11, 'add_feedbackmodel'),
(42, 'Can change feedback model', 11, 'change_feedbackmodel'),
(43, 'Can delete feedback model', 11, 'delete_feedbackmodel'),
(44, 'Can view feedback model', 11, 'view_feedbackmodel'),
(45, 'Can add application model', 12, 'add_applicationmodel'),
(46, 'Can change application model', 12, 'change_applicationmodel'),
(47, 'Can delete application model', 12, 'delete_applicationmodel'),
(48, 'Can view application model', 12, 'view_applicationmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE IF NOT EXISTS `contact_details` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`contact_id`, `name`, `email`, `subject`, `message`, `reg_date`) VALUES
(1, 'Bhagyashree', 'bhagyashreeb191@gmail.com', 'Hi', 'Message Request', '2022-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'mainapp', 'contactmodel'),
(9, 'scholarshipprovidersapp', 'postscholarshipmodel'),
(8, 'scholarshipprovidersapp', 'providerregistrationmodel'),
(6, 'sessions', 'session'),
(12, 'studentsapp', 'applicationmodel'),
(11, 'studentsapp', 'feedbackmodel'),
(10, 'studentsapp', 'studentsregistrationmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-22 05:13:38.001656'),
(2, 'auth', '0001_initial', '2022-04-22 05:13:39.792679'),
(3, 'admin', '0001_initial', '2022-04-22 05:13:40.380652'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-22 05:13:40.448652'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-22 05:13:40.505665'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-04-22 05:13:40.921656'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-04-22 05:13:41.166660'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-04-22 05:13:41.391681'),
(9, 'auth', '0004_alter_user_username_opts', '2022-04-22 05:13:41.480658'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-04-22 05:13:41.715659'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-04-22 05:13:41.761653'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-22 05:13:41.845651'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-04-22 05:13:42.083649'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-22 05:13:42.296667'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-04-22 05:13:42.504651'),
(16, 'auth', '0011_update_proxy_permissions', '2022-04-22 05:13:42.587656'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-22 05:13:42.792653'),
(18, 'sessions', '0001_initial', '2022-04-22 05:13:42.979663'),
(19, 'mainapp', '0001_initial', '2022-04-22 05:14:15.545716'),
(20, 'scholarshipprovidersapp', '0001_initial', '2022-04-22 05:15:56.334686'),
(21, 'studentsapp', '0001_initial', '2022-04-22 05:16:40.448604');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hkuwqmkdpfyjpxtrveod8lobfy5p8ef4', 'eyJwcm92aWRlcl9pZCI6MSwic3R1ZGVudF9pZCI6Mn0:1nhvIx:jYkIoknJp-aagTyqnIzF_AHKz6u_-vyDrIcX-aQGQko', '2022-05-06 15:34:43.117664');

-- --------------------------------------------------------

--
-- Table structure for table `post_scholarship_details`
--

CREATE TABLE IF NOT EXISTS `post_scholarship_details` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_scholarship` varchar(155) NOT NULL,
  `type_of_scheme` varchar(100) DEFAULT NULL,
  `name_of_scholarship` varchar(111) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `eligibility` varchar(55) NOT NULL,
  `description` longtext NOT NULL,
  `documents_required` varchar(100) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `post_scholarship_details`
--

INSERT INTO `post_scholarship_details` (`post_id`, `type_of_scholarship`, `type_of_scheme`, `name_of_scholarship`, `amount`, `eligibility`, `description`, `documents_required`, `last_date`, `status`, `post_date`) VALUES
(1, 'Merit-based scholarship', 'Central Schemes', 'INSPIRE SCHOLARSHIP', 5000, 'Intermediate', 'INSPIRE', 'Aadhar', '2022-12-12', 'Accepted', '2022-04-22'),
(2, 'Mean-based scholarship', 'UGC/AICTE Schemes', 'INSPIRE FOR WOMENS SCHOLARSHIPsss', 12000, 'Polytechique/Diploma', 'INSPIRE SCHOLARSHIP PROVIDER', 'Pan Card', '2022-11-01', 'Rejected', '2022-04-22'),
(3, 'Merir cum means-based scholarship', 'State Schemes', 'INSPIRE SCHOLARSHIP PROVIDER', 102565, 'Post Graduate', 'INSPIRE SCHOLARSHIP PROVIDER', 'SSC Memo', '2022-10-10', 'pending', '2022-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `scholarship_provider_details`
--

CREATE TABLE IF NOT EXISTS `scholarship_provider_details` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `institute_name` varchar(155) NOT NULL,
  `board_university` varchar(155) NOT NULL,
  `pan_number` varchar(111) NOT NULL,
  `hod_institute` varchar(111) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firm_registration` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `scholarship_provider_details`
--

INSERT INTO `scholarship_provider_details` (`provider_id`, `institute_name`, `board_university`, `pan_number`, `hod_institute`, `phone_number`, `email`, `password`, `firm_registration`, `photo`, `status`, `reg_date`) VALUES
(1, 'Central University of Karnataka', 'Amity University', '8998455D', 'Soumya', 9874561230, 'soumya@gmail.com', 'Soumya', 'download_CXvgX5j_vVi1F1v.png', 'download_CXvgX5j_KsrRgo2.png', 'Accepted', '2022-04-22'),
(2, 'Indian Institute of Hyderabad', 'Jawaharlal University', 'BG13332', 'Ambika', 8974102365, 'ambika@gmail.com', 'ambika', 'download_CXvgX5j_gaExBQm.png', 'download_CXvgX5j_fCmdwTI.png', 'Rejected', '2022-04-22'),
(3, 'National Institute of Hyderabad', 'University Of Rajasthan', '8998455ER', 'Ramya', 8974561230, 'ramya@gmail.com', 'ramya', 'download_CXvgX5j_bodoovN.png', 'download_CXvgX5j_ni11XJ1.png', 'pending', '2022-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE IF NOT EXISTS `student_details` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(155) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`student_id`, `name`, `phone_number`, `email`, `password`, `photo`, `status`, `reg_date`) VALUES
(1, 'Bhagyashree', 9740045314, 'bhagyashreeb191@gmail.com', 'Bhagya', 'download_CXvgX5j_0yYqElM.png', 'Rejected', '2022-04-22'),
(2, 'Soumya C N', 8197633128, 'soumya@gmail.com', 'soumya', 'download_CXvgX5j_JPWLgtI.png', 'Accepted', '2022-04-22'),
(3, 'Ambika', 9978546123, 'ambika@gmail.com', 'Ambika', 'download_CXvgX5j_6P2RiuZ.png', 'pending', '2022-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `students_feedback_details`
--

CREATE TABLE IF NOT EXISTS `students_feedback_details` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `message` longtext NOT NULL,
  `feedback_date` date DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `students_feedback_details`
--

INSERT INTO `students_feedback_details` (`feedback_id`, `name`, `email`, `message`, `feedback_date`) VALUES
(1, 'Bhagyashree', 'bhagyashreeb191@gmail.com', 'Hi', '2022-04-22');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
