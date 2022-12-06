-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: simpla
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `s_blog`
--

DROP TABLE IF EXISTS `s_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_blog` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `name` varchar(500) NOT NULL,
                          `url` varchar(255) NOT NULL,
                          `meta_title` varchar(500) NOT NULL,
                          `meta_keywords` varchar(500) NOT NULL,
                          `meta_description` varchar(500) NOT NULL,
                          `annotation` text NOT NULL,
                          `text` longtext NOT NULL,
                          `visible` tinyint(1) NOT NULL DEFAULT '0',
                          `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                          PRIMARY KEY (`id`),
                          KEY `enabled` (`visible`),
                          KEY `url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_blog`
--

LOCK TABLES `s_blog` WRITE;
/*!40000 ALTER TABLE `s_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_brands`
--

DROP TABLE IF EXISTS `s_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_brands` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL DEFAULT '',
                            `url` varchar(255) NOT NULL DEFAULT '',
                            `meta_title` varchar(500) NOT NULL,
                            `meta_keywords` varchar(500) NOT NULL,
                            `meta_description` varchar(500) NOT NULL,
                            `description` text NOT NULL,
                            `image` varchar(255) NOT NULL,
                            PRIMARY KEY (`id`),
                            KEY `name` (`name`),
                            KEY `url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_brands`
--

LOCK TABLES `s_brands` WRITE;
/*!40000 ALTER TABLE `s_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_categories`
--

DROP TABLE IF EXISTS `s_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_categories` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `parent_id` int(11) NOT NULL DEFAULT '0',
                                `name` varchar(255) NOT NULL DEFAULT '',
                                `meta_title` varchar(255) NOT NULL,
                                `meta_keywords` varchar(255) NOT NULL,
                                `meta_description` varchar(255) NOT NULL,
                                `description` text NOT NULL,
                                `url` varchar(255) NOT NULL DEFAULT '',
                                `image` varchar(255) NOT NULL DEFAULT '',
                                `position` int(11) NOT NULL DEFAULT '0',
                                `visible` tinyint(1) NOT NULL DEFAULT '1',
                                `external_id` varchar(36) NOT NULL,
                                PRIMARY KEY (`id`),
                                KEY `url` (`url`),
                                KEY `parent_id` (`parent_id`),
                                KEY `position` (`position`),
                                KEY `visible` (`visible`),
                                KEY `external_id` (`external_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_categories`
--

LOCK TABLES `s_categories` WRITE;
/*!40000 ALTER TABLE `s_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_categories_features`
--

DROP TABLE IF EXISTS `s_categories_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_categories_features` (
                                         `category_id` int(11) NOT NULL,
                                         `feature_id` int(11) NOT NULL,
                                         PRIMARY KEY (`category_id`,`feature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_categories_features`
--

LOCK TABLES `s_categories_features` WRITE;
/*!40000 ALTER TABLE `s_categories_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_categories_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_comments`
--

DROP TABLE IF EXISTS `s_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_comments` (
                              `id` bigint(20) NOT NULL AUTO_INCREMENT,
                              `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `ip` varchar(20) NOT NULL,
                              `object_id` int(11) NOT NULL DEFAULT '0',
                              `name` varchar(255) NOT NULL,
                              `text` text NOT NULL,
                              `type` enum('product','blog') NOT NULL,
                              `approved` int(1) NOT NULL DEFAULT '0',
                              PRIMARY KEY (`id`),
                              KEY `product_id` (`object_id`),
                              KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_comments`
--

LOCK TABLES `s_comments` WRITE;
/*!40000 ALTER TABLE `s_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_coupons`
--

DROP TABLE IF EXISTS `s_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_coupons` (
                             `id` bigint(20) NOT NULL AUTO_INCREMENT,
                             `code` varchar(256) NOT NULL,
                             `expire` timestamp NULL DEFAULT NULL,
                             `type` enum('absolute','percentage') NOT NULL DEFAULT 'absolute',
                             `value` decimal(10,2) NOT NULL DEFAULT '0.00',
                             `min_order_price` decimal(10,2) DEFAULT NULL,
                             `single` int(1) NOT NULL DEFAULT '0',
                             `usages` int(11) NOT NULL DEFAULT '0',
                             PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_coupons`
--

LOCK TABLES `s_coupons` WRITE;
/*!40000 ALTER TABLE `s_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_currencies`
--

DROP TABLE IF EXISTS `s_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_currencies` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(255) NOT NULL DEFAULT '0',
                                `sign` varchar(20) NOT NULL,
                                `code` char(3) NOT NULL DEFAULT '',
                                `rate_from` decimal(10,2) NOT NULL DEFAULT '1.00',
                                `rate_to` decimal(10,2) NOT NULL DEFAULT '1.00',
                                `cents` int(1) NOT NULL DEFAULT '2',
                                `position` int(11) NOT NULL,
                                `enabled` int(1) NOT NULL,
                                PRIMARY KEY (`id`),
                                KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_currencies`
--

LOCK TABLES `s_currencies` WRITE;
/*!40000 ALTER TABLE `s_currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_delivery`
--

DROP TABLE IF EXISTS `s_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_delivery` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) NOT NULL,
                              `description` text NOT NULL,
                              `free_from` decimal(10,2) NOT NULL DEFAULT '0.00',
                              `price` decimal(10,2) NOT NULL DEFAULT '0.00',
                              `enabled` tinyint(1) NOT NULL DEFAULT '0',
                              `position` int(11) NOT NULL,
                              `separate_payment` int(1) DEFAULT '0',
                              PRIMARY KEY (`id`),
                              KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_delivery`
--

LOCK TABLES `s_delivery` WRITE;
/*!40000 ALTER TABLE `s_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_delivery_payment`
--

DROP TABLE IF EXISTS `s_delivery_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_delivery_payment` (
                                      `delivery_id` int(11) NOT NULL,
                                      `payment_method_id` int(11) NOT NULL,
                                      PRIMARY KEY (`delivery_id`,`payment_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Связка способом оплаты и способов доставки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_delivery_payment`
--

LOCK TABLES `s_delivery_payment` WRITE;
/*!40000 ALTER TABLE `s_delivery_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_delivery_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_features`
--

DROP TABLE IF EXISTS `s_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_features` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) NOT NULL,
                              `position` int(11) NOT NULL,
                              `in_filter` tinyint(1) DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `position` (`position`),
                              KEY `in_filter` (`in_filter`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_features`
--

LOCK TABLES `s_features` WRITE;
/*!40000 ALTER TABLE `s_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_feedbacks`
--

DROP TABLE IF EXISTS `s_feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_feedbacks` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `date` datetime NOT NULL,
                               `ip` varchar(20) NOT NULL,
                               `name` varchar(255) NOT NULL,
                               `email` varchar(255) NOT NULL,
                               `message` text NOT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_feedbacks`
--

LOCK TABLES `s_feedbacks` WRITE;
/*!40000 ALTER TABLE `s_feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_groups`
--

DROP TABLE IF EXISTS `s_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_groups` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL DEFAULT '',
                            `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
                            PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_groups`
--

LOCK TABLES `s_groups` WRITE;
/*!40000 ALTER TABLE `s_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_images`
--

DROP TABLE IF EXISTS `s_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_images` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL,
                            `product_id` int(11) NOT NULL DEFAULT '0',
                            `filename` varchar(255) NOT NULL DEFAULT '',
                            `position` int(11) NOT NULL,
                            PRIMARY KEY (`id`),
                            KEY `filename` (`filename`),
                            KEY `product_id` (`product_id`),
                            KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_images`
--

LOCK TABLES `s_images` WRITE;
/*!40000 ALTER TABLE `s_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_labels`
--

DROP TABLE IF EXISTS `s_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_labels` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL,
                            `color` varchar(6) NOT NULL,
                            `position` int(11) NOT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_labels`
--

LOCK TABLES `s_labels` WRITE;
/*!40000 ALTER TABLE `s_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_menu`
--

DROP TABLE IF EXISTS `s_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_menu` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `name` varchar(255) NOT NULL DEFAULT '',
                          `position` int(11) NOT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_menu`
--

LOCK TABLES `s_menu` WRITE;
/*!40000 ALTER TABLE `s_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_options`
--

DROP TABLE IF EXISTS `s_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_options` (
                             `product_id` int(11) NOT NULL,
                             `feature_id` int(11) NOT NULL,
                             `value` varchar(1024) NOT NULL,
                             PRIMARY KEY (`product_id`,`feature_id`),
                             KEY `value` (`value`(333)),
                             KEY `product_id` (`product_id`),
                             KEY `feature_id` (`feature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_options`
--

LOCK TABLES `s_options` WRITE;
/*!40000 ALTER TABLE `s_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_orders`
--

DROP TABLE IF EXISTS `s_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_orders` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `delivery_id` int(11) DEFAULT NULL,
                            `delivery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
                            `payment_method_id` int(11) DEFAULT NULL,
                            `paid` int(1) NOT NULL DEFAULT '0',
                            `payment_date` datetime NOT NULL,
                            `closed` tinyint(1) NOT NULL,
                            `date` datetime DEFAULT NULL,
                            `user_id` int(11) DEFAULT '0',
                            `name` varchar(255) NOT NULL DEFAULT '',
                            `address` varchar(255) NOT NULL DEFAULT '',
                            `phone` varchar(255) NOT NULL DEFAULT '',
                            `email` varchar(255) NOT NULL,
                            `comment` varchar(1024) NOT NULL,
                            `status` int(11) NOT NULL DEFAULT '0',
                            `url` varchar(255) DEFAULT NULL,
                            `payment_details` text NOT NULL,
                            `ip` varchar(15) NOT NULL,
                            `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
                            `note` varchar(1024) NOT NULL,
                            `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
                            `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
                            `coupon_code` varchar(255) NOT NULL,
                            `separate_delivery` int(1) NOT NULL DEFAULT '0',
                            `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY (`id`),
                            KEY `login` (`user_id`),
                            KEY `written_off` (`closed`),
                            KEY `date` (`date`),
                            KEY `status` (`status`),
                            KEY `code` (`url`),
                            KEY `payment_status` (`paid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_orders`
--

LOCK TABLES `s_orders` WRITE;
/*!40000 ALTER TABLE `s_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_orders_labels`
--

DROP TABLE IF EXISTS `s_orders_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_orders_labels` (
                                   `order_id` int(11) NOT NULL,
                                   `label_id` int(11) NOT NULL,
                                   PRIMARY KEY (`order_id`,`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_orders_labels`
--

LOCK TABLES `s_orders_labels` WRITE;
/*!40000 ALTER TABLE `s_orders_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_orders_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_pages`
--

DROP TABLE IF EXISTS `s_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_pages` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `url` varchar(255) NOT NULL DEFAULT '',
                           `name` varchar(255) NOT NULL DEFAULT '',
                           `meta_title` varchar(500) NOT NULL,
                           `meta_description` varchar(500) NOT NULL,
                           `meta_keywords` varchar(500) NOT NULL,
                           `body` longtext NOT NULL,
                           `menu_id` int(11) NOT NULL DEFAULT '0',
                           `position` int(11) NOT NULL DEFAULT '0',
                           `visible` tinyint(1) NOT NULL DEFAULT '0',
                           `header` varchar(1024) NOT NULL,
                           `new_field` varchar(255) DEFAULT NULL,
                           `new_field2` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `order_num` (`position`),
                           KEY `url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_pages`
--

LOCK TABLES `s_pages` WRITE;
/*!40000 ALTER TABLE `s_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_payment_methods`
--

DROP TABLE IF EXISTS `s_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_payment_methods` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `module` varchar(255) NOT NULL,
                                     `name` varchar(255) NOT NULL,
                                     `description` text NOT NULL,
                                     `currency_id` float NOT NULL,
                                     `settings` text NOT NULL,
                                     `enabled` tinyint(1) NOT NULL DEFAULT '0',
                                     `position` int(11) NOT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_payment_methods`
--

LOCK TABLES `s_payment_methods` WRITE;
/*!40000 ALTER TABLE `s_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_products`
--

DROP TABLE IF EXISTS `s_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_products` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `url` varchar(255) NOT NULL DEFAULT '',
                              `brand_id` int(11) DEFAULT NULL,
                              `name` varchar(500) NOT NULL,
                              `annotation` text NOT NULL,
                              `body` longtext NOT NULL,
                              `visible` tinyint(1) NOT NULL DEFAULT '1',
                              `position` int(11) NOT NULL DEFAULT '0',
                              `meta_title` varchar(500) NOT NULL,
                              `meta_keywords` varchar(500) NOT NULL,
                              `meta_description` varchar(500) NOT NULL,
                              `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                              `featured` tinyint(1) DEFAULT NULL,
                              `external_id` varchar(36) NOT NULL,
                              PRIMARY KEY (`id`),
                              KEY `url` (`url`),
                              KEY `brand_id` (`brand_id`),
                              KEY `visible` (`visible`),
                              KEY `position` (`position`),
                              KEY `external_id` (`external_id`),
                              KEY `hit` (`featured`),
                              KEY `name` (`name`(333))
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_products`
--

LOCK TABLES `s_products` WRITE;
/*!40000 ALTER TABLE `s_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_products_categories`
--

DROP TABLE IF EXISTS `s_products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_products_categories` (
                                         `product_id` int(11) NOT NULL,
                                         `category_id` int(11) NOT NULL,
                                         `position` int(11) NOT NULL,
                                         PRIMARY KEY (`product_id`,`category_id`),
                                         KEY `position` (`position`),
                                         KEY `product_id` (`product_id`),
                                         KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_products_categories`
--

LOCK TABLES `s_products_categories` WRITE;
/*!40000 ALTER TABLE `s_products_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_products_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_purchases`
--

DROP TABLE IF EXISTS `s_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_purchases` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `order_id` int(11) NOT NULL DEFAULT '0',
                               `product_id` int(11) DEFAULT '0',
                               `variant_id` int(11) DEFAULT NULL,
                               `product_name` varchar(255) NOT NULL DEFAULT '',
                               `variant_name` varchar(255) NOT NULL,
                               `price` decimal(10,2) NOT NULL DEFAULT '0.00',
                               `amount` int(11) NOT NULL DEFAULT '0',
                               `sku` varchar(255) NOT NULL,
                               PRIMARY KEY (`id`),
                               KEY `order_id` (`order_id`),
                               KEY `product_id` (`product_id`),
                               KEY `variant_id` (`variant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_purchases`
--

LOCK TABLES `s_purchases` WRITE;
/*!40000 ALTER TABLE `s_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_related_products`
--

DROP TABLE IF EXISTS `s_related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_related_products` (
                                      `product_id` int(11) NOT NULL,
                                      `related_id` int(11) NOT NULL,
                                      `position` int(11) NOT NULL,
                                      PRIMARY KEY (`product_id`,`related_id`),
                                      KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_related_products`
--

LOCK TABLES `s_related_products` WRITE;
/*!40000 ALTER TABLE `s_related_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_related_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_settings`
--

DROP TABLE IF EXISTS `s_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_settings` (
                              `setting_id` int(11) NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) NOT NULL DEFAULT '',
                              `value` text NOT NULL,
                              PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_settings`
--

LOCK TABLES `s_settings` WRITE;
/*!40000 ALTER TABLE `s_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_users`
--

DROP TABLE IF EXISTS `s_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_users` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `email` varchar(255) NOT NULL,
                           `password` varchar(255) NOT NULL DEFAULT '',
                           `name` varchar(255) NOT NULL DEFAULT '',
                           `group_id` int(11) NOT NULL DEFAULT '0',
                           `enabled` tinyint(1) NOT NULL DEFAULT '0',
                           `last_ip` varchar(15) DEFAULT NULL,
                           `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                           PRIMARY KEY (`id`),
                           KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_users`
--

LOCK TABLES `s_users` WRITE;
/*!40000 ALTER TABLE `s_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_variants`
--

DROP TABLE IF EXISTS `s_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_variants` (
                              `id` bigint(20) NOT NULL AUTO_INCREMENT,
                              `product_id` int(11) NOT NULL,
                              `sku` varchar(255) NOT NULL,
                              `name` varchar(255) NOT NULL,
                              `price` decimal(14,2) NOT NULL DEFAULT '0.00',
                              `compare_price` decimal(14,2) DEFAULT NULL,
                              `stock` mediumint(9) DEFAULT NULL,
                              `position` int(11) NOT NULL,
                              `attachment` varchar(255) NOT NULL,
                              `external_id` varchar(36) NOT NULL,
                              PRIMARY KEY (`id`),
                              KEY `product_id` (`product_id`),
                              KEY `sku` (`sku`),
                              KEY `price` (`price`),
                              KEY `stock` (`stock`),
                              KEY `position` (`position`),
                              KEY `external_id` (`external_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_variants`
--

LOCK TABLES `s_variants` WRITE;
/*!40000 ALTER TABLE `s_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-14 10:07:04
