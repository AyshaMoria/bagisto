-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 10:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bagisto`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `address_type` varchar(191) NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `address1` varchar(191) NOT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postcode` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'only for customer_addresses',
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_type`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address1`, `address2`, `city`, `state`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'cart_billing', NULL, 2, NULL, 'aysha', 'bholat', NULL, 'aysha', 'aamir manzil', NULL, 'surat', 'GJ', 'IN', '395005', 'aysha092@gmail.com', '08780007055', NULL, 0, NULL, '2024-02-13 07:57:32', '2024-02-13 07:57:32'),
(2, 'cart_shipping', NULL, 2, NULL, 'aysha', 'bholat', NULL, 'aysha', 'aamir manzil', NULL, 'surat', 'GJ', 'IN', '395005', 'aysha092@gmail.com', '08780007055', NULL, 0, NULL, '2024-02-13 07:57:32', '2024-02-13 07:57:32'),
(3, 'cart_billing', NULL, 3, NULL, 'aysha', 'bholat', NULL, 'aysha', 'aamir manzil', NULL, 'surat', 'GJ', 'IN', '395005', 'aysha092@gmail.com', '08780007055', NULL, 0, NULL, '2024-02-15 07:49:57', '2024-02-15 07:49:57'),
(4, 'cart_shipping', NULL, 3, NULL, 'aysha', 'bholat', NULL, 'aysha', 'aamir manzil', NULL, 'surat', 'GJ', 'IN', '395005', 'aysha092@gmail.com', '08780007055', NULL, 0, NULL, '2024-02-15 07:49:57', '2024-02-15 07:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Example', 'admin@example.com', '$2y$10$JMhh4aXZ0FzhQFgIekMe5ugojA5xlHZx7AEUrCWl1gUIYBjcXKFEu', 'XuIfAY5r8wZ6xy95AOXy8xFQ4LVgMBVWYxtjfrbAWPgTHRxWF4TngApogwB6NtYcqxcSU2yOKfjYarx8', 1, 1, 'admins/1/SbEu7IIVXbU4xD8EGBSZzGPjWwHSUHCwjqYzVYIm.png', NULL, '2024-02-12 08:35:38', '2024-02-12 10:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `admin_name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `swatch_type` varchar(191) DEFAULT NULL,
  `validation` varchar(191) DEFAULT NULL,
  `regex` varchar(191) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_comparable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_locale` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_channel` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` int(11) DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(20, 'width', 'Width', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(21, 'height', 'Height', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(23, 'color', 'Color', 'select', NULL, NULL, NULL, 26, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(24, 'size', 'Size', 'select', NULL, NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(25, 'brand', 'Brand', 'select', NULL, NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2024-02-12 08:35:38', '2024-02-12 08:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_families`
--

CREATE TABLE `attribute_families` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_families`
--

INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
(1, 'default', 'Default', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_groups`
--

CREATE TABLE `attribute_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_family_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `column` int(11) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_groups`
--

INSERT INTO `attribute_groups` (`id`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
(1, 1, 'General', 1, 1, 0),
(2, 1, 'Description', 1, 2, 0),
(3, 1, 'Meta Description', 1, 3, 0),
(4, 1, 'Price', 2, 1, 0),
(5, 1, 'Shipping', 2, 2, 0),
(6, 1, 'Settings', 2, 3, 0),
(7, 1, 'Inventories', 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_mappings`
--

CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_group_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_group_mappings`
--

INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 6, 1),
(6, 6, 2),
(7, 6, 3),
(8, 6, 4),
(9, 2, 1),
(10, 2, 2),
(11, 4, 1),
(12, 4, 2),
(13, 4, 3),
(14, 4, 4),
(15, 4, 5),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(19, 5, 1),
(20, 5, 2),
(21, 5, 3),
(22, 5, 4),
(23, 1, 6),
(24, 1, 7),
(25, 1, 8),
(26, 6, 5),
(27, 1, 2),
(28, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `swatch_value` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES
(1, 23, 'Red', 1, NULL),
(2, 23, 'Green', 2, NULL),
(3, 23, 'Yellow', 3, NULL),
(4, 23, 'Black', 4, NULL),
(5, 23, 'White', 5, NULL),
(6, 24, 'S', 1, NULL),
(7, 24, 'M', 2, NULL),
(8, 24, 'L', 3, NULL),
(9, 24, 'XL', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_option_translations`
--

CREATE TABLE `attribute_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_option_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_option_translations`
--

INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES
(1, 1, 'en', 'Red'),
(2, 2, 'en', 'Green'),
(3, 3, 'en', 'Yellow'),
(4, 4, 'en', 'Black'),
(5, 5, 'en', 'White'),
(6, 6, 'en', 'S'),
(7, 7, 'en', 'M'),
(8, 8, 'en', 'L'),
(9, 9, 'en', 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'SKU'),
(2, 2, 'en', 'Name'),
(3, 3, 'en', 'URL Key'),
(4, 4, 'en', 'Tax Category'),
(5, 5, 'en', 'New'),
(6, 6, 'en', 'Featured'),
(7, 7, 'en', 'Visible Individually'),
(8, 8, 'en', 'Status'),
(9, 9, 'en', 'Short Description'),
(10, 10, 'en', 'Description'),
(11, 11, 'en', 'Price'),
(12, 12, 'en', 'Cost'),
(13, 13, 'en', 'Special Price'),
(14, 14, 'en', 'Special Price From'),
(15, 15, 'en', 'Special Price To'),
(16, 16, 'en', 'Meta Description'),
(17, 17, 'en', 'Meta Keywords'),
(18, 18, 'en', 'Meta Description'),
(19, 19, 'en', 'Width'),
(20, 20, 'en', 'Height'),
(21, 21, 'en', 'Depth'),
(22, 22, 'en', 'Weight'),
(23, 23, 'en', 'Color'),
(24, 24, 'en', 'Size'),
(25, 25, 'en', 'Brand'),
(26, 26, 'en', 'Allow Guest Checkout'),
(27, 27, 'en', 'Product Number');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `cart_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `tax_total` decimal(12,4) DEFAULT 0.0000,
  `base_tax_total` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `checkout_method` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'aysha092@gmail.com', 'Aysha', 'Moria', NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 4.0000, 4.0000, 4.0000, 4.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 1, NULL, 1, 1, '2024-02-12 09:58:47', '2024-02-12 10:14:03'),
(2, 'aysha092@gmail.com', 'aysha', 'bholat', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 17.0000, 17.0000, 7.0000, 7.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2024-02-13 07:57:08', '2024-02-13 07:57:51'),
(3, 'aysha092@gmail.com', 'aysha', 'bholat', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 5.0000, 5.0000, 5.0000, 5.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2024-02-15 07:49:46', '2024-02-15 07:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES
(1, 1, 'kidswear', 'simple', 'kids-boys-cotton-printed-white-and-red-colour-top-shortsq', NULL, 3.0000, 3.0000, 3.0000, 4.0000, 4.0000, NULL, 4.0000, 4.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 2, 1, NULL, NULL, '{\"quantity\":1,\"product_id\":2}', '2024-02-12 09:58:47', '2024-02-12 10:14:03'),
(2, 1, 'a', 'simple', 'Alan Jones Clothing Women\'s Cotton Hooded Neck Sweatshirt', NULL, 2.0000, 2.0000, 2.0000, 7.0000, 7.0000, NULL, 7.0000, 7.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 6, 2, NULL, NULL, '{\"quantity\":1,\"product_id\":6}', '2024-02-13 07:57:08', '2024-02-13 07:57:51'),
(3, 1, 'abcd', 'simple', 'LEOTUDE Women\'s Loopknit Boyfriend/Loose Fit Round Neck Sweatshirt (Color Black)', NULL, 5.0000, 5.0000, 5.0000, 5.0000, 5.0000, NULL, 5.0000, 5.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 5, 3, NULL, NULL, '{\"quantity\":1,\"product_id\":5}', '2024-02-15 07:49:46', '2024-02-15 07:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item_inventories`
--

CREATE TABLE `cart_item_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_item_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_payment`
--

CREATE TABLE `cart_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_payment`
--

INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES
(4, 'paypal_standard', 'PayPal Standard', 2, '2024-02-13 07:57:49', '2024-02-13 07:57:49'),
(7, 'paypal_standard', 'PayPal Standard', 3, '2024-02-15 07:50:08', '2024-02-15 07:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rules`
--

CREATE TABLE `cart_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_type` int(11) NOT NULL DEFAULT 1,
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT 0,
  `usage_per_customer` int(11) NOT NULL DEFAULT 0,
  `uses_per_coupon` int(11) NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_quantity` int(11) NOT NULL DEFAULT 1,
  `discount_step` varchar(191) NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_channels`
--

CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupons`
--

CREATE TABLE `cart_rule_coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `usage_limit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usage_per_customer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupon_usage`
--

CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` int(11) NOT NULL DEFAULT 0,
  `cart_rule_coupon_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customers`
--

CREATE TABLE `cart_rule_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customer_groups`
--

CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_translations`
--

CREATE TABLE `cart_rule_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shipping_rates`
--

CREATE TABLE `cart_shipping_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `carrier` varchar(191) NOT NULL,
  `carrier_title` varchar(191) NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) NOT NULL,
  `method_description` varchar(191) DEFAULT NULL,
  `price` double DEFAULT 0,
  `base_price` double DEFAULT 0,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cart_address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart_shipping_rates`
--

INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`) VALUES
(5, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 1, 2, '2024-02-13 07:57:41', '2024-02-13 07:57:41'),
(6, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 1, 2, '2024-02-13 07:57:41', '2024-02-13 07:57:41'),
(9, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 1, 4, '2024-02-15 07:50:00', '2024-02-15 07:50:00'),
(10, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 1, 4, '2024-02-15 07:50:00', '2024-02-15 07:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rules`
--

CREATE TABLE `catalog_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_channels`
--

CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_customer_groups`
--

CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_products`
--

CREATE TABLE `catalog_rule_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_product_prices`
--

CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `display_mode` varchar(191) DEFAULT 'products_and_description',
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `banner_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'products_and_description', 1, 24, NULL, NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(2, 1, 'category/2/FQmL75tz4lqm1kJlJwvQ1jKb8iNAYy7PXe0AKDPM.webp', 1, 'products_and_description', 16, 17, 1, NULL, NULL, '2024-02-12 09:09:22', '2024-02-12 09:53:59'),
(3, 5, 'category/3/UgU2hlTB9kP5yLw5bfYAkMOcyIZmzG36JFgMQuV6.webp', 1, 'products_and_description', 14, 15, 1, NULL, NULL, '2024-02-12 09:33:38', '2024-02-12 09:56:13'),
(4, 2, 'category/4/MZQqgTozorhYDpkIUlmEwfbo8k7EMWWMSUfiV3KT.webp', 1, 'products_and_description', 18, 19, 1, NULL, NULL, '2024-02-12 09:35:51', '2024-02-12 09:54:57'),
(5, 4, 'category/5/lNZtJ2XpAFoHjrMmwQYdyGgfCJzG8af4pqz6uvPW.webp', 1, 'products_and_description', 20, 21, 1, NULL, NULL, '2024-02-12 09:38:49', '2024-02-12 09:56:05'),
(6, 3, 'category/6/Y5LotNdmwVCYG9rkFrx0mqu4ukScCnqy3tfpfZoI.webp', 1, 'products_and_description', 22, 23, 1, NULL, NULL, '2024-02-12 09:55:35', '2024-02-12 09:55:56');

-- --------------------------------------------------------

--
-- Table structure for table `category_filterable_attributes`
--

CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_filterable_attributes`
--

INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
(2, 11),
(2, 23),
(2, 24),
(3, 11),
(3, 23),
(4, 11),
(4, 23),
(4, 24),
(4, 25),
(5, 11),
(5, 23),
(6, 11),
(6, 23),
(6, 24);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `url_path` varchar(2048) NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES
(1, 1, 'Root', 'root', '', 'Root', '', '', '', NULL, 'en'),
(2, 1, 'Raíz', 'root', '', 'Raíz', '', '', '', NULL, 'es'),
(3, 1, 'Racine', 'root', '', 'Racine', '', '', '', NULL, 'fr'),
(4, 1, 'Hoofdcategorie', 'root', '', 'Hoofdcategorie', '', '', '', NULL, 'nl'),
(5, 1, 'Kök', 'root', '', 'Kök', '', '', '', NULL, 'tr'),
(6, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 1, 'en'),
(7, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 3, 'nl'),
(8, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 5, 'es'),
(9, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 2, 'fr'),
(10, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 6, 'de'),
(11, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 10, 'hi_IN'),
(12, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 7, 'it'),
(13, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 8, 'ru'),
(14, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 4, 'tr'),
(15, 2, 'Kid\'s Wear', 'kids-wear', 'kids-wear', '<p>kid\'s Cloths</p>', '', '', '', 9, 'uk'),
(16, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 1, 'en'),
(17, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 3, 'nl'),
(18, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 5, 'es'),
(19, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 2, 'fr'),
(20, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 6, 'de'),
(21, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 10, 'hi_IN'),
(22, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 7, 'it'),
(23, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 8, 'ru'),
(24, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 4, 'tr'),
(25, 3, 'Iphone', 'iphone', 'iphone', '<p>iphones</p>', '', '', '', 9, 'uk'),
(26, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 1, 'en'),
(27, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 3, 'nl'),
(28, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 5, 'es'),
(29, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 2, 'fr'),
(30, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 6, 'de'),
(31, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 10, 'hi_IN'),
(32, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 7, 'it'),
(33, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 8, 'ru'),
(34, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 4, 'tr'),
(35, 4, 'Men\'s Wear', 'mens-wear', 'mens-wear', '<p>men\'s wear</p>', '', '', '', 9, 'uk'),
(36, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 1, 'en'),
(37, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 3, 'nl'),
(38, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 5, 'es'),
(39, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 2, 'fr'),
(40, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 6, 'de'),
(41, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 10, 'hi_IN'),
(42, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 7, 'it'),
(43, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 8, 'ru'),
(44, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 4, 'tr'),
(45, 5, 'Electronics', 'electronics', 'electronics', '<p>electronics</p>', '', '', '', 9, 'uk'),
(46, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 1, 'en'),
(47, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 3, 'nl'),
(48, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 5, 'es'),
(49, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 2, 'fr'),
(50, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 6, 'de'),
(51, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 10, 'hi_IN'),
(52, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 7, 'it'),
(53, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 8, 'ru'),
(54, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 4, 'tr'),
(55, 6, 'women\'s wear', 'womens-wear', 'womens-wear', '<p>women\'s wear</p>', '', '', '', 9, 'uk');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `theme` varchar(191) DEFAULT NULL,
  `hostname` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT 0,
  `allowed_ips` text DEFAULT NULL,
  `root_category_id` int(10) UNSIGNED DEFAULT NULL,
  `default_locale_id` int(10) UNSIGNED NOT NULL,
  `base_currency_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'default', 'http://localhost', 'channel/1/PYWYMUNJ3CudEfSTJsxNSRr6tqKh6ljSyWzngRna.png', 'channel/1/AoLg1a0ovIQsBvDu0PiZ2m7S993krusw4rz5gTlp.png', NULL, 0, '', 1, 1, 1, NULL, '2024-02-12 10:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `channel_currencies`
--

CREATE TABLE `channel_currencies` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_currencies`
--

INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `channel_inventory_sources`
--

CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_inventory_sources`
--

INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_locales`
--

CREATE TABLE `channel_locales` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_locales`
--

INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
(1, 1),
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `channel_translations`
--

CREATE TABLE `channel_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_mode_text` text DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_translations`
--

INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Default', NULL, NULL, '{\"meta_title\":\"Online Store\",\"meta_description\":\"Demo store meta description\",\"meta_keywords\":\"ONLINE STORE\"}', NULL, '2024-02-12 09:18:50'),
(2, 1, 'fr', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL),
(3, 1, 'nl', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL),
(4, 1, 'tr', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL),
(5, 1, 'es', 'Default', NULL, NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `layout` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(2, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(3, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(4, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(5, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(6, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(7, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(8, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(9, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(10, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(11, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_channels`
--

CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_translations`
--

CREATE TABLE `cms_page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_title` varchar(191) NOT NULL,
  `url_key` varchar(191) NOT NULL,
  `html_content` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  `cms_page_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_page_translations`
--

INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
(1, 'About Us', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">About us page content</div></div>', 'about us', '', 'aboutus', 'en', 1),
(2, 'Return Policy', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Return policy page content</div></div>', 'return policy', '', 'return, policy', 'en', 2),
(3, 'Refund Policy', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Refund policy page content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3),
(4, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Terms & conditions page content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
(5, 'Terms of use', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Terms of use page content</div></div>', 'Terms of use', '', 'term, use', 'en', 5),
(6, 'Contact Us', 'contact-us', '<div class=\"static-container\"><div class=\"mb-5\">Contact us page content</div></div>', 'Contact Us', '', 'contact, us', 'en', 6),
(7, 'Customer Service', 'cutomer-service', '<div class=\"static-container\"><div class=\"mb-5\">Customer service  page content</div></div>', 'Customer Service', '', 'customer, service', 'en', 7),
(8, 'What\'s New', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 8),
(9, 'Payment Policy', 'payment-policy', '<div class=\"static-container\"><div class=\"mb-5\">Payment Policy page content</div></div>', 'Payment Policy', '', 'payment, policy', 'en', 9),
(10, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy  page content</div></div>', 'Shipping Policy', '', 'shipping, policy', 'en', 10),
(11, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy  page content</div></div>', 'Privacy Policy', '', 'privacy, policy', 'en', 11);

-- --------------------------------------------------------

--
-- Table structure for table `compare_items`
--

CREATE TABLE `compare_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `core_config`
--

CREATE TABLE `core_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `channel_code` varchar(191) DEFAULT NULL,
  `locale_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `core_config`
--

INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
(1, 'catalog.products.guest_checkout.allow_guest_checkout', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(4, 'emails.general.notifications.emails.general.notifications.customer', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(5, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(6, 'emails.general.notifications.emails.general.notifications.new_admin', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(7, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(8, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(9, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(10, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(11, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(12, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(13, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(14, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(15, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(16, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2024-02-12 08:35:38', '2024-02-12 08:35:38'),
(17, 'general.design.admin_logo.logo_image', 'configuration/7UQSDRJlPG2roD4pB8MGMHGr8eEbwqYKPGTaJ3lH.png', 'Default', NULL, '2024-02-12 09:59:19', '2024-02-12 10:04:00'),
(18, 'general.design.admin_logo.favicon', 'configuration/EEdDkCFAxISS24DsCf6KhHYMS2GcBdL3JWn0CPaj.png', 'Default', NULL, '2024-02-12 09:59:19', '2024-02-12 10:04:00'),
(19, 'general.general.locale_options.weight_unit', 'kgs', 'Default', NULL, '2024-02-13 07:45:40', '2024-02-13 07:45:40'),
(20, 'general.content.shop.compare_option', 'value', 'Default', 'en', '2024-02-13 07:46:07', '2024-02-13 07:46:07'),
(21, 'general.content.shop.wishlist_option', 'value', 'Default', 'en', '2024-02-13 07:46:07', '2024-02-13 07:46:07'),
(22, 'general.content.shop.image_search', 'value', 'Default', 'en', '2024-02-13 07:46:07', '2024-02-13 07:46:07'),
(23, 'general.content.custom_scripts.custom_css', '', 'Default', NULL, '2024-02-13 07:46:07', '2024-02-13 07:46:07'),
(24, 'general.content.custom_scripts.custom_javascript', '', 'Default', NULL, '2024-02-13 07:46:07', '2024-02-13 07:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(243, 'UN', 'United Nations'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `default_name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
(1, 244, 'US', 'AL', 'Alabama'),
(2, 244, 'US', 'AK', 'Alaska'),
(3, 244, 'US', 'AS', 'American Samoa'),
(4, 244, 'US', 'AZ', 'Arizona'),
(5, 244, 'US', 'AR', 'Arkansas'),
(6, 244, 'US', 'AE', 'Armed Forces Africa'),
(7, 244, 'US', 'AA', 'Armed Forces Americas'),
(8, 244, 'US', 'AE', 'Armed Forces Canada'),
(9, 244, 'US', 'AE', 'Armed Forces Europe'),
(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
(12, 244, 'US', 'CA', 'California'),
(13, 244, 'US', 'CO', 'Colorado'),
(14, 244, 'US', 'CT', 'Connecticut'),
(15, 244, 'US', 'DE', 'Delaware'),
(16, 244, 'US', 'DC', 'District of Columbia'),
(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 244, 'US', 'FL', 'Florida'),
(19, 244, 'US', 'GA', 'Georgia'),
(20, 244, 'US', 'GU', 'Guam'),
(21, 244, 'US', 'HI', 'Hawaii'),
(22, 244, 'US', 'ID', 'Idaho'),
(23, 244, 'US', 'IL', 'Illinois'),
(24, 244, 'US', 'IN', 'Indiana'),
(25, 244, 'US', 'IA', 'Iowa'),
(26, 244, 'US', 'KS', 'Kansas'),
(27, 244, 'US', 'KY', 'Kentucky'),
(28, 244, 'US', 'LA', 'Louisiana'),
(29, 244, 'US', 'ME', 'Maine'),
(30, 244, 'US', 'MH', 'Marshall Islands'),
(31, 244, 'US', 'MD', 'Maryland'),
(32, 244, 'US', 'MA', 'Massachusetts'),
(33, 244, 'US', 'MI', 'Michigan'),
(34, 244, 'US', 'MN', 'Minnesota'),
(35, 244, 'US', 'MS', 'Mississippi'),
(36, 244, 'US', 'MO', 'Missouri'),
(37, 244, 'US', 'MT', 'Montana'),
(38, 244, 'US', 'NE', 'Nebraska'),
(39, 244, 'US', 'NV', 'Nevada'),
(40, 244, 'US', 'NH', 'New Hampshire'),
(41, 244, 'US', 'NJ', 'New Jersey'),
(42, 244, 'US', 'NM', 'New Mexico'),
(43, 244, 'US', 'NY', 'New York'),
(44, 244, 'US', 'NC', 'North Carolina'),
(45, 244, 'US', 'ND', 'North Dakota'),
(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
(47, 244, 'US', 'OH', 'Ohio'),
(48, 244, 'US', 'OK', 'Oklahoma'),
(49, 244, 'US', 'OR', 'Oregon'),
(50, 244, 'US', 'PW', 'Palau'),
(51, 244, 'US', 'PA', 'Pennsylvania'),
(52, 244, 'US', 'PR', 'Puerto Rico'),
(53, 244, 'US', 'RI', 'Rhode Island'),
(54, 244, 'US', 'SC', 'South Carolina'),
(55, 244, 'US', 'SD', 'South Dakota'),
(56, 244, 'US', 'TN', 'Tennessee'),
(57, 244, 'US', 'TX', 'Texas'),
(58, 244, 'US', 'UT', 'Utah'),
(59, 244, 'US', 'VT', 'Vermont'),
(60, 244, 'US', 'VI', 'Virgin Islands'),
(61, 244, 'US', 'VA', 'Virginia'),
(62, 244, 'US', 'WA', 'Washington'),
(63, 244, 'US', 'WV', 'West Virginia'),
(64, 244, 'US', 'WI', 'Wisconsin'),
(65, 244, 'US', 'WY', 'Wyoming'),
(66, 40, 'CA', 'AB', 'Alberta'),
(67, 40, 'CA', 'BC', 'British Columbia'),
(68, 40, 'CA', 'MB', 'Manitoba'),
(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 40, 'CA', 'NB', 'New Brunswick'),
(71, 40, 'CA', 'NS', 'Nova Scotia'),
(72, 40, 'CA', 'NT', 'Northwest Territories'),
(73, 40, 'CA', 'NU', 'Nunavut'),
(74, 40, 'CA', 'ON', 'Ontario'),
(75, 40, 'CA', 'PE', 'Prince Edward Island'),
(76, 40, 'CA', 'QC', 'Quebec'),
(77, 40, 'CA', 'SK', 'Saskatchewan'),
(78, 40, 'CA', 'YT', 'Yukon Territory'),
(79, 88, 'DE', 'NDS', 'Niedersachsen'),
(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 88, 'DE', 'BAY', 'Bayern'),
(82, 88, 'DE', 'BER', 'Berlin'),
(83, 88, 'DE', 'BRG', 'Brandenburg'),
(84, 88, 'DE', 'BRE', 'Bremen'),
(85, 88, 'DE', 'HAM', 'Hamburg'),
(86, 88, 'DE', 'HES', 'Hessen'),
(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 88, 'DE', 'SAR', 'Saarland'),
(91, 88, 'DE', 'SAS', 'Sachsen'),
(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 88, 'DE', 'THE', 'Thüringen'),
(95, 16, 'AT', 'WI', 'Wien'),
(96, 16, 'AT', 'NO', 'Niederösterreich'),
(97, 16, 'AT', 'OO', 'Oberösterreich'),
(98, 16, 'AT', 'SB', 'Salzburg'),
(99, 16, 'AT', 'KN', 'Kärnten'),
(100, 16, 'AT', 'ST', 'Steiermark'),
(101, 16, 'AT', 'TI', 'Tirol'),
(102, 16, 'AT', 'BL', 'Burgenland'),
(103, 16, 'AT', 'VB', 'Vorarlberg'),
(104, 220, 'CH', 'AG', 'Aargau'),
(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 220, 'CH', 'BE', 'Bern'),
(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
(109, 220, 'CH', 'BS', 'Basel-Stadt'),
(110, 220, 'CH', 'FR', 'Freiburg'),
(111, 220, 'CH', 'GE', 'Genf'),
(112, 220, 'CH', 'GL', 'Glarus'),
(113, 220, 'CH', 'GR', 'Graubünden'),
(114, 220, 'CH', 'JU', 'Jura'),
(115, 220, 'CH', 'LU', 'Luzern'),
(116, 220, 'CH', 'NE', 'Neuenburg'),
(117, 220, 'CH', 'NW', 'Nidwalden'),
(118, 220, 'CH', 'OW', 'Obwalden'),
(119, 220, 'CH', 'SG', 'St. Gallen'),
(120, 220, 'CH', 'SH', 'Schaffhausen'),
(121, 220, 'CH', 'SO', 'Solothurn'),
(122, 220, 'CH', 'SZ', 'Schwyz'),
(123, 220, 'CH', 'TG', 'Thurgau'),
(124, 220, 'CH', 'TI', 'Tessin'),
(125, 220, 'CH', 'UR', 'Uri'),
(126, 220, 'CH', 'VD', 'Waadt'),
(127, 220, 'CH', 'VS', 'Wallis'),
(128, 220, 'CH', 'ZG', 'Zug'),
(129, 220, 'CH', 'ZH', 'Zürich'),
(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
(131, 206, 'ES', 'Alava', 'Alava'),
(132, 206, 'ES', 'Albacete', 'Albacete'),
(133, 206, 'ES', 'Alicante', 'Alicante'),
(134, 206, 'ES', 'Almeria', 'Almeria'),
(135, 206, 'ES', 'Asturias', 'Asturias'),
(136, 206, 'ES', 'Avila', 'Avila'),
(137, 206, 'ES', 'Badajoz', 'Badajoz'),
(138, 206, 'ES', 'Baleares', 'Baleares'),
(139, 206, 'ES', 'Barcelona', 'Barcelona'),
(140, 206, 'ES', 'Burgos', 'Burgos'),
(141, 206, 'ES', 'Caceres', 'Caceres'),
(142, 206, 'ES', 'Cadiz', 'Cadiz'),
(143, 206, 'ES', 'Cantabria', 'Cantabria'),
(144, 206, 'ES', 'Castellon', 'Castellon'),
(145, 206, 'ES', 'Ceuta', 'Ceuta'),
(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 206, 'ES', 'Cordoba', 'Cordoba'),
(148, 206, 'ES', 'Cuenca', 'Cuenca'),
(149, 206, 'ES', 'Girona', 'Girona'),
(150, 206, 'ES', 'Granada', 'Granada'),
(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 206, 'ES', 'Huelva', 'Huelva'),
(154, 206, 'ES', 'Huesca', 'Huesca'),
(155, 206, 'ES', 'Jaen', 'Jaen'),
(156, 206, 'ES', 'La Rioja', 'La Rioja'),
(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 206, 'ES', 'Leon', 'Leon'),
(159, 206, 'ES', 'Lleida', 'Lleida'),
(160, 206, 'ES', 'Lugo', 'Lugo'),
(161, 206, 'ES', 'Madrid', 'Madrid'),
(162, 206, 'ES', 'Malaga', 'Malaga'),
(163, 206, 'ES', 'Melilla', 'Melilla'),
(164, 206, 'ES', 'Murcia', 'Murcia'),
(165, 206, 'ES', 'Navarra', 'Navarra'),
(166, 206, 'ES', 'Ourense', 'Ourense'),
(167, 206, 'ES', 'Palencia', 'Palencia'),
(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 206, 'ES', 'Salamanca', 'Salamanca'),
(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 206, 'ES', 'Segovia', 'Segovia'),
(172, 206, 'ES', 'Sevilla', 'Sevilla'),
(173, 206, 'ES', 'Soria', 'Soria'),
(174, 206, 'ES', 'Tarragona', 'Tarragona'),
(175, 206, 'ES', 'Teruel', 'Teruel'),
(176, 206, 'ES', 'Toledo', 'Toledo'),
(177, 206, 'ES', 'Valencia', 'Valencia'),
(178, 206, 'ES', 'Valladolid', 'Valladolid'),
(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 206, 'ES', 'Zamora', 'Zamora'),
(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 81, 'FR', '1', 'Ain'),
(183, 81, 'FR', '2', 'Aisne'),
(184, 81, 'FR', '3', 'Allier'),
(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 81, 'FR', '5', 'Hautes-Alpes'),
(187, 81, 'FR', '6', 'Alpes-Maritimes'),
(188, 81, 'FR', '7', 'Ardèche'),
(189, 81, 'FR', '8', 'Ardennes'),
(190, 81, 'FR', '9', 'Ariège'),
(191, 81, 'FR', '10', 'Aube'),
(192, 81, 'FR', '11', 'Aude'),
(193, 81, 'FR', '12', 'Aveyron'),
(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
(195, 81, 'FR', '14', 'Calvados'),
(196, 81, 'FR', '15', 'Cantal'),
(197, 81, 'FR', '16', 'Charente'),
(198, 81, 'FR', '17', 'Charente-Maritime'),
(199, 81, 'FR', '18', 'Cher'),
(200, 81, 'FR', '19', 'Corrèze'),
(201, 81, 'FR', '2A', 'Corse-du-Sud'),
(202, 81, 'FR', '2B', 'Haute-Corse'),
(203, 81, 'FR', '21', 'Côte-d\'Or'),
(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
(205, 81, 'FR', '23', 'Creuse'),
(206, 81, 'FR', '24', 'Dordogne'),
(207, 81, 'FR', '25', 'Doubs'),
(208, 81, 'FR', '26', 'Drôme'),
(209, 81, 'FR', '27', 'Eure'),
(210, 81, 'FR', '28', 'Eure-et-Loir'),
(211, 81, 'FR', '29', 'Finistère'),
(212, 81, 'FR', '30', 'Gard'),
(213, 81, 'FR', '31', 'Haute-Garonne'),
(214, 81, 'FR', '32', 'Gers'),
(215, 81, 'FR', '33', 'Gironde'),
(216, 81, 'FR', '34', 'Hérault'),
(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
(218, 81, 'FR', '36', 'Indre'),
(219, 81, 'FR', '37', 'Indre-et-Loire'),
(220, 81, 'FR', '38', 'Isère'),
(221, 81, 'FR', '39', 'Jura'),
(222, 81, 'FR', '40', 'Landes'),
(223, 81, 'FR', '41', 'Loir-et-Cher'),
(224, 81, 'FR', '42', 'Loire'),
(225, 81, 'FR', '43', 'Haute-Loire'),
(226, 81, 'FR', '44', 'Loire-Atlantique'),
(227, 81, 'FR', '45', 'Loiret'),
(228, 81, 'FR', '46', 'Lot'),
(229, 81, 'FR', '47', 'Lot-et-Garonne'),
(230, 81, 'FR', '48', 'Lozère'),
(231, 81, 'FR', '49', 'Maine-et-Loire'),
(232, 81, 'FR', '50', 'Manche'),
(233, 81, 'FR', '51', 'Marne'),
(234, 81, 'FR', '52', 'Haute-Marne'),
(235, 81, 'FR', '53', 'Mayenne'),
(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 81, 'FR', '55', 'Meuse'),
(238, 81, 'FR', '56', 'Morbihan'),
(239, 81, 'FR', '57', 'Moselle'),
(240, 81, 'FR', '58', 'Nièvre'),
(241, 81, 'FR', '59', 'Nord'),
(242, 81, 'FR', '60', 'Oise'),
(243, 81, 'FR', '61', 'Orne'),
(244, 81, 'FR', '62', 'Pas-de-Calais'),
(245, 81, 'FR', '63', 'Puy-de-Dôme'),
(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
(249, 81, 'FR', '67', 'Bas-Rhin'),
(250, 81, 'FR', '68', 'Haut-Rhin'),
(251, 81, 'FR', '69', 'Rhône'),
(252, 81, 'FR', '70', 'Haute-Saône'),
(253, 81, 'FR', '71', 'Saône-et-Loire'),
(254, 81, 'FR', '72', 'Sarthe'),
(255, 81, 'FR', '73', 'Savoie'),
(256, 81, 'FR', '74', 'Haute-Savoie'),
(257, 81, 'FR', '75', 'Paris'),
(258, 81, 'FR', '76', 'Seine-Maritime'),
(259, 81, 'FR', '77', 'Seine-et-Marne'),
(260, 81, 'FR', '78', 'Yvelines'),
(261, 81, 'FR', '79', 'Deux-Sèvres'),
(262, 81, 'FR', '80', 'Somme'),
(263, 81, 'FR', '81', 'Tarn'),
(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
(265, 81, 'FR', '83', 'Var'),
(266, 81, 'FR', '84', 'Vaucluse'),
(267, 81, 'FR', '85', 'Vendée'),
(268, 81, 'FR', '86', 'Vienne'),
(269, 81, 'FR', '87', 'Haute-Vienne'),
(270, 81, 'FR', '88', 'Vosges'),
(271, 81, 'FR', '89', 'Yonne'),
(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
(273, 81, 'FR', '91', 'Essonne'),
(274, 81, 'FR', '92', 'Hauts-de-Seine'),
(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
(276, 81, 'FR', '94', 'Val-de-Marne'),
(277, 81, 'FR', '95', 'Val-d\'Oise'),
(278, 185, 'RO', 'AB', 'Alba'),
(279, 185, 'RO', 'AR', 'Arad'),
(280, 185, 'RO', 'AG', 'Argeş'),
(281, 185, 'RO', 'BC', 'Bacău'),
(282, 185, 'RO', 'BH', 'Bihor'),
(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 185, 'RO', 'BT', 'Botoşani'),
(285, 185, 'RO', 'BV', 'Braşov'),
(286, 185, 'RO', 'BR', 'Brăila'),
(287, 185, 'RO', 'B', 'Bucureşti'),
(288, 185, 'RO', 'BZ', 'Buzău'),
(289, 185, 'RO', 'CS', 'Caraş-Severin'),
(290, 185, 'RO', 'CL', 'Călăraşi'),
(291, 185, 'RO', 'CJ', 'Cluj'),
(292, 185, 'RO', 'CT', 'Constanţa'),
(293, 185, 'RO', 'CV', 'Covasna'),
(294, 185, 'RO', 'DB', 'Dâmboviţa'),
(295, 185, 'RO', 'DJ', 'Dolj'),
(296, 185, 'RO', 'GL', 'Galaţi'),
(297, 185, 'RO', 'GR', 'Giurgiu'),
(298, 185, 'RO', 'GJ', 'Gorj'),
(299, 185, 'RO', 'HR', 'Harghita'),
(300, 185, 'RO', 'HD', 'Hunedoara'),
(301, 185, 'RO', 'IL', 'Ialomiţa'),
(302, 185, 'RO', 'IS', 'Iaşi'),
(303, 185, 'RO', 'IF', 'Ilfov'),
(304, 185, 'RO', 'MM', 'Maramureş'),
(305, 185, 'RO', 'MH', 'Mehedinţi'),
(306, 185, 'RO', 'MS', 'Mureş'),
(307, 185, 'RO', 'NT', 'Neamţ'),
(308, 185, 'RO', 'OT', 'Olt'),
(309, 185, 'RO', 'PH', 'Prahova'),
(310, 185, 'RO', 'SM', 'Satu-Mare'),
(311, 185, 'RO', 'SJ', 'Sălaj'),
(312, 185, 'RO', 'SB', 'Sibiu'),
(313, 185, 'RO', 'SV', 'Suceava'),
(314, 185, 'RO', 'TR', 'Teleorman'),
(315, 185, 'RO', 'TM', 'Timiş'),
(316, 185, 'RO', 'TL', 'Tulcea'),
(317, 185, 'RO', 'VS', 'Vaslui'),
(318, 185, 'RO', 'VL', 'Vâlcea'),
(319, 185, 'RO', 'VN', 'Vrancea'),
(320, 80, 'FI', 'Lappi', 'Lappi'),
(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 80, 'FI', 'Kainuu', 'Kainuu'),
(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 80, 'FI', 'Satakunta', 'Satakunta'),
(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 74, 'EE', 'EE-37', 'Harjumaa'),
(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 74, 'EE', 'EE-51', 'Järvamaa'),
(345, 74, 'EE', 'EE-57', 'Läänemaa'),
(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
(349, 74, 'EE', 'EE-70', 'Raplamaa'),
(350, 74, 'EE', 'EE-74', 'Saaremaa'),
(351, 74, 'EE', 'EE-78', 'Tartumaa'),
(352, 74, 'EE', 'EE-82', 'Valgamaa'),
(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
(354, 74, 'EE', 'EE-86', 'Võrumaa'),
(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 125, 'LV', 'LV-RIX', 'Rīga'),
(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 125, 'LV', 'Valmiera', 'Valmiera'),
(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 125, 'LV', 'Apes novads', 'Apes novads'),
(375, 125, 'LV', 'Auces novads', 'Auces novads'),
(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 125, 'LV', 'Engures novads', 'Engures novads'),
(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 125, 'LV', 'Salas novads', 'Salas novads'),
(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 31, 'BR', 'AC', 'Acre'),
(486, 31, 'BR', 'AL', 'Alagoas'),
(487, 31, 'BR', 'AP', 'Amapá'),
(488, 31, 'BR', 'AM', 'Amazonas'),
(489, 31, 'BR', 'BA', 'Bahia'),
(490, 31, 'BR', 'CE', 'Ceará'),
(491, 31, 'BR', 'ES', 'Espírito Santo'),
(492, 31, 'BR', 'GO', 'Goiás'),
(493, 31, 'BR', 'MA', 'Maranhão'),
(494, 31, 'BR', 'MT', 'Mato Grosso'),
(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 31, 'BR', 'MG', 'Minas Gerais'),
(497, 31, 'BR', 'PA', 'Pará'),
(498, 31, 'BR', 'PB', 'Paraíba'),
(499, 31, 'BR', 'PR', 'Paraná'),
(500, 31, 'BR', 'PE', 'Pernambuco'),
(501, 31, 'BR', 'PI', 'Piauí'),
(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 31, 'BR', 'RO', 'Rondônia'),
(506, 31, 'BR', 'RR', 'Roraima'),
(507, 31, 'BR', 'SC', 'Santa Catarina'),
(508, 31, 'BR', 'SP', 'São Paulo'),
(509, 31, 'BR', 'SE', 'Sergipe'),
(510, 31, 'BR', 'TO', 'Tocantins'),
(511, 31, 'BR', 'DF', 'Distrito Federal'),
(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 59, 'HR', 'HR-18', 'Istarska županija'),
(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 106, 'IN', 'AS', 'Assam'),
(537, 106, 'IN', 'BR', 'Bihar'),
(538, 106, 'IN', 'CH', 'Chandigarh'),
(539, 106, 'IN', 'CT', 'Chhattisgarh'),
(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 106, 'IN', 'DD', 'Daman and Diu'),
(542, 106, 'IN', 'DL', 'Delhi'),
(543, 106, 'IN', 'GA', 'Goa'),
(544, 106, 'IN', 'GJ', 'Gujarat'),
(545, 106, 'IN', 'HR', 'Haryana'),
(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 106, 'IN', 'JH', 'Jharkhand'),
(549, 106, 'IN', 'KA', 'Karnataka'),
(550, 106, 'IN', 'KL', 'Kerala'),
(551, 106, 'IN', 'LD', 'Lakshadweep'),
(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
(553, 106, 'IN', 'MH', 'Maharashtra'),
(554, 106, 'IN', 'MN', 'Manipur'),
(555, 106, 'IN', 'ML', 'Meghalaya'),
(556, 106, 'IN', 'MZ', 'Mizoram'),
(557, 106, 'IN', 'NL', 'Nagaland'),
(558, 106, 'IN', 'OR', 'Odisha'),
(559, 106, 'IN', 'PY', 'Puducherry'),
(560, 106, 'IN', 'PB', 'Punjab'),
(561, 106, 'IN', 'RJ', 'Rajasthan'),
(562, 106, 'IN', 'SK', 'Sikkim'),
(563, 106, 'IN', 'TN', 'Tamil Nadu'),
(564, 106, 'IN', 'TG', 'Telangana'),
(565, 106, 'IN', 'TR', 'Tripura'),
(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
(567, 106, 'IN', 'UT', 'Uttarakhand'),
(568, 106, 'IN', 'WB', 'West Bengal'),
(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
(571, 176, 'PY', 'PY-13', 'Amambay'),
(572, 176, 'PY', 'PY-ASU', 'Asunción'),
(573, 176, 'PY', 'PY-19', 'Boquerón'),
(574, 176, 'PY', 'PY-5', 'Caaguazú'),
(575, 176, 'PY', 'PY-6', 'Caazapá'),
(576, 176, 'PY', 'PY-14', 'Canindeyú'),
(577, 176, 'PY', 'PY-11', 'Central'),
(578, 176, 'PY', 'PY-1', 'Concepción'),
(579, 176, 'PY', 'PY-3', 'Cordillera'),
(580, 176, 'PY', 'PY-4', 'Guairá'),
(581, 176, 'PY', 'PY-7', 'Itapúa'),
(582, 176, 'PY', 'PY-8', 'Misiones'),
(583, 176, 'PY', 'PY-9', 'Paraguarí'),
(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
(585, 176, 'PY', 'PY-2', 'San Pedro'),
(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- --------------------------------------------------------

--
-- Table structure for table `country_state_translations`
--

CREATE TABLE `country_state_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_state_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `default_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_state_translations`
--

INSERT INTO `country_state_translations` (`id`, `country_state_id`, `locale`, `default_name`) VALUES
(1, 1, 'ar', 'ألاباما'),
(2, 2, 'ar', 'ألاسكا'),
(3, 3, 'ar', 'ساموا الأمريكية'),
(4, 4, 'ar', 'أريزونا'),
(5, 5, 'ar', 'أركنساس'),
(6, 6, 'ar', 'القوات المسلحة أفريقيا'),
(7, 7, 'ar', 'القوات المسلحة الأمريكية'),
(8, 8, 'ar', 'القوات المسلحة الكندية'),
(9, 9, 'ar', 'القوات المسلحة أوروبا'),
(10, 10, 'ar', 'القوات المسلحة الشرق الأوسط'),
(11, 11, 'ar', 'القوات المسلحة في المحيط الهادئ'),
(12, 12, 'ar', 'كاليفورنيا'),
(13, 13, 'ar', 'كولورادو'),
(14, 14, 'ar', 'كونيتيكت'),
(15, 15, 'ar', 'ديلاوير'),
(16, 16, 'ar', 'مقاطعة كولومبيا'),
(17, 17, 'ar', 'ولايات ميكرونيزيا الموحدة'),
(18, 18, 'ar', 'فلوريدا'),
(19, 19, 'ar', 'جورجيا'),
(20, 20, 'ar', 'غوام'),
(21, 21, 'ar', 'هاواي'),
(22, 22, 'ar', 'ايداهو'),
(23, 23, 'ar', 'إلينوي'),
(24, 24, 'ar', 'إنديانا'),
(25, 25, 'ar', 'أيوا'),
(26, 26, 'ar', 'كانساس'),
(27, 27, 'ar', 'كنتاكي'),
(28, 28, 'ar', 'لويزيانا'),
(29, 29, 'ar', 'مين'),
(30, 30, 'ar', 'جزر مارشال'),
(31, 31, 'ar', 'ماريلاند'),
(32, 32, 'ar', 'ماساتشوستس'),
(33, 33, 'ar', 'ميشيغان'),
(34, 34, 'ar', 'مينيسوتا'),
(35, 35, 'ar', 'ميسيسيبي'),
(36, 36, 'ar', 'ميسوري'),
(37, 37, 'ar', 'مونتانا'),
(38, 38, 'ar', 'نبراسكا'),
(39, 39, 'ar', 'نيفادا'),
(40, 40, 'ar', 'نيو هامبشاير'),
(41, 41, 'ar', 'نيو جيرسي'),
(42, 42, 'ar', 'المكسيك جديدة'),
(43, 43, 'ar', 'نيويورك'),
(44, 44, 'ar', 'شمال كارولينا'),
(45, 45, 'ar', 'شمال داكوتا'),
(46, 46, 'ar', 'جزر مريانا الشمالية'),
(47, 47, 'ar', 'أوهايو'),
(48, 48, 'ar', 'أوكلاهوما'),
(49, 49, 'ar', 'ولاية أوريغون'),
(50, 50, 'ar', 'بالاو'),
(51, 51, 'ar', 'بنسلفانيا'),
(52, 52, 'ar', 'بورتوريكو'),
(53, 53, 'ar', 'جزيرة رود'),
(54, 54, 'ar', 'كارولينا الجنوبية'),
(55, 55, 'ar', 'جنوب داكوتا'),
(56, 56, 'ar', 'تينيسي'),
(57, 57, 'ar', 'تكساس'),
(58, 58, 'ar', 'يوتا'),
(59, 59, 'ar', 'فيرمونت'),
(60, 60, 'ar', 'جزر فيرجن'),
(61, 61, 'ar', 'فرجينيا'),
(62, 62, 'ar', 'واشنطن'),
(63, 63, 'ar', 'فرجينيا الغربية'),
(64, 64, 'ar', 'ولاية ويسكونسن'),
(65, 65, 'ar', 'وايومنغ'),
(66, 66, 'ar', 'ألبرتا'),
(67, 67, 'ar', 'كولومبيا البريطانية'),
(68, 68, 'ar', 'مانيتوبا'),
(69, 69, 'ar', 'نيوفاوندلاند ولابرادور'),
(70, 70, 'ar', 'برونزيك جديد'),
(71, 71, 'ar', 'مقاطعة نفوفا سكوشيا'),
(72, 72, 'ar', 'الاقاليم الشمالية الغربية'),
(73, 73, 'ar', 'نونافوت'),
(74, 74, 'ar', 'أونتاريو'),
(75, 75, 'ar', 'جزيرة الأمير ادوارد'),
(76, 76, 'ar', 'كيبيك'),
(77, 77, 'ar', 'ساسكاتشوان'),
(78, 78, 'ar', 'إقليم يوكون'),
(79, 79, 'ar', 'Niedersachsen'),
(80, 80, 'ar', 'بادن فورتمبيرغ'),
(81, 81, 'ar', 'بايرن ميونيخ'),
(82, 82, 'ar', 'برلين'),
(83, 83, 'ar', 'براندنبورغ'),
(84, 84, 'ar', 'بريمن'),
(85, 85, 'ar', 'هامبورغ'),
(86, 86, 'ar', 'هيسن'),
(87, 87, 'ar', 'مكلنبورغ-فوربومرن'),
(88, 88, 'ar', 'نوردراين فيستفالن'),
(89, 89, 'ar', 'راينلاند-بفالز'),
(90, 90, 'ar', 'سارلاند'),
(91, 91, 'ar', 'ساكسن'),
(92, 92, 'ar', 'سكسونيا أنهالت'),
(93, 93, 'ar', 'شليسفيغ هولشتاين'),
(94, 94, 'ar', 'تورنغن'),
(95, 95, 'ar', 'فيينا'),
(96, 96, 'ar', 'النمسا السفلى'),
(97, 97, 'ar', 'النمسا العليا'),
(98, 98, 'ar', 'سالزبورغ'),
(99, 99, 'ar', 'Каринтия'),
(100, 100, 'ar', 'STEIERMARK'),
(101, 101, 'ar', 'تيرول'),
(102, 102, 'ar', 'بورغنلاند'),
(103, 103, 'ar', 'فورارلبرغ'),
(104, 104, 'ar', 'أرجاو'),
(105, 105, 'ar', 'Appenzell Innerrhoden'),
(106, 106, 'ar', 'أبنزل أوسيرهودن'),
(107, 107, 'ar', 'برن'),
(108, 108, 'ar', 'كانتون ريف بازل'),
(109, 109, 'ar', 'بازل شتات'),
(110, 110, 'ar', 'فرايبورغ'),
(111, 111, 'ar', 'Genf'),
(112, 112, 'ar', 'جلاروس'),
(113, 113, 'ar', 'غراوبوندن'),
(114, 114, 'ar', 'العصر الجوارسي أو الجوري'),
(115, 115, 'ar', 'لوزيرن'),
(116, 116, 'ar', 'في Neuenburg'),
(117, 117, 'ar', 'نيدوالدن'),
(118, 118, 'ar', 'أوبوالدن'),
(119, 119, 'ar', 'سانت غالن'),
(120, 120, 'ar', 'شافهاوزن'),
(121, 121, 'ar', 'سولوتورن'),
(122, 122, 'ar', 'شفيتس'),
(123, 123, 'ar', 'ثورجو'),
(124, 124, 'ar', 'تيتشينو'),
(125, 125, 'ar', 'أوري'),
(126, 126, 'ar', 'وادت'),
(127, 127, 'ar', 'اليس'),
(128, 128, 'ar', 'زوغ'),
(129, 129, 'ar', 'زيورخ'),
(130, 130, 'ar', 'Corunha'),
(131, 131, 'ar', 'ألافا'),
(132, 132, 'ar', 'الباسيتي'),
(133, 133, 'ar', 'اليكانتي'),
(134, 134, 'ar', 'الميريا'),
(135, 135, 'ar', 'أستورياس'),
(136, 136, 'ar', 'أفيلا'),
(137, 137, 'ar', 'بطليوس'),
(138, 138, 'ar', 'البليار'),
(139, 139, 'ar', 'برشلونة'),
(140, 140, 'ar', 'برغش'),
(141, 141, 'ar', 'كاسيريس'),
(142, 142, 'ar', 'كاديز'),
(143, 143, 'ar', 'كانتابريا'),
(144, 144, 'ar', 'كاستيلون'),
(145, 145, 'ar', 'سبتة'),
(146, 146, 'ar', 'سيوداد ريال'),
(147, 147, 'ar', 'قرطبة'),
(148, 148, 'ar', 'كوينكا'),
(149, 149, 'ar', 'جيرونا'),
(150, 150, 'ar', 'غرناطة'),
(151, 151, 'ar', 'غوادالاخارا'),
(152, 152, 'ar', 'بجويبوزكوا'),
(153, 153, 'ar', 'هويلفا'),
(154, 154, 'ar', 'هويسكا'),
(155, 155, 'ar', 'خاين'),
(156, 156, 'ar', 'لاريوخا'),
(157, 157, 'ar', 'لاس بالماس'),
(158, 158, 'ar', 'ليون'),
(159, 159, 'ar', 'يدا'),
(160, 160, 'ar', 'لوغو'),
(161, 161, 'ar', 'مدريد'),
(162, 162, 'ar', 'ملقة'),
(163, 163, 'ar', 'مليلية'),
(164, 164, 'ar', 'مورسيا'),
(165, 165, 'ar', 'نافارا'),
(166, 166, 'ar', 'أورينس'),
(167, 167, 'ar', 'بلنسية'),
(168, 168, 'ar', 'بونتيفيدرا'),
(169, 169, 'ar', 'سالامانكا'),
(170, 170, 'ar', 'سانتا كروز دي تينيريفي'),
(171, 171, 'ar', 'سيغوفيا'),
(172, 172, 'ar', 'اشبيلية'),
(173, 173, 'ar', 'سوريا'),
(174, 174, 'ar', 'تاراغونا'),
(175, 175, 'ar', 'تيرويل'),
(176, 176, 'ar', 'توليدو'),
(177, 177, 'ar', 'فالنسيا'),
(178, 178, 'ar', 'بلد الوليد'),
(179, 179, 'ar', 'فيزكايا'),
(180, 180, 'ar', 'زامورا'),
(181, 181, 'ar', 'سرقسطة'),
(182, 182, 'ar', 'عين'),
(183, 183, 'ar', 'أيسن'),
(184, 184, 'ar', 'اليي'),
(185, 185, 'ar', 'ألب البروفنس العليا'),
(186, 186, 'ar', 'أوتس ألب'),
(187, 187, 'ar', 'ألب ماريتيم'),
(188, 188, 'ar', 'ARDECHE'),
(189, 189, 'ar', 'Ardennes'),
(190, 190, 'ar', 'آردن'),
(191, 191, 'ar', 'أوب'),
(192, 192, 'ar', 'اود'),
(193, 193, 'ar', 'أفيرون'),
(194, 194, 'ar', 'بوكاس دو رون'),
(195, 195, 'ar', 'كالفادوس'),
(196, 196, 'ar', 'كانتال'),
(197, 197, 'ar', 'شارانت'),
(198, 198, 'ar', 'سيين إت مارن'),
(199, 199, 'ar', 'شير'),
(200, 200, 'ar', 'كوريز'),
(201, 201, 'ar', 'سود كورس-دو-'),
(202, 202, 'ar', 'هوت كورس'),
(203, 203, 'ar', 'كوستا دوركوريز'),
(204, 204, 'ar', 'كوتس دورمور'),
(205, 205, 'ar', 'كروز'),
(206, 206, 'ar', 'دوردوني'),
(207, 207, 'ar', 'دوبس'),
(208, 208, 'ar', 'DrômeFinistère'),
(209, 209, 'ar', 'أور'),
(210, 210, 'ar', 'أور ولوار'),
(211, 211, 'ar', 'فينيستير'),
(212, 212, 'ar', 'جارد'),
(213, 213, 'ar', 'هوت غارون'),
(214, 214, 'ar', 'الخيام'),
(215, 215, 'ar', 'جيروند'),
(216, 216, 'ar', 'هيرولت'),
(217, 217, 'ar', 'إيل وفيلان'),
(218, 218, 'ar', 'إندر'),
(219, 219, 'ar', 'أندر ولوار'),
(220, 220, 'ar', 'إيسر'),
(221, 221, 'ar', 'العصر الجوارسي أو الجوري'),
(222, 222, 'ar', 'اندز'),
(223, 223, 'ar', 'لوار وشير'),
(224, 224, 'ar', 'لوار'),
(225, 225, 'ar', 'هوت-لوار'),
(226, 226, 'ar', 'وار أتلانتيك'),
(227, 227, 'ar', 'لورا'),
(228, 228, 'ar', 'كثيرا'),
(229, 229, 'ar', 'الكثير غارون'),
(230, 230, 'ar', 'لوزر'),
(231, 231, 'ar', 'مين-إي-لوار'),
(232, 232, 'ar', 'المانش'),
(233, 233, 'ar', 'مارن'),
(234, 234, 'ar', 'هوت مارن'),
(235, 235, 'ar', 'مايين'),
(236, 236, 'ar', 'مورت وموزيل'),
(237, 237, 'ar', 'ميوز'),
(238, 238, 'ar', 'موربيهان'),
(239, 239, 'ar', 'موسيل'),
(240, 240, 'ar', 'نيفر'),
(241, 241, 'ar', 'نورد'),
(242, 242, 'ar', 'إيل دو فرانس'),
(243, 243, 'ar', 'أورن'),
(244, 244, 'ar', 'با-دو-كاليه'),
(245, 245, 'ar', 'بوي دي دوم'),
(246, 246, 'ar', 'البرانيس ​​الأطلسية'),
(247, 247, 'ar', 'أوتس-بيرينيهs'),
(248, 248, 'ar', 'بيرينيه-أورينتال'),
(249, 249, 'ar', 'بس رين'),
(250, 250, 'ar', 'أوت رين'),
(251, 251, 'ar', 'رون [3]'),
(252, 252, 'ar', 'هوت-سون'),
(253, 253, 'ar', 'سون ولوار'),
(254, 254, 'ar', 'سارت'),
(255, 255, 'ar', 'سافوا'),
(256, 256, 'ar', 'هاوت سافوي'),
(257, 257, 'ar', 'باريس'),
(258, 258, 'ar', 'سين البحرية'),
(259, 259, 'ar', 'سيين إت مارن'),
(260, 260, 'ar', 'إيفلين'),
(261, 261, 'ar', 'دوكس سفرس'),
(262, 262, 'ar', 'السوم'),
(263, 263, 'ar', 'تارن'),
(264, 264, 'ar', 'تارن وغارون'),
(265, 265, 'ar', 'فار'),
(266, 266, 'ar', 'فوكلوز'),
(267, 267, 'ar', 'تارن'),
(268, 268, 'ar', 'فيين'),
(269, 269, 'ar', 'هوت فيين'),
(270, 270, 'ar', 'الفوج'),
(271, 271, 'ar', 'يون'),
(272, 272, 'ar', 'تيريتوير-دي-بلفور'),
(273, 273, 'ar', 'إيسون'),
(274, 274, 'ar', 'هوت دو سين'),
(275, 275, 'ar', 'سين سان دوني'),
(276, 276, 'ar', 'فال دو مارن'),
(277, 277, 'ar', 'فال دواز'),
(278, 278, 'ar', 'ألبا'),
(279, 279, 'ar', 'اراد'),
(280, 280, 'ar', 'ARGES'),
(281, 281, 'ar', 'باكاو'),
(282, 282, 'ar', 'بيهور'),
(283, 283, 'ar', 'بيستريتا ناسود'),
(284, 284, 'ar', 'بوتوساني'),
(285, 285, 'ar', 'براشوف'),
(286, 286, 'ar', 'برايلا'),
(287, 287, 'ar', 'بوخارست'),
(288, 288, 'ar', 'بوزاو'),
(289, 289, 'ar', 'كاراس سيفيرين'),
(290, 290, 'ar', 'كالاراسي'),
(291, 291, 'ar', 'كلوج'),
(292, 292, 'ar', 'كونستانتا'),
(293, 293, 'ar', 'كوفاسنا'),
(294, 294, 'ar', 'دامبوفيتا'),
(295, 295, 'ar', 'دولج'),
(296, 296, 'ar', 'جالاتي'),
(297, 297, 'ar', 'Giurgiu'),
(298, 298, 'ar', 'غيورغيو'),
(299, 299, 'ar', 'هارغيتا'),
(300, 300, 'ar', 'هونيدوارا'),
(301, 301, 'ar', 'ايالوميتا'),
(302, 302, 'ar', 'ياشي'),
(303, 303, 'ar', 'إيلفوف'),
(304, 304, 'ar', 'مارامريس'),
(305, 305, 'ar', 'MEHEDINTI'),
(306, 306, 'ar', 'موريس'),
(307, 307, 'ar', 'نيامتس'),
(308, 308, 'ar', 'أولت'),
(309, 309, 'ar', 'براهوفا'),
(310, 310, 'ar', 'ساتو ماري'),
(311, 311, 'ar', 'سالاج'),
(312, 312, 'ar', 'سيبيو'),
(313, 313, 'ar', 'سوسيفا'),
(314, 314, 'ar', 'تيليورمان'),
(315, 315, 'ar', 'تيم هو'),
(316, 316, 'ar', 'تولسيا'),
(317, 317, 'ar', 'فاسلوي'),
(318, 318, 'ar', 'فالسيا'),
(319, 319, 'ar', 'فرانتشا'),
(320, 320, 'ar', 'Lappi'),
(321, 321, 'ar', 'Pohjois-Pohjanmaa'),
(322, 322, 'ar', 'كاينو'),
(323, 323, 'ar', 'Pohjois-كارجالا'),
(324, 324, 'ar', 'Pohjois-سافو'),
(325, 325, 'ar', 'Etelä-سافو'),
(326, 326, 'ar', 'Etelä-Pohjanmaa'),
(327, 327, 'ar', 'Pohjanmaa'),
(328, 328, 'ar', 'بيركنما'),
(329, 329, 'ar', 'ساتا كونتا'),
(330, 330, 'ar', 'كسكي-Pohjanmaa'),
(331, 331, 'ar', 'كسكي-سومي'),
(332, 332, 'ar', 'Varsinais-سومي'),
(333, 333, 'ar', 'Etelä-كارجالا'),
(334, 334, 'ar', 'Päijät-Häme'),
(335, 335, 'ar', 'كانتا-HAME'),
(336, 336, 'ar', 'أوسيما'),
(337, 337, 'ar', 'أوسيما'),
(338, 338, 'ar', 'كومنلاكسو'),
(339, 339, 'ar', 'Ahvenanmaa'),
(340, 340, 'ar', 'Harjumaa'),
(341, 341, 'ar', 'هيوما'),
(342, 342, 'ar', 'المؤسسة الدولية للتنمية فيروما'),
(343, 343, 'ar', 'جوغفما'),
(344, 344, 'ar', 'يارفا'),
(345, 345, 'ar', 'انيما'),
(346, 346, 'ar', 'اني فيريوما'),
(347, 347, 'ar', 'بولفاما'),
(348, 348, 'ar', 'بارنوما'),
(349, 349, 'ar', 'Raplamaa'),
(350, 350, 'ar', 'Saaremaa'),
(351, 351, 'ar', 'Tartumaa'),
(352, 352, 'ar', 'Valgamaa'),
(353, 353, 'ar', 'Viljandimaa'),
(354, 354, 'ar', 'روايات Salacgr novvas'),
(355, 355, 'ar', 'داوجافبيلس'),
(356, 356, 'ar', 'يلغافا'),
(357, 357, 'ar', 'يكاب'),
(358, 358, 'ar', 'يورمال'),
(359, 359, 'ar', 'يابايا'),
(360, 360, 'ar', 'ليباج أبريس'),
(361, 361, 'ar', 'ريزكن'),
(362, 362, 'ar', 'ريغا'),
(363, 363, 'ar', 'مقاطعة ريغا'),
(364, 364, 'ar', 'فالميرا'),
(365, 365, 'ar', 'فنتسبيلز'),
(366, 366, 'ar', 'روايات Aglonas'),
(367, 367, 'ar', 'Aizkraukles novads'),
(368, 368, 'ar', 'Aizkraukles novads'),
(369, 369, 'ar', 'Aknīstes novads'),
(370, 370, 'ar', 'Alojas novads'),
(371, 371, 'ar', 'روايات Alsungas'),
(372, 372, 'ar', 'ألكسنس أبريز'),
(373, 373, 'ar', 'روايات أماتاس'),
(374, 374, 'ar', 'قرود الروايات'),
(375, 375, 'ar', 'روايات أوسيس'),
(376, 376, 'ar', 'بابيت الروايات'),
(377, 377, 'ar', 'Baldones الروايات'),
(378, 378, 'ar', 'بالتينافاس الروايات'),
(379, 379, 'ar', 'روايات بالفو'),
(380, 380, 'ar', 'Bauskas الروايات'),
(381, 381, 'ar', 'Beverīnas novads'),
(382, 382, 'ar', 'Novads Brocēnu'),
(383, 383, 'ar', 'Novads Burtnieku'),
(384, 384, 'ar', 'Carnikavas novads'),
(385, 385, 'ar', 'Cesvaines novads'),
(386, 386, 'ar', 'Ciblas novads'),
(387, 387, 'ar', 'تسو أبريس'),
(388, 388, 'ar', 'Dagdas novads'),
(389, 389, 'ar', 'Daugavpils novads'),
(390, 390, 'ar', 'روايات دوبيليس'),
(391, 391, 'ar', 'ديربيس الروايات'),
(392, 392, 'ar', 'ديربيس الروايات'),
(393, 393, 'ar', 'يشرك الروايات'),
(394, 394, 'ar', 'Garkalnes novads'),
(395, 395, 'ar', 'Grobiņas novads'),
(396, 396, 'ar', 'غولبينيس الروايات'),
(397, 397, 'ar', 'إيكافاس روايات'),
(398, 398, 'ar', 'Ikškiles novads'),
(399, 399, 'ar', 'Ilūkstes novads'),
(400, 400, 'ar', 'روايات Inčukalna'),
(401, 401, 'ar', 'Jaunjelgavas novads'),
(402, 402, 'ar', 'Jaunpiebalgas novads'),
(403, 403, 'ar', 'روايات Jaunpiebalgas'),
(404, 404, 'ar', 'Jelgavas novads'),
(405, 405, 'ar', 'جيكابيلس أبريز'),
(406, 406, 'ar', 'روايات كاندافاس'),
(407, 407, 'ar', 'Kokneses الروايات'),
(408, 408, 'ar', 'Krimuldas novads'),
(409, 409, 'ar', 'Krustpils الروايات'),
(410, 410, 'ar', 'Krāslavas Apriņķis'),
(411, 411, 'ar', 'كولدوغاس أبريز'),
(412, 412, 'ar', 'Kārsavas novads'),
(413, 413, 'ar', 'روايات ييلفاريس'),
(414, 414, 'ar', 'ليمباو أبريز'),
(415, 415, 'ar', 'روايات لباناس'),
(416, 416, 'ar', 'روايات لودزاس'),
(417, 417, 'ar', 'مقاطعة ليجاتني'),
(418, 418, 'ar', 'مقاطعة ليفاني'),
(419, 419, 'ar', 'مادونا روايات'),
(420, 420, 'ar', 'Mazsalacas novads'),
(421, 421, 'ar', 'روايات مالبلز'),
(422, 422, 'ar', 'Mārupes novads'),
(423, 423, 'ar', 'نوفاو نوكشنو'),
(424, 424, 'ar', 'روايات نيريتاس'),
(425, 425, 'ar', 'روايات نيكاس'),
(426, 426, 'ar', 'أغنام الروايات'),
(427, 427, 'ar', 'أولينيس الروايات'),
(428, 428, 'ar', 'روايات Ozolnieku'),
(429, 429, 'ar', 'بريسيو أبرييس'),
(430, 430, 'ar', 'Priekules الروايات'),
(431, 431, 'ar', 'كوندادو دي بريكوي'),
(432, 432, 'ar', 'Pärgaujas novads'),
(433, 433, 'ar', 'روايات بافيلوستاس'),
(434, 434, 'ar', 'بلافيناس مقاطعة'),
(435, 435, 'ar', 'روناس روايات'),
(436, 436, 'ar', 'Riebiņu novads'),
(437, 437, 'ar', 'روجاس روايات'),
(438, 438, 'ar', 'Novads روباو'),
(439, 439, 'ar', 'روكافاس روايات'),
(440, 440, 'ar', 'روغاجو روايات'),
(441, 441, 'ar', 'رندلس الروايات'),
(442, 442, 'ar', 'Radzeknes novads'),
(443, 443, 'ar', 'Rūjienas novads'),
(444, 444, 'ar', 'بلدية سالاسغريفا'),
(445, 445, 'ar', 'روايات سالاس'),
(446, 446, 'ar', 'Salaspils novads'),
(447, 447, 'ar', 'روايات سالدوس'),
(448, 448, 'ar', 'Novuls Saulkrastu'),
(449, 449, 'ar', 'سيغولداس روايات'),
(450, 450, 'ar', 'Skrundas novads'),
(451, 451, 'ar', 'مقاطعة Skrīveri'),
(452, 452, 'ar', 'يبتسم الروايات'),
(453, 453, 'ar', 'روايات Stopiņu'),
(454, 454, 'ar', 'روايات Stren novu'),
(455, 455, 'ar', 'سجاس روايات'),
(456, 456, 'ar', 'روايات تالسو'),
(457, 457, 'ar', 'توكوما الروايات'),
(458, 458, 'ar', 'Tērvetes novads'),
(459, 459, 'ar', 'Vaiņodes novads'),
(460, 460, 'ar', 'فالكاس الروايات'),
(461, 461, 'ar', 'فالميراس الروايات'),
(462, 462, 'ar', 'مقاطعة فاكلاني'),
(463, 463, 'ar', 'Vecpiebalgas novads'),
(464, 464, 'ar', 'روايات Vecumnieku'),
(465, 465, 'ar', 'فنتسبيلس الروايات'),
(466, 466, 'ar', 'Viesītes Novads'),
(467, 467, 'ar', 'Viļakas novads'),
(468, 468, 'ar', 'روايات فيناو'),
(469, 469, 'ar', 'Vārkavas novads'),
(470, 470, 'ar', 'روايات زيلوبس'),
(471, 471, 'ar', 'مقاطعة أدازي'),
(472, 472, 'ar', 'مقاطعة Erglu'),
(473, 473, 'ar', 'مقاطعة كيغمس'),
(474, 474, 'ar', 'مقاطعة كيكافا'),
(475, 475, 'ar', 'Alytaus Apskritis'),
(476, 476, 'ar', 'كاونو ابكريتيس'),
(477, 477, 'ar', 'Klaipėdos apskritis'),
(478, 478, 'ar', 'Marijampol\'s apskritis'),
(479, 479, 'ar', 'Panevėžio apskritis'),
(480, 480, 'ar', 'uliaulių apskritis'),
(481, 481, 'ar', 'Taurag\'s apskritis'),
(482, 482, 'ar', 'Telšių apskritis'),
(483, 483, 'ar', 'Utenos apskritis'),
(484, 484, 'ar', 'فيلنياوس ابكريتيس'),
(485, 485, 'ar', 'فدان'),
(486, 486, 'ar', 'ألاغواس'),
(487, 487, 'ar', 'أمابا'),
(488, 488, 'ar', 'أمازوناس'),
(489, 489, 'ar', 'باهيا'),
(490, 490, 'ar', 'سيارا'),
(491, 491, 'ar', 'إسبيريتو سانتو'),
(492, 492, 'ar', 'غوياس'),
(493, 493, 'ar', 'مارانهاو'),
(494, 494, 'ar', 'ماتو جروسو'),
(495, 495, 'ar', 'ماتو جروسو دو سول'),
(496, 496, 'ar', 'ميناس جريس'),
(497, 497, 'ar', 'بارا'),
(498, 498, 'ar', 'بارايبا'),
(499, 499, 'ar', 'بارانا'),
(500, 500, 'ar', 'بيرنامبوكو'),
(501, 501, 'ar', 'بياوي'),
(502, 502, 'ar', 'ريو دي جانيرو'),
(503, 503, 'ar', 'ريو غراندي دو نورتي'),
(504, 504, 'ar', 'ريو غراندي دو سول'),
(505, 505, 'ar', 'روندونيا'),
(506, 506, 'ar', 'رورايما'),
(507, 507, 'ar', 'سانتا كاتارينا'),
(508, 508, 'ar', 'ساو باولو'),
(509, 509, 'ar', 'سيرغيبي'),
(510, 510, 'ar', 'توكانتينز'),
(511, 511, 'ar', 'وفي مقاطعة الاتحادية'),
(512, 512, 'ar', 'Zagrebačka زوبانيا'),
(513, 513, 'ar', 'Krapinsko-zagorska زوبانيا'),
(514, 514, 'ar', 'Sisačko-moslavačka زوبانيا'),
(515, 515, 'ar', 'كارلوفيتش شوبانيا'),
(516, 516, 'ar', 'فارادينسكا زوبانيجا'),
(517, 517, 'ar', 'Koprivničko-križevačka زوبانيجا'),
(518, 518, 'ar', 'بيلوفارسكو-بيلوجورسكا'),
(519, 519, 'ar', 'بريمورسكو غورانسكا سوبانيا'),
(520, 520, 'ar', 'ليكو سينيسكا زوبانيا'),
(521, 521, 'ar', 'Virovitičko-podravska زوبانيا'),
(522, 522, 'ar', 'Požeško-slavonska županija'),
(523, 523, 'ar', 'Brodsko-posavska županija'),
(524, 524, 'ar', 'زادارسكا زوبانيجا'),
(525, 525, 'ar', 'Osječko-baranjska županija'),
(526, 526, 'ar', 'شيبنسكو-كنينسكا سوبانيا'),
(527, 527, 'ar', 'Virovitičko-podravska زوبانيا'),
(528, 528, 'ar', 'Splitsko-dalmatinska زوبانيا'),
(529, 529, 'ar', 'Istarska زوبانيا'),
(530, 530, 'ar', 'Dubrovačko-neretvanska زوبانيا'),
(531, 531, 'ar', 'Međimurska زوبانيا'),
(532, 532, 'ar', 'غراد زغرب'),
(533, 533, 'ar', 'جزر أندامان ونيكوبار'),
(534, 534, 'ar', 'ولاية اندرا براديش'),
(535, 535, 'ar', 'اروناتشال براديش'),
(536, 536, 'ar', 'أسام'),
(537, 537, 'ar', 'بيهار'),
(538, 538, 'ar', 'شانديغار'),
(539, 539, 'ar', 'تشهاتيسجاره'),
(540, 540, 'ar', 'دادرا ونجار هافيلي'),
(541, 541, 'ar', 'دامان وديو'),
(542, 542, 'ar', 'دلهي'),
(543, 543, 'ar', 'غوا'),
(544, 544, 'ar', 'غوجارات'),
(545, 545, 'ar', 'هاريانا'),
(546, 546, 'ar', 'هيماشال براديش'),
(547, 547, 'ar', 'جامو وكشمير'),
(548, 548, 'ar', 'جهارخاند'),
(549, 549, 'ar', 'كارناتاكا'),
(550, 550, 'ar', 'ولاية كيرالا'),
(551, 551, 'ar', 'اكشادويب'),
(552, 552, 'ar', 'ماديا براديش'),
(553, 553, 'ar', 'ماهاراشترا'),
(554, 554, 'ar', 'مانيبور'),
(555, 555, 'ar', 'ميغالايا'),
(556, 556, 'ar', 'ميزورام'),
(557, 557, 'ar', 'ناجالاند'),
(558, 558, 'ar', 'أوديشا'),
(559, 559, 'ar', 'بودوتشيري'),
(560, 560, 'ar', 'البنجاب'),
(561, 561, 'ar', 'راجستان'),
(562, 562, 'ar', 'سيكيم'),
(563, 563, 'ar', 'تاميل نادو'),
(564, 564, 'ar', 'تيلانجانا'),
(565, 565, 'ar', 'تريبورا'),
(566, 566, 'ar', 'ولاية اوتار براديش'),
(567, 567, 'ar', 'أوتارانتشال'),
(568, 568, 'ar', 'البنغال الغربية'),
(569, 1, 'es', 'Alabama'),
(570, 2, 'es', 'Alaska'),
(571, 3, 'es', 'American Samoa'),
(572, 4, 'es', 'Arizona'),
(573, 5, 'es', 'Arkansas'),
(574, 6, 'es', 'Armed Forces Africa'),
(575, 7, 'es', 'Armed Forces Americas'),
(576, 8, 'es', 'Armed Forces Canada'),
(577, 9, 'es', 'Armed Forces Europe'),
(578, 10, 'es', 'Armed Forces Middle East'),
(579, 11, 'es', 'Armed Forces Pacific'),
(580, 12, 'es', 'California'),
(581, 13, 'es', 'Colorado'),
(582, 14, 'es', 'Connecticut'),
(583, 15, 'es', 'Delaware'),
(584, 16, 'es', 'District of Columbia'),
(585, 17, 'es', 'Federated States Of Micronesia'),
(586, 18, 'es', 'Florida'),
(587, 19, 'es', 'Georgia'),
(588, 20, 'es', 'Guam'),
(589, 21, 'es', 'Hawaii'),
(590, 22, 'es', 'Idaho'),
(591, 23, 'es', 'Illinois'),
(592, 24, 'es', 'Indiana'),
(593, 25, 'es', 'Iowa'),
(594, 26, 'es', 'Kansas'),
(595, 27, 'es', 'Kentucky'),
(596, 28, 'es', 'Louisiana'),
(597, 29, 'es', 'Maine'),
(598, 30, 'es', 'Marshall Islands'),
(599, 31, 'es', 'Maryland'),
(600, 32, 'es', 'Massachusetts'),
(601, 33, 'es', 'Michigan'),
(602, 34, 'es', 'Minnesota'),
(603, 35, 'es', 'Mississippi'),
(604, 36, 'es', 'Missouri'),
(605, 37, 'es', 'Montana'),
(606, 38, 'es', 'Nebraska'),
(607, 39, 'es', 'Nevada'),
(608, 40, 'es', 'New Hampshire'),
(609, 41, 'es', 'New Jersey'),
(610, 42, 'es', 'New Mexico'),
(611, 43, 'es', 'New York'),
(612, 44, 'es', 'North Carolina'),
(613, 45, 'es', 'North Dakota'),
(614, 46, 'es', 'Northern Mariana Islands'),
(615, 47, 'es', 'Ohio'),
(616, 48, 'es', 'Oklahoma'),
(617, 49, 'es', 'Oregon'),
(618, 50, 'es', 'Palau'),
(619, 51, 'es', 'Pennsylvania'),
(620, 52, 'es', 'Puerto Rico'),
(621, 53, 'es', 'Rhode Island'),
(622, 54, 'es', 'South Carolina'),
(623, 55, 'es', 'South Dakota'),
(624, 56, 'es', 'Tennessee'),
(625, 57, 'es', 'Texas'),
(626, 58, 'es', 'Utah'),
(627, 59, 'es', 'Vermont'),
(628, 60, 'es', 'Virgin Islands'),
(629, 61, 'es', 'Virginia'),
(630, 62, 'es', 'Washington'),
(631, 63, 'es', 'West Virginia'),
(632, 64, 'es', 'Wisconsin'),
(633, 65, 'es', 'Wyoming'),
(634, 66, 'es', 'Alberta'),
(635, 67, 'es', 'British Columbia'),
(636, 68, 'es', 'Manitoba'),
(637, 69, 'es', 'Newfoundland and Labrador'),
(638, 70, 'es', 'New Brunswick'),
(639, 71, 'es', 'Nova Scotia'),
(640, 72, 'es', 'Northwest Territories'),
(641, 73, 'es', 'Nunavut'),
(642, 74, 'es', 'Ontario'),
(643, 75, 'es', 'Prince Edward Island'),
(644, 76, 'es', 'Quebec'),
(645, 77, 'es', 'Saskatchewan'),
(646, 78, 'es', 'Yukon Territory'),
(647, 79, 'es', 'Niedersachsen'),
(648, 80, 'es', 'Baden-Württemberg'),
(649, 81, 'es', 'Bayern'),
(650, 82, 'es', 'Berlin'),
(651, 83, 'es', 'Brandenburg'),
(652, 84, 'es', 'Bremen'),
(653, 85, 'es', 'Hamburg'),
(654, 86, 'es', 'Hessen'),
(655, 87, 'es', 'Mecklenburg-Vorpommern'),
(656, 88, 'es', 'Nordrhein-Westfalen'),
(657, 89, 'es', 'Rheinland-Pfalz'),
(658, 90, 'es', 'Saarland'),
(659, 91, 'es', 'Sachsen'),
(660, 92, 'es', 'Sachsen-Anhalt'),
(661, 93, 'es', 'Schleswig-Holstein'),
(662, 94, 'es', 'Thüringen'),
(663, 95, 'es', 'Wien'),
(664, 96, 'es', 'Niederösterreich'),
(665, 97, 'es', 'Oberösterreich'),
(666, 98, 'es', 'Salzburg'),
(667, 99, 'es', 'Kärnten'),
(668, 100, 'es', 'Steiermark'),
(669, 101, 'es', 'Tirol'),
(670, 102, 'es', 'Burgenland'),
(671, 103, 'es', 'Vorarlberg'),
(672, 104, 'es', 'Aargau'),
(673, 105, 'es', 'Appenzell Innerrhoden'),
(674, 106, 'es', 'Appenzell Ausserrhoden'),
(675, 107, 'es', 'Bern'),
(676, 108, 'es', 'Basel-Landschaft'),
(677, 109, 'es', 'Basel-Stadt'),
(678, 110, 'es', 'Freiburg'),
(679, 111, 'es', 'Genf'),
(680, 112, 'es', 'Glarus'),
(681, 113, 'es', 'Graubünden'),
(682, 114, 'es', 'Jura'),
(683, 115, 'es', 'Luzern'),
(684, 116, 'es', 'Neuenburg'),
(685, 117, 'es', 'Nidwalden'),
(686, 118, 'es', 'Obwalden'),
(687, 119, 'es', 'St. Gallen'),
(688, 120, 'es', 'Schaffhausen'),
(689, 121, 'es', 'Solothurn'),
(690, 122, 'es', 'Schwyz'),
(691, 123, 'es', 'Thurgau'),
(692, 124, 'es', 'Tessin'),
(693, 125, 'es', 'Uri'),
(694, 126, 'es', 'Waadt'),
(695, 127, 'es', 'Wallis'),
(696, 128, 'es', 'Zug'),
(697, 129, 'es', 'Zürich'),
(698, 130, 'es', 'La Coruña'),
(699, 131, 'es', 'Álava'),
(700, 132, 'es', 'Albacete'),
(701, 133, 'es', 'Alicante'),
(702, 134, 'es', 'Almería'),
(703, 135, 'es', 'Asturias'),
(704, 136, 'es', 'Ávila'),
(705, 137, 'es', 'Badajoz'),
(706, 138, 'es', 'Baleares'),
(707, 139, 'es', 'Barcelona'),
(708, 140, 'es', 'Burgos'),
(709, 141, 'es', 'Cáceres'),
(710, 142, 'es', 'Cádiz'),
(711, 143, 'es', 'Cantabria'),
(712, 144, 'es', 'Castellón'),
(713, 145, 'es', 'Ceuta'),
(714, 146, 'es', 'Ciudad Real'),
(715, 147, 'es', 'Córdoba'),
(716, 148, 'es', 'Cuenca'),
(717, 149, 'es', 'Gerona'),
(718, 150, 'es', 'Granada'),
(719, 151, 'es', 'Guadalajara'),
(720, 152, 'es', 'Guipúzcoa'),
(721, 153, 'es', 'Huelva'),
(722, 154, 'es', 'Huesca'),
(723, 155, 'es', 'Jaén'),
(724, 156, 'es', 'La Rioja'),
(725, 157, 'es', 'Las Palmas'),
(726, 158, 'es', 'León'),
(727, 159, 'es', 'Lérida'),
(728, 160, 'es', 'Lugo'),
(729, 161, 'es', 'Madrid'),
(730, 162, 'es', 'Málaga'),
(731, 163, 'es', 'Melilla'),
(732, 164, 'es', 'Murcia'),
(733, 165, 'es', 'Navarra'),
(734, 166, 'es', 'Orense'),
(735, 167, 'es', 'Palencia'),
(736, 168, 'es', 'Pontevedra'),
(737, 169, 'es', 'Salamanca'),
(738, 170, 'es', 'Santa Cruz de Tenerife'),
(739, 171, 'es', 'Segovia'),
(740, 172, 'es', 'Sevilla'),
(741, 173, 'es', 'Soria'),
(742, 174, 'es', 'Tarragona'),
(743, 175, 'es', 'Teruel'),
(744, 176, 'es', 'Toledo'),
(745, 177, 'es', 'Valencia'),
(746, 178, 'es', 'Valladolid'),
(747, 179, 'es', 'Vizcaya'),
(748, 180, 'es', 'Zamora'),
(749, 181, 'es', 'Zaragoza'),
(750, 182, 'es', 'Ain'),
(751, 183, 'es', 'Aisne'),
(752, 184, 'es', 'Allier'),
(753, 185, 'es', 'Alpes-de-Haute-Provence'),
(754, 186, 'es', 'Hautes-Alpes'),
(755, 187, 'es', 'Alpes-Maritimes'),
(756, 188, 'es', 'Ardèche'),
(757, 189, 'es', 'Ardennes'),
(758, 190, 'es', 'Ariège'),
(759, 191, 'es', 'Aube'),
(760, 192, 'es', 'Aude'),
(761, 193, 'es', 'Aveyron'),
(762, 194, 'es', 'Bouches-du-Rhône'),
(763, 195, 'es', 'Calvados'),
(764, 196, 'es', 'Cantal'),
(765, 197, 'es', 'Charente'),
(766, 198, 'es', 'Charente-Maritime'),
(767, 199, 'es', 'Cher'),
(768, 200, 'es', 'Corrèze'),
(769, 201, 'es', 'Corse-du-Sud'),
(770, 202, 'es', 'Haute-Corse'),
(771, 203, 'es', 'Côte-d\'Or'),
(772, 204, 'es', 'Côtes-d\'Armor'),
(773, 205, 'es', 'Creuse'),
(774, 206, 'es', 'Dordogne'),
(775, 207, 'es', 'Doubs'),
(776, 208, 'es', 'Drôme'),
(777, 209, 'es', 'Eure'),
(778, 210, 'es', 'Eure-et-Loir'),
(779, 211, 'es', 'Finistère'),
(780, 212, 'es', 'Gard'),
(781, 213, 'es', 'Haute-Garonne'),
(782, 214, 'es', 'Gers'),
(783, 215, 'es', 'Gironde'),
(784, 216, 'es', 'Hérault'),
(785, 217, 'es', 'Ille-et-Vilaine'),
(786, 218, 'es', 'Indre'),
(787, 219, 'es', 'Indre-et-Loire'),
(788, 220, 'es', 'Isère'),
(789, 221, 'es', 'Jura'),
(790, 222, 'es', 'Landes'),
(791, 223, 'es', 'Loir-et-Cher'),
(792, 224, 'es', 'Loire'),
(793, 225, 'es', 'Haute-Loire'),
(794, 226, 'es', 'Loire-Atlantique'),
(795, 227, 'es', 'Loiret'),
(796, 228, 'es', 'Lot'),
(797, 229, 'es', 'Lot-et-Garonne'),
(798, 230, 'es', 'Lozère'),
(799, 231, 'es', 'Maine-et-Loire'),
(800, 232, 'es', 'Manche'),
(801, 233, 'es', 'Marne'),
(802, 234, 'es', 'Haute-Marne'),
(803, 235, 'es', 'Mayenne'),
(804, 236, 'es', 'Meurthe-et-Moselle'),
(805, 237, 'es', 'Meuse'),
(806, 238, 'es', 'Morbihan'),
(807, 239, 'es', 'Moselle'),
(808, 240, 'es', 'Nièvre'),
(809, 241, 'es', 'Nord'),
(810, 242, 'es', 'Oise'),
(811, 243, 'es', 'Orne'),
(812, 244, 'es', 'Pas-de-Calais'),
(813, 245, 'es', 'Puy-de-Dôme'),
(814, 246, 'es', 'Pyrénées-Atlantiques'),
(815, 247, 'es', 'Hautes-Pyrénées'),
(816, 248, 'es', 'Pyrénées-Orientales'),
(817, 249, 'es', 'Bas-Rhin'),
(818, 250, 'es', 'Haut-Rhin'),
(819, 251, 'es', 'Rhône'),
(820, 252, 'es', 'Haute-Saône'),
(821, 253, 'es', 'Saône-et-Loire'),
(822, 254, 'es', 'Sarthe'),
(823, 255, 'es', 'Savoie'),
(824, 256, 'es', 'Haute-Savoie'),
(825, 257, 'es', 'Paris'),
(826, 258, 'es', 'Seine-Maritime'),
(827, 259, 'es', 'Seine-et-Marne'),
(828, 260, 'es', 'Yvelines'),
(829, 261, 'es', 'Deux-Sèvres'),
(830, 262, 'es', 'Somme'),
(831, 263, 'es', 'Tarn'),
(832, 264, 'es', 'Tarn-et-Garonne'),
(833, 265, 'es', 'Var'),
(834, 266, 'es', 'Vaucluse'),
(835, 267, 'es', 'Vendée'),
(836, 268, 'es', 'Vienne'),
(837, 269, 'es', 'Haute-Vienne'),
(838, 270, 'es', 'Vosges'),
(839, 271, 'es', 'Yonne'),
(840, 272, 'es', 'Territoire-de-Belfort'),
(841, 273, 'es', 'Essonne'),
(842, 274, 'es', 'Hauts-de-Seine'),
(843, 275, 'es', 'Seine-Saint-Denis'),
(844, 276, 'es', 'Val-de-Marne'),
(845, 277, 'es', 'Val-d\'Oise'),
(846, 278, 'es', 'Alba'),
(847, 279, 'es', 'Arad'),
(848, 280, 'es', 'Argeş'),
(849, 281, 'es', 'Bacău'),
(850, 282, 'es', 'Bihor'),
(851, 283, 'es', 'Bistriţa-Năsăud'),
(852, 284, 'es', 'Botoşani'),
(853, 285, 'es', 'Braşov'),
(854, 286, 'es', 'Brăila'),
(855, 287, 'es', 'Bucureşti'),
(856, 288, 'es', 'Buzău'),
(857, 289, 'es', 'Caraş-Severin'),
(858, 290, 'es', 'Călăraşi'),
(859, 291, 'es', 'Cluj'),
(860, 292, 'es', 'Constanţa'),
(861, 293, 'es', 'Covasna'),
(862, 294, 'es', 'Dâmboviţa'),
(863, 295, 'es', 'Dolj'),
(864, 296, 'es', 'Galaţi'),
(865, 297, 'es', 'Giurgiu'),
(866, 298, 'es', 'Gorj'),
(867, 299, 'es', 'Harghita'),
(868, 300, 'es', 'Hunedoara'),
(869, 301, 'es', 'Ialomiţa'),
(870, 302, 'es', 'Iaşi'),
(871, 303, 'es', 'Ilfov'),
(872, 304, 'es', 'Maramureş'),
(873, 305, 'es', 'Mehedinţi'),
(874, 306, 'es', 'Mureş'),
(875, 307, 'es', 'Neamţ'),
(876, 308, 'es', 'Olt'),
(877, 309, 'es', 'Prahova'),
(878, 310, 'es', 'Satu-Mare'),
(879, 311, 'es', 'Sălaj'),
(880, 312, 'es', 'Sibiu'),
(881, 313, 'es', 'Suceava'),
(882, 314, 'es', 'Teleorman'),
(883, 315, 'es', 'Timiş'),
(884, 316, 'es', 'Tulcea'),
(885, 317, 'es', 'Vaslui'),
(886, 318, 'es', 'Vâlcea'),
(887, 319, 'es', 'Vrancea'),
(888, 320, 'es', 'Lappi'),
(889, 321, 'es', 'Pohjois-Pohjanmaa'),
(890, 322, 'es', 'Kainuu'),
(891, 323, 'es', 'Pohjois-Karjala'),
(892, 324, 'es', 'Pohjois-Savo'),
(893, 325, 'es', 'Etelä-Savo'),
(894, 326, 'es', 'Etelä-Pohjanmaa'),
(895, 327, 'es', 'Pohjanmaa'),
(896, 328, 'es', 'Pirkanmaa'),
(897, 329, 'es', 'Satakunta'),
(898, 330, 'es', 'Keski-Pohjanmaa'),
(899, 331, 'es', 'Keski-Suomi'),
(900, 332, 'es', 'Varsinais-Suomi'),
(901, 333, 'es', 'Etelä-Karjala'),
(902, 334, 'es', 'Päijät-Häme'),
(903, 335, 'es', 'Kanta-Häme'),
(904, 336, 'es', 'Uusimaa'),
(905, 337, 'es', 'Itä-Uusimaa'),
(906, 338, 'es', 'Kymenlaakso'),
(907, 339, 'es', 'Ahvenanmaa'),
(908, 340, 'es', 'Harjumaa'),
(909, 341, 'es', 'Hiiumaa'),
(910, 342, 'es', 'country_state_ida-Virumaa'),
(911, 343, 'es', 'Jõgevamaa'),
(912, 344, 'es', 'Järvamaa'),
(913, 345, 'es', 'Läänemaa'),
(914, 346, 'es', 'Lääne-Virumaa'),
(915, 347, 'es', 'Põlvamaa'),
(916, 348, 'es', 'Pärnumaa'),
(917, 349, 'es', 'Raplamaa'),
(918, 350, 'es', 'Saaremaa'),
(919, 351, 'es', 'Tartumaa'),
(920, 352, 'es', 'Valgamaa'),
(921, 353, 'es', 'Viljandimaa'),
(922, 354, 'es', 'Võrumaa'),
(923, 355, 'es', 'Daugavpils'),
(924, 356, 'es', 'Jelgava'),
(925, 357, 'es', 'Jēkabpils'),
(926, 358, 'es', 'Jūrmala'),
(927, 359, 'es', 'Liepāja'),
(928, 360, 'es', 'Liepājas novads'),
(929, 361, 'es', 'Rēzekne'),
(930, 362, 'es', 'Rīga'),
(931, 363, 'es', 'Rīgas novads'),
(932, 364, 'es', 'Valmiera'),
(933, 365, 'es', 'Ventspils'),
(934, 366, 'es', 'Aglonas novads'),
(935, 367, 'es', 'Aizkraukles novads'),
(936, 368, 'es', 'Aizputes novads'),
(937, 369, 'es', 'Aknīstes novads'),
(938, 370, 'es', 'Alojas novads'),
(939, 371, 'es', 'Alsungas novads'),
(940, 372, 'es', 'Alūksnes novads'),
(941, 373, 'es', 'Amatas novads'),
(942, 374, 'es', 'Apes novads'),
(943, 375, 'es', 'Auces novads'),
(944, 376, 'es', 'Babītes novads'),
(945, 377, 'es', 'Baldones novads'),
(946, 378, 'es', 'Baltinavas novads'),
(947, 379, 'es', 'Balvu novads'),
(948, 380, 'es', 'Bauskas novads'),
(949, 381, 'es', 'Beverīnas novads'),
(950, 382, 'es', 'Brocēnu novads'),
(951, 383, 'es', 'Burtnieku novads'),
(952, 384, 'es', 'Carnikavas novads'),
(953, 385, 'es', 'Cesvaines novads'),
(954, 386, 'es', 'Ciblas novads'),
(955, 387, 'es', 'Cēsu novads'),
(956, 388, 'es', 'Dagdas novads'),
(957, 389, 'es', 'Daugavpils novads'),
(958, 390, 'es', 'Dobeles novads'),
(959, 391, 'es', 'Dundagas novads'),
(960, 392, 'es', 'Durbes novads'),
(961, 393, 'es', 'Engures novads'),
(962, 394, 'es', 'Garkalnes novads'),
(963, 395, 'es', 'Grobiņas novads'),
(964, 396, 'es', 'Gulbenes novads'),
(965, 397, 'es', 'Iecavas novads'),
(966, 398, 'es', 'Ikšķiles novads'),
(967, 399, 'es', 'Ilūkstes novads'),
(968, 400, 'es', 'Inčukalna novads'),
(969, 401, 'es', 'Jaunjelgavas novads'),
(970, 402, 'es', 'Jaunpiebalgas novads'),
(971, 403, 'es', 'Jaunpils novads'),
(972, 404, 'es', 'Jelgavas novads'),
(973, 405, 'es', 'Jēkabpils novads'),
(974, 406, 'es', 'Kandavas novads'),
(975, 407, 'es', 'Kokneses novads'),
(976, 408, 'es', 'Krimuldas novads'),
(977, 409, 'es', 'Krustpils novads'),
(978, 410, 'es', 'Krāslavas novads'),
(979, 411, 'es', 'Kuldīgas novads'),
(980, 412, 'es', 'Kārsavas novads'),
(981, 413, 'es', 'Lielvārdes novads'),
(982, 414, 'es', 'Limbažu novads'),
(983, 415, 'es', 'Lubānas novads'),
(984, 416, 'es', 'Ludzas novads'),
(985, 417, 'es', 'Līgatnes novads'),
(986, 418, 'es', 'Līvānu novads'),
(987, 419, 'es', 'Madonas novads'),
(988, 420, 'es', 'Mazsalacas novads'),
(989, 421, 'es', 'Mālpils novads'),
(990, 422, 'es', 'Mārupes novads'),
(991, 423, 'es', 'Naukšēnu novads'),
(992, 424, 'es', 'Neretas novads'),
(993, 425, 'es', 'Nīcas novads'),
(994, 426, 'es', 'Ogres novads'),
(995, 427, 'es', 'Olaines novads'),
(996, 428, 'es', 'Ozolnieku novads'),
(997, 429, 'es', 'Preiļu novads'),
(998, 430, 'es', 'Priekules novads'),
(999, 431, 'es', 'Priekuļu novads'),
(1000, 432, 'es', 'Pārgaujas novads'),
(1001, 433, 'es', 'Pāvilostas novads'),
(1002, 434, 'es', 'Pļaviņu novads'),
(1003, 435, 'es', 'Raunas novads'),
(1004, 436, 'es', 'Riebiņu novads'),
(1005, 437, 'es', 'Rojas novads'),
(1006, 438, 'es', 'Ropažu novads'),
(1007, 439, 'es', 'Rucavas novads'),
(1008, 440, 'es', 'Rugāju novads'),
(1009, 441, 'es', 'Rundāles novads'),
(1010, 442, 'es', 'Rēzeknes novads'),
(1011, 443, 'es', 'Rūjienas novads'),
(1012, 444, 'es', 'Salacgrīvas novads'),
(1013, 445, 'es', 'Salas novads'),
(1014, 446, 'es', 'Salaspils novads'),
(1015, 447, 'es', 'Saldus novads'),
(1016, 448, 'es', 'Saulkrastu novads'),
(1017, 449, 'es', 'Siguldas novads'),
(1018, 450, 'es', 'Skrundas novads'),
(1019, 451, 'es', 'Skrīveru novads'),
(1020, 452, 'es', 'Smiltenes novads'),
(1021, 453, 'es', 'Stopiņu novads'),
(1022, 454, 'es', 'Strenču novads'),
(1023, 455, 'es', 'Sējas novads'),
(1024, 456, 'es', 'Talsu novads'),
(1025, 457, 'es', 'Tukuma novads'),
(1026, 458, 'es', 'Tērvetes novads'),
(1027, 459, 'es', 'Vaiņodes novads'),
(1028, 460, 'es', 'Valkas novads'),
(1029, 461, 'es', 'Valmieras novads'),
(1030, 462, 'es', 'Varakļānu novads'),
(1031, 463, 'es', 'Vecpiebalgas novads'),
(1032, 464, 'es', 'Vecumnieku novads'),
(1033, 465, 'es', 'Ventspils novads'),
(1034, 466, 'es', 'Viesītes novads'),
(1035, 467, 'es', 'Viļakas novads'),
(1036, 468, 'es', 'Viļānu novads'),
(1037, 469, 'es', 'Vārkavas novads'),
(1038, 470, 'es', 'Zilupes novads'),
(1039, 471, 'es', 'Ādažu novads'),
(1040, 472, 'es', 'Ērgļu novads'),
(1041, 473, 'es', 'Ķeguma novads'),
(1042, 474, 'es', 'Ķekavas novads'),
(1043, 475, 'es', 'Alytaus Apskritis'),
(1044, 476, 'es', 'Kauno Apskritis'),
(1045, 477, 'es', 'Klaipėdos Apskritis'),
(1046, 478, 'es', 'Marijampolės Apskritis'),
(1047, 479, 'es', 'Panevėžio Apskritis'),
(1048, 480, 'es', 'Šiaulių Apskritis'),
(1049, 481, 'es', 'Tauragės Apskritis'),
(1050, 482, 'es', 'Telšių Apskritis'),
(1051, 483, 'es', 'Utenos Apskritis'),
(1052, 484, 'es', 'Vilniaus Apskritis'),
(1053, 485, 'es', 'Acre'),
(1054, 486, 'es', 'Alagoas'),
(1055, 487, 'es', 'Amapá'),
(1056, 488, 'es', 'Amazonas'),
(1057, 489, 'es', 'Bahía'),
(1058, 490, 'es', 'Ceará'),
(1059, 491, 'es', 'Espíritu Santo'),
(1060, 492, 'es', 'Goiás'),
(1061, 493, 'es', 'Maranhão'),
(1062, 494, 'es', 'Mato Grosso'),
(1063, 495, 'es', 'Mato Grosso del Sur'),
(1064, 496, 'es', 'Minas Gerais'),
(1065, 497, 'es', 'Pará'),
(1066, 498, 'es', 'Paraíba'),
(1067, 499, 'es', 'Paraná'),
(1068, 500, 'es', 'Pernambuco'),
(1069, 501, 'es', 'Piauí'),
(1070, 502, 'es', 'Río de Janeiro'),
(1071, 503, 'es', 'Río Grande del Norte'),
(1072, 504, 'es', 'Río Grande del Sur'),
(1073, 505, 'es', 'Rondônia'),
(1074, 506, 'es', 'Roraima'),
(1075, 507, 'es', 'Santa Catarina'),
(1076, 508, 'es', 'São Paulo'),
(1077, 509, 'es', 'Sergipe'),
(1078, 510, 'es', 'Tocantins'),
(1079, 511, 'es', 'Distrito Federal'),
(1080, 512, 'es', 'Zagrebačka županija'),
(1081, 513, 'es', 'Krapinsko-zagorska županija'),
(1082, 514, 'es', 'Sisačko-moslavačka županija'),
(1083, 515, 'es', 'Karlovačka županija'),
(1084, 516, 'es', 'Varaždinska županija'),
(1085, 517, 'es', 'Koprivničko-križevačka županija'),
(1086, 518, 'es', 'Bjelovarsko-bilogorska županija'),
(1087, 519, 'es', 'Primorsko-goranska županija'),
(1088, 520, 'es', 'Ličko-senjska županija'),
(1089, 521, 'es', 'Virovitičko-podravska županija'),
(1090, 522, 'es', 'Požeško-slavonska županija'),
(1091, 523, 'es', 'Brodsko-posavska županija'),
(1092, 524, 'es', 'Zadarska županija'),
(1093, 525, 'es', 'Osječko-baranjska županija'),
(1094, 526, 'es', 'Šibensko-kninska županija'),
(1095, 527, 'es', 'Vukovarsko-srijemska županija'),
(1096, 528, 'es', 'Splitsko-dalmatinska županija'),
(1097, 529, 'es', 'Istarska županija'),
(1098, 530, 'es', 'Dubrovačko-neretvanska županija'),
(1099, 531, 'es', 'Međimurska županija'),
(1100, 532, 'es', 'Grad Zagreb'),
(1101, 533, 'es', 'Andaman and Nicobar Islands'),
(1102, 534, 'es', 'Andhra Pradesh'),
(1103, 535, 'es', 'Arunachal Pradesh'),
(1104, 536, 'es', 'Assam'),
(1105, 537, 'es', 'Bihar'),
(1106, 538, 'es', 'Chandigarh'),
(1107, 539, 'es', 'Chhattisgarh'),
(1108, 540, 'es', 'Dadra and Nagar Haveli'),
(1109, 541, 'es', 'Daman and Diu'),
(1110, 542, 'es', 'Delhi'),
(1111, 543, 'es', 'Goa'),
(1112, 544, 'es', 'Gujarat'),
(1113, 545, 'es', 'Haryana'),
(1114, 546, 'es', 'Himachal Pradesh'),
(1115, 547, 'es', 'Jammu and Kashmir'),
(1116, 548, 'es', 'Jharkhand'),
(1117, 549, 'es', 'Karnataka'),
(1118, 550, 'es', 'Kerala'),
(1119, 551, 'es', 'Lakshadweep'),
(1120, 552, 'es', 'Madhya Pradesh'),
(1121, 553, 'es', 'Maharashtra'),
(1122, 554, 'es', 'Manipur'),
(1123, 555, 'es', 'Meghalaya'),
(1124, 556, 'es', 'Mizoram'),
(1125, 557, 'es', 'Nagaland'),
(1126, 558, 'es', 'Odisha'),
(1127, 559, 'es', 'Puducherry'),
(1128, 560, 'es', 'Punjab'),
(1129, 561, 'es', 'Rajasthan'),
(1130, 562, 'es', 'Sikkim'),
(1131, 563, 'es', 'Tamil Nadu'),
(1132, 564, 'es', 'Telangana'),
(1133, 565, 'es', 'Tripura'),
(1134, 566, 'es', 'Uttar Pradesh'),
(1135, 567, 'es', 'Uttarakhand'),
(1136, 568, 'es', 'West Bengal'),
(1137, 569, 'es', 'Alto Paraguay'),
(1138, 570, 'es', 'Alto Paraná'),
(1139, 571, 'es', 'Amambay'),
(1140, 572, 'es', 'Asunción'),
(1141, 573, 'es', 'Boquerón'),
(1142, 574, 'es', 'Caaguazú'),
(1143, 575, 'es', 'Caazapá'),
(1144, 576, 'es', 'Canindeyú'),
(1145, 577, 'es', 'Central'),
(1146, 578, 'es', 'Concepción'),
(1147, 579, 'es', 'Cordillera'),
(1148, 580, 'es', 'Guairá'),
(1149, 581, 'es', 'Itapúa'),
(1150, 582, 'es', 'Misiones'),
(1151, 583, 'es', 'Paraguarí'),
(1152, 584, 'es', 'Presidente Hayes'),
(1153, 585, 'es', 'San Pedro'),
(1154, 586, 'es', 'Ñeembucú'),
(1155, 1, 'fa', 'آلاباما'),
(1156, 2, 'fa', 'آلاسکا'),
(1157, 3, 'fa', 'ساموآ آمریکایی'),
(1158, 4, 'fa', 'آریزونا'),
(1159, 5, 'fa', 'آرکانزاس'),
(1160, 6, 'fa', 'نیروهای مسلح آفریقا'),
(1161, 7, 'fa', 'Armed Forces America'),
(1162, 8, 'fa', 'نیروهای مسلح کانادا'),
(1163, 9, 'fa', 'نیروهای مسلح اروپا'),
(1164, 10, 'fa', 'نیروهای مسلح خاورمیانه'),
(1165, 11, 'fa', 'نیروهای مسلح اقیانوس آرام'),
(1166, 12, 'fa', 'کالیفرنیا'),
(1167, 13, 'fa', 'کلرادو'),
(1168, 14, 'fa', 'کانکتیکات'),
(1169, 15, 'fa', 'دلاور'),
(1170, 16, 'fa', 'منطقه کلمبیا'),
(1171, 17, 'fa', 'ایالات فدرال میکرونزی'),
(1172, 18, 'fa', 'فلوریدا'),
(1173, 19, 'fa', 'جورجیا'),
(1174, 20, 'fa', 'گوام'),
(1175, 21, 'fa', 'هاوایی'),
(1176, 22, 'fa', 'آیداهو'),
(1177, 23, 'fa', 'ایلینویز'),
(1178, 24, 'fa', 'ایندیانا'),
(1179, 25, 'fa', 'آیووا'),
(1180, 26, 'fa', 'کانزاس'),
(1181, 27, 'fa', 'کنتاکی'),
(1182, 28, 'fa', 'لوئیزیانا'),
(1183, 29, 'fa', 'ماین'),
(1184, 30, 'fa', 'مای'),
(1185, 31, 'fa', 'مریلند'),
(1186, 32, 'fa', ' '),
(1187, 33, 'fa', 'میشیگان'),
(1188, 34, 'fa', 'مینه سوتا'),
(1189, 35, 'fa', 'می سی سی پی'),
(1190, 36, 'fa', 'میسوری'),
(1191, 37, 'fa', 'مونتانا'),
(1192, 38, 'fa', 'نبراسکا'),
(1193, 39, 'fa', 'نواد'),
(1194, 40, 'fa', 'نیوهمپشایر'),
(1195, 41, 'fa', 'نیوجرسی'),
(1196, 42, 'fa', 'نیومکزیکو'),
(1197, 43, 'fa', 'نیویورک'),
(1198, 44, 'fa', 'کارولینای شمالی'),
(1199, 45, 'fa', 'داکوتای شمالی'),
(1200, 46, 'fa', 'جزایر ماریانای شمالی'),
(1201, 47, 'fa', 'اوهایو'),
(1202, 48, 'fa', 'اوکلاهما'),
(1203, 49, 'fa', 'اورگان'),
(1204, 50, 'fa', 'پالائو'),
(1205, 51, 'fa', 'پنسیلوانیا'),
(1206, 52, 'fa', 'پورتوریکو'),
(1207, 53, 'fa', 'رود آیلند'),
(1208, 54, 'fa', 'کارولینای جنوبی'),
(1209, 55, 'fa', 'داکوتای جنوبی'),
(1210, 56, 'fa', 'تنسی'),
(1211, 57, 'fa', 'تگزاس'),
(1212, 58, 'fa', 'یوتا'),
(1213, 59, 'fa', 'ورمونت'),
(1214, 60, 'fa', 'جزایر ویرجین'),
(1215, 61, 'fa', 'ویرجینیا'),
(1216, 62, 'fa', 'واشنگتن'),
(1217, 63, 'fa', 'ویرجینیای غربی'),
(1218, 64, 'fa', 'ویسکانسین'),
(1219, 65, 'fa', 'وایومینگ'),
(1220, 66, 'fa', 'آلبرتا'),
(1221, 67, 'fa', 'بریتیش کلمبیا'),
(1222, 68, 'fa', 'مانیتوبا'),
(1223, 69, 'fa', 'نیوفاندلند و لابرادور'),
(1224, 70, 'fa', 'نیوبرانزویک'),
(1225, 71, 'fa', 'نوا اسکوشیا'),
(1226, 72, 'fa', 'سرزمینهای شمال غربی'),
(1227, 73, 'fa', 'نوناووت'),
(1228, 74, 'fa', 'انتاریو'),
(1229, 75, 'fa', 'جزیره پرنس ادوارد'),
(1230, 76, 'fa', 'کبک'),
(1231, 77, 'fa', 'ساسکاتچوان'),
(1232, 78, 'fa', 'قلمرو یوکان'),
(1233, 79, 'fa', 'نیدرزاکسن'),
(1234, 80, 'fa', 'بادن-وورتمبرگ'),
(1235, 81, 'fa', 'بایرن'),
(1236, 82, 'fa', 'برلین'),
(1237, 83, 'fa', 'براندنبورگ'),
(1238, 84, 'fa', 'برمن'),
(1239, 85, 'fa', 'هامبور'),
(1240, 86, 'fa', 'هسن'),
(1241, 87, 'fa', 'مکلنبورگ-وورپومرن'),
(1242, 88, 'fa', 'نوردراین-وستفالن'),
(1243, 89, 'fa', 'راینلاند-پلاتینات'),
(1244, 90, 'fa', 'سارلند'),
(1245, 91, 'fa', 'ساچسن'),
(1246, 92, 'fa', 'ساچسن-آنهالت'),
(1247, 93, 'fa', 'شلسویگ-هولشتاین'),
(1248, 94, 'fa', 'تورینگی'),
(1249, 95, 'fa', 'وین'),
(1250, 96, 'fa', 'اتریش پایین'),
(1251, 97, 'fa', 'اتریش فوقانی'),
(1252, 98, 'fa', 'سالزبورگ'),
(1253, 99, 'fa', 'کارنتا'),
(1254, 100, 'fa', 'Steiermar'),
(1255, 101, 'fa', 'تیرول'),
(1256, 102, 'fa', 'بورگنلن'),
(1257, 103, 'fa', 'Vorarlber'),
(1258, 104, 'fa', 'آرگ'),
(1259, 105, 'fa', ''),
(1260, 106, 'fa', 'اپنزلسرهودن'),
(1261, 107, 'fa', 'بر'),
(1262, 108, 'fa', 'بازل-لندشفت'),
(1263, 109, 'fa', 'بازل استاد'),
(1264, 110, 'fa', 'فرایبورگ'),
(1265, 111, 'fa', 'گنف'),
(1266, 112, 'fa', 'گلاروس'),
(1267, 113, 'fa', 'Graubünde'),
(1268, 114, 'fa', 'ژورا'),
(1269, 115, 'fa', 'لوزرن'),
(1270, 116, 'fa', 'نوینبور'),
(1271, 117, 'fa', 'نیدالد'),
(1272, 118, 'fa', 'اوبولدن'),
(1273, 119, 'fa', 'سنت گالن'),
(1274, 120, 'fa', 'شافهاوز'),
(1275, 121, 'fa', 'سولوتور'),
(1276, 122, 'fa', 'شووی'),
(1277, 123, 'fa', 'تورگاو'),
(1278, 124, 'fa', 'تسسی'),
(1279, 125, 'fa', 'اوری'),
(1280, 126, 'fa', 'وادت'),
(1281, 127, 'fa', 'والی'),
(1282, 128, 'fa', 'ز'),
(1283, 129, 'fa', 'زوریخ'),
(1284, 130, 'fa', 'کورونا'),
(1285, 131, 'fa', 'آلاوا'),
(1286, 132, 'fa', 'آلبوم'),
(1287, 133, 'fa', 'آلیکانت'),
(1288, 134, 'fa', 'آلمریا'),
(1289, 135, 'fa', 'آستوریا'),
(1290, 136, 'fa', 'آویلا'),
(1291, 137, 'fa', 'باداژوز'),
(1292, 138, 'fa', 'ضرب و شتم'),
(1293, 139, 'fa', 'بارسلون'),
(1294, 140, 'fa', 'بورگو'),
(1295, 141, 'fa', 'کاسر'),
(1296, 142, 'fa', 'کادی'),
(1297, 143, 'fa', 'کانتابریا'),
(1298, 144, 'fa', 'کاستلون'),
(1299, 145, 'fa', 'سوت'),
(1300, 146, 'fa', 'سیوداد واقعی'),
(1301, 147, 'fa', 'کوردوب'),
(1302, 148, 'fa', 'Cuenc'),
(1303, 149, 'fa', 'جیرون'),
(1304, 150, 'fa', 'گراناد'),
(1305, 151, 'fa', 'گوادالاجار'),
(1306, 152, 'fa', 'Guipuzcoa'),
(1307, 153, 'fa', 'هولوا'),
(1308, 154, 'fa', 'هوسک'),
(1309, 155, 'fa', 'جی'),
(1310, 156, 'fa', 'لا ریوجا'),
(1311, 157, 'fa', 'لاس پالماس'),
(1312, 158, 'fa', 'لئو'),
(1313, 159, 'fa', 'Lleid'),
(1314, 160, 'fa', 'لوگ'),
(1315, 161, 'fa', 'مادری'),
(1316, 162, 'fa', 'مالاگ'),
(1317, 163, 'fa', 'ملیلی'),
(1318, 164, 'fa', 'مورسیا'),
(1319, 165, 'fa', 'ناوار'),
(1320, 166, 'fa', 'اورنس'),
(1321, 167, 'fa', 'پالنسی'),
(1322, 168, 'fa', 'پونتوودر'),
(1323, 169, 'fa', 'سالامانک'),
(1324, 170, 'fa', 'سانتا کروز د تنریفه'),
(1325, 171, 'fa', 'سوگویا'),
(1326, 172, 'fa', 'سوی'),
(1327, 173, 'fa', 'سوریا'),
(1328, 174, 'fa', 'تاراگونا'),
(1329, 175, 'fa', 'ترئو'),
(1330, 176, 'fa', 'تولدو'),
(1331, 177, 'fa', 'والنسیا'),
(1332, 178, 'fa', 'والادولی'),
(1333, 179, 'fa', 'ویزکایا'),
(1334, 180, 'fa', 'زامور'),
(1335, 181, 'fa', 'ساراگوز'),
(1336, 182, 'fa', 'عی'),
(1337, 183, 'fa', 'آیز'),
(1338, 184, 'fa', 'آلی'),
(1339, 185, 'fa', 'آلپ-دو-هاوت-پرووانس'),
(1340, 186, 'fa', 'هاوتس آلپ'),
(1341, 187, 'fa', 'Alpes-Maritime'),
(1342, 188, 'fa', 'اردچه'),
(1343, 189, 'fa', 'آرد'),
(1344, 190, 'fa', 'محاصر'),
(1345, 191, 'fa', 'آبه'),
(1346, 192, 'fa', 'Aud'),
(1347, 193, 'fa', 'آویرون'),
(1348, 194, 'fa', 'BOCAS DO Rhône'),
(1349, 195, 'fa', 'نوعی عرق'),
(1350, 196, 'fa', 'کانتینال'),
(1351, 197, 'fa', 'چارنت'),
(1352, 198, 'fa', 'چارنت-دریایی'),
(1353, 199, 'fa', 'چ'),
(1354, 200, 'fa', 'کور'),
(1355, 201, 'fa', 'کرس دو ساد'),
(1356, 202, 'fa', 'هاوت کورس'),
(1357, 203, 'fa', 'کوستا دورکرز'),
(1358, 204, 'fa', 'تخت دارمور'),
(1359, 205, 'fa', 'درهم'),
(1360, 206, 'fa', 'دوردگن'),
(1361, 207, 'fa', 'دوب'),
(1362, 208, 'fa', 'تعریف اول'),
(1363, 209, 'fa', 'یور'),
(1364, 210, 'fa', 'Eure-et-Loi'),
(1365, 211, 'fa', 'فمینیست'),
(1366, 212, 'fa', 'باغ'),
(1367, 213, 'fa', 'اوت-گارون'),
(1368, 214, 'fa', 'گر'),
(1369, 215, 'fa', 'جیروند'),
(1370, 216, 'fa', 'هیر'),
(1371, 217, 'fa', 'هشدار داده می شود'),
(1372, 218, 'fa', 'ایندور'),
(1373, 219, 'fa', 'Indre-et-Loir'),
(1374, 220, 'fa', 'ایزر'),
(1375, 221, 'fa', 'یور'),
(1376, 222, 'fa', 'لندز'),
(1377, 223, 'fa', 'Loir-et-Che'),
(1378, 224, 'fa', 'وام گرفتن'),
(1379, 225, 'fa', 'Haute-Loir'),
(1380, 226, 'fa', 'Loire-Atlantiqu'),
(1381, 227, 'fa', 'لیرت'),
(1382, 228, 'fa', 'لوط'),
(1383, 229, 'fa', 'لوت و گارون'),
(1384, 230, 'fa', 'لوزر'),
(1385, 231, 'fa', 'ماین et-Loire'),
(1386, 232, 'fa', 'مانچ'),
(1387, 233, 'fa', 'مارن'),
(1388, 234, 'fa', 'هاوت-مارن'),
(1389, 235, 'fa', 'مایین'),
(1390, 236, 'fa', 'مورته-et-Moselle'),
(1391, 237, 'fa', 'مسخره کردن'),
(1392, 238, 'fa', 'موربیان'),
(1393, 239, 'fa', 'موزل'),
(1394, 240, 'fa', 'Nièvr'),
(1395, 241, 'fa', 'نورد'),
(1396, 242, 'fa', 'اوی'),
(1397, 243, 'fa', 'ارن'),
(1398, 244, 'fa', 'پاس-کاله'),
(1399, 245, 'fa', 'Puy-de-Dôm'),
(1400, 246, 'fa', 'Pyrénées-Atlantiques'),
(1401, 247, 'fa', 'Hautes-Pyrénée'),
(1402, 248, 'fa', 'Pyrénées-Orientales'),
(1403, 249, 'fa', 'بس راین'),
(1404, 250, 'fa', 'هاوت-رین'),
(1405, 251, 'fa', 'رو'),
(1406, 252, 'fa', 'Haute-Saône'),
(1407, 253, 'fa', 'Saône-et-Loire'),
(1408, 254, 'fa', 'سارته'),
(1409, 255, 'fa', 'ساووی'),
(1410, 256, 'fa', 'هاو-ساووی'),
(1411, 257, 'fa', 'پاری'),
(1412, 258, 'fa', 'Seine-Maritime'),
(1413, 259, 'fa', 'Seine-et-Marn'),
(1414, 260, 'fa', 'ایولینز'),
(1415, 261, 'fa', 'Deux-Sèvres'),
(1416, 262, 'fa', 'سمی'),
(1417, 263, 'fa', 'ضعف'),
(1418, 264, 'fa', 'Tarn-et-Garonne'),
(1419, 265, 'fa', 'وار'),
(1420, 266, 'fa', 'ووکلوز'),
(1421, 267, 'fa', 'وندیه'),
(1422, 268, 'fa', 'وین'),
(1423, 269, 'fa', 'هاوت-وین'),
(1424, 270, 'fa', 'رأی دادن'),
(1425, 271, 'fa', 'یون'),
(1426, 272, 'fa', 'سرزمین-دو-بلفورت'),
(1427, 273, 'fa', 'اسون'),
(1428, 274, 'fa', 'هاوتز دی سی'),
(1429, 275, 'fa', 'Seine-Saint-Deni'),
(1430, 276, 'fa', 'والد مارن'),
(1431, 277, 'fa', 'Val-d\'Ois'),
(1432, 278, 'fa', 'آلبا'),
(1433, 279, 'fa', 'آرا'),
(1434, 280, 'fa', 'Argeș'),
(1435, 281, 'fa', 'باکو'),
(1436, 282, 'fa', 'بیهور'),
(1437, 283, 'fa', 'بیستریا-نسوود'),
(1438, 284, 'fa', 'بوتانی'),
(1439, 285, 'fa', 'برازوف'),
(1440, 286, 'fa', 'Brăila'),
(1441, 287, 'fa', 'București'),
(1442, 288, 'fa', 'بوز'),
(1443, 289, 'fa', 'کارا- Severin'),
(1444, 290, 'fa', 'کالیراسی'),
(1445, 291, 'fa', 'كلوژ'),
(1446, 292, 'fa', 'کنستانس'),
(1447, 293, 'fa', 'کواسنا'),
(1448, 294, 'fa', 'Dâmbovița'),
(1449, 295, 'fa', 'دال'),
(1450, 296, 'fa', 'گالشی'),
(1451, 297, 'fa', 'جورجیو'),
(1452, 298, 'fa', 'گور'),
(1453, 299, 'fa', 'هارگیتا'),
(1454, 300, 'fa', 'هوندهار'),
(1455, 301, 'fa', 'ایالومیشا'),
(1456, 302, 'fa', 'Iași'),
(1457, 303, 'fa', 'Ilfo'),
(1458, 304, 'fa', 'Maramureș'),
(1459, 305, 'fa', 'Mehedinți'),
(1460, 306, 'fa', 'Mureș'),
(1461, 307, 'fa', 'Neamț'),
(1462, 308, 'fa', 'اولت'),
(1463, 309, 'fa', 'پرهوا'),
(1464, 310, 'fa', 'ستو ماره'),
(1465, 311, 'fa', 'سلاج'),
(1466, 312, 'fa', 'سیبیو'),
(1467, 313, 'fa', 'سوساو'),
(1468, 314, 'fa', 'تلورمان'),
(1469, 315, 'fa', 'تیمیچ'),
(1470, 316, 'fa', 'تولسا'),
(1471, 317, 'fa', 'واسلوئی'),
(1472, 318, 'fa', 'Vâlcea'),
(1473, 319, 'fa', 'ورانسا'),
(1474, 320, 'fa', 'لاپی'),
(1475, 321, 'fa', 'Pohjois-Pohjanmaa'),
(1476, 322, 'fa', 'کائینو'),
(1477, 323, 'fa', 'Pohjois-Karjala'),
(1478, 324, 'fa', 'Pohjois-Savo'),
(1479, 325, 'fa', 'اتل-ساوو'),
(1480, 326, 'fa', 'کسکی-پوهانما'),
(1481, 327, 'fa', 'Pohjanmaa'),
(1482, 328, 'fa', 'پیرکانما'),
(1483, 329, 'fa', 'ساتاکونتا'),
(1484, 330, 'fa', 'کسکی-پوهانما'),
(1485, 331, 'fa', 'کسکی-سوومی'),
(1486, 332, 'fa', 'Varsinais-Suomi'),
(1487, 333, 'fa', 'اتلی کرجالا'),
(1488, 334, 'fa', 'Päijät-HAM'),
(1489, 335, 'fa', 'کانتا-هوم'),
(1490, 336, 'fa', 'یوسیما'),
(1491, 337, 'fa', 'اوسیم'),
(1492, 338, 'fa', 'کیمنلاکو'),
(1493, 339, 'fa', 'آونوانما'),
(1494, 340, 'fa', 'هارژوم'),
(1495, 341, 'fa', 'سلا'),
(1496, 342, 'fa', 'آیدا-ویروما'),
(1497, 343, 'fa', 'Jõgevamaa'),
(1498, 344, 'fa', 'جوروماا'),
(1499, 345, 'fa', 'لونما'),
(1500, 346, 'fa', 'لون-ویروما'),
(1501, 347, 'fa', 'پالوماا'),
(1502, 348, 'fa', 'پورنوما'),
(1503, 349, 'fa', 'Raplama'),
(1504, 350, 'fa', 'ساارما'),
(1505, 351, 'fa', 'تارتوما'),
(1506, 352, 'fa', 'والگام'),
(1507, 353, 'fa', 'ویلجاندیم'),
(1508, 354, 'fa', 'Võrumaa'),
(1509, 355, 'fa', 'داگاوپیل'),
(1510, 356, 'fa', 'جلگاو'),
(1511, 357, 'fa', 'جکابیل'),
(1512, 358, 'fa', 'جرمل'),
(1513, 359, 'fa', 'لیپجا'),
(1514, 360, 'fa', 'شهرستان لیپاج'),
(1515, 361, 'fa', 'روژن'),
(1516, 362, 'fa', 'راگ'),
(1517, 363, 'fa', 'شهرستان ریگ'),
(1518, 364, 'fa', 'والمییرا'),
(1519, 365, 'fa', 'Ventspils'),
(1520, 366, 'fa', 'آگلوناس نوادا'),
(1521, 367, 'fa', 'تازه کاران آیزکرایکلس'),
(1522, 368, 'fa', 'تازه واردان'),
(1523, 369, 'fa', 'شهرستا'),
(1524, 370, 'fa', 'نوازندگان آلوجاس'),
(1525, 371, 'fa', 'تازه های آلسونگاس'),
(1526, 372, 'fa', 'شهرستان آلوکس'),
(1527, 373, 'fa', 'تازه کاران آماتاس'),
(1528, 374, 'fa', 'میمون های تازه'),
(1529, 375, 'fa', 'نوادا را آویز می کند'),
(1530, 376, 'fa', 'شهرستان بابی'),
(1531, 377, 'fa', 'Baldones novad'),
(1532, 378, 'fa', 'نوین های بالتیناوا'),
(1533, 379, 'fa', 'Balvu novad'),
(1534, 380, 'fa', 'نوازندگان باسکاس'),
(1535, 381, 'fa', 'شهرستان بورین'),
(1536, 382, 'fa', 'شهرستان بروچن'),
(1537, 383, 'fa', 'بوردنیکو نوآوران'),
(1538, 384, 'fa', 'تازه کارنیکاوا'),
(1539, 385, 'fa', 'نوازان سزوینس'),
(1540, 386, 'fa', 'نوادگان Cibla'),
(1541, 387, 'fa', 'شهرستان Cesis'),
(1542, 388, 'fa', 'تازه های داگدا'),
(1543, 389, 'fa', 'داوگاوپیلز نوادا'),
(1544, 390, 'fa', 'دابل نوادی'),
(1545, 391, 'fa', 'تازه کارهای دنداگاس'),
(1546, 392, 'fa', 'نوباد دوربس'),
(1547, 393, 'fa', 'مشغول تازه کارها است'),
(1548, 394, 'fa', 'گرکالنس نواد'),
(1549, 395, 'fa', 'یا شهرستان گروبی'),
(1550, 396, 'fa', 'تازه های گلبنس'),
(1551, 397, 'fa', 'Iecavas novads'),
(1552, 398, 'fa', 'شهرستان ایسکل'),
(1553, 399, 'fa', 'ایالت ایلکست'),
(1554, 400, 'fa', 'کنددو د اینچوکالن'),
(1555, 401, 'fa', 'نوجواد Jaunjelgavas'),
(1556, 402, 'fa', 'تازه های Jaunpiebalgas'),
(1557, 403, 'fa', 'شهرستان جونپیلس'),
(1558, 404, 'fa', 'شهرستان جگلو'),
(1559, 405, 'fa', 'شهرستان جکابیل'),
(1560, 406, 'fa', 'شهرستان کنداوا'),
(1561, 407, 'fa', 'شهرستان کوکنز'),
(1562, 408, 'fa', 'شهرستان کریمولد'),
(1563, 409, 'fa', 'شهرستان کرستپیل'),
(1564, 410, 'fa', 'شهرستان کراسلاو'),
(1565, 411, 'fa', 'کاندادو د کلدیگا'),
(1566, 412, 'fa', 'کاندادو د کارساوا'),
(1567, 413, 'fa', 'شهرستان لیولوارد'),
(1568, 414, 'fa', 'شهرستان لیمباشی'),
(1569, 415, 'fa', 'ای ولسوالی لوبون'),
(1570, 416, 'fa', 'شهرستان لودزا'),
(1571, 417, 'fa', 'شهرستان لیگات'),
(1572, 418, 'fa', 'شهرستان لیوانی'),
(1573, 419, 'fa', 'شهرستان مادونا'),
(1574, 420, 'fa', 'شهرستان مازسال'),
(1575, 421, 'fa', 'شهرستان مالپیلس'),
(1576, 422, 'fa', 'شهرستان Mārupe'),
(1577, 423, 'fa', 'ا کنددو د نوکشنی'),
(1578, 424, 'fa', 'کاملاً یک شهرستان'),
(1579, 425, 'fa', 'شهرستان نیکا'),
(1580, 426, 'fa', 'شهرستان اوگر'),
(1581, 427, 'fa', 'شهرستان اولین'),
(1582, 428, 'fa', 'شهرستان اوزولنیکی'),
(1583, 429, 'fa', 'شهرستان پرلیلی'),
(1584, 430, 'fa', 'شهرستان Priekule'),
(1585, 431, 'fa', 'Condado de Priekuļi'),
(1586, 432, 'fa', 'شهرستان در حال حرکت'),
(1587, 433, 'fa', 'شهرستان پاویلوستا'),
(1588, 4, 'fa', 'شهرستان Plavinas'),
(1589, 435, 'fa', 'شهرستان راونا'),
(1590, 436, 'fa', 'شهرستان ریبیشی'),
(1591, 437, 'fa', 'شهرستان روجا'),
(1592, 438, 'fa', 'شهرستان روپازی'),
(1593, 439, 'fa', 'شهرستان روساوا'),
(1594, 440, 'fa', 'شهرستان روگی'),
(1595, 441, 'fa', 'شهرستان راندل'),
(1596, 442, 'fa', 'شهرستان ریزکن'),
(1597, 443, 'fa', 'شهرستان روژینا'),
(1598, 444, 'fa', 'شهرداری Salacgriva'),
(1599, 445, 'fa', 'منطقه جزیره'),
(1600, 446, 'fa', 'شهرستان Salaspils'),
(1601, 447, 'fa', 'شهرستان سالدوس'),
(1602, 448, 'fa', 'شهرستان ساولکرستی'),
(1603, 449, 'fa', 'شهرستان سیگولدا'),
(1604, 450, 'fa', 'شهرستان Skrunda'),
(1605, 451, 'fa', 'شهرستان Skrīveri'),
(1606, 452, 'fa', 'شهرستان Smiltene'),
(1607, 453, 'fa', 'شهرستان ایستینی'),
(1608, 454, 'fa', 'شهرستان استرنشی'),
(1609, 455, 'fa', 'منطقه کاشت'),
(1610, 456, 'fa', 'شهرستان تالسی'),
(1611, 457, 'fa', 'توکومس'),
(1612, 458, 'fa', 'شهرستان تورت'),
(1613, 459, 'fa', 'یا شهرستان وایودود'),
(1614, 460, 'fa', 'شهرستان والکا'),
(1615, 461, 'fa', 'شهرستان Valmiera'),
(1616, 462, 'fa', 'شهرستان وارکانی'),
(1617, 463, 'fa', 'شهرستان Vecpiebalga'),
(1618, 464, 'fa', 'شهرستان وکومنیکی'),
(1619, 465, 'fa', 'شهرستان ونتسپیل'),
(1620, 466, 'fa', 'کنددو د بازدید'),
(1621, 467, 'fa', 'شهرستان ویلاکا'),
(1622, 468, 'fa', 'شهرستان ویلانی'),
(1623, 469, 'fa', 'شهرستان واركاوا'),
(1624, 470, 'fa', 'شهرستان زیلوپ'),
(1625, 471, 'fa', 'شهرستان آدازی'),
(1626, 472, 'fa', 'شهرستان ارگلو'),
(1627, 473, 'fa', 'شهرستان کگومس'),
(1628, 474, 'fa', 'شهرستان ککاوا'),
(1629, 475, 'fa', 'شهرستان Alytus'),
(1630, 476, 'fa', 'شهرستان Kaunas'),
(1631, 477, 'fa', 'شهرستان کلایپدا'),
(1632, 478, 'fa', 'شهرستان ماریجامپولی'),
(1633, 479, 'fa', 'شهرستان پانویسیز'),
(1634, 480, 'fa', 'شهرستان سیاولیا'),
(1635, 481, 'fa', 'شهرستان تاجیج'),
(1636, 482, 'fa', 'شهرستان تلشیا'),
(1637, 483, 'fa', 'شهرستان اوتنا'),
(1638, 484, 'fa', 'شهرستان ویلنیوس'),
(1639, 485, 'fa', 'جریب');
INSERT INTO `country_state_translations` (`id`, `country_state_id`, `locale`, `default_name`) VALUES
(1640, 486, 'fa', 'حالت'),
(1641, 487, 'fa', 'آمپá'),
(1642, 488, 'fa', 'آمازون'),
(1643, 489, 'fa', 'باهی'),
(1644, 490, 'fa', 'سارا'),
(1645, 491, 'fa', 'روح القدس'),
(1646, 492, 'fa', 'برو'),
(1647, 493, 'fa', 'مارانهائ'),
(1648, 494, 'fa', 'ماتو گروسو'),
(1649, 495, 'fa', 'Mato Grosso do Sul'),
(1650, 496, 'fa', 'ایالت میناس گرایس'),
(1651, 497, 'fa', 'پار'),
(1652, 498, 'fa', 'حالت'),
(1653, 499, 'fa', 'پارانا'),
(1654, 500, 'fa', 'حال'),
(1655, 501, 'fa', 'پیازو'),
(1656, 502, 'fa', 'ریو دوژانیرو'),
(1657, 503, 'fa', 'ریو گراند دو نورته'),
(1658, 504, 'fa', 'ریو گراند دو سول'),
(1659, 505, 'fa', 'Rondôni'),
(1660, 506, 'fa', 'Roraim'),
(1661, 507, 'fa', 'سانتا کاتارینا'),
(1662, 508, 'fa', 'پ'),
(1663, 509, 'fa', 'Sergip'),
(1664, 510, 'fa', 'توکانتین'),
(1665, 511, 'fa', 'منطقه فدرال'),
(1666, 512, 'fa', 'شهرستان زاگرب'),
(1667, 513, 'fa', 'Condado de Krapina-Zagorj'),
(1668, 514, 'fa', 'شهرستان سیساک-موسلاوینا'),
(1669, 515, 'fa', 'شهرستان کارلوواک'),
(1670, 516, 'fa', 'شهرداری واراžدین'),
(1671, 517, 'fa', 'Condo de Koprivnica-Križevci'),
(1672, 518, 'fa', 'محل سکونت د بیلوار-بلوگورا'),
(1673, 519, 'fa', 'Condado de Primorje-Gorski kotar'),
(1674, 520, 'fa', 'شهرستان لیکا-سنج'),
(1675, 521, 'fa', 'Condado de Virovitica-Podravina'),
(1676, 522, 'fa', 'شهرستان پوژگا-اسلاونیا'),
(1677, 523, 'fa', 'Condado de Brod-Posavina'),
(1678, 524, 'fa', 'شهرستان زجر'),
(1679, 525, 'fa', 'Condado de Osijek-Baranja'),
(1680, 526, 'fa', 'Condo de Sibenik-Knin'),
(1681, 527, 'fa', 'Condado de Vukovar-Srijem'),
(1682, 528, 'fa', 'شهرستان اسپلیت-Dalmatia'),
(1683, 529, 'fa', 'شهرستان ایستیا'),
(1684, 530, 'fa', 'Condado de Dubrovnik-Neretva'),
(1685, 531, 'fa', 'شهرستان Međimurje'),
(1686, 532, 'fa', 'شهر زاگرب'),
(1687, 533, 'fa', 'جزایر آندامان و نیکوبار'),
(1688, 534, 'fa', 'آندرا پرادش'),
(1689, 535, 'fa', 'آروناچال پرادش'),
(1690, 536, 'fa', 'آسام'),
(1691, 537, 'fa', 'Biha'),
(1692, 538, 'fa', 'چاندیگار'),
(1693, 539, 'fa', 'چاتیسگار'),
(1694, 540, 'fa', 'دادرا و نگار هاولی'),
(1695, 541, 'fa', 'دامان و دیو'),
(1696, 542, 'fa', 'دهلی'),
(1697, 543, 'fa', 'گوا'),
(1698, 544, 'fa', 'گجرات'),
(1699, 545, 'fa', 'هاریانا'),
(1700, 546, 'fa', 'هیماچال پرادش'),
(1701, 547, 'fa', 'جامو و کشمیر'),
(1702, 548, 'fa', 'جهخند'),
(1703, 549, 'fa', 'کارناتاکا'),
(1704, 550, 'fa', 'کرال'),
(1705, 551, 'fa', 'لاکشادوپ'),
(1706, 552, 'fa', 'مادیا پرادش'),
(1707, 553, 'fa', 'ماهاراشترا'),
(1708, 554, 'fa', 'مانی پور'),
(1709, 555, 'fa', 'مگالایا'),
(1710, 556, 'fa', 'مزورام'),
(1711, 557, 'fa', 'ناگلند'),
(1712, 558, 'fa', 'ادیشا'),
(1713, 559, 'fa', 'میناکاری'),
(1714, 560, 'fa', 'پنجا'),
(1715, 561, 'fa', 'راجستان'),
(1716, 562, 'fa', 'سیکیم'),
(1717, 563, 'fa', 'تامیل نادو'),
(1718, 564, 'fa', 'تلنگانا'),
(1719, 565, 'fa', 'تریپورا'),
(1720, 566, 'fa', 'اوتار پرادش'),
(1721, 567, 'fa', 'اوتاراکند'),
(1722, 568, 'fa', 'بنگال غرب'),
(1723, 1, 'pt_BR', 'Alabama'),
(1724, 2, 'pt_BR', 'Alaska'),
(1725, 3, 'pt_BR', 'Samoa Americana'),
(1726, 4, 'pt_BR', 'Arizona'),
(1727, 5, 'pt_BR', 'Arkansas'),
(1728, 6, 'pt_BR', 'Forças Armadas da África'),
(1729, 7, 'pt_BR', 'Forças Armadas das Américas'),
(1730, 8, 'pt_BR', 'Forças Armadas do Canadá'),
(1731, 9, 'pt_BR', 'Forças Armadas da Europa'),
(1732, 10, 'pt_BR', 'Forças Armadas do Oriente Médio'),
(1733, 11, 'pt_BR', 'Forças Armadas do Pacífico'),
(1734, 12, 'pt_BR', 'California'),
(1735, 13, 'pt_BR', 'Colorado'),
(1736, 14, 'pt_BR', 'Connecticut'),
(1737, 15, 'pt_BR', 'Delaware'),
(1738, 16, 'pt_BR', 'Distrito de Columbia'),
(1739, 17, 'pt_BR', 'Estados Federados da Micronésia'),
(1740, 18, 'pt_BR', 'Florida'),
(1741, 19, 'pt_BR', 'Geórgia'),
(1742, 20, 'pt_BR', 'Guam'),
(1743, 21, 'pt_BR', 'Havaí'),
(1744, 22, 'pt_BR', 'Idaho'),
(1745, 23, 'pt_BR', 'Illinois'),
(1746, 24, 'pt_BR', 'Indiana'),
(1747, 25, 'pt_BR', 'Iowa'),
(1748, 26, 'pt_BR', 'Kansas'),
(1749, 27, 'pt_BR', 'Kentucky'),
(1750, 28, 'pt_BR', 'Louisiana'),
(1751, 29, 'pt_BR', 'Maine'),
(1752, 30, 'pt_BR', 'Ilhas Marshall'),
(1753, 31, 'pt_BR', 'Maryland'),
(1754, 32, 'pt_BR', 'Massachusetts'),
(1755, 33, 'pt_BR', 'Michigan'),
(1756, 34, 'pt_BR', 'Minnesota'),
(1757, 35, 'pt_BR', 'Mississippi'),
(1758, 36, 'pt_BR', 'Missouri'),
(1759, 37, 'pt_BR', 'Montana'),
(1760, 38, 'pt_BR', 'Nebraska'),
(1761, 39, 'pt_BR', 'Nevada'),
(1762, 40, 'pt_BR', 'New Hampshire'),
(1763, 41, 'pt_BR', 'Nova Jersey'),
(1764, 42, 'pt_BR', 'Novo México'),
(1765, 43, 'pt_BR', 'Nova York'),
(1766, 44, 'pt_BR', 'Carolina do Norte'),
(1767, 45, 'pt_BR', 'Dakota do Norte'),
(1768, 46, 'pt_BR', 'Ilhas Marianas do Norte'),
(1769, 47, 'pt_BR', 'Ohio'),
(1770, 48, 'pt_BR', 'Oklahoma'),
(1771, 4, 'pt_BR', 'Oregon'),
(1772, 50, 'pt_BR', 'Palau'),
(1773, 51, 'pt_BR', 'Pensilvânia'),
(1774, 52, 'pt_BR', 'Porto Rico'),
(1775, 53, 'pt_BR', 'Rhode Island'),
(1776, 54, 'pt_BR', 'Carolina do Sul'),
(1777, 55, 'pt_BR', 'Dakota do Sul'),
(1778, 56, 'pt_BR', 'Tennessee'),
(1779, 57, 'pt_BR', 'Texas'),
(1780, 58, 'pt_BR', 'Utah'),
(1781, 59, 'pt_BR', 'Vermont'),
(1782, 60, 'pt_BR', 'Ilhas Virgens'),
(1783, 61, 'pt_BR', 'Virginia'),
(1784, 62, 'pt_BR', 'Washington'),
(1785, 63, 'pt_BR', 'West Virginia'),
(1786, 64, 'pt_BR', 'Wisconsin'),
(1787, 65, 'pt_BR', 'Wyoming'),
(1788, 66, 'pt_BR', 'Alberta'),
(1789, 67, 'pt_BR', 'Colúmbia Britânica'),
(1790, 68, 'pt_BR', 'Manitoba'),
(1791, 69, 'pt_BR', 'Terra Nova e Labrador'),
(1792, 70, 'pt_BR', 'New Brunswick'),
(1793, 7, 'pt_BR', 'Nova Escócia'),
(1794, 72, 'pt_BR', 'Territórios do Noroeste'),
(1795, 73, 'pt_BR', 'Nunavut'),
(1796, 74, 'pt_BR', 'Ontario'),
(1797, 75, 'pt_BR', 'Ilha do Príncipe Eduardo'),
(1798, 76, 'pt_BR', 'Quebec'),
(1799, 77, 'pt_BR', 'Saskatchewan'),
(1800, 78, 'pt_BR', 'Território yukon'),
(1801, 79, 'pt_BR', 'Niedersachsen'),
(1802, 80, 'pt_BR', 'Baden-Wurttemberg'),
(1803, 81, 'pt_BR', 'Bayern'),
(1804, 82, 'pt_BR', 'Berlim'),
(1805, 83, 'pt_BR', 'Brandenburg'),
(1806, 84, 'pt_BR', 'Bremen'),
(1807, 85, 'pt_BR', 'Hamburgo'),
(1808, 86, 'pt_BR', 'Hessen'),
(1809, 87, 'pt_BR', 'Mecklenburg-Vorpommern'),
(1810, 88, 'pt_BR', 'Nordrhein-Westfalen'),
(1811, 8, 'pt_BR', 'Renânia-Palatinado'),
(1812, 90, 'pt_BR', 'Sarre'),
(1813, 91, 'pt_BR', 'Sachsen'),
(1814, 92, 'pt_BR', 'Sachsen-Anhalt'),
(1815, 93, 'pt_BR', 'Schleswig-Holstein'),
(1816, 94, 'pt_BR', 'Turíngia'),
(1817, 95, 'pt_BR', 'Viena'),
(1818, 96, 'pt_BR', 'Baixa Áustria'),
(1819, 97, 'pt_BR', 'Oberösterreich'),
(1820, 98, 'pt_BR', 'Salzburg'),
(1821, 99, 'pt_BR', 'Caríntia'),
(1822, 100, 'pt_BR', 'Steiermark'),
(1823, 101, 'pt_BR', 'Tirol'),
(1824, 102, 'pt_BR', 'Burgenland'),
(1825, 103, 'pt_BR', 'Vorarlberg'),
(1826, 104, 'pt_BR', 'Aargau'),
(1827, 105, 'pt_BR', 'Appenzell Innerrhoden'),
(1828, 106, 'pt_BR', 'Appenzell Ausserrhoden'),
(1829, 107, 'pt_BR', 'Bern'),
(1830, 108, 'pt_BR', 'Basel-Landschaft'),
(1831, 109, 'pt_BR', 'Basel-Stadt'),
(1832, 110, 'pt_BR', 'Freiburg'),
(1833, 111, 'pt_BR', 'Genf'),
(1834, 112, 'pt_BR', 'Glarus'),
(1835, 113, 'pt_BR', 'Grisons'),
(1836, 114, 'pt_BR', 'Jura'),
(1837, 115, 'pt_BR', 'Luzern'),
(1838, 116, 'pt_BR', 'Neuenburg'),
(1839, 117, 'pt_BR', 'Nidwalden'),
(1840, 118, 'pt_BR', 'Obwalden'),
(1841, 119, 'pt_BR', 'St. Gallen'),
(1842, 120, 'pt_BR', 'Schaffhausen'),
(1843, 121, 'pt_BR', 'Solothurn'),
(1844, 122, 'pt_BR', 'Schwyz'),
(1845, 123, 'pt_BR', 'Thurgau'),
(1846, 124, 'pt_BR', 'Tessin'),
(1847, 125, 'pt_BR', 'Uri'),
(1848, 126, 'pt_BR', 'Waadt'),
(1849, 127, 'pt_BR', 'Wallis'),
(1850, 128, 'pt_BR', 'Zug'),
(1851, 129, 'pt_BR', 'Zurique'),
(1852, 130, 'pt_BR', 'Corunha'),
(1853, 131, 'pt_BR', 'Álava'),
(1854, 132, 'pt_BR', 'Albacete'),
(1855, 133, 'pt_BR', 'Alicante'),
(1856, 134, 'pt_BR', 'Almeria'),
(1857, 135, 'pt_BR', 'Astúrias'),
(1858, 136, 'pt_BR', 'Avila'),
(1859, 137, 'pt_BR', 'Badajoz'),
(1860, 138, 'pt_BR', 'Baleares'),
(1861, 139, 'pt_BR', 'Barcelona'),
(1862, 140, 'pt_BR', 'Burgos'),
(1863, 141, 'pt_BR', 'Caceres'),
(1864, 142, 'pt_BR', 'Cadiz'),
(1865, 143, 'pt_BR', 'Cantábria'),
(1866, 144, 'pt_BR', 'Castellon'),
(1867, 145, 'pt_BR', 'Ceuta'),
(1868, 146, 'pt_BR', 'Ciudad Real'),
(1869, 147, 'pt_BR', 'Cordoba'),
(1870, 148, 'pt_BR', 'Cuenca'),
(1871, 149, 'pt_BR', 'Girona'),
(1872, 150, 'pt_BR', 'Granada'),
(1873, 151, 'pt_BR', 'Guadalajara'),
(1874, 152, 'pt_BR', 'Guipuzcoa'),
(1875, 153, 'pt_BR', 'Huelva'),
(1876, 154, 'pt_BR', 'Huesca'),
(1877, 155, 'pt_BR', 'Jaen'),
(1878, 156, 'pt_BR', 'La Rioja'),
(1879, 157, 'pt_BR', 'Las Palmas'),
(1880, 158, 'pt_BR', 'Leon'),
(1881, 159, 'pt_BR', 'Lleida'),
(1882, 160, 'pt_BR', 'Lugo'),
(1883, 161, 'pt_BR', 'Madri'),
(1884, 162, 'pt_BR', 'Málaga'),
(1885, 163, 'pt_BR', 'Melilla'),
(1886, 164, 'pt_BR', 'Murcia'),
(1887, 165, 'pt_BR', 'Navarra'),
(1888, 166, 'pt_BR', 'Ourense'),
(1889, 167, 'pt_BR', 'Palencia'),
(1890, 168, 'pt_BR', 'Pontevedra'),
(1891, 169, 'pt_BR', 'Salamanca'),
(1892, 170, 'pt_BR', 'Santa Cruz de Tenerife'),
(1893, 171, 'pt_BR', 'Segovia'),
(1894, 172, 'pt_BR', 'Sevilla'),
(1895, 173, 'pt_BR', 'Soria'),
(1896, 174, 'pt_BR', 'Tarragona'),
(1897, 175, 'pt_BR', 'Teruel'),
(1898, 176, 'pt_BR', 'Toledo'),
(1899, 177, 'pt_BR', 'Valencia'),
(1900, 178, 'pt_BR', 'Valladolid'),
(1901, 179, 'pt_BR', 'Vizcaya'),
(1902, 180, 'pt_BR', 'Zamora'),
(1903, 181, 'pt_BR', 'Zaragoza'),
(1904, 182, 'pt_BR', 'Ain'),
(1905, 183, 'pt_BR', 'Aisne'),
(1906, 184, 'pt_BR', 'Allier'),
(1907, 185, 'pt_BR', 'Alpes da Alta Provença'),
(1908, 186, 'pt_BR', 'Altos Alpes'),
(1909, 187, 'pt_BR', 'Alpes-Maritimes'),
(1910, 188, 'pt_BR', 'Ardèche'),
(1911, 189, 'pt_BR', 'Ardennes'),
(1912, 190, 'pt_BR', 'Ariege'),
(1913, 191, 'pt_BR', 'Aube'),
(1914, 192, 'pt_BR', 'Aude'),
(1915, 193, 'pt_BR', 'Aveyron'),
(1916, 194, 'pt_BR', 'BOCAS DO Rhône'),
(1917, 195, 'pt_BR', 'Calvados'),
(1918, 196, 'pt_BR', 'Cantal'),
(1919, 197, 'pt_BR', 'Charente'),
(1920, 198, 'pt_BR', 'Charente-Maritime'),
(1921, 199, 'pt_BR', 'Cher'),
(1922, 200, 'pt_BR', 'Corrèze'),
(1923, 201, 'pt_BR', 'Corse-du-Sud'),
(1924, 202, 'pt_BR', 'Alta Córsega'),
(1925, 203, 'pt_BR', 'Costa d\'OrCorrèze'),
(1926, 204, 'pt_BR', 'Cotes d\'Armor'),
(1927, 205, 'pt_BR', 'Creuse'),
(1928, 206, 'pt_BR', 'Dordogne'),
(1929, 207, 'pt_BR', 'Doubs'),
(1930, 208, 'pt_BR', 'DrômeFinistère'),
(1931, 209, 'pt_BR', 'Eure'),
(1932, 210, 'pt_BR', 'Eure-et-Loir'),
(1933, 211, 'pt_BR', 'Finistère'),
(1934, 212, 'pt_BR', 'Gard'),
(1935, 213, 'pt_BR', 'Haute-Garonne'),
(1936, 214, 'pt_BR', 'Gers'),
(1937, 215, 'pt_BR', 'Gironde'),
(1938, 216, 'pt_BR', 'Hérault'),
(1939, 217, 'pt_BR', 'Ille-et-Vilaine'),
(1940, 218, 'pt_BR', 'Indre'),
(1941, 219, 'pt_BR', 'Indre-et-Loire'),
(1942, 220, 'pt_BR', 'Isère'),
(1943, 221, 'pt_BR', 'Jura'),
(1944, 222, 'pt_BR', 'Landes'),
(1945, 223, 'pt_BR', 'Loir-et-Cher'),
(1946, 224, 'pt_BR', 'Loire'),
(1947, 22, 'pt_BR', 'Haute-Loire'),
(1948, 226, 'pt_BR', 'Loire-Atlantique'),
(1949, 227, 'pt_BR', 'Loiret'),
(1950, 228, 'pt_BR', 'Lot'),
(1951, 229, 'pt_BR', 'Lot e Garona'),
(1952, 230, 'pt_BR', 'Lozère'),
(1953, 231, 'pt_BR', 'Maine-et-Loire'),
(1954, 232, 'pt_BR', 'Manche'),
(1955, 233, 'pt_BR', 'Marne'),
(1956, 234, 'pt_BR', 'Haute-Marne'),
(1957, 235, 'pt_BR', 'Mayenne'),
(1958, 236, 'pt_BR', 'Meurthe-et-Moselle'),
(1959, 237, 'pt_BR', 'Meuse'),
(1960, 238, 'pt_BR', 'Morbihan'),
(1961, 239, 'pt_BR', 'Moselle'),
(1962, 240, 'pt_BR', 'Nièvre'),
(1963, 241, 'pt_BR', 'Nord'),
(1964, 242, 'pt_BR', 'Oise'),
(1965, 243, 'pt_BR', 'Orne'),
(1966, 244, 'pt_BR', 'Pas-de-Calais'),
(1967, 24, 'pt_BR', 'Puy-de-Dôme'),
(1968, 246, 'pt_BR', 'Pirineus Atlânticos'),
(1969, 247, 'pt_BR', 'Hautes-Pyrénées'),
(1970, 248, 'pt_BR', 'Pirineus Orientais'),
(1971, 249, 'pt_BR', 'Bas-Rhin'),
(1972, 250, 'pt_BR', 'Alto Reno'),
(1973, 251, 'pt_BR', 'Rhône'),
(1974, 252, 'pt_BR', 'Haute-Saône'),
(1975, 253, 'pt_BR', 'Saône-et-Loire'),
(1976, 25, 'pt_BR', 'Sarthe'),
(1977, 255, 'pt_BR', 'Savoie'),
(1978, 256, 'pt_BR', 'Alta Sabóia'),
(1979, 257, 'pt_BR', 'Paris'),
(1980, 258, 'pt_BR', 'Seine-Maritime'),
(1981, 259, 'pt_BR', 'Seine-et-Marne'),
(1982, 260, 'pt_BR', 'Yvelines'),
(1983, 261, 'pt_BR', 'Deux-Sèvres'),
(1984, 262, 'pt_BR', 'Somme'),
(1985, 263, 'pt_BR', 'Tarn'),
(1986, 264, 'pt_BR', 'Tarn-et-Garonne'),
(1987, 265, 'pt_BR', 'Var'),
(1988, 266, 'pt_BR', 'Vaucluse'),
(1989, 267, 'pt_BR', 'Compradora'),
(1990, 268, 'pt_BR', 'Vienne'),
(1991, 269, 'pt_BR', 'Haute-Vienne'),
(1992, 270, 'pt_BR', 'Vosges'),
(1993, 271, 'pt_BR', 'Yonne'),
(1994, 272, 'pt_BR', 'Território de Belfort'),
(1995, 273, 'pt_BR', 'Essonne'),
(1996, 274, 'pt_BR', 'Altos do Sena'),
(1997, 275, 'pt_BR', 'Seine-Saint-Denis'),
(1998, 276, 'pt_BR', 'Val-de-Marne'),
(1999, 277, 'pt_BR', 'Val-d\'Oise'),
(2000, 278, 'pt_BR', 'Alba'),
(2001, 279, 'pt_BR', 'Arad'),
(2002, 280, 'pt_BR', 'Arges'),
(2003, 281, 'pt_BR', 'Bacau'),
(2004, 282, 'pt_BR', 'Bihor'),
(2005, 283, 'pt_BR', 'Bistrita-Nasaud'),
(2006, 284, 'pt_BR', 'Botosani'),
(2007, 285, 'pt_BR', 'Brașov'),
(2008, 286, 'pt_BR', 'Braila'),
(2009, 287, 'pt_BR', 'Bucareste'),
(2010, 288, 'pt_BR', 'Buzau'),
(2011, 289, 'pt_BR', 'Caras-Severin'),
(2012, 290, 'pt_BR', 'Călărași'),
(2013, 291, 'pt_BR', 'Cluj'),
(2014, 292, 'pt_BR', 'Constanta'),
(2015, 29, 'pt_BR', 'Covasna'),
(2016, 294, 'pt_BR', 'Dambovita'),
(2017, 295, 'pt_BR', 'Dolj'),
(2018, 296, 'pt_BR', 'Galati'),
(2019, 297, 'pt_BR', 'Giurgiu'),
(2020, 298, 'pt_BR', 'Gorj'),
(2021, 299, 'pt_BR', 'Harghita'),
(2022, 300, 'pt_BR', 'Hunedoara'),
(2023, 301, 'pt_BR', 'Ialomita'),
(2024, 302, 'pt_BR', 'Iasi'),
(2025, 303, 'pt_BR', 'Ilfov'),
(2026, 304, 'pt_BR', 'Maramures'),
(2027, 305, 'pt_BR', 'Maramures'),
(2028, 306, 'pt_BR', 'Mures'),
(2029, 307, 'pt_BR', 'alemão'),
(2030, 308, 'pt_BR', 'Olt'),
(2031, 309, 'pt_BR', 'Prahova'),
(2032, 310, 'pt_BR', 'Satu-Mare'),
(2033, 311, 'pt_BR', 'Salaj'),
(2034, 312, 'pt_BR', 'Sibiu'),
(2035, 313, 'pt_BR', 'Suceava'),
(2036, 314, 'pt_BR', 'Teleorman'),
(2037, 315, 'pt_BR', 'Timis'),
(2038, 316, 'pt_BR', 'Tulcea'),
(2039, 317, 'pt_BR', 'Vaslui'),
(2040, 318, 'pt_BR', 'dale'),
(2041, 319, 'pt_BR', 'Vrancea'),
(2042, 320, 'pt_BR', 'Lappi'),
(2043, 321, 'pt_BR', 'Pohjois-Pohjanmaa'),
(2044, 322, 'pt_BR', 'Kainuu'),
(2045, 323, 'pt_BR', 'Pohjois-Karjala'),
(2046, 324, 'pt_BR', 'Pohjois-Savo'),
(2047, 325, 'pt_BR', 'Sul Savo'),
(2048, 326, 'pt_BR', 'Ostrobothnia do sul'),
(2049, 327, 'pt_BR', 'Pohjanmaa'),
(2050, 328, 'pt_BR', 'Pirkanmaa'),
(2051, 329, 'pt_BR', 'Satakunta'),
(2052, 330, 'pt_BR', 'Keski-Pohjanmaa'),
(2053, 331, 'pt_BR', 'Keski-Suomi'),
(2054, 332, 'pt_BR', 'Varsinais-Suomi'),
(2055, 333, 'pt_BR', 'Carélia do Sul'),
(2056, 334, 'pt_BR', 'Päijät-Häme'),
(2057, 335, 'pt_BR', 'Kanta-Häme'),
(2058, 336, 'pt_BR', 'Uusimaa'),
(2059, 337, 'pt_BR', 'Uusimaa'),
(2060, 338, 'pt_BR', 'Kymenlaakso'),
(2061, 339, 'pt_BR', 'Ahvenanmaa'),
(2062, 340, 'pt_BR', 'Harjumaa'),
(2063, 341, 'pt_BR', 'Hiiumaa'),
(2064, 342, 'pt_BR', 'Ida-Virumaa'),
(2065, 343, 'pt_BR', 'Condado de Jõgeva'),
(2066, 344, 'pt_BR', 'Condado de Järva'),
(2067, 345, 'pt_BR', 'Läänemaa'),
(2068, 346, 'pt_BR', 'Condado de Lääne-Viru'),
(2069, 347, 'pt_BR', 'Condado de Põlva'),
(2070, 348, 'pt_BR', 'Condado de Pärnu'),
(2071, 349, 'pt_BR', 'Raplamaa'),
(2072, 350, 'pt_BR', 'Saaremaa'),
(2073, 351, 'pt_BR', 'Tartumaa'),
(2074, 352, 'pt_BR', 'Valgamaa'),
(2075, 353, 'pt_BR', 'Viljandimaa'),
(2076, 354, 'pt_BR', 'Võrumaa'),
(2077, 355, 'pt_BR', 'Daugavpils'),
(2078, 356, 'pt_BR', 'Jelgava'),
(2079, 357, 'pt_BR', 'Jekabpils'),
(2080, 358, 'pt_BR', 'Jurmala'),
(2081, 359, 'pt_BR', 'Liepaja'),
(2082, 360, 'pt_BR', 'Liepaja County'),
(2083, 361, 'pt_BR', 'Rezekne'),
(2084, 362, 'pt_BR', 'Riga'),
(2085, 363, 'pt_BR', 'Condado de Riga'),
(2086, 364, 'pt_BR', 'Valmiera'),
(2087, 365, 'pt_BR', 'Ventspils'),
(2088, 366, 'pt_BR', 'Aglonas novads'),
(2089, 367, 'pt_BR', 'Aizkraukles novads'),
(2090, 368, 'pt_BR', 'Aizputes novads'),
(2091, 369, 'pt_BR', 'Condado de Akniste'),
(2092, 370, 'pt_BR', 'Alojas novads'),
(2093, 371, 'pt_BR', 'Alsungas novads'),
(2094, 372, 'pt_BR', 'Aluksne County'),
(2095, 373, 'pt_BR', 'Amatas novads'),
(2096, 374, 'pt_BR', 'Macacos novads'),
(2097, 375, 'pt_BR', 'Auces novads'),
(2098, 376, 'pt_BR', 'Babītes novads'),
(2099, 377, 'pt_BR', 'Baldones novads'),
(2100, 378, 'pt_BR', 'Baltinavas novads'),
(2101, 379, 'pt_BR', 'Balvu novads'),
(2102, 380, 'pt_BR', 'Bauskas novads'),
(2103, 381, 'pt_BR', 'Condado de Beverina'),
(2104, 382, 'pt_BR', 'Condado de Broceni'),
(2105, 383, 'pt_BR', 'Burtnieku novads'),
(2106, 384, 'pt_BR', 'Carnikavas novads'),
(2107, 385, 'pt_BR', 'Cesvaines novads'),
(2108, 386, 'pt_BR', 'Ciblas novads'),
(2109, 387, 'pt_BR', 'Cesis county'),
(2110, 388, 'pt_BR', 'Dagdas novads'),
(2111, 389, 'pt_BR', 'Daugavpils novads'),
(2112, 390, 'pt_BR', 'Dobeles novads'),
(2113, 391, 'pt_BR', 'Dundagas novads'),
(2114, 392, 'pt_BR', 'Durbes novads'),
(2115, 393, 'pt_BR', 'Engad novads'),
(2116, 394, 'pt_BR', 'Garkalnes novads'),
(2117, 395, 'pt_BR', 'O condado de Grobiņa'),
(2118, 396, 'pt_BR', 'Gulbenes novads'),
(2119, 397, 'pt_BR', 'Iecavas novads'),
(2120, 398, 'pt_BR', 'Ikskile county'),
(2121, 399, 'pt_BR', 'Ilūkste county'),
(2122, 400, 'pt_BR', 'Condado de Inčukalns'),
(2123, 401, 'pt_BR', 'Jaunjelgavas novads'),
(2124, 402, 'pt_BR', 'Jaunpiebalgas novads'),
(2125, 403, 'pt_BR', 'Jaunpils novads'),
(2126, 404, 'pt_BR', 'Jelgavas novads'),
(2127, 405, 'pt_BR', 'Jekabpils county'),
(2128, 406, 'pt_BR', 'Kandavas novads'),
(2129, 407, 'pt_BR', 'Kokneses novads'),
(2130, 408, 'pt_BR', 'Krimuldas novads'),
(2131, 409, 'pt_BR', 'Krustpils novads'),
(2132, 410, 'pt_BR', 'Condado de Kraslava'),
(2133, 411, 'pt_BR', 'Condado de Kuldīga'),
(2134, 412, 'pt_BR', 'Condado de Kārsava'),
(2135, 413, 'pt_BR', 'Condado de Lielvarde'),
(2136, 414, 'pt_BR', 'Condado de Limbaži'),
(2137, 415, 'pt_BR', 'O distrito de Lubāna'),
(2138, 416, 'pt_BR', 'Ludzas novads'),
(2139, 417, 'pt_BR', 'Ligatne county'),
(2140, 418, 'pt_BR', 'Livani county'),
(2141, 419, 'pt_BR', 'Madonas novads'),
(2142, 420, 'pt_BR', 'Mazsalacas novads'),
(2143, 421, 'pt_BR', 'Mālpils county'),
(2144, 422, 'pt_BR', 'Mārupe county'),
(2145, 423, 'pt_BR', 'O condado de Naukšēni'),
(2146, 424, 'pt_BR', 'Neretas novads'),
(2147, 425, 'pt_BR', 'Nīca county'),
(2148, 426, 'pt_BR', 'Ogres novads'),
(2149, 427, 'pt_BR', 'Olaines novads'),
(2150, 428, 'pt_BR', 'Ozolnieku novads'),
(2151, 429, 'pt_BR', 'Preiļi county'),
(2152, 430, 'pt_BR', 'Priekules novads'),
(2153, 431, 'pt_BR', 'Condado de Priekuļi'),
(2154, 432, 'pt_BR', 'Moving county'),
(2155, 433, 'pt_BR', 'Condado de Pavilosta'),
(2156, 434, 'pt_BR', 'Condado de Plavinas'),
(2157, 435, 'pt_BR', 'Raunas novads'),
(2158, 436, 'pt_BR', 'Condado de Riebiņi'),
(2159, 437, 'pt_BR', 'Rojas novads'),
(2160, 438, 'pt_BR', 'Ropazi county'),
(2161, 439, 'pt_BR', 'Rucavas novads'),
(2162, 440, 'pt_BR', 'Rugāji county'),
(2163, 441, 'pt_BR', 'Rundāle county'),
(2164, 442, 'pt_BR', 'Rezekne county'),
(2165, 443, 'pt_BR', 'Rūjiena county'),
(2166, 444, 'pt_BR', 'O município de Salacgriva'),
(2167, 445, 'pt_BR', 'Salas novads'),
(2168, 446, 'pt_BR', 'Salaspils novads'),
(2169, 447, 'pt_BR', 'Saldus novads'),
(2170, 448, 'pt_BR', 'Saulkrastu novads'),
(2171, 449, 'pt_BR', 'Siguldas novads'),
(2172, 450, 'pt_BR', 'Skrundas novads'),
(2173, 451, 'pt_BR', 'Skrīveri county'),
(2174, 452, 'pt_BR', 'Smiltenes novads'),
(2175, 453, 'pt_BR', 'Condado de Stopini'),
(2176, 454, 'pt_BR', 'Condado de Strenči'),
(2177, 455, 'pt_BR', 'Região de semeadura'),
(2178, 456, 'pt_BR', 'Talsu novads'),
(2179, 457, 'pt_BR', 'Tukuma novads'),
(2180, 458, 'pt_BR', 'Condado de Tērvete'),
(2181, 459, 'pt_BR', 'O condado de Vaiņode'),
(2182, 460, 'pt_BR', 'Valkas novads'),
(2183, 461, 'pt_BR', 'Valmieras novads'),
(2184, 462, 'pt_BR', 'Varaklani county'),
(2185, 463, 'pt_BR', 'Vecpiebalgas novads'),
(2186, 464, 'pt_BR', 'Vecumnieku novads'),
(2187, 465, 'pt_BR', 'Ventspils novads'),
(2188, 466, 'pt_BR', 'Condado de Viesite'),
(2189, 467, 'pt_BR', 'Condado de Vilaka'),
(2190, 468, 'pt_BR', 'Vilani county'),
(2191, 469, 'pt_BR', 'Condado de Varkava'),
(2192, 470, 'pt_BR', 'Zilupes novads'),
(2193, 471, 'pt_BR', 'Adazi county'),
(2194, 472, 'pt_BR', 'Erglu county'),
(2195, 473, 'pt_BR', 'Kegums county'),
(2196, 474, 'pt_BR', 'Kekava county'),
(2197, 475, 'pt_BR', 'Alytaus Apskritis'),
(2198, 476, 'pt_BR', 'Kauno Apskritis'),
(2199, 477, 'pt_BR', 'Condado de Klaipeda'),
(2200, 478, 'pt_BR', 'Marijampolė county'),
(2201, 479, 'pt_BR', 'Panevezys county'),
(2202, 480, 'pt_BR', 'Siauliai county'),
(2203, 481, 'pt_BR', 'Taurage county'),
(2204, 482, 'pt_BR', 'Telšiai county'),
(2205, 483, 'pt_BR', 'Utenos Apskritis'),
(2206, 484, 'pt_BR', 'Vilniaus Apskritis'),
(2207, 485, 'pt_BR', 'Acre'),
(2208, 486, 'pt_BR', 'Alagoas'),
(2209, 487, 'pt_BR', 'Amapá'),
(2210, 488, 'pt_BR', 'Amazonas'),
(2211, 489, 'pt_BR', 'Bahia'),
(2212, 490, 'pt_BR', 'Ceará'),
(2213, 491, 'pt_BR', 'Espírito Santo'),
(2214, 492, 'pt_BR', 'Goiás'),
(2215, 493, 'pt_BR', 'Maranhão'),
(2216, 494, 'pt_BR', 'Mato Grosso'),
(2217, 495, 'pt_BR', 'Mato Grosso do Sul'),
(2218, 496, 'pt_BR', 'Minas Gerais'),
(2219, 497, 'pt_BR', 'Pará'),
(2220, 498, 'pt_BR', 'Paraíba'),
(2221, 499, 'pt_BR', 'Paraná'),
(2222, 500, 'pt_BR', 'Pernambuco'),
(2223, 501, 'pt_BR', 'Piauí'),
(2224, 502, 'pt_BR', 'Rio de Janeiro'),
(2225, 503, 'pt_BR', 'Rio Grande do Norte'),
(2226, 504, 'pt_BR', 'Rio Grande do Sul'),
(2227, 505, 'pt_BR', 'Rondônia'),
(2228, 506, 'pt_BR', 'Roraima'),
(2229, 507, 'pt_BR', 'Santa Catarina'),
(2230, 508, 'pt_BR', 'São Paulo'),
(2231, 509, 'pt_BR', 'Sergipe'),
(2232, 510, 'pt_BR', 'Tocantins'),
(2233, 511, 'pt_BR', 'Distrito Federal'),
(2234, 512, 'pt_BR', 'Condado de Zagreb'),
(2235, 513, 'pt_BR', 'Condado de Krapina-Zagorje'),
(2236, 514, 'pt_BR', 'Condado de Sisak-Moslavina'),
(2237, 515, 'pt_BR', 'Condado de Karlovac'),
(2238, 516, 'pt_BR', 'Concelho de Varaždin'),
(2239, 517, 'pt_BR', 'Condado de Koprivnica-Križevci'),
(2240, 518, 'pt_BR', 'Condado de Bjelovar-Bilogora'),
(2241, 519, 'pt_BR', 'Condado de Primorje-Gorski kotar'),
(2242, 520, 'pt_BR', 'Condado de Lika-Senj'),
(2243, 521, 'pt_BR', 'Condado de Virovitica-Podravina'),
(2244, 522, 'pt_BR', 'Condado de Požega-Slavonia'),
(2245, 523, 'pt_BR', 'Condado de Brod-Posavina'),
(2246, 524, 'pt_BR', 'Condado de Zadar'),
(2247, 525, 'pt_BR', 'Condado de Osijek-Baranja'),
(2248, 526, 'pt_BR', 'Condado de Šibenik-Knin'),
(2249, 527, 'pt_BR', 'Condado de Vukovar-Srijem'),
(2250, 528, 'pt_BR', 'Condado de Split-Dalmácia'),
(2251, 529, 'pt_BR', 'Condado de Ístria'),
(2252, 530, 'pt_BR', 'Condado de Dubrovnik-Neretva'),
(2253, 531, 'pt_BR', 'Međimurska županija'),
(2254, 532, 'pt_BR', 'Grad Zagreb'),
(2255, 533, 'pt_BR', 'Ilhas Andaman e Nicobar'),
(2256, 534, 'pt_BR', 'Andhra Pradesh'),
(2257, 535, 'pt_BR', 'Arunachal Pradesh'),
(2258, 536, 'pt_BR', 'Assam'),
(2259, 537, 'pt_BR', 'Bihar'),
(2260, 538, 'pt_BR', 'Chandigarh'),
(2261, 539, 'pt_BR', 'Chhattisgarh'),
(2262, 540, 'pt_BR', 'Dadra e Nagar Haveli'),
(2263, 541, 'pt_BR', 'Daman e Diu'),
(2264, 542, 'pt_BR', 'Delhi'),
(2265, 543, 'pt_BR', 'Goa'),
(2266, 544, 'pt_BR', 'Gujarat'),
(2267, 545, 'pt_BR', 'Haryana'),
(2268, 546, 'pt_BR', 'Himachal Pradesh'),
(2269, 547, 'pt_BR', 'Jammu e Caxemira'),
(2270, 548, 'pt_BR', 'Jharkhand'),
(2271, 549, 'pt_BR', 'Karnataka'),
(2272, 550, 'pt_BR', 'Kerala'),
(2273, 551, 'pt_BR', 'Lakshadweep'),
(2274, 552, 'pt_BR', 'Madhya Pradesh'),
(2275, 553, 'pt_BR', 'Maharashtra'),
(2276, 554, 'pt_BR', 'Manipur'),
(2277, 555, 'pt_BR', 'Meghalaya'),
(2278, 556, 'pt_BR', 'Mizoram'),
(2279, 557, 'pt_BR', 'Nagaland'),
(2280, 558, 'pt_BR', 'Odisha'),
(2281, 559, 'pt_BR', 'Puducherry'),
(2282, 560, 'pt_BR', 'Punjab'),
(2283, 561, 'pt_BR', 'Rajasthan'),
(2284, 562, 'pt_BR', 'Sikkim'),
(2285, 563, 'pt_BR', 'Tamil Nadu'),
(2286, 564, 'pt_BR', 'Telangana'),
(2287, 565, 'pt_BR', 'Tripura'),
(2288, 566, 'pt_BR', 'Uttar Pradesh'),
(2289, 567, 'pt_BR', 'Uttarakhand'),
(2290, 568, 'pt_BR', 'Bengala Ocidental');

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_translations`
--

INSERT INTO `country_translations` (`id`, `country_id`, `locale`, `name`) VALUES
(1, 1, 'ar', 'أفغانستان'),
(2, 2, 'ar', 'جزر آلاند'),
(3, 3, 'ar', 'ألبانيا'),
(4, 4, 'ar', 'الجزائر'),
(5, 5, 'ar', 'ساموا الأمريكية'),
(6, 6, 'ar', 'أندورا'),
(7, 7, 'ar', 'أنغولا'),
(8, 8, 'ar', 'أنغيلا'),
(9, 9, 'ar', 'القارة القطبية الجنوبية'),
(10, 10, 'ar', 'أنتيغوا وبربودا'),
(11, 11, 'ar', 'الأرجنتين'),
(12, 12, 'ar', 'أرمينيا'),
(13, 13, 'ar', 'أروبا'),
(14, 14, 'ar', 'جزيرة الصعود'),
(15, 15, 'ar', 'أستراليا'),
(16, 16, 'ar', 'النمسا'),
(17, 17, 'ar', 'أذربيجان'),
(18, 18, 'ar', 'الباهاما'),
(19, 19, 'ar', 'البحرين'),
(20, 20, 'ar', 'بنغلاديش'),
(21, 21, 'ar', 'بربادوس'),
(22, 22, 'ar', 'روسيا البيضاء'),
(23, 23, 'ar', 'بلجيكا'),
(24, 24, 'ar', 'بليز'),
(25, 25, 'ar', 'بنين'),
(26, 26, 'ar', 'برمودا'),
(27, 27, 'ar', 'بوتان'),
(28, 28, 'ar', 'بوليفيا'),
(29, 29, 'ar', 'البوسنة والهرسك'),
(30, 30, 'ar', 'بوتسوانا'),
(31, 31, 'ar', 'البرازيل'),
(32, 32, 'ar', 'إقليم المحيط البريطاني الهندي'),
(33, 33, 'ar', 'جزر فيرجن البريطانية'),
(34, 34, 'ar', 'بروناي'),
(35, 35, 'ar', 'بلغاريا'),
(36, 36, 'ar', 'بوركينا فاسو'),
(37, 37, 'ar', 'بوروندي'),
(38, 38, 'ar', 'كمبوديا'),
(39, 39, 'ar', 'الكاميرون'),
(40, 40, 'ar', 'كندا'),
(41, 41, 'ar', 'جزر الكناري'),
(42, 42, 'ar', 'الرأس الأخضر'),
(43, 43, 'ar', 'الكاريبي هولندا'),
(44, 44, 'ar', 'جزر كايمان'),
(45, 45, 'ar', 'جمهورية افريقيا الوسطى'),
(46, 46, 'ar', 'سبتة ومليلية'),
(47, 47, 'ar', 'تشاد'),
(48, 48, 'ar', 'تشيلي'),
(49, 49, 'ar', 'الصين'),
(50, 50, 'ar', 'جزيرة الكريسماس'),
(51, 51, 'ar', 'جزر كوكوس (كيلينغ)'),
(52, 52, 'ar', 'كولومبيا'),
(53, 53, 'ar', 'جزر القمر'),
(54, 54, 'ar', 'الكونغو - برازافيل'),
(55, 55, 'ar', 'الكونغو - كينشاسا'),
(56, 56, 'ar', 'جزر كوك'),
(57, 57, 'ar', 'كوستاريكا'),
(58, 58, 'ar', 'ساحل العاج'),
(59, 59, 'ar', 'كرواتيا'),
(60, 60, 'ar', 'كوبا'),
(61, 61, 'ar', 'كوراساو'),
(62, 62, 'ar', 'قبرص'),
(63, 63, 'ar', 'التشيك'),
(64, 64, 'ar', 'الدنمارك'),
(65, 65, 'ar', 'دييغو غارسيا'),
(66, 66, 'ar', 'جيبوتي'),
(67, 67, 'ar', 'دومينيكا'),
(68, 68, 'ar', 'جمهورية الدومنيكان'),
(69, 69, 'ar', 'الإكوادور'),
(70, 70, 'ar', 'مصر'),
(71, 71, 'ar', 'السلفادور'),
(72, 72, 'ar', 'غينيا الإستوائية'),
(73, 73, 'ar', 'إريتريا'),
(74, 74, 'ar', 'استونيا'),
(75, 75, 'ar', 'أثيوبيا'),
(76, 76, 'ar', 'منطقة اليورو'),
(77, 77, 'ar', 'جزر فوكلاند'),
(78, 78, 'ar', 'جزر فاروس'),
(79, 79, 'ar', 'فيجي'),
(80, 80, 'ar', 'فنلندا'),
(81, 81, 'ar', 'فرنسا'),
(82, 82, 'ar', 'غيانا الفرنسية'),
(83, 83, 'ar', 'بولينيزيا الفرنسية'),
(84, 84, 'ar', 'المناطق الجنوبية لفرنسا'),
(85, 85, 'ar', 'الغابون'),
(86, 86, 'ar', 'غامبيا'),
(87, 87, 'ar', 'جورجيا'),
(88, 88, 'ar', 'ألمانيا'),
(89, 89, 'ar', 'غانا'),
(90, 90, 'ar', 'جبل طارق'),
(91, 91, 'ar', 'اليونان'),
(92, 92, 'ar', 'الأرض الخضراء'),
(93, 93, 'ar', 'غرينادا'),
(94, 94, 'ar', 'جوادلوب'),
(95, 95, 'ar', 'غوام'),
(96, 96, 'ar', 'غواتيمالا'),
(97, 97, 'ar', 'غيرنسي'),
(98, 98, 'ar', 'غينيا'),
(99, 99, 'ar', 'غينيا بيساو'),
(100, 100, 'ar', 'غيانا'),
(101, 101, 'ar', 'هايتي'),
(102, 102, 'ar', 'هندوراس'),
(103, 103, 'ar', 'هونج كونج SAR الصين'),
(104, 104, 'ar', 'هنغاريا'),
(105, 105, 'ar', 'أيسلندا'),
(106, 106, 'ar', 'الهند'),
(107, 107, 'ar', 'إندونيسيا'),
(108, 108, 'ar', 'إيران'),
(109, 109, 'ar', 'العراق'),
(110, 110, 'ar', 'أيرلندا'),
(111, 111, 'ar', 'جزيرة آيل أوف مان'),
(112, 112, 'ar', 'إسرائيل'),
(113, 113, 'ar', 'إيطاليا'),
(114, 114, 'ar', 'جامايكا'),
(115, 115, 'ar', 'اليابان'),
(116, 116, 'ar', 'جيرسي'),
(117, 117, 'ar', 'الأردن'),
(118, 118, 'ar', 'كازاخستان'),
(119, 119, 'ar', 'كينيا'),
(120, 120, 'ar', 'كيريباس'),
(121, 121, 'ar', 'كوسوفو'),
(122, 122, 'ar', 'الكويت'),
(123, 123, 'ar', 'قرغيزستان'),
(124, 124, 'ar', 'لاوس'),
(125, 125, 'ar', 'لاتفيا'),
(126, 126, 'ar', 'لبنان'),
(127, 127, 'ar', 'ليسوتو'),
(128, 128, 'ar', 'ليبيريا'),
(129, 129, 'ar', 'ليبيا'),
(130, 130, 'ar', 'ليختنشتاين'),
(131, 131, 'ar', 'ليتوانيا'),
(132, 132, 'ar', 'لوكسمبورغ'),
(133, 133, 'ar', 'ماكاو SAR الصين'),
(134, 134, 'ar', 'مقدونيا'),
(135, 135, 'ar', 'مدغشقر'),
(136, 136, 'ar', 'مالاوي'),
(137, 137, 'ar', 'ماليزيا'),
(138, 138, 'ar', 'جزر المالديف'),
(139, 139, 'ar', 'مالي'),
(140, 140, 'ar', 'مالطا'),
(141, 141, 'ar', 'جزر مارشال'),
(142, 142, 'ar', 'مارتينيك'),
(143, 143, 'ar', 'موريتانيا'),
(144, 144, 'ar', 'موريشيوس'),
(145, 145, 'ar', 'ضائع'),
(146, 146, 'ar', 'المكسيك'),
(147, 147, 'ar', 'ميكرونيزيا'),
(148, 148, 'ar', 'مولدوفا'),
(149, 149, 'ar', 'موناكو'),
(150, 150, 'ar', 'منغوليا'),
(151, 151, 'ar', 'الجبل الأسود'),
(152, 152, 'ar', 'مونتسيرات'),
(153, 153, 'ar', 'المغرب'),
(154, 154, 'ar', 'موزمبيق'),
(155, 155, 'ar', 'ميانمار (بورما)'),
(156, 156, 'ar', 'ناميبيا'),
(157, 157, 'ar', 'ناورو'),
(158, 158, 'ar', 'نيبال'),
(159, 159, 'ar', 'نيبال'),
(160, 160, 'ar', 'كاليدونيا الجديدة'),
(161, 161, 'ar', 'نيوزيلاندا'),
(162, 162, 'ar', 'نيكاراغوا'),
(163, 163, 'ar', 'النيجر'),
(164, 164, 'ar', 'نيجيريا'),
(165, 165, 'ar', 'نيوي'),
(166, 166, 'ar', 'جزيرة نورفولك'),
(167, 167, 'ar', 'كوريا الشماليه'),
(168, 168, 'ar', 'جزر مريانا الشمالية'),
(169, 169, 'ar', 'النرويج'),
(170, 170, 'ar', 'سلطنة عمان'),
(171, 171, 'ar', 'باكستان'),
(172, 172, 'ar', 'بالاو'),
(173, 173, 'ar', 'الاراضي الفلسطينية'),
(174, 174, 'ar', 'بناما'),
(175, 175, 'ar', 'بابوا غينيا الجديدة'),
(176, 176, 'ar', 'باراغواي'),
(177, 177, 'ar', 'بيرو'),
(178, 178, 'ar', 'الفلبين'),
(179, 179, 'ar', 'جزر بيتكيرن'),
(180, 180, 'ar', 'بولندا'),
(181, 181, 'ar', 'البرتغال'),
(182, 182, 'ar', 'بورتوريكو'),
(183, 183, 'ar', 'دولة قطر'),
(184, 184, 'ar', 'جمع شمل'),
(185, 185, 'ar', 'رومانيا'),
(186, 186, 'ar', 'روسيا'),
(187, 187, 'ar', 'رواندا'),
(188, 188, 'ar', 'ساموا'),
(189, 189, 'ar', 'سان مارينو'),
(190, 190, 'ar', 'سانت كيتس ونيفيس'),
(191, 191, 'ar', 'المملكة العربية السعودية'),
(192, 192, 'ar', 'السنغال'),
(193, 193, 'ar', 'صربيا'),
(194, 194, 'ar', 'سيشيل'),
(195, 195, 'ar', 'سيراليون'),
(196, 196, 'ar', 'سنغافورة'),
(197, 197, 'ar', 'سينت مارتن'),
(198, 198, 'ar', 'سلوفاكيا'),
(199, 199, 'ar', 'سلوفينيا'),
(200, 200, 'ar', 'جزر سليمان'),
(201, 201, 'ar', 'الصومال'),
(202, 202, 'ar', 'جنوب أفريقيا'),
(203, 203, 'ar', 'جورجيا الجنوبية وجزر ساندويتش الجنوبية'),
(204, 204, 'ar', 'كوريا الجنوبية'),
(205, 205, 'ar', 'جنوب السودان'),
(206, 206, 'ar', 'إسبانيا'),
(207, 207, 'ar', 'سيريلانكا'),
(208, 208, 'ar', 'سانت بارتيليمي'),
(209, 209, 'ar', 'سانت هيلانة'),
(210, 210, 'ar', 'سانت كيتس ونيفيس'),
(211, 211, 'ar', 'شارع لوسيا'),
(212, 212, 'ar', 'سانت مارتن'),
(213, 213, 'ar', 'سانت بيير وميكلون'),
(214, 214, 'ar', 'سانت فنسنت وجزر غرينادين'),
(215, 215, 'ar', 'السودان'),
(216, 216, 'ar', 'سورينام'),
(217, 217, 'ar', 'سفالبارد وجان ماين'),
(218, 218, 'ar', 'سوازيلاند'),
(219, 219, 'ar', 'السويد'),
(220, 220, 'ar', 'سويسرا'),
(221, 221, 'ar', 'سوريا'),
(222, 222, 'ar', 'تايوان'),
(223, 223, 'ar', 'طاجيكستان'),
(224, 224, 'ar', 'تنزانيا'),
(225, 225, 'ar', 'تايلاند'),
(226, 226, 'ar', 'تيمور'),
(227, 227, 'ar', 'توجو'),
(228, 228, 'ar', 'توكيلاو'),
(229, 229, 'ar', 'تونغا'),
(230, 230, 'ar', 'ترينيداد وتوباغو'),
(231, 231, 'ar', 'تريستان دا كونها'),
(232, 232, 'ar', 'تونس'),
(233, 233, 'ar', 'ديك رومي'),
(234, 234, 'ar', 'تركمانستان'),
(235, 235, 'ar', 'جزر تركس وكايكوس'),
(236, 236, 'ar', 'توفالو'),
(237, 237, 'ar', 'جزر الولايات المتحدة البعيدة'),
(238, 238, 'ar', 'جزر فيرجن الأمريكية'),
(239, 239, 'ar', 'أوغندا'),
(240, 240, 'ar', 'أوكرانيا'),
(241, 241, 'ar', 'الإمارات العربية المتحدة'),
(242, 242, 'ar', 'المملكة المتحدة'),
(243, 243, 'ar', 'الأمم المتحدة'),
(244, 244, 'ar', 'الولايات المتحدة الأمريكية'),
(245, 245, 'ar', 'أوروغواي'),
(246, 246, 'ar', 'أوزبكستان'),
(247, 247, 'ar', 'فانواتو'),
(248, 248, 'ar', 'مدينة الفاتيكان'),
(249, 249, 'ar', 'فنزويلا'),
(250, 250, 'ar', 'فيتنام'),
(251, 251, 'ar', 'واليس وفوتونا'),
(252, 252, 'ar', 'الصحراء الغربية'),
(253, 253, 'ar', 'اليمن'),
(254, 254, 'ar', 'زامبيا'),
(255, 255, 'ar', 'زيمبابوي'),
(256, 1, 'es', 'Afganistán'),
(257, 2, 'es', 'Islas Åland'),
(258, 3, 'es', 'Albania'),
(259, 4, 'es', 'Argelia'),
(260, 5, 'es', 'Samoa Americana'),
(261, 6, 'es', 'Andorra'),
(262, 7, 'es', 'Angola'),
(263, 8, 'es', 'Anguila'),
(264, 9, 'es', 'Antártida'),
(265, 10, 'es', 'Antigua y Barbuda'),
(266, 11, 'es', 'Argentina'),
(267, 12, 'es', 'Armenia'),
(268, 13, 'es', 'Aruba'),
(269, 14, 'es', 'Isla Ascensión'),
(270, 15, 'es', 'Australia'),
(271, 16, 'es', 'Austria'),
(272, 17, 'es', 'Azerbaiyán'),
(273, 18, 'es', 'Bahamas'),
(274, 19, 'es', 'Bahrein'),
(275, 20, 'es', 'Bangladesh'),
(276, 21, 'es', 'Barbados'),
(277, 22, 'es', 'Bielorrusia'),
(278, 23, 'es', 'Bélgica'),
(279, 24, 'es', 'Belice'),
(280, 25, 'es', 'Benín'),
(281, 26, 'es', 'Islas Bermudas'),
(282, 27, 'es', 'Bhután'),
(283, 28, 'es', 'Bolivia'),
(284, 29, 'es', 'Bosnia y Herzegovina'),
(285, 30, 'es', 'Botsuana'),
(286, 31, 'es', 'Brasil'),
(287, 32, 'es', 'Territorio Británico del Océano índico'),
(288, 33, 'es', 'Islas Vírgenes Británicas'),
(289, 34, 'es', 'Brunéi'),
(290, 35, 'es', 'Bulgaria'),
(291, 36, 'es', 'Burkina Faso'),
(292, 37, 'es', 'Burundi'),
(293, 38, 'es', 'Camboya'),
(294, 39, 'es', 'Camerún'),
(295, 40, 'es', 'Canadá'),
(296, 41, 'es', 'Islas Canarias'),
(297, 42, 'es', 'Cabo Verde'),
(298, 43, 'es', 'Caribe Neerlandés'),
(299, 44, 'es', 'Islas Caimán'),
(300, 45, 'es', 'República Centroafricana'),
(301, 46, 'es', 'Ceuta y Melilla'),
(302, 47, 'es', 'Chad'),
(303, 48, 'es', 'Chile'),
(304, 49, 'es', 'China'),
(305, 50, 'es', 'Isla de Navidad'),
(306, 51, 'es', 'Islas Cocos'),
(307, 52, 'es', 'Colombia'),
(308, 53, 'es', 'Comoras'),
(309, 54, 'es', 'República del Congo'),
(310, 55, 'es', 'República Democrática del Congo'),
(311, 56, 'es', 'Islas Cook'),
(312, 57, 'es', 'Costa Rica'),
(313, 58, 'es', 'Costa de Marfil'),
(314, 59, 'es', 'Croacia'),
(315, 60, 'es', 'Cuba'),
(316, 61, 'es', 'Curazao'),
(317, 62, 'es', 'Chipre'),
(318, 63, 'es', 'República Checa'),
(319, 64, 'es', 'Dinamarca'),
(320, 65, 'es', 'Diego García'),
(321, 66, 'es', 'Yibuti'),
(322, 67, 'es', 'Dominica'),
(323, 68, 'es', 'República Dominicana'),
(324, 69, 'es', 'Ecuador'),
(325, 70, 'es', 'Egipto'),
(326, 71, 'es', 'El Salvador'),
(327, 72, 'es', 'Guinea Ecuatorial'),
(328, 73, 'es', 'Eritrea'),
(329, 74, 'es', 'Estonia'),
(330, 75, 'es', 'Etiopía'),
(331, 76, 'es', 'Europa'),
(332, 77, 'es', 'Islas Malvinas'),
(333, 78, 'es', 'Islas Feroe'),
(334, 79, 'es', 'Fiyi'),
(335, 80, 'es', 'Finlandia'),
(336, 81, 'es', 'Francia'),
(337, 82, 'es', 'Guayana Francesa'),
(338, 83, 'es', 'Polinesia Francesa'),
(339, 84, 'es', 'Territorios Australes y Antárticas Franceses'),
(340, 85, 'es', 'Gabón'),
(341, 86, 'es', 'Gambia'),
(342, 87, 'es', 'Georgia'),
(343, 88, 'es', 'Alemania'),
(344, 89, 'es', 'Ghana'),
(345, 90, 'es', 'Gibraltar'),
(346, 91, 'es', 'Grecia'),
(347, 92, 'es', 'Groenlandia'),
(348, 93, 'es', 'Granada'),
(349, 94, 'es', 'Guadalupe'),
(350, 95, 'es', 'Guam'),
(351, 96, 'es', 'Guatemala'),
(352, 97, 'es', 'Guernsey'),
(353, 98, 'es', 'Guinea'),
(354, 99, 'es', 'Guinea-Bisáu'),
(355, 100, 'es', 'Guyana'),
(356, 101, 'es', 'Haití'),
(357, 102, 'es', 'Honduras'),
(358, 103, 'es', 'Hong Kong'),
(359, 104, 'es', 'Hungría'),
(360, 105, 'es', 'Islandia'),
(361, 106, 'es', 'India'),
(362, 107, 'es', 'Indonesia'),
(363, 108, 'es', 'Irán'),
(364, 109, 'es', 'Irak'),
(365, 110, 'es', 'Irlanda'),
(366, 111, 'es', 'Isla de Man'),
(367, 112, 'es', 'Israel'),
(368, 113, 'es', 'Italia'),
(369, 114, 'es', 'Jamaica'),
(370, 115, 'es', 'Japón'),
(371, 116, 'es', 'Jersey'),
(372, 117, 'es', 'Jordania'),
(373, 118, 'es', 'Kazajistán'),
(374, 119, 'es', 'Kenia'),
(375, 120, 'es', 'Kiribati'),
(376, 121, 'es', 'Kosovo'),
(377, 122, 'es', 'Kuwait'),
(378, 123, 'es', 'Kirguistán'),
(379, 124, 'es', 'Laos'),
(380, 125, 'es', 'Letonia'),
(381, 126, 'es', 'Líbano'),
(382, 127, 'es', 'Lesoto'),
(383, 128, 'es', 'Liberia'),
(384, 129, 'es', 'Libia'),
(385, 130, 'es', 'Liechtenstein'),
(386, 131, 'es', 'Lituania'),
(387, 132, 'es', 'Luxemburgo'),
(388, 133, 'es', 'Macao'),
(389, 134, 'es', 'Macedonia'),
(390, 135, 'es', 'Madagascar'),
(391, 136, 'es', 'Malaui'),
(392, 137, 'es', 'Malasia'),
(393, 138, 'es', 'Maldivas'),
(394, 139, 'es', 'Malí'),
(395, 140, 'es', 'Malta'),
(396, 141, 'es', 'Islas Marshall'),
(397, 142, 'es', 'Martinica'),
(398, 143, 'es', 'Mauritania'),
(399, 144, 'es', 'Mauricio'),
(400, 145, 'es', 'Mayotte'),
(401, 146, 'es', 'México'),
(402, 147, 'es', 'Micronesia'),
(403, 148, 'es', 'Moldavia'),
(404, 149, 'es', 'Mónaco'),
(405, 150, 'es', 'Mongolia'),
(406, 151, 'es', 'Montenegro'),
(407, 152, 'es', 'Montserrat'),
(408, 153, 'es', 'Marruecos'),
(409, 154, 'es', 'Mozambique'),
(410, 155, 'es', 'Birmania'),
(411, 156, 'es', 'Namibia'),
(412, 157, 'es', 'Nauru'),
(413, 158, 'es', 'Nepal'),
(414, 159, 'es', 'Holanda'),
(415, 160, 'es', 'Nueva Caledonia'),
(416, 161, 'es', 'Nueva Zelanda'),
(417, 162, 'es', 'Nicaragua'),
(418, 163, 'es', 'Níger'),
(419, 164, 'es', 'Nigeria'),
(420, 165, 'es', 'Niue'),
(421, 166, 'es', 'Isla Norfolk'),
(422, 167, 'es', 'Corea del Norte'),
(423, 168, 'es', 'Islas Marianas del Norte'),
(424, 169, 'es', 'Noruega'),
(425, 170, 'es', 'Omán'),
(426, 171, 'es', 'Pakistán'),
(427, 172, 'es', 'Palaos'),
(428, 173, 'es', 'Palestina'),
(429, 174, 'es', 'Panamá'),
(430, 175, 'es', 'Papúa Nueva Guinea'),
(431, 176, 'es', 'Paraguay'),
(432, 177, 'es', 'Perú'),
(433, 178, 'es', 'Filipinas'),
(434, 179, 'es', 'Islas Pitcairn'),
(435, 180, 'es', 'Polonia'),
(436, 181, 'es', 'Portugal'),
(437, 182, 'es', 'Puerto Rico'),
(438, 183, 'es', 'Catar'),
(439, 184, 'es', 'Reunión'),
(440, 185, 'es', 'Rumania'),
(441, 186, 'es', 'Rusia'),
(442, 187, 'es', 'Ruanda'),
(443, 188, 'es', 'Samoa'),
(444, 189, 'es', 'San Marino'),
(445, 190, 'es', 'Santo Tomé y Príncipe'),
(446, 191, 'es', 'Arabia Saudita'),
(447, 192, 'es', 'Senegal'),
(448, 193, 'es', 'Serbia'),
(449, 194, 'es', 'Seychelles'),
(450, 195, 'es', 'Sierra Leona'),
(451, 196, 'es', 'Singapur'),
(452, 197, 'es', 'San Martín'),
(453, 198, 'es', 'Eslovaquia'),
(454, 199, 'es', 'Eslovenia'),
(455, 200, 'es', 'Islas Salomón'),
(456, 201, 'es', 'Somalia'),
(457, 202, 'es', 'Sudáfrica'),
(458, 203, 'es', 'Islas Georgias del Sur y Sandwich del Sur'),
(459, 204, 'es', 'Corea del Sur'),
(460, 205, 'es', 'Sudán del Sur'),
(461, 206, 'es', 'España'),
(462, 207, 'es', 'Sri Lanka'),
(463, 208, 'es', 'San Bartolomé'),
(464, 209, 'es', 'Santa Elena'),
(465, 210, 'es', 'San Cristóbal y Nieves'),
(466, 211, 'es', 'Santa Lucía'),
(467, 212, 'es', 'San Martín'),
(468, 213, 'es', 'San Pedro y Miquelón'),
(469, 214, 'es', 'San Vicente y las Granadinas'),
(470, 215, 'es', 'Sudán'),
(471, 216, 'es', 'Surinam'),
(472, 217, 'es', 'Svalbard y Jan Mayen'),
(473, 218, 'es', 'Suazilandia'),
(474, 219, 'es', 'Suecia'),
(475, 220, 'es', 'Suiza'),
(476, 221, 'es', 'Siri'),
(477, 222, 'es', 'Taiwán'),
(478, 223, 'es', 'Tayikistán'),
(479, 224, 'es', 'Tanzania'),
(480, 225, 'es', 'Tailandia'),
(481, 226, 'es', 'Timor Oriental'),
(482, 227, 'es', 'Togo'),
(483, 228, 'es', 'Tokelau'),
(484, 229, 'es', 'Tonga'),
(485, 230, 'es', 'Trinidad y Tobago'),
(486, 231, 'es', 'Tristán de Acuña'),
(487, 232, 'es', 'Túnez'),
(488, 233, 'es', 'Turquía'),
(489, 234, 'es', 'Turkmenistán'),
(490, 235, 'es', 'Islas Turcas y Caicos'),
(491, 236, 'es', 'Tuvalu'),
(492, 237, 'es', 'Islas Ultramarinas Menores de los Estados Unidos'),
(493, 238, 'es', 'Islas Vírgenes de los Estados Unidos'),
(494, 239, 'es', 'Uganda'),
(495, 240, 'es', 'Ucrania'),
(496, 241, 'es', 'Emiratos árabes Unidos'),
(497, 242, 'es', 'Reino Unido'),
(498, 243, 'es', 'Naciones Unidas'),
(499, 244, 'es', 'Estados Unidos'),
(500, 245, 'es', 'Uruguay'),
(501, 246, 'es', 'Uzbekistán'),
(502, 247, 'es', 'Vanuatu'),
(503, 248, 'es', 'Ciudad del Vaticano'),
(504, 249, 'es', 'Venezuela'),
(505, 250, 'es', 'Vietnam'),
(506, 251, 'es', 'Wallis y Futuna'),
(507, 252, 'es', 'Sahara Occidental'),
(508, 253, 'es', 'Yemen'),
(509, 254, 'es', 'Zambia'),
(510, 255, 'es', 'Zimbabue'),
(511, 1, 'fa', 'افغانستان'),
(512, 2, 'fa', 'جزایر الند'),
(513, 3, 'fa', 'آلبانی'),
(514, 4, 'fa', 'الجزایر'),
(515, 5, 'fa', 'ساموآ آمریکایی'),
(516, 6, 'fa', 'آندورا'),
(517, 7, 'fa', 'آنگولا'),
(518, 8, 'fa', 'آنگولا'),
(519, 9, 'fa', 'جنوبگان'),
(520, 10, 'fa', 'آنتیگوا و باربودا'),
(521, 11, 'fa', 'آرژانتین'),
(522, 12, 'fa', 'ارمنستان'),
(523, 13, 'fa', 'آروبا'),
(524, 14, 'fa', 'جزیره صعود'),
(525, 15, 'fa', 'استرالیا'),
(526, 16, 'fa', 'اتریش'),
(527, 17, 'fa', 'آذربایجان'),
(528, 18, 'fa', 'باهاما'),
(529, 19, 'fa', 'بحرین'),
(530, 20, 'fa', 'بنگلادش'),
(531, 21, 'fa', 'باربادوس'),
(532, 22, 'fa', 'بلاروس'),
(533, 23, 'fa', 'بلژیک'),
(534, 24, 'fa', 'بلژیک'),
(535, 25, 'fa', 'بنین'),
(536, 26, 'fa', 'برمودا'),
(537, 27, 'fa', 'بوتان'),
(538, 28, 'fa', 'بولیوی'),
(539, 29, 'fa', 'بوسنی و هرزگوین'),
(540, 30, 'fa', 'بوتسوانا'),
(541, 31, 'fa', 'برزیل'),
(542, 32, 'fa', 'قلمرو اقیانوس هند انگلیس'),
(543, 33, 'fa', 'جزایر ویرجین انگلیس'),
(544, 34, 'fa', 'برونئی'),
(545, 35, 'fa', 'بلغارستان'),
(546, 36, 'fa', 'بورکینا فاسو'),
(547, 37, 'fa', 'بوروندی'),
(548, 38, 'fa', 'کامبوج'),
(549, 39, 'fa', 'کامرون'),
(550, 40, 'fa', 'کانادا'),
(551, 41, 'fa', 'جزایر قناری'),
(552, 42, 'fa', 'کیپ ورد'),
(553, 43, 'fa', 'کارائیب هلند'),
(554, 44, 'fa', 'Cayman Islands'),
(555, 45, 'fa', 'جمهوری آفریقای مرکزی'),
(556, 46, 'fa', 'سوتا و ملیلا'),
(557, 47, 'fa', 'چاد'),
(558, 48, 'fa', 'شیلی'),
(559, 49, 'fa', 'چین'),
(560, 50, 'fa', 'جزیره کریسمس'),
(561, 51, 'fa', 'جزایر کوکو (Keeling)'),
(562, 52, 'fa', 'کلمبیا'),
(563, 53, 'fa', 'کومور'),
(564, 54, 'fa', 'کنگو - برزاویل'),
(565, 55, 'fa', 'کنگو - کینشاسا'),
(566, 56, 'fa', 'جزایر کوک'),
(567, 57, 'fa', 'کاستاریکا'),
(568, 58, 'fa', 'ساحل عاج'),
(569, 59, 'fa', 'کرواسی'),
(570, 60, 'fa', 'کوبا'),
(571, 61, 'fa', 'کوراسائو'),
(572, 62, 'fa', 'قبرس'),
(573, 63, 'fa', 'چک'),
(574, 64, 'fa', 'دانمارک'),
(575, 65, 'fa', 'دیگو گارسیا'),
(576, 66, 'fa', 'جیبوتی'),
(577, 67, 'fa', 'دومینیکا'),
(578, 68, 'fa', 'جمهوری دومینیکن'),
(579, 69, 'fa', 'اکوادور'),
(580, 70, 'fa', 'مصر'),
(581, 71, 'fa', 'السالوادور'),
(582, 72, 'fa', 'گینه استوایی'),
(583, 73, 'fa', 'اریتره'),
(584, 74, 'fa', 'استونی'),
(585, 75, 'fa', 'اتیوپی'),
(586, 76, 'fa', 'منطقه یورو'),
(587, 77, 'fa', 'جزایر فالکلند'),
(588, 78, 'fa', 'جزایر فارو'),
(589, 79, 'fa', 'فیجی'),
(590, 80, 'fa', 'فنلاند'),
(591, 81, 'fa', 'فرانسه'),
(592, 82, 'fa', 'گویان فرانسه'),
(593, 83, 'fa', 'پلی‌نزی فرانسه'),
(594, 84, 'fa', 'سرزمین های جنوبی فرانسه'),
(595, 85, 'fa', 'گابن'),
(596, 86, 'fa', 'گامبیا'),
(597, 87, 'fa', 'جورجیا'),
(598, 88, 'fa', 'آلمان'),
(599, 89, 'fa', 'غنا'),
(600, 90, 'fa', 'جبل الطارق'),
(601, 91, 'fa', 'یونان'),
(602, 92, 'fa', 'گرینلند'),
(603, 93, 'fa', 'گرنادا'),
(604, 94, 'fa', 'گوادلوپ'),
(605, 95, 'fa', 'گوام'),
(606, 96, 'fa', 'گواتمالا'),
(607, 97, 'fa', 'گورنسی'),
(608, 98, 'fa', 'گینه'),
(609, 99, 'fa', 'گینه بیسائو'),
(610, 100, 'fa', 'گویان'),
(611, 101, 'fa', 'هائیتی'),
(612, 102, 'fa', 'هندوراس'),
(613, 103, 'fa', 'هنگ کنگ SAR چین'),
(614, 104, 'fa', 'مجارستان'),
(615, 105, 'fa', 'ایسلند'),
(616, 106, 'fa', 'هند'),
(617, 107, 'fa', 'اندونزی'),
(618, 108, 'fa', 'ایران'),
(619, 109, 'fa', 'عراق'),
(620, 110, 'fa', 'ایرلند'),
(621, 111, 'fa', 'جزیره من'),
(622, 112, 'fa', 'اسرائيل'),
(623, 113, 'fa', 'ایتالیا'),
(624, 114, 'fa', 'جامائیکا'),
(625, 115, 'fa', 'ژاپن'),
(626, 116, 'fa', 'پیراهن ورزشی'),
(627, 117, 'fa', 'اردن'),
(628, 118, 'fa', 'قزاقستان'),
(629, 119, 'fa', 'کنیا'),
(630, 120, 'fa', 'کیریباتی'),
(631, 121, 'fa', 'کوزوو'),
(632, 122, 'fa', 'کویت'),
(633, 123, 'fa', 'قرقیزستان'),
(634, 124, 'fa', 'لائوس'),
(635, 125, 'fa', 'لتونی'),
(636, 126, 'fa', 'لبنان'),
(637, 127, 'fa', 'لسوتو'),
(638, 128, 'fa', 'لیبریا'),
(639, 129, 'fa', 'لیبی'),
(640, 130, 'fa', 'لیختن اشتاین'),
(641, 131, 'fa', 'لیتوانی'),
(642, 132, 'fa', 'لوکزامبورگ'),
(643, 133, 'fa', 'ماکائو SAR چین'),
(644, 134, 'fa', 'مقدونیه'),
(645, 135, 'fa', 'ماداگاسکار'),
(646, 136, 'fa', 'مالاوی'),
(647, 137, 'fa', 'مالزی'),
(648, 138, 'fa', 'مالدیو'),
(649, 139, 'fa', 'مالی'),
(650, 140, 'fa', 'مالت'),
(651, 141, 'fa', 'جزایر مارشال'),
(652, 142, 'fa', 'مارتینیک'),
(653, 143, 'fa', 'موریتانی'),
(654, 144, 'fa', 'موریس'),
(655, 145, 'fa', 'گمشده'),
(656, 146, 'fa', 'مکزیک'),
(657, 147, 'fa', 'میکرونزی'),
(658, 148, 'fa', 'مولداوی'),
(659, 149, 'fa', 'موناکو'),
(660, 150, 'fa', 'مغولستان'),
(661, 151, 'fa', 'مونته نگرو'),
(662, 152, 'fa', 'مونتسرات'),
(663, 153, 'fa', 'مراکش'),
(664, 154, 'fa', 'موزامبیک'),
(665, 155, 'fa', 'میانمار (برمه)'),
(666, 156, 'fa', 'ناميبيا'),
(667, 157, 'fa', 'نائورو'),
(668, 158, 'fa', 'نپال'),
(669, 159, 'fa', 'هلند'),
(670, 160, 'fa', 'کالدونیای جدید'),
(671, 161, 'fa', 'نیوزلند'),
(672, 162, 'fa', 'نیکاراگوئه'),
(673, 163, 'fa', 'نیجر'),
(674, 164, 'fa', 'نیجریه'),
(675, 165, 'fa', 'نیو'),
(676, 166, 'fa', 'جزیره نورفولک'),
(677, 167, 'fa', 'کره شمالی'),
(678, 168, 'fa', 'جزایر ماریانای شمالی'),
(679, 169, 'fa', 'نروژ'),
(680, 170, 'fa', 'عمان'),
(681, 171, 'fa', 'پاکستان'),
(682, 172, 'fa', 'پالائو'),
(683, 173, 'fa', 'سرزمین های فلسطینی'),
(684, 174, 'fa', 'پاناما'),
(685, 175, 'fa', 'پاپوا گینه نو'),
(686, 176, 'fa', 'پاراگوئه'),
(687, 177, 'fa', 'پرو'),
(688, 178, 'fa', 'فیلیپین'),
(689, 179, 'fa', 'جزایر پیکریرن'),
(690, 180, 'fa', 'لهستان'),
(691, 181, 'fa', 'کشور پرتغال'),
(692, 182, 'fa', 'پورتوریکو'),
(693, 183, 'fa', 'قطر'),
(694, 184, 'fa', 'تجدید دیدار'),
(695, 185, 'fa', 'رومانی'),
(696, 186, 'fa', 'روسیه'),
(697, 187, 'fa', 'رواندا'),
(698, 188, 'fa', 'ساموآ'),
(699, 189, 'fa', 'سان مارینو'),
(700, 190, 'fa', 'سنت کیتس و نوویس'),
(701, 191, 'fa', 'عربستان سعودی'),
(702, 192, 'fa', 'سنگال'),
(703, 193, 'fa', 'صربستان'),
(704, 194, 'fa', 'سیشل'),
(705, 195, 'fa', 'سیرالئون'),
(706, 196, 'fa', 'سنگاپور'),
(707, 197, 'fa', 'سینت ماارتن'),
(708, 198, 'fa', 'اسلواکی'),
(709, 199, 'fa', 'اسلوونی'),
(710, 200, 'fa', 'جزایر سلیمان'),
(711, 201, 'fa', 'سومالی'),
(712, 202, 'fa', 'آفریقای جنوبی'),
(713, 203, 'fa', 'جزایر جورجیا جنوبی و جزایر ساندویچ جنوبی'),
(714, 204, 'fa', 'کره جنوبی'),
(715, 205, 'fa', 'سودان جنوبی'),
(716, 206, 'fa', 'اسپانیا'),
(717, 207, 'fa', 'سری لانکا'),
(718, 208, 'fa', 'سنت بارتلی'),
(719, 209, 'fa', 'سنت هلنا'),
(720, 210, 'fa', 'سنت کیتز و نوویس'),
(721, 211, 'fa', 'سنت لوسیا'),
(722, 212, 'fa', 'سنت مارتین'),
(723, 213, 'fa', 'سنت پیر و میکلون'),
(724, 214, 'fa', 'سنت وینسنت و گرنادینها'),
(725, 215, 'fa', 'سودان'),
(726, 216, 'fa', 'سورینام'),
(727, 217, 'fa', 'اسوالبارد و جان ماین'),
(728, 218, 'fa', 'سوازیلند'),
(729, 219, 'fa', 'سوئد'),
(730, 220, 'fa', 'سوئیس'),
(731, 221, 'fa', 'سوریه'),
(732, 222, 'fa', 'تایوان'),
(733, 223, 'fa', 'تاجیکستان'),
(734, 224, 'fa', 'تانزانیا'),
(735, 225, 'fa', 'تایلند'),
(736, 226, 'fa', 'تیمور-لست'),
(737, 227, 'fa', 'رفتن'),
(738, 228, 'fa', 'توکلو'),
(739, 229, 'fa', 'تونگا'),
(740, 230, 'fa', 'ترینیداد و توباگو'),
(741, 231, 'fa', 'تریستان دا کانونا'),
(742, 232, 'fa', 'تونس'),
(743, 233, 'fa', 'بوقلمون'),
(744, 234, 'fa', 'ترکمنستان'),
(745, 235, 'fa', 'جزایر تورکس و کایکوس'),
(746, 236, 'fa', 'تووالو'),
(747, 237, 'fa', 'جزایر دور افتاده ایالات متحده آمریکا'),
(748, 238, 'fa', 'جزایر ویرجین ایالات متحده'),
(749, 239, 'fa', 'اوگاندا'),
(750, 240, 'fa', 'اوکراین'),
(751, 241, 'fa', 'امارات متحده عربی'),
(752, 242, 'fa', 'انگلستان'),
(753, 243, 'fa', 'سازمان ملل'),
(754, 244, 'fa', 'ایالات متحده'),
(755, 245, 'fa', 'اروگوئه'),
(756, 246, 'fa', 'ازبکستان'),
(757, 247, 'fa', 'وانواتو'),
(758, 248, 'fa', 'شهر واتیکان'),
(759, 249, 'fa', 'ونزوئلا'),
(760, 250, 'fa', 'ویتنام'),
(761, 251, 'fa', 'والیس و فوتونا'),
(762, 252, 'fa', 'صحرای غربی'),
(763, 253, 'fa', 'یمن'),
(764, 254, 'fa', 'زامبیا'),
(765, 255, 'fa', 'زیمبابوه'),
(766, 1, 'pt_BR', 'Afeganistão'),
(767, 2, 'pt_BR', 'Ilhas Åland'),
(768, 3, 'pt_BR', 'Albânia'),
(769, 4, 'pt_BR', 'Argélia'),
(770, 5, 'pt_BR', 'Samoa Americana'),
(771, 6, 'pt_BR', 'Andorra'),
(772, 7, 'pt_BR', 'Angola'),
(773, 8, 'pt_BR', 'Angola'),
(774, 9, 'pt_BR', 'Antártico'),
(775, 10, 'pt_BR', 'Antígua e Barbuda'),
(776, 11, 'pt_BR', 'Argentina'),
(777, 12, 'pt_BR', 'Armênia'),
(778, 13, 'pt_BR', 'Aruba'),
(779, 14, 'pt_BR', 'Ilha de escalada'),
(780, 15, 'pt_BR', 'Austrália'),
(781, 16, 'pt_BR', 'Áustria'),
(782, 17, 'pt_BR', 'Azerbaijão'),
(783, 18, 'pt_BR', 'Bahamas'),
(784, 19, 'pt_BR', 'Bahrain'),
(785, 20, 'pt_BR', 'Bangladesh'),
(786, 21, 'pt_BR', 'Barbados'),
(787, 22, 'pt_BR', 'Bielorrússia'),
(788, 23, 'pt_BR', 'Bélgica'),
(789, 24, 'pt_BR', 'Bélgica'),
(790, 25, 'pt_BR', 'Benin'),
(791, 26, 'pt_BR', 'Bermuda'),
(792, 27, 'pt_BR', 'Butão'),
(793, 28, 'pt_BR', 'Bolívia'),
(794, 29, 'pt_BR', 'Bósnia e Herzegovina'),
(795, 30, 'pt_BR', 'Botsuana'),
(796, 31, 'pt_BR', 'Brasil'),
(797, 32, 'pt_BR', 'Território Britânico do Oceano Índico'),
(798, 33, 'pt_BR', 'Ilhas Virgens Britânicas'),
(799, 34, 'pt_BR', 'Brunei'),
(800, 35, 'pt_BR', 'Bulgária'),
(801, 36, 'pt_BR', 'Burkina Faso'),
(802, 37, 'pt_BR', 'Burundi'),
(803, 38, 'pt_BR', 'Camboja'),
(804, 39, 'pt_BR', 'Camarões'),
(805, 40, 'pt_BR', 'Canadá'),
(806, 41, 'pt_BR', 'Ilhas Canárias'),
(807, 42, 'pt_BR', 'Cabo Verde'),
(808, 43, 'pt_BR', 'Holanda do Caribe'),
(809, 44, 'pt_BR', 'Ilhas Cayman'),
(810, 45, 'pt_BR', 'República Centro-Africana'),
(811, 46, 'pt_BR', 'Ceuta e Melilla'),
(812, 47, 'pt_BR', 'Chade'),
(813, 48, 'pt_BR', 'Chile'),
(814, 49, 'pt_BR', 'China'),
(815, 50, 'pt_BR', 'Ilha Christmas'),
(816, 51, 'pt_BR', 'Ilhas Cocos (Keeling)'),
(817, 52, 'pt_BR', 'Colômbia'),
(818, 53, 'pt_BR', 'Comores'),
(819, 54, 'pt_BR', 'Congo - Brazzaville'),
(820, 55, 'pt_BR', 'Congo - Kinshasa'),
(821, 56, 'pt_BR', 'Ilhas Cook'),
(822, 57, 'pt_BR', 'Costa Rica'),
(823, 58, 'pt_BR', 'Costa do Marfim'),
(824, 59, 'pt_BR', 'Croácia'),
(825, 60, 'pt_BR', 'Cuba'),
(826, 61, 'pt_BR', 'Curaçao'),
(827, 62, 'pt_BR', 'Chipre'),
(828, 63, 'pt_BR', 'Czechia'),
(829, 64, 'pt_BR', 'Dinamarca'),
(830, 65, 'pt_BR', 'Diego Garcia'),
(831, 66, 'pt_BR', 'Djibuti'),
(832, 67, 'pt_BR', 'Dominica'),
(833, 68, 'pt_BR', 'República Dominicana'),
(834, 69, 'pt_BR', 'Equador'),
(835, 70, 'pt_BR', 'Egito'),
(836, 71, 'pt_BR', 'El Salvador'),
(837, 72, 'pt_BR', 'Guiné Equatorial'),
(838, 73, 'pt_BR', 'Eritreia'),
(839, 74, 'pt_BR', 'Estônia'),
(840, 75, 'pt_BR', 'Etiópia'),
(841, 76, 'pt_BR', 'Zona Euro'),
(842, 77, 'pt_BR', 'Ilhas Malvinas'),
(843, 78, 'pt_BR', 'Ilhas Faroe'),
(844, 79, 'pt_BR', 'Fiji'),
(845, 80, 'pt_BR', 'Finlândia'),
(846, 81, 'pt_BR', 'França'),
(847, 82, 'pt_BR', 'Guiana Francesa'),
(848, 83, 'pt_BR', 'Polinésia Francesa'),
(849, 84, 'pt_BR', 'Territórios Franceses do Sul'),
(850, 85, 'pt_BR', 'Gabão'),
(851, 86, 'pt_BR', 'Gâmbia'),
(852, 87, 'pt_BR', 'Geórgia'),
(853, 88, 'pt_BR', 'Alemanha'),
(854, 89, 'pt_BR', 'Gana'),
(855, 90, 'pt_BR', 'Gibraltar'),
(856, 91, 'pt_BR', 'Grécia'),
(857, 92, 'pt_BR', 'Gronelândia'),
(858, 93, 'pt_BR', 'Granada'),
(859, 94, 'pt_BR', 'Guadalupe'),
(860, 95, 'pt_BR', 'Guam'),
(861, 96, 'pt_BR', 'Guatemala'),
(862, 97, 'pt_BR', 'Guernsey'),
(863, 98, 'pt_BR', 'Guiné'),
(864, 99, 'pt_BR', 'Guiné-Bissau'),
(865, 100, 'pt_BR', 'Guiana'),
(866, 101, 'pt_BR', 'Haiti'),
(867, 102, 'pt_BR', 'Honduras'),
(868, 103, 'pt_BR', 'Região Administrativa Especial de Hong Kong, China'),
(869, 104, 'pt_BR', 'Hungria'),
(870, 105, 'pt_BR', 'Islândia'),
(871, 106, 'pt_BR', 'Índia'),
(872, 107, 'pt_BR', 'Indonésia'),
(873, 108, 'pt_BR', 'Irã'),
(874, 109, 'pt_BR', 'Iraque'),
(875, 110, 'pt_BR', 'Irlanda'),
(876, 111, 'pt_BR', 'Ilha de Man'),
(877, 112, 'pt_BR', 'Israel'),
(878, 113, 'pt_BR', 'Itália'),
(879, 114, 'pt_BR', 'Jamaica'),
(880, 115, 'pt_BR', 'Japão'),
(881, 116, 'pt_BR', 'Jersey'),
(882, 117, 'pt_BR', 'Jordânia'),
(883, 118, 'pt_BR', 'Cazaquistão'),
(884, 119, 'pt_BR', 'Quênia'),
(885, 120, 'pt_BR', 'Quiribati'),
(886, 121, 'pt_BR', 'Kosovo'),
(887, 122, 'pt_BR', 'Kuwait'),
(888, 123, 'pt_BR', 'Quirguistão'),
(889, 124, 'pt_BR', 'Laos'),
(890, 125, 'pt_BR', 'Letônia'),
(891, 126, 'pt_BR', 'Líbano'),
(892, 127, 'pt_BR', 'Lesoto'),
(893, 128, 'pt_BR', 'Libéria'),
(894, 129, 'pt_BR', 'Líbia'),
(895, 130, 'pt_BR', 'Liechtenstein'),
(896, 131, 'pt_BR', 'Lituânia'),
(897, 132, 'pt_BR', 'Luxemburgo'),
(898, 133, 'pt_BR', 'Macau SAR China'),
(899, 134, 'pt_BR', 'Macedônia'),
(900, 135, 'pt_BR', 'Madagascar'),
(901, 136, 'pt_BR', 'Malawi'),
(902, 137, 'pt_BR', 'Malásia'),
(903, 138, 'pt_BR', 'Maldivas'),
(904, 139, 'pt_BR', 'Mali'),
(905, 140, 'pt_BR', 'Malta'),
(906, 141, 'pt_BR', 'Ilhas Marshall'),
(907, 142, 'pt_BR', 'Martinica'),
(908, 143, 'pt_BR', 'Mauritânia'),
(909, 144, 'pt_BR', 'Maurício'),
(910, 145, 'pt_BR', 'Maiote'),
(911, 146, 'pt_BR', 'México'),
(912, 147, 'pt_BR', 'Micronésia'),
(913, 148, 'pt_BR', 'Moldávia'),
(914, 149, 'pt_BR', 'Mônaco'),
(915, 150, 'pt_BR', 'Mongólia'),
(916, 151, 'pt_BR', 'Montenegro'),
(917, 152, 'pt_BR', 'Montserrat'),
(918, 153, 'pt_BR', 'Marrocos'),
(919, 154, 'pt_BR', 'Moçambique'),
(920, 155, 'pt_BR', 'Mianmar (Birmânia)'),
(921, 156, 'pt_BR', 'Namíbia'),
(922, 157, 'pt_BR', 'Nauru'),
(923, 158, 'pt_BR', 'Nepal'),
(924, 159, 'pt_BR', 'Holanda'),
(925, 160, 'pt_BR', 'Nova Caledônia'),
(926, 161, 'pt_BR', 'Nova Zelândia'),
(927, 162, 'pt_BR', 'Nicarágua'),
(928, 163, 'pt_BR', 'Níger'),
(929, 164, 'pt_BR', 'Nigéria'),
(930, 165, 'pt_BR', 'Niue'),
(931, 166, 'pt_BR', 'Ilha Norfolk'),
(932, 167, 'pt_BR', 'Coréia do Norte'),
(933, 168, 'pt_BR', 'Ilhas Marianas do Norte'),
(934, 169, 'pt_BR', 'Noruega'),
(935, 170, 'pt_BR', 'Omã'),
(936, 171, 'pt_BR', 'Paquistão'),
(937, 172, 'pt_BR', 'Palau'),
(938, 173, 'pt_BR', 'Territórios Palestinos'),
(939, 174, 'pt_BR', 'Panamá'),
(940, 175, 'pt_BR', 'Papua Nova Guiné'),
(941, 176, 'pt_BR', 'Paraguai'),
(942, 177, 'pt_BR', 'Peru'),
(943, 178, 'pt_BR', 'Filipinas'),
(944, 179, 'pt_BR', 'Ilhas Pitcairn'),
(945, 180, 'pt_BR', 'Polônia'),
(946, 181, 'pt_BR', 'Portugal'),
(947, 182, 'pt_BR', 'Porto Rico'),
(948, 183, 'pt_BR', 'Catar'),
(949, 184, 'pt_BR', 'Reunião'),
(950, 185, 'pt_BR', 'Romênia'),
(951, 186, 'pt_BR', 'Rússia'),
(952, 187, 'pt_BR', 'Ruanda'),
(953, 188, 'pt_BR', 'Samoa'),
(954, 189, 'pt_BR', 'São Marinho'),
(955, 190, 'pt_BR', 'São Cristóvão e Nevis'),
(956, 191, 'pt_BR', 'Arábia Saudita'),
(957, 192, 'pt_BR', 'Senegal'),
(958, 193, 'pt_BR', 'Sérvia'),
(959, 194, 'pt_BR', 'Seychelles'),
(960, 195, 'pt_BR', 'Serra Leoa'),
(961, 196, 'pt_BR', 'Cingapura'),
(962, 197, 'pt_BR', 'São Martinho'),
(963, 198, 'pt_BR', 'Eslováquia'),
(964, 199, 'pt_BR', 'Eslovênia'),
(965, 200, 'pt_BR', 'Ilhas Salomão'),
(966, 201, 'pt_BR', 'Somália'),
(967, 202, 'pt_BR', 'África do Sul'),
(968, 203, 'pt_BR', 'Ilhas Geórgia do Sul e Sandwich do Sul'),
(969, 204, 'pt_BR', 'Coréia do Sul'),
(970, 205, 'pt_BR', 'Sudão do Sul'),
(971, 206, 'pt_BR', 'Espanha'),
(972, 207, 'pt_BR', 'Sri Lanka'),
(973, 208, 'pt_BR', 'São Bartolomeu'),
(974, 209, 'pt_BR', 'Santa Helena'),
(975, 210, 'pt_BR', 'São Cristóvão e Nevis'),
(976, 211, 'pt_BR', 'Santa Lúcia'),
(977, 212, 'pt_BR', 'São Martinho'),
(978, 213, 'pt_BR', 'São Pedro e Miquelon'),
(979, 214, 'pt_BR', 'São Vicente e Granadinas'),
(980, 215, 'pt_BR', 'Sudão'),
(981, 216, 'pt_BR', 'Suriname'),
(982, 217, 'pt_BR', 'Svalbard e Jan Mayen'),
(983, 218, 'pt_BR', 'Suazilândia'),
(984, 219, 'pt_BR', 'Suécia'),
(985, 220, 'pt_BR', 'Suíça'),
(986, 221, 'pt_BR', 'Síria'),
(987, 222, 'pt_BR', 'Taiwan'),
(988, 223, 'pt_BR', 'Tajiquistão'),
(989, 224, 'pt_BR', 'Tanzânia'),
(990, 225, 'pt_BR', 'Tailândia'),
(991, 226, 'pt_BR', 'Timor-Leste'),
(992, 227, 'pt_BR', 'Togo'),
(993, 228, 'pt_BR', 'Tokelau'),
(994, 229, 'pt_BR', 'Tonga'),
(995, 230, 'pt_BR', 'Trinidad e Tobago'),
(996, 231, 'pt_BR', 'Tristan da Cunha'),
(997, 232, 'pt_BR', 'Tunísia'),
(998, 233, 'pt_BR', 'Turquia'),
(999, 234, 'pt_BR', 'Turquemenistão'),
(1000, 235, 'pt_BR', 'Ilhas Turks e Caicos'),
(1001, 236, 'pt_BR', 'Tuvalu'),
(1002, 237, 'pt_BR', 'Ilhas periféricas dos EUA'),
(1003, 238, 'pt_BR', 'Ilhas Virgens dos EUA'),
(1004, 239, 'pt_BR', 'Uganda'),
(1005, 240, 'pt_BR', 'Ucrânia'),
(1006, 241, 'pt_BR', 'Emirados Árabes Unidos'),
(1007, 242, 'pt_BR', 'Reino Unido'),
(1008, 243, 'pt_BR', 'Nações Unidas'),
(1009, 244, 'pt_BR', 'Estados Unidos'),
(1010, 245, 'pt_BR', 'Uruguai'),
(1011, 246, 'pt_BR', 'Uzbequistão'),
(1012, 247, 'pt_BR', 'Vanuatu'),
(1013, 248, 'pt_BR', 'Cidade do Vaticano'),
(1014, 249, 'pt_BR', 'Venezuela'),
(1015, 250, 'pt_BR', 'Vietnã'),
(1016, 251, 'pt_BR', 'Wallis e Futuna'),
(1017, 252, 'pt_BR', 'Saara Ocidental'),
(1018, 253, 'pt_BR', 'Iêmen'),
(1019, 254, 'pt_BR', 'Zâmbia'),
(1020, 255, 'pt_BR', 'Zimbábue');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'US Dollar', '$', 2, NULL, NULL),
(2, 'EUR', 'Euro', '€', 2, NULL, NULL),
(3, 'INR', 'INR', '₹', 0, '2024-02-12 09:06:06', '2024-02-12 09:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_rates`
--

CREATE TABLE `currency_exchange_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `currency_exchange_rates`
--

INSERT INTO `currency_exchange_rates` (`id`, `rate`, `target_currency`, `created_at`, `updated_at`) VALUES
(1, 83.010000000000, 3, '2024-02-12 09:16:10', '2024-02-12 09:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aysha', 'Moria', NULL, NULL, 'aysha092@gmail.com', NULL, NULL, 1, '$2y$10$svl7oFK5cl6ikHZzjazoh.59V/ylJTa.EgqIl11phpwVIwLDVdnqC', 'Sy5AhKp6pWJrdGzGdKPMQDjCvTJZMbIuTUakQJ0GDDb8xaGbFNOuFk2VJBq9tyWmqfoYOCFxfs4e1uHL', 2, 0, 1, 0, '8a6086402d661aba530c41fa738cb24d', NULL, '2024-02-12 09:20:46', '2024-02-12 09:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'Guest', 0, NULL, NULL),
(2, 'general', 'General', 0, NULL, NULL),
(3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_notes`
--

CREATE TABLE `customer_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `note` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_password_resets`
--

CREATE TABLE `customer_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_social_accounts`
--

CREATE TABLE `customer_social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT 0,
  `download_used` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_item_id` int(10) UNSIGNED NOT NULL,
  `download_canceled` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_sources`
--

CREATE TABLE `inventory_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(191) NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `contact_fax` varchar(191) DEFAULT NULL,
  `country` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `street` varchar(191) NOT NULL,
  `postcode` varchar(191) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `inventory_sources`
--

INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Default', NULL, 'Detroit Warehouse', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `reminders` int(11) NOT NULL DEFAULT 0,
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `direction` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'ltr', 'locales/en.png', NULL, NULL),
(2, 'fr', 'French', 'ltr', 'locales/fr.png', NULL, NULL),
(3, 'nl', 'Dutch', 'ltr', 'locales/nl.png', NULL, NULL),
(4, 'tr', 'Türkçe', 'ltr', 'locales/tr.png', NULL, NULL),
(5, 'es', 'Español', 'ltr', 'locales/es.png', NULL, NULL),
(6, 'de', 'German', 'ltr', 'locales/de.png', NULL, NULL),
(7, 'it', 'Italian	', 'ltr', 'locales/it.png', NULL, NULL),
(8, 'ru', 'Russian', 'ltr', 'locales/ru.png', NULL, NULL),
(9, 'uk', 'Ukrainian', 'ltr', 'locales/uk.png', NULL, NULL),
(10, 'hi_IN', 'Hindi', 'ltr', NULL, '2024-02-12 08:38:55', '2024-02-12 08:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigns`
--

CREATE TABLE `marketing_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL,
  `mail_to` varchar(191) NOT NULL,
  `spooling` varchar(191) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_template_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_event_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_events`
--

CREATE TABLE `marketing_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `marketing_events`
--

INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_templates`
--

CREATE TABLE `marketing_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_12_111907_create_admins_table', 1),
(5, '2018_06_13_055341_create_roles_table', 1),
(6, '2018_07_05_130148_create_attributes_table', 1),
(7, '2018_07_05_132854_create_attribute_translations_table', 1),
(8, '2018_07_05_135150_create_attribute_families_table', 1),
(9, '2018_07_05_135152_create_attribute_groups_table', 1),
(10, '2018_07_05_140832_create_attribute_options_table', 1),
(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
(12, '2018_07_05_142820_create_categories_table', 1),
(13, '2018_07_10_055143_create_locales_table', 1),
(14, '2018_07_20_054426_create_countries_table', 1),
(15, '2018_07_20_054502_create_currencies_table', 1),
(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
(17, '2018_07_20_064849_create_channels_table', 1),
(18, '2018_07_21_142836_create_category_translations_table', 1),
(19, '2018_07_23_110040_create_inventory_sources_table', 1),
(20, '2018_07_24_082635_create_customer_groups_table', 1),
(21, '2018_07_24_082930_create_customers_table', 1),
(22, '2018_07_27_065727_create_products_table', 1),
(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
(24, '2018_07_27_092623_create_product_reviews_table', 1),
(25, '2018_07_27_113941_create_product_images_table', 1),
(26, '2018_07_27_113956_create_product_inventories_table', 1),
(27, '2018_08_30_064755_create_tax_categories_table', 1),
(28, '2018_08_30_065042_create_tax_rates_table', 1),
(29, '2018_08_30_065840_create_tax_mappings_table', 1),
(30, '2018_09_05_150444_create_cart_table', 1),
(31, '2018_09_05_150915_create_cart_items_table', 1),
(32, '2018_09_11_064045_customer_password_resets', 1),
(33, '2018_09_19_093453_create_cart_payment', 1),
(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
(35, '2018_09_20_060658_create_core_config_table', 1),
(36, '2018_09_27_113154_create_orders_table', 1),
(37, '2018_09_27_113207_create_order_items_table', 1),
(38, '2018_09_27_115022_create_shipments_table', 1),
(39, '2018_09_27_115029_create_shipment_items_table', 1),
(40, '2018_09_27_115135_create_invoices_table', 1),
(41, '2018_09_27_115144_create_invoice_items_table', 1),
(42, '2018_10_01_095504_create_order_payment_table', 1),
(43, '2018_10_03_025230_create_wishlist_table', 1),
(44, '2018_10_12_101803_create_country_translations_table', 1),
(45, '2018_10_12_101913_create_country_states_table', 1),
(46, '2018_10_12_101923_create_country_state_translations_table', 1),
(47, '2018_11_16_173504_create_subscribers_list_table', 1),
(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
(49, '2018_12_06_185202_create_product_flat_table', 1),
(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
(52, '2019_05_13_024321_create_cart_rules_table', 1),
(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
(64, '2019_07_30_153530_create_cms_pages_table', 1),
(65, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
(66, '2019_08_02_105320_create_product_grouped_products_table', 1),
(67, '2019_08_20_170510_create_product_bundle_options_table', 1),
(68, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
(69, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
(70, '2019_09_11_184511_create_refunds_table', 1),
(71, '2019_09_11_184519_create_refund_items_table', 1),
(72, '2019_12_03_184613_create_catalog_rules_table', 1),
(73, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
(74, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
(75, '2019_12_06_101110_create_catalog_rule_products_table', 1),
(76, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
(77, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(78, '2020_01_14_191854_create_cms_page_translations_table', 1),
(79, '2020_01_15_130209_create_cms_page_channels_table', 1),
(80, '2020_04_16_185147_add_table_addresses', 1),
(81, '2020_05_06_171638_create_order_comments_table', 1),
(82, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
(83, '2020_06_25_162154_create_customer_social_accounts_table', 1),
(84, '2020_11_19_112228_create_product_videos_table', 1),
(85, '2020_11_26_141455_create_marketing_templates_table', 1),
(86, '2020_11_26_150534_create_marketing_events_table', 1),
(87, '2020_11_26_150644_create_marketing_campaigns_table', 1),
(88, '2020_12_21_000200_create_channel_translations_table', 1),
(89, '2020_12_27_121950_create_jobs_table', 1),
(90, '2021_03_11_212124_create_order_transactions_table', 1),
(91, '2021_04_07_132010_create_product_review_images_table', 1),
(92, '2021_12_15_104544_notifications', 1),
(93, '2022_03_15_160510_create_failed_jobs_table', 1),
(94, '2022_04_01_094622_create_sitemaps_table', 1),
(95, '2022_10_03_144232_create_product_price_indices_table', 1),
(96, '2022_10_04_144444_create_job_batches_table', 1),
(97, '2022_10_08_134150_create_product_inventory_indices_table', 1),
(98, '2023_05_26_213105_create_wishlist_items_table', 1),
(99, '2023_05_26_213120_create_compare_items_table', 1),
(100, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
(101, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
(102, '2023_07_10_184256_create_theme_customizations_table', 1),
(103, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
(104, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
(105, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
(106, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
(107, '2023_07_25_171058_create_customer_notes_table', 1),
(108, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
(109, '2023_09_15_170053_create_theme_customization_translations_table', 1),
(110, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
(111, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
(112, '2023_10_05_163612_create_visits_table', 1),
(113, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `channel_name` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `shipping_title` varchar(191) DEFAULT NULL,
  `shipping_description` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_type` varchar(191) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

CREATE TABLE `order_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT 0.0000,
  `total_weight` decimal(12,4) DEFAULT 0.0000,
  `qty_ordered` int(11) DEFAULT 0,
  `qty_shipped` int(11) DEFAULT 0,
  `qty_invoiced` int(11) DEFAULT 0,
  `qty_canceled` int(11) DEFAULT 0,
  `qty_refunded` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT 0.0000,
  `payment_method` varchar(191) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'kids', 'simple', NULL, 1, NULL, '2024-02-12 09:10:04', '2024-02-12 09:10:04'),
(2, 'kidswear', 'simple', NULL, 1, NULL, '2024-02-12 09:28:17', '2024-02-12 09:28:17'),
(3, 'wo', 'simple', NULL, 1, NULL, '2024-02-12 09:57:25', '2024-02-12 09:57:25'),
(4, 'abc', 'simple', NULL, 1, NULL, '2024-02-13 07:33:11', '2024-02-13 07:33:11'),
(5, 'abcd', 'simple', NULL, 1, NULL, '2024-02-13 07:37:44', '2024-02-13 07:37:44'),
(6, 'a', 'simple', NULL, 1, NULL, '2024-02-13 07:40:01', '2024-02-13 07:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`) VALUES
(1, 'en', 'default', 'Whaou! Kids Boys Cotton Printed White and Red Colour Top Shorts Set |', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9),
(2, 'en', 'default', 'Whaou! Kids Boys Cotton Printed White and Red Colour Top Shorts Set |', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10),
(3, NULL, NULL, 'kids', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(4, 'en', 'default', 'Kids Boys Cotton Printed White and Red Colour Top Shorts', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
(5, NULL, NULL, 'kids-boys-cotton-printed-white-and-red-colour-top-shorts', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3),
(6, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 1, 23),
(7, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 1, 24),
(8, NULL, NULL, '101', NULL, NULL, NULL, NULL, NULL, NULL, 1, 27),
(9, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 28),
(10, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16),
(11, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17),
(12, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18),
(13, NULL, NULL, NULL, NULL, NULL, 10.0000, NULL, NULL, NULL, 1, 11),
(14, NULL, 'default', NULL, NULL, NULL, 9.0000, NULL, NULL, NULL, 1, 12),
(15, NULL, NULL, NULL, NULL, NULL, 9.0000, NULL, NULL, NULL, 1, 13),
(16, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-12', NULL, 1, 14),
(17, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2024-02-14', NULL, 1, 15),
(18, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 5),
(19, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 6),
(20, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 7),
(21, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 8),
(22, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 26),
(23, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 19),
(24, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 20),
(25, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 21),
(26, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22),
(31, 'en', 'Default', 'kids-boys-cotton-printed-white-and-red-colour-top-shorts', NULL, NULL, NULL, NULL, NULL, NULL, 2, 9),
(32, 'en', 'Default', 'kids-boys-cotton-printed-white-and-red-colour-top-shorts', NULL, NULL, NULL, NULL, NULL, NULL, 2, 10),
(33, NULL, NULL, 'kidswear', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(34, 'en', 'Default', 'kids-boys-cotton-printed-white-and-red-colour-top-shortsq', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2),
(35, NULL, NULL, 'kids-boys-cotton-printed-white-and-red-colour-top-shortsq', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3),
(36, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 23),
(37, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 2, 24),
(38, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 27),
(39, NULL, 'Default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 28),
(40, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 16),
(41, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 17),
(42, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 18),
(43, NULL, NULL, NULL, NULL, NULL, 5.0000, NULL, NULL, NULL, 2, 11),
(44, NULL, 'Default', NULL, NULL, NULL, 4.0000, NULL, NULL, NULL, 2, 12),
(45, NULL, NULL, NULL, NULL, NULL, 4.0000, NULL, NULL, NULL, 2, 13),
(46, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, '2024-02-12', NULL, 2, 14),
(47, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, '2024-02-14', NULL, 2, 15),
(48, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 5),
(49, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 6),
(50, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 7),
(51, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 8),
(52, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 26),
(53, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 19),
(54, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 20),
(55, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 21),
(56, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 2, 22),
(57, 'en', 'Default', 'Qube By Fort Collins Women\'s Synthetic Short Length Jacket', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9),
(58, 'en', 'Default', 'Qube By Fort Collins Women\'s Synthetic Short Length Jacket', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10),
(59, NULL, NULL, 'abc', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(60, 'en', 'Default', 'Qube By Fort Collins Women\'s Synthetic Short Length Jacket', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2),
(61, NULL, NULL, 'qube-by-fort-collins-womens-synthetic-short-length-jacket', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3),
(62, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 4, 23),
(63, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 4, 24),
(64, NULL, NULL, '122', NULL, NULL, NULL, NULL, NULL, NULL, 4, 27),
(65, NULL, 'Default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 28),
(66, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16),
(67, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17),
(68, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18),
(69, NULL, NULL, NULL, NULL, NULL, 5.0000, NULL, NULL, NULL, 4, 11),
(70, NULL, 'Default', NULL, NULL, NULL, 5.0000, NULL, NULL, NULL, 4, 12),
(71, NULL, NULL, NULL, NULL, NULL, 4.0000, NULL, NULL, NULL, 4, 13),
(72, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, '2024-02-13', NULL, 4, 14),
(73, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, '2024-02-15', NULL, 4, 15),
(74, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 5),
(75, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 6),
(76, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 7),
(77, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 8),
(78, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 26),
(79, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 19),
(80, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 20),
(81, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 21),
(82, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 4, 22),
(83, 'en', 'Default', 'LEOTUDE Women\'s Loopknit Boyfriend/Loose Fit Round Neck Sweatshirt (Color Black)', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9),
(84, 'en', 'Default', 'Neck: Round Neck\r\nPattern: Colorblock\r\nColor: Black:Grey\r\nSleeve Type: Full Sleeve With Drop Shoulder\r\nSize Chart: Please Refer The Size Chart available in Product Image.', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10),
(85, NULL, NULL, 'abcd', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(86, 'en', 'Default', 'LEOTUDE Women\'s Loopknit Boyfriend/Loose Fit Round Neck Sweatshirt (Color Black)', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2),
(87, NULL, NULL, 'leotude-womens-loopknit-boyfriendloose-fit-round-neck-sweatshirt-color-black', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3),
(88, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 5, 23),
(89, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 5, 24),
(90, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 27),
(91, NULL, 'Default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 28),
(92, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 16),
(93, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 17),
(94, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 18),
(95, NULL, NULL, NULL, NULL, NULL, 6.0000, NULL, NULL, NULL, 5, 11),
(96, NULL, 'Default', NULL, NULL, NULL, 6.0000, NULL, NULL, NULL, 5, 12),
(97, NULL, NULL, NULL, NULL, NULL, 5.0000, NULL, NULL, NULL, 5, 13),
(98, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, '2024-02-13', NULL, 5, 14),
(99, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, '2024-02-15', NULL, 5, 15),
(100, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 5),
(101, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 6),
(102, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 7),
(103, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 8),
(104, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 26),
(105, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 5, 19),
(106, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 5, 20),
(107, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 5, 21),
(108, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 5, 22),
(109, 'en', 'Default', 'Alan Jones Clothing Women\'s Cotton Hooded Neck Sweatshirt', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9),
(110, 'en', 'Default', 'Material composition60% Cotton, 40% Polyester\r\nSleeve typeLong Sleeve\r\nMaterial typeCotton\r\nFit typeRegular\r\nLengthStandard Length\r\nNeck styleHooded Neck\r\nCountry of OriginIndia', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10),
(111, NULL, NULL, 'a', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1),
(112, 'en', 'Default', 'Alan Jones Clothing Women\'s Cotton Hooded Neck Sweatshirt', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2),
(113, NULL, NULL, 'alan-jones-clothing-womens-cotton-hooded-neck-sweatshirt', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3),
(114, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 23),
(115, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 6, 24),
(116, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 27),
(117, NULL, 'Default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 28),
(118, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16),
(119, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17),
(120, 'en', 'Default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18),
(121, NULL, NULL, NULL, NULL, NULL, 7.0000, NULL, NULL, NULL, 6, 11),
(122, NULL, 'Default', NULL, NULL, NULL, 7.0000, NULL, NULL, NULL, 6, 12),
(123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 13),
(124, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 14),
(125, NULL, 'Default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 15),
(126, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 5),
(127, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 6),
(128, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7),
(129, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8),
(130, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 26),
(131, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 6, 19),
(132, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 6, 20),
(133, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 6, 21),
(134, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22);

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_options`
--

CREATE TABLE `product_bundle_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_products`
--

CREATE TABLE `product_bundle_option_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_translations`
--

CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(2, 2),
(4, 6),
(5, 6),
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_cross_sells`
--

CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_customer_group_prices`
--

CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `value_type` varchar(191) NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_links`
--

CREATE TABLE `product_downloadable_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sample_url` varchar(191) DEFAULT NULL,
  `sample_file` varchar(191) DEFAULT NULL,
  `sample_file_name` varchar(191) DEFAULT NULL,
  `sample_type` varchar(191) DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_link_translations`
--

CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_link_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_samples`
--

CREATE TABLE `product_downloadable_samples` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_sample_translations`
--

CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_sample_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_flat`
--

CREATE TABLE `product_flat` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `product_number` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_key` varchar(191) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_flat`
--

INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES
(1, 'kids', 'simple', '101', 'Kids Boys Cotton Printed White and Red Colour Top Shorts', 'Whaou! Kids Boys Cotton Printed White and Red Colour Top Shorts Set |', 'Whaou! Kids Boys Cotton Printed White and Red Colour Top Shorts Set |', 'kids-boys-cotton-printed-white-and-red-colour-top-shorts', 0, 0, 0, '', '', '', 10.0000, 9.0000, '2024-02-12', '2024-02-14', 2.0000, '2024-02-12 14:40:04', 'en', 'default', 1, 1, '2024-02-12 14:43:15', NULL, 0),
(2, 'kids', 'simple', '101', NULL, NULL, NULL, 'kids-boys-cotton-printed-white-and-red-colour-top-shorts', 0, 0, 0, NULL, NULL, NULL, 10.0000, 9.0000, '2024-02-12', '2024-02-14', 2.0000, '2024-02-12 14:40:04', 'hi_IN', 'default', 1, 1, '2024-02-12 14:43:15', NULL, 0),
(3, 'kidswear', 'simple', '', 'kids-boys-cotton-printed-white-and-red-colour-top-shortsq', 'kids-boys-cotton-printed-white-and-red-colour-top-shorts', 'kids-boys-cotton-printed-white-and-red-colour-top-shorts', 'kids-boys-cotton-printed-white-and-red-colour-top-shortsq', 1, 1, 1, '', '', '', 5.0000, 4.0000, '2024-02-12', '2024-02-14', 3.0000, '2024-02-12 14:58:17', 'en', 'Default', 1, 2, '2024-02-12 15:43:16', NULL, 1),
(4, 'kidswear', 'simple', '', NULL, NULL, NULL, 'kids-boys-cotton-printed-white-and-red-colour-top-shortsq', 1, 1, 1, NULL, NULL, NULL, 5.0000, 4.0000, '2024-02-12', '2024-02-14', 3.0000, '2024-02-12 14:58:17', 'hi_IN', 'Default', 1, 2, '2024-02-12 15:43:16', NULL, 1),
(5, 'wo', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-12 15:27:25', 'en', 'Default', 1, 3, '2024-02-12 15:27:25', NULL, NULL),
(6, 'wo', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-12 15:27:25', 'hi_IN', 'Default', 1, 3, '2024-02-12 15:27:25', NULL, NULL),
(7, 'abc', 'simple', '122', 'Qube By Fort Collins Women\'s Synthetic Short Length Jacket', 'Qube By Fort Collins Women\'s Synthetic Short Length Jacket', 'Qube By Fort Collins Women\'s Synthetic Short Length Jacket', 'qube-by-fort-collins-womens-synthetic-short-length-jacket', 1, 1, 1, '', '', '', 5.0000, 4.0000, '2024-02-13', '2024-02-15', 5.0000, '2024-02-13 13:03:11', 'en', 'Default', 1, 4, '2024-02-13 13:04:26', NULL, 1),
(8, 'abc', 'simple', '122', NULL, NULL, NULL, 'qube-by-fort-collins-womens-synthetic-short-length-jacket', 1, 1, 1, NULL, NULL, NULL, 5.0000, 4.0000, '2024-02-13', '2024-02-15', 5.0000, '2024-02-13 13:03:11', 'hi_IN', 'Default', 1, 4, '2024-02-13 13:04:26', NULL, 1),
(9, 'abcd', 'simple', '', 'LEOTUDE Women\'s Loopknit Boyfriend/Loose Fit Round Neck Sweatshirt (Color Black)', 'LEOTUDE Women\'s Loopknit Boyfriend/Loose Fit Round Neck Sweatshirt (Color Black)', 'Neck: Round Neck\r\nPattern: Colorblock\r\nColor: Black:Grey\r\nSleeve Type: Full Sleeve With Drop Shoulder\r\nSize Chart: Please Refer The Size Chart available in Product Image.', 'leotude-womens-loopknit-boyfriendloose-fit-round-neck-sweatshirt-color-black', 1, 1, 1, '', '', '', 6.0000, 5.0000, '2024-02-13', '2024-02-15', 5.0000, '2024-02-13 13:07:44', 'en', 'Default', 1, 5, '2024-02-13 13:09:18', NULL, 1),
(10, 'abcd', 'simple', '', NULL, NULL, NULL, 'leotude-womens-loopknit-boyfriendloose-fit-round-neck-sweatshirt-color-black', 1, 1, 1, NULL, NULL, NULL, 6.0000, 5.0000, '2024-02-13', '2024-02-15', 5.0000, '2024-02-13 13:07:44', 'hi_IN', 'Default', 1, 5, '2024-02-13 13:09:18', NULL, 1),
(11, 'a', 'simple', '', 'Alan Jones Clothing Women\'s Cotton Hooded Neck Sweatshirt', 'Alan Jones Clothing Women\'s Cotton Hooded Neck Sweatshirt', 'Material composition60% Cotton, 40% Polyester\r\nSleeve typeLong Sleeve\r\nMaterial typeCotton\r\nFit typeRegular\r\nLengthStandard Length\r\nNeck styleHooded Neck\r\nCountry of OriginIndia', 'alan-jones-clothing-womens-cotton-hooded-neck-sweatshirt', 1, 1, 1, '', '', '', 7.0000, NULL, NULL, NULL, 2.0000, '2024-02-13 13:10:01', 'en', 'Default', 1, 6, '2024-02-13 13:12:29', NULL, 1),
(12, 'a', 'simple', '', NULL, NULL, NULL, 'alan-jones-clothing-womens-cotton-hooded-neck-sweatshirt', 1, 1, 1, NULL, NULL, NULL, 7.0000, NULL, NULL, NULL, 2.0000, '2024-02-13 13:10:01', 'hi_IN', 'Default', 1, 6, '2024-02-13 13:12:29', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_grouped_products`
--

CREATE TABLE `product_grouped_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `associated_product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
(1, 'images', 'product/1/LbEPrpUOKF7LtghZbdA99bPcqpsmn2z9NZ2oYkiL.webp', 1, 1),
(2, 'images', 'product/2/8awBzkBNTsyiwknmESuh13cZKHXYGBDso6QAX70P.webp', 2, 1),
(3, 'images', 'product/4/k0kUMDUJGfftxo4LVRsLz7bsTVm15OJW2LMHT2UO.webp', 4, 1),
(4, 'images', 'product/4/i3TZTcIDgyFgsahE8lzmdyfJipRRgZMlRCQrgZ4D.webp', 4, 2),
(5, 'images', 'product/4/wyW2mFadpMIu5OJdYHQC2a6dlekEm2yDW0KXZPDN.webp', 4, 3),
(6, 'images', 'product/5/e5xK7rtZCnujF0JKk1qsdeL1jJ5W6RU63RSpMmz4.webp', 5, 1),
(7, 'images', 'product/5/TjEnPm5mrTDllHTpW2kaNOiURuPUhOaJMWkcdtKi.webp', 5, 2),
(8, 'images', 'product/6/ymcVWDp9vCjBsc9ChLW48jdOb84U5DItDPd0H49P.webp', 6, 1),
(9, 'images', 'product/6/86vk3NcowXFjfntHeeiuTVTeTkOdSF7IIUe3Np94.webp', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_inventories`
--

INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES
(1, 50, 1, 0, 1),
(2, 50, 2, 0, 1),
(3, 50, 4, 0, 1),
(4, 10, 5, 0, 1),
(5, 7, 6, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory_indices`
--

CREATE TABLE `product_inventory_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_inventory_indices`
--

INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 50, 1, 1, NULL, NULL),
(2, 50, 2, 1, NULL, '2024-02-12 09:52:38'),
(3, 50, 4, 1, NULL, NULL),
(4, 10, 5, 1, NULL, NULL),
(5, 7, 6, 1, NULL, '2024-02-13 07:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_ordered_inventories`
--

CREATE TABLE `product_ordered_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_indices`
--

CREATE TABLE `product_price_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_price_indices`
--

INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9.0000, 10.0000, 9.0000, 10.0000, NULL, NULL),
(2, 1, 2, 9.0000, 10.0000, 9.0000, 10.0000, NULL, NULL),
(3, 1, 3, 9.0000, 10.0000, 9.0000, 10.0000, NULL, NULL),
(4, 2, 1, 4.0000, 5.0000, 4.0000, 5.0000, NULL, NULL),
(5, 2, 2, 4.0000, 5.0000, 4.0000, 5.0000, NULL, NULL),
(6, 2, 3, 4.0000, 5.0000, 4.0000, 5.0000, NULL, NULL),
(7, 4, 1, 4.0000, 5.0000, 4.0000, 5.0000, NULL, NULL),
(8, 4, 2, 4.0000, 5.0000, 4.0000, 5.0000, NULL, NULL),
(9, 4, 3, 4.0000, 5.0000, 4.0000, 5.0000, NULL, NULL),
(10, 5, 1, 5.0000, 6.0000, 5.0000, 6.0000, NULL, NULL),
(11, 5, 2, 5.0000, 6.0000, 5.0000, 6.0000, NULL, NULL),
(12, 5, 3, 5.0000, 6.0000, 5.0000, 6.0000, NULL, NULL),
(13, 6, 1, 7.0000, 7.0000, 7.0000, 7.0000, NULL, NULL),
(14, 6, 2, 7.0000, 7.0000, 7.0000, 7.0000, NULL, NULL),
(15, 6, 3, 7.0000, 7.0000, 7.0000, 7.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_relations`
--

CREATE TABLE `product_relations` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `title` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_review_attachments`
--

CREATE TABLE `product_review_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT 'image',
  `mime_type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_super_attributes`
--

CREATE TABLE `product_super_attributes` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_up_sells`
--

CREATE TABLE `product_up_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refund_items`
--

CREATE TABLE `refund_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `refund_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `permission_type` varchar(191) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Administrator role', 'all', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) DEFAULT NULL,
  `carrier_title` varchar(191) DEFAULT NULL,
  `track_number` text DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_address_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

CREATE TABLE `shipment_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT 0.0000,
  `base_price` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) DEFAULT 0.0000,
  `base_total` decimal(12,4) DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sitemaps`
--

CREATE TABLE `sitemaps` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_list`
--

CREATE TABLE `subscribers_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories`
--

CREATE TABLE `tax_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories_tax_rates`
--

CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED NOT NULL,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(191) NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT 0,
  `zip_code` varchar(191) DEFAULT NULL,
  `zip_from` varchar(191) DEFAULT NULL,
  `zip_to` varchar(191) DEFAULT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `theme_customizations`
--

CREATE TABLE `theme_customizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `theme_customizations`
--

INSERT INTO `theme_customizations` (`id`, `channel_id`, `type`, `name`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'image_carousel', 'Image Carousel', 1, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(2, 1, 'static_content', 'Offer Information', 2, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(3, 1, 'category_carousel', 'Categories Collections', 3, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(4, 1, 'product_carousel', 'New Products', 4, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(5, 1, 'static_content', 'Top Collections', 5, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(6, 1, 'static_content', 'Bold Collections', 6, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(7, 1, 'product_carousel', 'Featured Collections', 7, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(8, 1, 'static_content', 'Game Container', 8, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(9, 1, 'product_carousel', 'All Products', 9, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(10, 1, 'static_content', 'Bold Collections', 10, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37'),
(11, 1, 'footer_links', 'Footer Links', 11, 1, '2024-02-12 08:35:37', '2024-02-12 08:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `theme_customization_translations`
--

CREATE TABLE `theme_customization_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_customization_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `theme_customization_translations`
--

INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES
(1, 1, 'en', '{\"images\":[{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/1.webp\"},{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/2.webp\"},{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/3.webp\"},{\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/4.webp\"}]}'),
(2, 2, 'en', '{\"html\":\"<div class=\\\"home-offer\\\"><span>Get UPTO 40% OFF on your 1st order SHOP NOW<\\/span><\\/div>\",\"css\":\".home-offer span {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer span {font-size:18px;}@media (max-width:525px) {.home-offer span {font-size:14px;}}\"}'),
(3, 3, 'en', '{\"filters\":{\"parent_id\":1,\"sort\":\"asc\",\"limit\":10}}'),
(4, 4, 'en', '{\"title\":\"New Products\",\"filters\":{\"new\":1,\"sort\":\"asc\",\"limit\":10}}'),
(5, 5, 'en', '{\"html\":\"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>The game with our new additions!<\\/h2><\\/div><div class=\\\"container top-collection-grid\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/2.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/2.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/2.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\\"><h3>Our Collections<\\/h3><\\/div><\\/div><\\/div>\",\"css\":\".top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 30px;}.top-collection-header {font-size: 32px;line-height: 1.5;}.top-collection-grid {gap: 15px;}}@media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 640px) {.top-collection-grid {margin-top: 20px;}}\"}'),
(6, 6, 'en', '{\"html\":\"<div class=\\\"container section-gap\\\"> <div class=\\\"inline-col-wrapper\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/6\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"\\\"> <\\/div> <div class=\\\"inline-col-content-wrapper\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> <p class=\\\"inline-col-description\\\">Buy products in groups for bigger discounts. like lorem ipsume is simply text for digital platform<\\/p> <button class=\\\"primary-button\\\">View All<\\/button> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\"}'),
(7, 7, 'en', '{\"title\":\"Featured Products\",\"filters\":{\"featured\":1,\"sort\":\"desc\",\"limit\":10}}'),
(8, 8, 'en', '{\"html\":\"<div class=\\\"section-title\\\"> <h2>The game with our new additions!<\\/h2> <\\/div> <div class=\\\"container section-gap\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"\\\"> <h3 class=\\\"overlay-text\\\">Our Collections<\\/h3> <\\/div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/2.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"\\\"> <h3 class=\\\"overlay-text\\\"> Our Collections <\\/h3> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:525px){.collection-card-wrapper .single-collection-card img{max-width:calc(100vw - 30px)}.collection-card-wrapper .single-collection-card .overlay-text{font-size:30px}.container{padding:0 30px;margin-top:20px}.section-title{margin-top:30px}.section-title h2{font-size:30px;line-height:normal}}\"}'),
(9, 9, 'en', '{\"title\":\"All Products\",\"filters\":{\"sort\":\"desc\",\"limit\":10}}'),
(10, 10, 'en', '{\"html\":\"<div class=\\\"container section-gap\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper \\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/10\\/1.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"\\\"> <\\/div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> <p class=\\\"inline-col-description\\\">Buy products in groups for bigger discounts. like lorem ipsume is simply text for digital platform<\\/p> <button class=\\\"primary-button\\\">View All<\\/button> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\"}'),
(11, 11, 'en', '{\"column_1\":[{\"url\":\"http:\\/\\/localhost\\/page\\/about-us\",\"title\":\"About Us\",\"sort_order\":1},{\"url\":\"http:\\/\\/localhost\\/page\\/contact-us\",\"title\":\"Contact Us\",\"sort_order\":2},{\"url\":\"http:\\/\\/localhost\\/page\\/customer-service\",\"title\":\"Customer Service\",\"sort_order\":3},{\"url\":\"http:\\/\\/localhost\\/page\\/whats-new\",\"title\":\"What\'s new\",\"sort_order\":4},{\"url\":\"http:\\/\\/localhost\\/page\\/terms-of-use\",\"title\":\"Terms of use\",\"sort_order\":5},{\"url\":\"http:\\/\\/localhost\\/page\\/terms-conditions\",\"title\":\"Terms & Conditions\",\"sort_order\":6}],\"column_2\":[{\"url\":\"http:\\/\\/localhost\\/page\\/privacy-policy\",\"title\":\"Privacy Policy\",\"sort_order\":1},{\"url\":\"http:\\/\\/localhost\\/page\\/payment-policy\",\"title\":\"Payment Policy\",\"sort_order\":2},{\"url\":\"http:\\/\\/localhost\\/page\\/shipping-policy\",\"title\":\"Shipping Policy\",\"sort_order\":3},{\"url\":\"http:\\/\\/localhost\\/page\\/refund-policy\",\"title\":\"Refund Policy\",\"sort_order\":4},{\"url\":\"http:\\/\\/localhost\\/page\\/return-policy\",\"title\":\"Return Policy\",\"sort_order\":5}]}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(191) DEFAULT NULL,
  `request` mediumtext DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `referer` mediumtext DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `useragent` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `visitable_type` varchar(191) DEFAULT NULL,
  `visitable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visitor_type` varchar(191) DEFAULT NULL,
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `created_at`, `updated_at`) VALUES
(1, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\",\"gu\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9,gu;q=0.8\"],\"cookie\":[\"laravel_session=eyJpdiI6Iko2aTU1azIxeUdwZnM0L1hOUTQ3ZFE9PSIsInZhbHVlIjoiV1JvVkRkaDMvTDQ0MWdOWHp2OGlWQW1PTXdOWFFNa0RuT05uSEY1dHFtRWUzVXhJdUJRQkYyK2tOeW9NZURzTzRyYkcvR2xQTlVkU3ZySk1qbHBHWG5NcU1pYjdBYnk3L1ZUdkFuejFuOXB1VTRXZGFGRmxaOTBwKzRiY05aNTAiLCJtYWMiOiIxMTVjZGIzYjg1MDZiNDdmZTdmN2MwMmE4NWRjMmU0ZDU3MGQ0MTc2ZjI2ZTM1MDcwMDdkZjRkN2IwNWUwMGVmIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6ImlvNGxoWGhISnNVWDlnMmJrNXdrZmc9PSIsInZhbHVlIjoibEU0R0JMQXdsTEptQnV1TTNndE9JQVdkQVU3RDJiZnFUemFENUNmSUVRL1B3bm9QTmQ1Y1ZNUzh6c0dTMVowdVJkQm5zZDBLSjlVSU9xNDY2SEZ0N2d2eDloRGlLOW1BNmk4VjFpYnpHQXlUY0N4cHZLcStnNnA0ZUczZkFSMU0iLCJtYWMiOiIyY2NkNjJhMjc2OTMzYjNhZDAzMjZmYzk2NjlhOWQ4ODZkNTQzNGNhNWJkNzZkMmY3ZTAwMTdhNGI0NzY1OTUwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImtNWlFZMlZnODg1TWpNWVQ3NVVVcEE9PSIsInZhbHVlIjoiK1ozVWF3d2xBQVUzdC8xcjJJZCtZN2Jpb3Zrc09hVTk3K0Jpc0VkcDZCbmg0Tno2YTE0TmYyUmhZdTVxTE9OZjV3aEFwSkMrYVZKQUo3ckZYdTdLTGRtaDZsbUg1MDR4Y2x0RW9HRVR2YjdWZU5IMjZnRWttcm1WbDRMWmFabkciLCJtYWMiOiJlMDIxNzg4MDA3NmZlYzUxMGQwMDZiZDg0MTgwYjllNjJkMGI1ZGQ2ZDhjM2UzMjNlNjQwN2U3ZDU0YWNmOWQ0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-12 08:36:36', '2024-02-12 08:36:36'),
(2, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"en-us\",\"en\",\"gu\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9,gu;q=0.8\"],\"cookie\":[\"laravel_session=eyJpdiI6Iko2aTU1azIxeUdwZnM0L1hOUTQ3ZFE9PSIsInZhbHVlIjoiV1JvVkRkaDMvTDQ0MWdOWHp2OGlWQW1PTXdOWFFNa0RuT05uSEY1dHFtRWUzVXhJdUJRQkYyK2tOeW9NZURzTzRyYkcvR2xQTlVkU3ZySk1qbHBHWG5NcU1pYjdBYnk3L1ZUdkFuejFuOXB1VTRXZGFGRmxaOTBwKzRiY05aNTAiLCJtYWMiOiIxMTVjZGIzYjg1MDZiNDdmZTdmN2MwMmE4NWRjMmU0ZDU3MGQ0MTc2ZjI2ZTM1MDcwMDdkZjRkN2IwNWUwMGVmIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6InhlaDZDSlB3Wm41K1E4b3VUbWhpb0E9PSIsInZhbHVlIjoiZWE3bk1TenhGbm5ZU0J5enVIbm5tMWJrQVZmM1NrV2w3VFhUSlhCRjJZUFJ4dlFCWXQxMzNLU1pCbXNZVVRyaTVWWVdJVEVUN1N4V0p6R01MY043YUZsQmVoWHBOSk5zZHI0RmR0QkNhR1JwT0F1czF1S3dzbnVUbGg3MGF4RmkiLCJtYWMiOiIxOTVjZWU0NjFmMThiYzNiNmJkNTcxZjY4ZjgzZjdiMWNiMGY2ZjdmYWQzODk1YjU5NDY1ODRjMTE2MjQ0YWJlIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ii9Wdmc3R2hpOVJMclN5d3RkUzRGZmc9PSIsInZhbHVlIjoiVzZaSVhzeDlmWUY4Q0JoWENrOFh2NG42KzhkdnRSekRNeUhpdThFcVNpc21VVGM0QXdkTHRPeWhobzhUbktXS3VSOWRabUp0YVBOd1Z5UXpmRmo3cWRkZHNWWU5abGRER2R5Z1JEcmhaQXVmbEk3U0k5VklNNE9qVXBmOWdjaGkiLCJtYWMiOiJhOTZhNDdhN2I5NTgyMWU5MThjZDM1M2QzNTkwMTY4MDA4NzIzZmRhNDY5YWJhOTk5MjVkMGJhNTcyMWIyZGEzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, '2024-02-12 09:21:06', '2024-02-12 09:21:06'),
(3, 'GET', '[]', 'http://127.0.0.1:8000/kids-wear', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\",\"gu\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9,gu;q=0.8\"],\"cookie\":[\"laravel_session=eyJpdiI6Iko2aTU1azIxeUdwZnM0L1hOUTQ3ZFE9PSIsInZhbHVlIjoiV1JvVkRkaDMvTDQ0MWdOWHp2OGlWQW1PTXdOWFFNa0RuT05uSEY1dHFtRWUzVXhJdUJRQkYyK2tOeW9NZURzTzRyYkcvR2xQTlVkU3ZySk1qbHBHWG5NcU1pYjdBYnk3L1ZUdkFuejFuOXB1VTRXZGFGRmxaOTBwKzRiY05aNTAiLCJtYWMiOiIxMTVjZGIzYjg1MDZiNDdmZTdmN2MwMmE4NWRjMmU0ZDU3MGQ0MTc2ZjI2ZTM1MDcwMDdkZjRkN2IwNWUwMGVmIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6ImRNT2dKU29RS20zVjhxZlczMGdhMXc9PSIsInZhbHVlIjoiSFlnc0hRQUVXY3g2cWVrL2hCOXpOek14UDArcEs3TkY0UkhqeGdTNFdkTEQzR1FPWGgvMmd0SDY4UjllU1dQdisrbldaVm5SaGV5ZVEvMUs0cXUrdkFBUFJXcDQvTzVEcmZac3plSkwxdWw1WGN6TjNRSENnN08xR3V5T3I2VFoiLCJtYWMiOiIwNmE4YTRkZDI4ZTZlZTBhZTNhZTVjMTI0YTdkYzk4ZGQ5Y2IzNTIxODk0Y2E5MjIyMDQ4MTNjOTAyM2QyMjAzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlRkNGlab1pBTXlmTUdvZlVORzBOY3c9PSIsInZhbHVlIjoiSk5vd0FqeDdQVm16ZHFyRmQ1UmpGZFpxL3pLdUxENmFHWlpxVTNORWNicmRIanJoN202STdwVkxoWDM0cnJVczNTMmVTWHFYc1FZMnhncTBhendvSEJEZzkzYmxlOVN1QUtoanJJd3BDWkUxNFFZa3RUNzNKbHBkbzM3NjI3aXIiLCJtYWMiOiI2MWQyOTE2N2E5YWZmMGU5ZWRkZWJmNDk5ZjNlZGU3MzYzOGQyY2NjNmQwMjI2MjhjZTkzNmRjZWFhNWUzZWRlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, 'Webkul\\Customer\\Models\\Customer', 1, '2024-02-12 09:46:17', '2024-02-12 09:46:17'),
(4, 'GET', '[]', 'http://127.0.0.1:8000/womens-wear', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\",\"gu\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9,gu;q=0.8\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkJZOVFqMkdJTDV6MzlaMlhOYTcrWWc9PSIsInZhbHVlIjoiVTB2bTM4N3h1dHNGRlBJRFAyNmF1bXU1TUViR1NLNUE3d2dvSDFMTnNFRDlhQ3ppWTR0bklDVjVtZ3lzR2h5aUZnTEVKWE1pOHgwWkhQdDM5QXcrRVJkUDQ0Vm93QmFINkJuMzlsbVVEWVNkV3NnTHBwYnFQWUszTkdMSVF3c2ciLCJtYWMiOiIzYTczMGI0MTkwM2ZiNTY4ODQ5Njk2NTMwM2FkMTJkZjM4NmE3YTVhNDllM2VmODI0N2Y2YmI2ZWQwZjQ1MDcyIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlNrR2lTRE1ldnY1elc4S3R0MWhZdXc9PSIsInZhbHVlIjoiV2QvUzlBVVpmWllIMWtBQjNPMUpreUZQa3ZPd0F3TzdCc2lMNnNrS1c2d1A2MXRZbjhHRkRRZ1h5TENNOVp4ZTd1NWdqVU5hWGJBdUdqYVY5SHlxaFBhMFJLNjJrSnhzd3hmUm93TTNOWkNoUW5KSUZ6U1hVckEzYkFZdlpnQnEiLCJtYWMiOiIwNzgyZDdhMjI4Mjg4ZTgxOGY1MjZhMzBjNmYwMjQyY2UyYjQ3YTRhMjk5NDU4Yzc4MjlmY2JhNmY4MzBlZGE0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 6, 'Webkul\\Customer\\Models\\Customer', 1, '2024-02-12 10:13:43', '2024-02-12 10:13:43'),
(5, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-13 07:31:07', '2024-02-13 07:31:07'),
(6, 'GET', '[]', 'http://127.0.0.1:8000/womens-wear', 'http://127.0.0.1:8000/', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjFsTjU2dUdBaXR2SFp3MTNuNmdtU1E9PSIsInZhbHVlIjoiYUhsOWxTaVVmR3Q5UUdLc25xeENXckJMaTJLdGdJUlNqaW5uaWRPc3p5NUxhOThrdzAyUzArb0dOeEl3ZmlyM1FwWStxd0t0OFpvZkFKakYwYXNSZFpDcTlvcWdRbHZvTGd1NHBKT3ZUT1htR3d3RXU4U0pLVzJ0UTRjcElFcm4iLCJtYWMiOiIzMDdmMTFlZTZjMzIxNzg1MDkzMTVlNjEyODQ1ZWY1Mzk4ZTUxNTJmMGY0YzJhZGQwMDZkYmU0YzIyZmZjMDg4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjRiKzduK3dnbGlMU1Z5L2g2cmFYVkE9PSIsInZhbHVlIjoiVUhKZFNLMHFFUEpJcFNaUnBkSXlZb0E4cUVJMHlHRUdVYTEyMjFjdWRpQThNQ2h5VmFZWStVN2pGVDhOL2YyZGhqd3dpMGxUUHhrT0JYMklINzFpK2hZTzlpVTNpdTJiZG9WenhPUHAxaTlWMVJnSjY0dGM4aVFZVTZmZ0dRUGwiLCJtYWMiOiI0ZDM3OTRkM2ZkMDY4NjE0ZTBkNGZjMGE5MjY4MWYyYWI1NzMxMzZjNTlmMmFmMTY1OTk5OGUyYTY5NGUwMjE1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, '2024-02-13 07:34:31', '2024-02-13 07:34:31'),
(7, 'GET', '[]', 'http://127.0.0.1:8000/qube-by-fort-collins-womens-synthetic-short-length-jacket', 'http://127.0.0.1:8000/womens-wear?sort=price-desc&limit=12&mode=grid', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/womens-wear?sort=price-desc&limit=12&mode=grid\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlE1bUFUbTJWUW8wNU0yemdua3lreVE9PSIsInZhbHVlIjoiUStsVUVVR3R6dEVuV3FzTFNCaXpSb2RQYzRXNGU2SmV3eW9jOGY0OFJPVzNBcHFjazk3TUJvY01oZ2k4TGxHMWtzK1pSaWZNSWFxa012TEIrbTJuTHVkOU9lRkhSYjFNSkNZM2JFSGxZK1U4N1lEY2NmeTZsQy9KRGZ2QXQ4V1AiLCJtYWMiOiI1MGQxZTcyMWFhZjFmZTRlN2ZmZTcxOThmZWUzZjJmNWZiNDNlM2M4YzE3NWQ4NGMwZGI3ZTkzNjg5M2QxN2Q0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlZJcUF3ZE9acnFlTmxLK1JwcUpNZ0E9PSIsInZhbHVlIjoidk1YL2ZlNDJtVkdlSnk1UExPNTFIM1JINkdkNHBnck1JajlFQTJWYk9hZ0ZnRmptdEJUUEZOMmY4NUhoNEF5a0RoYmgvemQwblB1dzJjTTVTdEtvc2Y0TUtKNTlvRzNDR1BwbXlpbDc5VWJ3aldwbnNIVHV5RVFxZXBWVlVFd2wiLCJtYWMiOiI2Mjk2NTBkNjljM2M4ZGUxMjUxYmZlNDY4NDg2MDRmOTc5NjU3OTYzZjk2MDhmMDhiNzQzNjk5YjRmNjBmY2UyIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 4, NULL, NULL, '2024-02-13 07:34:40', '2024-02-13 07:34:40'),
(8, 'GET', '[]', 'http://127.0.0.1:8000/kids-wear', 'http://127.0.0.1:8000/qube-by-fort-collins-womens-synthetic-short-length-jacket', '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/qube-by-fort-collins-womens-synthetic-short-length-jacket\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjlhdmVLY2lKSkxERGhQT05qOGRxZlE9PSIsInZhbHVlIjoiVFV1RVg0OFgrM2ZOK1RMbG56eTRNUm9BUTdSMHkvaEtXK2k1Z1pzbG45SWdTdVBmN05vM1ZNckRMbjhxeFJMWUNaK2NjSkRNbktJeFJnbmdmUjBCRGh2QUNuSlV3MGEya3pvMzdrcEwrNEFlazVDTlZUVlpNWkhxQVdkUEpuengiLCJtYWMiOiI1YjExZDg0YzJmMDAwOTk3ZWVkZDgxYjA1ZjlkYzEwODQ5MDc2OWIxZTVjZTA3MmE4NDQzMWI2MmJjNmFiMDVjIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlNTcFhvMTFlcllFemd0a2plWmRueXc9PSIsInZhbHVlIjoianJHdW9LVU9NaCtwY0Z4Wjg2cFdWbVJJUU1OdS85TGV6RkN2SDlFUTNla3oveVlRTjJkcjJNd3BnenEwQlZGb2lVRGVvelFIZjZleS9UaGNvMjFPL3dBVTkrUzMvMHNuYThseDRWQ0I5YTJWL092YVdZcEhxOXZJQWsvNkxoVXAiLCJtYWMiOiI3ZjMwNWMzMmQ5OTdmMjc2OWQxOTM2YTdiYzExZWExMjdlYTYyYzlhNTAyMmE1NTg5NDIwNTY3ZTRhYjc4NzJmIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, '2024-02-13 07:35:03', '2024-02-13 07:35:03'),
(9, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not A(Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"121\\\", \\\"Chromium\\\";v=\\\"121\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"sidebar_collapsed=0; dark_mode=0; XSRF-TOKEN=eyJpdiI6IldpZGZSeWpFOWtmcVdoTVFVNHFCcXc9PSIsInZhbHVlIjoiYUFhOWt0UFBZZHdjNnFJSks2SGVyYS9ZNHloWWMxRG16N3cvTW02bC9URFMrMHlkS2dWVVYzMm15TVNtbENQOHZhUWpDQWVFVFdvNDNSYkZ6ZE1yTnlxQzJYWHZ4TGtSU3I3RGNQNW1UZzNNcHowZEh3bmVHZjF6OWdFQjhzejUiLCJtYWMiOiJiMjMwMDAwNmJjOWE0NGExN2Q2ZmI4YTYzNWM5ZjdmMjY5YTMyNTcxMWJmODY4MzFjZjk1Nzk4OGU3MmRiYWU0IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IldZeVpQVk9rWlJtWjlHUGRnc1ZER1E9PSIsInZhbHVlIjoiUGkwNlE0VEtMSTg3T0M0azRzMzhndC83Q0ZjbkhNbXdVTGl0NzhSNVc4dVlHeW1kL0trTllMS3krNGFBU3E3b29vL3krTkx3bEdMRDREZkc1Z2NoRDVwaDk0cXhpdFRRdnBMWnJqWmtpRlZBTlVpekNMQ2p2cmFLN3JvLzhMNHgiLCJtYWMiOiI2NjQyNGRiZDFiZDk3YmM3MzU3MDY5OTIzZDYyNDYyZjhkMjYzN2Q1NjIyNDBiYTQ5MDk1Njc0MmM5NTJlMTI4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-02-15 07:49:34', '2024-02-15 07:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `item_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_options`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `addresses_cart_id_foreign` (`cart_id`),
  ADD KEY `addresses_order_id_foreign` (`order_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_families`
--
ALTER TABLE `attribute_families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`);

--
-- Indexes for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  ADD KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_parent_id_foreign` (`parent_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_payment_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `cart_rules`
--
ALTER TABLE `cart_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD PRIMARY KEY (`cart_rule_id`,`channel_id`),
  ADD KEY `cart_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`);

--
-- Indexes for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  ADD KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  ADD KEY `cart_rule_customers_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  ADD KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`);

--
-- Indexes for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  ADD KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  ADD KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_products_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  ADD KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  ADD KEY `category_translations_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_root_category_id_foreign` (`root_category_id`),
  ADD KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  ADD KEY `channels_base_currency_id_foreign` (`base_currency_id`);

--
-- Indexes for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD PRIMARY KEY (`channel_id`,`currency_id`),
  ADD KEY `channel_currencies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  ADD KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD PRIMARY KEY (`channel_id`,`locale_id`),
  ADD KEY `channel_locales_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  ADD KEY `channel_translations_locale_index` (`locale`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  ADD KEY `cms_page_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`);

--
-- Indexes for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compare_items_product_id_foreign` (`product_id`),
  ADD KEY `compare_items_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `core_config`
--
ALTER TABLE `core_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_translations_country_state_id_foreign` (`country_state_id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_code_unique` (`code`);

--
-- Indexes for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_notes_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_password_resets`
--
ALTER TABLE `customer_password_resets`
  ADD KEY `customer_password_resets_email_index` (`email`);

--
-- Indexes for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  ADD KEY `customer_social_accounts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  ADD KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  ADD KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_sources_code_unique` (`code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locales_code_unique` (`code`);

--
-- Indexes for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  ADD KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `marketing_events`
--
ALTER TABLE `marketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_parent_id_foreign` (`parent_id`),
  ADD KEY `order_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  ADD KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`);

--
-- Indexes for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  ADD KEY `product_cross_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_links_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`);

--
-- Indexes for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_samples_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`);

--
-- Indexes for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  ADD KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `product_flat_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_grouped_products_product_id_foreign` (`product_id`),
  ADD KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  ADD KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_inventory_indices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_price_indices_product_id_customer_group_id_unique` (`product_id`,`customer_group_id`),
  ADD KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD KEY `product_relations_parent_id_foreign` (`parent_id`),
  ADD KEY `product_relations_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_images_review_id_foreign` (`review_id`);

--
-- Indexes for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD KEY `product_super_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  ADD KEY `product_up_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Indexes for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_items_parent_id_foreign` (`parent_id`),
  ADD KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `refund_items_refund_id_foreign` (`refund_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `sitemaps`
--
ALTER TABLE `sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  ADD KEY `subscribers_list_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_categories_code_unique` (`code`);

--
-- Indexes for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  ADD KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rates_identifier_unique` (`identifier`);

--
-- Indexes for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  ADD KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_items_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `attribute_families`
--
ALTER TABLE `attribute_families`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_payment`
--
ALTER TABLE `cart_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_rules`
--
ALTER TABLE `cart_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channel_translations`
--
ALTER TABLE `channel_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `compare_items`
--
ALTER TABLE `compare_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_config`
--
ALTER TABLE `core_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2291;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_notes`
--
ALTER TABLE `customer_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_events`
--
ALTER TABLE `marketing_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_payment`
--
ALTER TABLE `order_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_flat`
--
ALTER TABLE `product_flat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_items`
--
ALTER TABLE `refund_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipment_items`
--
ALTER TABLE `shipment_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitemaps`
--
ALTER TABLE `sitemaps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories`
--
ALTER TABLE `tax_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  ADD CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `country_states`
--
ALTER TABLE `country_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
