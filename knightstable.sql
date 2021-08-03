-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2019 at 11:31 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knightstable`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountbalance`
--

CREATE TABLE `accountbalance` (
  `accountID` int(11) NOT NULL,
  `accountFirstName` varchar(100) NOT NULL,
  `accountLastName` varchar(100) NOT NULL,
  `accountTotalBalance` int(100) NOT NULL,
  `customerbalanceID` int(11) NOT NULL,
  `dateT` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accountbalance`
--

INSERT INTO `accountbalance` (`accountID`, `accountFirstName`, `accountLastName`, `accountTotalBalance`, `customerbalanceID`, `dateT`) VALUES
(1, '', 'Requillo Adrian', 175, 3, '2019-10-09 14:40:24'),
(2, '', 'Barbon John', 50, 1, '2019-10-09 14:38:00'),
(3, '', 'Uy Anthony', 40, 2, '2019-10-09 14:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `balanceID` int(11) NOT NULL,
  `balanceItemName` varchar(200) NOT NULL,
  `balanceItemPrice` int(200) NOT NULL,
  `balanceItemTotal` int(200) NOT NULL,
  `customerbalanceID` int(200) NOT NULL,
  `transactionType` varchar(200) NOT NULL,
  `dateT` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`balanceID`, `balanceItemName`, `balanceItemPrice`, `balanceItemTotal`, `customerbalanceID`, `transactionType`, `dateT`) VALUES
(1, 'Cod Fillet', 75, 125, 3, 'BALANCE', '2019-10-13 01:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `CartNo` int(11) NOT NULL,
  `CartTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customeraccount`
--

CREATE TABLE `customeraccount` (
  `customerID` int(11) NOT NULL,
  `customerFirstName` varchar(100) NOT NULL,
  `customerLastName` varchar(200) NOT NULL,
  `customerUsername` varchar(100) NOT NULL,
  `customerPassword` varchar(100) NOT NULL,
  `customerContact` varchar(100) NOT NULL,
  `customerAddress` varchar(100) NOT NULL,
  `customerOrganization` varchar(100) NOT NULL,
  `customerEmail` varchar(100) NOT NULL,
  `customerIdNo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customeraccount`
--

INSERT INTO `customeraccount` (`customerID`, `customerFirstName`, `customerLastName`, `customerUsername`, `customerPassword`, `customerContact`, `customerAddress`, `customerOrganization`, `customerEmail`, `customerIdNo`) VALUES
(2, 'James', 'Moore', 'jamo', '26af0c5e930b016b360401e304c1bdc2', '096649230', 'New York', 'Google Inc.', 'james@google.com', 54894521),
(3, 'Mark', 'Mazowski', 'mari', 'd40b913237b22c538b948e7e44aeb9cf', '096311789', 'London', 'Yahoo inc.', 'mark@yahoo.com', 4889123),
(4, 'Johnson', 'Dwayne', 'johny', '05da9d587437a3f58cf91a8694448793', '098623164', 'Philadelphia', 'Body inc.', 'john@addu.edu.ph', 48951526);

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `Dish_ID` int(11) NOT NULL,
  `Dish_Name` varchar(40) NOT NULL,
  `Dish_Price` decimal(10,2) NOT NULL,
  `Dish_Description` varchar(400) NOT NULL,
  `status` varchar(11) NOT NULL,
  `Dish_Type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`Dish_ID`, `Dish_Name`, `Dish_Price`, `Dish_Description`, `status`, `Dish_Type`) VALUES
(15, 'Hotdog Meal', '30.00', 'Hotdog + Rice', 'active', 'MEALS'),
(16, 'Tortang Talong', '40.00', 'Eggplant + Egg (No Rice)', 'active', 'MEALS'),
(17, 'Grilled Pork Belly', '75.00', 'Pork Belly + Rice', 'active', 'MEALS'),
(18, 'Egg Meal', '30.00', 'Egg + Rice', 'active', 'MEALS'),
(19, 'Fried Chicken', '75.00', 'Chicken Meal w/ Rice', 'active', 'MEALS');

-- --------------------------------------------------------

--
-- Table structure for table `dish_stockin`
--

CREATE TABLE `dish_stockin` (
  `dish_stockinID` int(11) NOT NULL,
  `Dish_ID` int(3) NOT NULL,
  `Dish_Servings` int(11) NOT NULL,
  `Dish_Price` decimal(10,2) NOT NULL,
  `Total_Dish_Cost` decimal(10,2) NOT NULL,
  `Stock_In_Type` varchar(11) NOT NULL,
  `Stock_In_Desc` varchar(100) NOT NULL,
  `Dish_AddedBy` int(11) NOT NULL,
  `Dish_Date` datetime DEFAULT current_timestamp(),
  `Expiry_Date` date NOT NULL,
  `Modified_Date` datetime DEFAULT current_timestamp(),
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish_stockin`
--

INSERT INTO `dish_stockin` (`dish_stockinID`, `Dish_ID`, `Dish_Servings`, `Dish_Price`, `Total_Dish_Cost`, `Stock_In_Type`, `Stock_In_Desc`, `Dish_AddedBy`, `Dish_Date`, `Expiry_Date`, `Modified_Date`, `status`) VALUES
(13, 15, 10, '30.00', '812.15', 'New', 'Hotdog Meal_10/12/2019 10:55 PM_10', 6, '2019-10-12 22:55:39', '2019-10-12', NULL, 'active'),
(14, 16, 10, '40.00', '210.50', 'New', 'Tortang Talong_10/12/2019 10:56 PM_10', 6, '2019-10-12 22:56:39', '2019-10-12', NULL, 'active'),
(15, 17, 10, '75.00', '329.94', 'New', 'Grilled Pork Belly_10/12/2019 10:56 PM_10', 6, '2019-10-12 22:57:00', '2019-10-12', NULL, 'active'),
(16, 18, 10, '30.00', '189.63', 'New', 'Egg Meal_10/12/2019 10:57 PM_10', 6, '2019-10-12 22:57:06', '2019-10-12', NULL, 'active'),
(17, 19, 10, '75.00', '433.49', 'New', 'Fried Chicken_10/12/2019 10:57 PM_10', 6, '2019-10-12 22:57:15', '2019-10-12', NULL, 'active'),
(18, 15, 10, '30.00', '812.15', 'New', 'Hotdog Meal_10/12/2019 11:01 PM_10', 6, '2019-10-12 23:01:50', '2019-10-12', NULL, 'active'),
(19, 16, 10, '40.00', '210.50', 'New', 'Tortang Talong_10/12/2019 11:02 PM_10', 6, '2019-10-12 23:02:00', '2019-10-12', NULL, 'active'),
(20, 17, 10, '75.00', '329.94', 'New', 'Grilled Pork Belly_10/12/2019 11:02 PM_10', 6, '2019-10-12 23:02:13', '2019-10-12', NULL, 'active'),
(21, 18, 10, '30.00', '189.63', 'New', 'Egg Meal_10/12/2019 11:02 PM_10', 6, '2019-10-12 23:02:31', '2019-10-12', NULL, 'active'),
(22, 19, 10, '75.00', '433.49', 'New', 'Fried Chicken_10/12/2019 11:02 PM_10', 6, '2019-10-12 23:02:38', '2019-10-12', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `dish_stockout`
--

CREATE TABLE `dish_stockout` (
  `dish_stockoutID` int(11) NOT NULL,
  `Dish_ID` int(3) NOT NULL,
  `Dish_Servings` int(11) NOT NULL,
  `Dish_Price` decimal(10,2) NOT NULL,
  `Stock_Out_Type` varchar(15) NOT NULL,
  `Stock_Out_Desc` varchar(100) DEFAULT NULL,
  `Dish_Date` datetime NOT NULL DEFAULT current_timestamp(),
  `Modified_Date` datetime DEFAULT current_timestamp(),
  `Dish_StockOutBy` int(4) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish_stockout`
--

INSERT INTO `dish_stockout` (`dish_stockoutID`, `Dish_ID`, `Dish_Servings`, `Dish_Price`, `Stock_Out_Type`, `Stock_Out_Desc`, `Dish_Date`, `Modified_Date`, `Dish_StockOutBy`, `status`) VALUES
(1, 2, 10, '50.00', 'Recooked', 'Grilled Pork Belly_09/20/2019 10:03 AM_8', '2019-09-20 10:03:15', NULL, 6, 'active'),
(2, 2, 15, '50.00', 'Recooked', 'Grilled Pork Belly_09/20/2019 10:16 AM_2', '2019-09-20 10:16:39', NULL, 6, 'active'),
(3, 2, 4, '50.00', 'EmpMeal', 'Hello_World_09 / 24 / 2019 12: 42 PM_4', '2019-09-24 12:42:49', NULL, 6, 'active'),
(6, 2, 10, '50.00', 'Sold', 'asdas', '2019-09-25 21:19:57', NULL, 6, 'active'),
(7, 4, 10, '20.00', 'Sold', 'asdasd', '2019-10-01 00:16:53', NULL, 6, 'active'),
(8, 4, 10, '20.00', 'Sold', 'SOLD AS FCK DOOD', '2019-10-04 21:05:51', NULL, 6, 'active'),
(9, 4, 5, '20.00', 'EmpMeal', 'Lunch Break food for', '2019-10-07 01:21:00', NULL, 6, 'inactive'),
(10, 4, 5, '20.00', 'Spoilage', 'pan.os na pan', '2019-10-07 07:10:58', NULL, 6, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_name` varchar(30) NOT NULL,
  `unitofmeasure` varchar(10) NOT NULL,
  `ingredient_description` varchar(100) NOT NULL,
  `reorder_quantity` decimal(10,2) NOT NULL,
  `reorder_unit` varchar(10) NOT NULL,
  `reference_cost` decimal(10,2) NOT NULL,
  `reference_quantity` decimal(10,2) NOT NULL,
  `reference_unit` varchar(10) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `ingredient_name`, `unitofmeasure`, `ingredient_description`, `reorder_quantity`, `reorder_unit`, `reference_cost`, `reference_quantity`, `reference_unit`, `status`) VALUES
(30, 'Pork Belly', 'Mass', 'Yummy Fat for Grilling', '2.00', 'lbs', '800.00', '5.00', 'kg', 'active'),
(31, 'Magnolia Butter', 'Mass', 'Magnolia Butter (Unsalted)', '225.00', 'g', '250.00', '450.00', 'g', 'active'),
(32, 'Salt', 'Mass', 'SM BONUS IODIZED SALT', '5.00', 'kg', '75.00', '2.50', 'kg', 'active'),
(33, 'Pepper', 'Mass', 'Black Pepper', '500.00', 'g', '460.00', '1.00', 'kg', 'active'),
(34, 'Eggs', 'Count', 'Just Eggs', '50.00', 'pcs', '350.00', '50.00', 'pcs', 'active'),
(35, 'Ampalaya', 'Mass', 'Known as Bitter Gourd. waow', '2.00', 'kg', '90.00', '1.00', 'kg', 'active'),
(36, 'Eggplant', 'Mass', 'Long and Violet', '5.00', 'kg', '60.00', '1.00', 'kg', 'active'),
(37, 'Hotdog', 'Mass', 'Brand Virginia', '4.00', 'kg', '241.45', '1.00', 'kg', 'active'),
(38, 'Rice', 'Mass', 'Bigas', '20.00', 'kg', '995.00', '20.00', 'kg', 'active'),
(39, 'Chicken', 'Mass', 'For Fried Chicken', '5.00', 'kg', '1100.00', '10.00', 'kg', 'active'),
(40, 'Flour', 'Mass', 'Magnolia All Purpose Flour', '2.00', 'kg', '103.64', '2.00', 'kg', 'active'),
(41, 'Cooking Oil', 'Volume', 'Canola Oil', '3.00', 'l', '1350.00', '1.50', 'l', 'active'),
(42, 'Soy Sauce', 'Volume', 'Silver Swan', '3.00', 'l', '131.25', '3.00', 'l', 'active'),
(43, 'Garlic', 'Mass', 'Garlic_10/12/2019 08:26 PM', '1.00', 'kg', '90.00', '1.00', 'kg', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_stockin`
--

CREATE TABLE `ingredients_stockin` (
  `ing_stockInID` int(11) NOT NULL,
  `Quantity` decimal(10,2) NOT NULL,
  `ingredient_unit` varchar(11) NOT NULL,
  `cost_per_unit` decimal(10,2) NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `Date_Added` datetime NOT NULL DEFAULT current_timestamp(),
  `ingredient_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients_stockin`
--

INSERT INTO `ingredients_stockin` (`ing_stockInID`, `Quantity`, `ingredient_unit`, `cost_per_unit`, `TotalCost`, `Date_Added`, `ingredient_id`, `member_id`, `status`) VALUES
(10, '5.00', 'kg', '160.00', '800.00', '2019-10-12 20:37:46', 30, 6, 'active'),
(11, '450.00', 'kg', '0.56', '250.00', '2019-10-12 20:37:46', 31, 6, 'active'),
(12, '2.50', 'kg', '30.00', '75.00', '2019-10-12 20:37:46', 32, 6, 'active'),
(13, '1.00', 'kg', '460.00', '460.00', '2019-10-12 20:37:46', 33, 6, 'active'),
(14, '50.00', 'pcs', '7.00', '350.00', '2019-10-12 20:37:46', 34, 6, 'active'),
(15, '1.00', 'kg', '90.00', '90.00', '2019-10-12 20:37:46', 35, 6, 'active'),
(16, '1.00', 'kg', '60.00', '60.00', '2019-10-12 20:37:46', 36, 6, 'active'),
(17, '1.00', 'kg', '241.45', '241.45', '2019-10-12 20:37:46', 37, 6, 'active'),
(18, '20.00', 'kg', '49.75', '995.00', '2019-10-12 20:37:46', 38, 6, 'active'),
(19, '10.00', 'kg', '110.00', '1100.00', '2019-10-12 20:37:46', 39, 6, 'active'),
(20, '2.00', 'kg', '51.82', '103.64', '2019-10-12 20:37:46', 40, 6, 'active'),
(21, '1.50', 'l', '900.00', '1350.00', '2019-10-12 20:37:46', 41, 6, 'active'),
(22, '3.00', 'l', '43.75', '131.25', '2019-10-12 20:37:46', 42, 6, 'active'),
(23, '1.00', 'kg', '90.00', '90.00', '2019-10-12 20:37:46', 43, 6, 'active'),
(24, '2.50', 'kg', '30.00', '75.00', '2019-10-12 20:42:29', 32, 6, 'active'),
(25, '1.00', 'kg', '90.00', '90.00', '2019-10-12 20:42:29', 35, 6, 'active'),
(26, '1.00', 'kg', '60.00', '60.00', '2019-10-12 20:42:29', 36, 6, 'active'),
(27, '1.00', 'kg', '241.45', '241.45', '2019-10-12 20:42:29', 37, 6, 'active'),
(28, '10.00', 'kg', '110.00', '1100.00', '2019-10-12 20:42:29', 39, 6, 'active'),
(29, '1.50', 'l', '900.00', '1350.00', '2019-10-12 20:42:29', 41, 6, 'active'),
(30, '1.00', 'kg', '60.00', '60.00', '2019-10-12 20:43:09', 36, 6, 'active'),
(31, '1.00', 'kg', '241.45', '241.45', '2019-10-12 20:43:09', 37, 6, 'active'),
(32, '10.00', 'kg', '110.00', '1100.00', '2019-10-12 20:43:09', 39, 6, 'active'),
(33, '1.00', 'kg', '60.00', '60.00', '2019-10-12 20:45:01', 36, 6, 'active'),
(34, '1.00', 'kg', '241.45', '241.45', '2019-10-12 20:45:01', 37, 6, 'active'),
(35, '10.00', 'kg', '110.00', '1100.00', '2019-10-12 20:45:01', 39, 6, 'active'),
(36, '1.00', 'kg', '60.00', '60.00', '2019-10-12 20:45:15', 36, 6, 'active'),
(37, '10.00', 'kg', '110.00', '1100.00', '2019-10-12 20:45:15', 39, 6, 'active'),
(38, '2.50', 'kg', '30.00', '75.00', '2019-10-12 22:59:05', 32, 6, 'active'),
(39, '50.00', 'pcs', '7.00', '350.00', '2019-10-12 22:59:05', 34, 6, 'active'),
(40, '1.00', 'kg', '60.00', '60.00', '2019-10-12 22:59:05', 36, 6, 'active'),
(41, '1.00', 'kg', '241.45', '241.45', '2019-10-12 22:59:05', 37, 6, 'active'),
(42, '20.00', 'kg', '49.75', '995.00', '2019-10-12 22:59:05', 38, 6, 'active'),
(43, '10.00', 'kg', '110.00', '1100.00', '2019-10-12 22:59:05', 39, 6, 'active'),
(44, '1.50', 'l', '900.00', '1350.00', '2019-10-12 22:59:05', 41, 6, 'active'),
(45, '3.00', 'l', '43.75', '131.25', '2019-10-12 22:59:05', 42, 6, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_stockout`
--

CREATE TABLE `ingredients_stockout` (
  `ing_stockoutID` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `Quantity` decimal(10,2) NOT NULL,
  `ingredient_unit` varchar(30) NOT NULL,
  `type` varchar(11) NOT NULL,
  `Date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `Dish_ID` int(11) DEFAULT NULL,
  `ing_desc` varchar(100) NOT NULL,
  `member_id` int(11) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients_stockout`
--

INSERT INTO `ingredients_stockout` (`ing_stockoutID`, `ingredient_id`, `Quantity`, `ingredient_unit`, `type`, `Date_added`, `Dish_ID`, `ing_desc`, `member_id`, `status`) VALUES
(18, 37, '2.00', 'kg', 'NEW', '2019-10-12 22:55:36', 15, 'Hotdog Meal_10/12/2019 10:55 PM_10', 6, 'active'),
(19, 38, '3.00', 'kg', 'NEW', '2019-10-12 22:55:37', 15, 'Hotdog Meal_10/12/2019 10:55 PM_10', 6, 'active'),
(20, 41, '0.20', 'l', 'NEW', '2019-10-12 22:55:39', 15, 'Hotdog Meal_10/12/2019 10:55 PM_10', 6, 'active'),
(21, 36, '0.75', 'kg', 'NEW', '2019-10-12 22:56:37', 16, 'Tortang Talong_10/12/2019 10:56 PM_10', 6, 'active'),
(22, 34, '10.00', 'pcs', 'NEW', '2019-10-12 22:56:38', 16, 'Tortang Talong_10/12/2019 10:56 PM_10', 6, 'active'),
(23, 41, '0.10', 'l', 'NEW', '2019-10-12 22:56:38', 16, 'Tortang Talong_10/12/2019 10:56 PM_10', 6, 'active'),
(24, 32, '0.03', 'kg', 'NEW', '2019-10-12 22:56:39', 16, 'Tortang Talong_10/12/2019 10:56 PM_10', 6, 'active'),
(25, 33, '0.01', 'kg', 'NEW', '2019-10-12 22:56:39', 16, 'Tortang Talong_10/12/2019 10:56 PM_10', 6, 'active'),
(26, 30, '2.00', 'kg', 'NEW', '2019-10-12 22:56:58', 17, 'Grilled Pork Belly_10/12/2019 10:56 PM_10', 6, 'active'),
(27, 31, '0.10', 'kg', 'NEW', '2019-10-12 22:56:59', 17, 'Grilled Pork Belly_10/12/2019 10:56 PM_10', 6, 'active'),
(28, 32, '0.03', 'kg', 'NEW', '2019-10-12 22:56:59', 17, 'Grilled Pork Belly_10/12/2019 10:56 PM_10', 6, 'active'),
(29, 33, '0.01', 'kg', 'NEW', '2019-10-12 22:57:00', 17, 'Grilled Pork Belly_10/12/2019 10:56 PM_10', 6, 'active'),
(30, 42, '0.10', 'l', 'NEW', '2019-10-12 22:57:00', 17, 'Grilled Pork Belly_10/12/2019 10:56 PM_10', 6, 'active'),
(31, 34, '10.00', 'pcs', 'NEW', '2019-10-12 22:57:06', 18, 'Egg Meal_10/12/2019 10:57 PM_10', 6, 'active'),
(32, 41, '0.05', 'l', 'NEW', '2019-10-12 22:57:06', 18, 'Egg Meal_10/12/2019 10:57 PM_10', 6, 'active'),
(33, 38, '1.50', 'kg', 'NEW', '2019-10-12 22:57:06', 18, 'Egg Meal_10/12/2019 10:57 PM_10', 6, 'active'),
(34, 39, '1.50', 'kg', 'NEW', '2019-10-12 22:57:14', 19, 'Fried Chicken_10/12/2019 10:57 PM_10', 6, 'active'),
(35, 31, '0.10', 'kg', 'NEW', '2019-10-12 22:57:14', 19, 'Fried Chicken_10/12/2019 10:57 PM_10', 6, 'active'),
(36, 41, '0.20', 'l', 'NEW', '2019-10-12 22:57:14', 19, 'Fried Chicken_10/12/2019 10:57 PM_10', 6, 'active'),
(37, 38, '1.50', 'kg', 'NEW', '2019-10-12 22:57:14', 19, 'Fried Chicken_10/12/2019 10:57 PM_10', 6, 'active'),
(38, 33, '0.03', 'kg', 'NEW', '2019-10-12 22:57:15', 19, 'Fried Chicken_10/12/2019 10:57 PM_10', 6, 'active'),
(39, 37, '2.00', 'kg', 'NEW', '2019-10-12 23:01:50', 15, 'Hotdog Meal_10/12/2019 11:01 PM_10', 6, 'active'),
(40, 38, '3.00', 'kg', 'NEW', '2019-10-12 23:01:50', 15, 'Hotdog Meal_10/12/2019 11:01 PM_10', 6, 'active'),
(41, 41, '0.20', 'l', 'NEW', '2019-10-12 23:01:50', 15, 'Hotdog Meal_10/12/2019 11:01 PM_10', 6, 'active'),
(42, 36, '0.75', 'kg', 'NEW', '2019-10-12 23:02:00', 16, 'Tortang Talong_10/12/2019 11:02 PM_10', 6, 'active'),
(43, 34, '10.00', 'pcs', 'NEW', '2019-10-12 23:02:00', 16, 'Tortang Talong_10/12/2019 11:02 PM_10', 6, 'active'),
(44, 41, '0.10', 'l', 'NEW', '2019-10-12 23:02:00', 16, 'Tortang Talong_10/12/2019 11:02 PM_10', 6, 'active'),
(45, 32, '0.03', 'kg', 'NEW', '2019-10-12 23:02:00', 16, 'Tortang Talong_10/12/2019 11:02 PM_10', 6, 'active'),
(46, 33, '0.01', 'kg', 'NEW', '2019-10-12 23:02:00', 16, 'Tortang Talong_10/12/2019 11:02 PM_10', 6, 'active'),
(47, 30, '2.00', 'kg', 'NEW', '2019-10-12 23:02:13', 17, 'Grilled Pork Belly_10/12/2019 11:02 PM_10', 6, 'active'),
(48, 31, '0.10', 'kg', 'NEW', '2019-10-12 23:02:13', 17, 'Grilled Pork Belly_10/12/2019 11:02 PM_10', 6, 'active'),
(49, 32, '0.03', 'kg', 'NEW', '2019-10-12 23:02:13', 17, 'Grilled Pork Belly_10/12/2019 11:02 PM_10', 6, 'active'),
(50, 33, '0.01', 'kg', 'NEW', '2019-10-12 23:02:13', 17, 'Grilled Pork Belly_10/12/2019 11:02 PM_10', 6, 'active'),
(51, 42, '0.10', 'l', 'NEW', '2019-10-12 23:02:13', 17, 'Grilled Pork Belly_10/12/2019 11:02 PM_10', 6, 'active'),
(52, 34, '10.00', 'pcs', 'NEW', '2019-10-12 23:02:31', 18, 'Egg Meal_10/12/2019 11:02 PM_10', 6, 'active'),
(53, 41, '0.05', 'l', 'NEW', '2019-10-12 23:02:31', 18, 'Egg Meal_10/12/2019 11:02 PM_10', 6, 'active'),
(54, 38, '1.50', 'kg', 'NEW', '2019-10-12 23:02:31', 18, 'Egg Meal_10/12/2019 11:02 PM_10', 6, 'active'),
(55, 39, '1.50', 'kg', 'NEW', '2019-10-12 23:02:38', 19, 'Fried Chicken_10/12/2019 11:02 PM_10', 6, 'active'),
(56, 31, '0.10', 'kg', 'NEW', '2019-10-12 23:02:38', 19, 'Fried Chicken_10/12/2019 11:02 PM_10', 6, 'active'),
(57, 41, '0.20', 'l', 'NEW', '2019-10-12 23:02:38', 19, 'Fried Chicken_10/12/2019 11:02 PM_10', 6, 'active'),
(58, 38, '1.50', 'kg', 'NEW', '2019-10-12 23:02:38', 19, 'Fried Chicken_10/12/2019 11:02 PM_10', 6, 'active'),
(59, 33, '0.03', 'kg', 'NEW', '2019-10-12 23:02:38', 19, 'Fried Chicken_10/12/2019 11:02 PM_10', 6, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(11) NOT NULL,
  `ItemNum` int(11) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `ItemmPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderdish`
--

CREATE TABLE `orderdish` (
  `idorderdish` int(11) NOT NULL,
  `dish_Dish_ID` int(11) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `dateT` datetime NOT NULL,
  `orders_idorder` int(11) NOT NULL,
  `orders_user_member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdish`
--

INSERT INTO `orderdish` (`idorderdish`, `dish_Dish_ID`, `quantity`, `dateT`, `orders_idorder`, `orders_user_member_id`) VALUES
(1, 18, '2', '2019-10-13 01:16:50', 1, 4),
(2, 19, '1', '2019-10-13 01:16:50', 1, 4),
(3, 15, '1', '2019-10-13 01:16:50', 1, 4),
(4, 16, '1', '2019-10-13 01:17:27', 2, 4),
(5, 17, '3', '2019-10-13 01:17:27', 2, 4),
(6, 19, '1', '2019-10-13 01:17:37', 3, 4),
(7, 18, '2', '2019-10-13 01:18:03', 4, 3),
(8, 17, '1', '2019-10-13 01:18:17', 5, 3),
(9, 16, '1', '2019-10-13 01:18:17', 5, 3),
(10, 17, '4', '2019-10-13 01:18:28', 6, 3),
(11, 18, '1', '2019-10-13 01:19:18', 7, 2),
(12, 17, '1', '2019-10-13 01:19:18', 7, 2),
(13, 15, '1', '2019-10-13 01:19:18', 7, 2),
(14, 18, '1', '2019-10-13 01:19:18', 7, 2),
(15, 17, '1', '2019-10-13 01:19:35', 8, 2),
(16, 18, '1', '2019-10-13 01:19:36', 8, 2),
(17, 16, '2', '2019-10-13 01:19:49', 9, 2),
(18, 15, '1', '2019-10-13 01:19:49', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `idorder` int(11) NOT NULL,
  `total` varchar(100) NOT NULL,
  `dateT` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(25) NOT NULL,
  `user_member_id` int(11) NOT NULL,
  `cateredBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`idorder`, `total`, `dateT`, `status`, `user_member_id`, `cateredBy`) VALUES
(1, '165.0', '2019-10-13 01:16:49', 'COMPLETE', 4, 3),
(2, '265.0', '2019-10-13 01:17:26', 'COMPLETE', 4, 3),
(3, '75.0', '2019-10-13 01:17:37', 'CANCELLED', 4, 3),
(4, '60.0', '2019-10-13 01:18:03', 'COMPLETE', 3, 3),
(5, '115.0', '2019-10-13 01:18:16', 'CANCELLED', 3, 3),
(6, '300.0', '2019-10-13 01:18:28', 'COMPLETE', 3, 3),
(7, '165.0', '2019-10-13 01:19:18', 'COMPLETE', 2, 3),
(8, '105.0', '2019-10-13 01:19:35', 'PENDING', 2, NULL),
(9, '110.0', '2019-10-13 01:19:49', 'PENDING', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paymentreceipt`
--

CREATE TABLE `paymentreceipt` (
  `paymentID` int(11) NOT NULL,
  `dateT` datetime NOT NULL,
  `paymentamount` int(11) NOT NULL,
  `paymentcustomerid` int(11) NOT NULL,
  `staffID` int(200) NOT NULL,
  `paymentReceiptNumber` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymentreceipt`
--

INSERT INTO `paymentreceipt` (`paymentID`, `dateT`, `paymentamount`, `paymentcustomerid`, `staffID`, `paymentReceiptNumber`) VALUES
(1, '2019-10-12 12:44:44', 50, 1, 3, '1231313131'),
(2, '2019-10-13 16:11:53', 25, 3, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `Recipe_ID` int(11) NOT NULL,
  `Dish_ID` int(11) NOT NULL,
  `Ingredient_ID` int(11) NOT NULL,
  `Quantity` decimal(10,2) NOT NULL,
  `Unit` varchar(20) NOT NULL,
  `Servings` int(11) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`Recipe_ID`, `Dish_ID`, `Ingredient_ID`, `Quantity`, `Unit`, `Servings`, `status`) VALUES
(3, 15, 37, '2.00', 'kg', 10, 'inactive'),
(4, 15, 38, '3.00', 'kg', 10, 'inactive'),
(5, 15, 37, '2.00', 'kg', 10, 'active'),
(6, 15, 38, '3.00', 'kg', 10, 'active'),
(7, 15, 41, '200.00', 'ml', 10, 'active'),
(8, 16, 36, '750.00', 'g', 10, 'active'),
(9, 16, 34, '10.00', 'pcs', 10, 'active'),
(10, 16, 41, '100.00', 'ml', 10, 'active'),
(11, 16, 32, '30.00', 'g', 10, 'active'),
(12, 16, 33, '10.00', 'g', 10, 'active'),
(13, 17, 30, '2.00', 'kg', 10, 'active'),
(14, 17, 31, '100.00', 'g', 10, 'active'),
(15, 17, 32, '30.00', 'g', 10, 'active'),
(16, 17, 33, '10.00', 'g', 10, 'active'),
(17, 17, 42, '100.00', 'ml', 10, 'active'),
(18, 18, 34, '10.00', 'pcs', 10, 'active'),
(19, 18, 41, '50.00', 'ml', 10, 'active'),
(20, 18, 38, '1.50', 'kg', 10, 'active'),
(21, 19, 39, '1.50', 'kg', 10, 'active'),
(22, 19, 31, '100.00', 'g', 10, 'active'),
(23, 19, 41, '200.00', 'ml', 10, 'active'),
(24, 19, 38, '1.50', 'kg', 10, 'active'),
(25, 19, 33, '30.00', 'g', 10, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `transactionlogs`
--

CREATE TABLE `transactionlogs` (
  `logsID` int(11) NOT NULL,
  `orderName` varchar(200) NOT NULL,
  `amount` int(200) NOT NULL,
  `dateT` datetime NOT NULL,
  `user_member_id` int(200) NOT NULL,
  `cateredBy` int(200) NOT NULL,
  `logType` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactionlogs`
--

INSERT INTO `transactionlogs` (`logsID`, `orderName`, `amount`, `dateT`, `user_member_id`, `cateredBy`, `logType`) VALUES
(1, 'Requillo Adrian', 50, '2019-10-09 14:40:24', 3, 1, 'ORDER'),
(2, 'Barbon John', 100, '2019-10-09 14:38:00', 1, 3, 'ORDER'),
(3, 'Uy Anthony', 40, '2019-10-09 14:39:11', 2, 2, 'ORDER'),
(4, '', 50, '2019-10-12 12:44:44', 1, 3, 'PAYMENT'),
(5, 'Requillo Adrian', 50, '2019-10-09 14:40:24', 3, 3, 'ORDER'),
(6, 'Requillo Adrian', 75, '2019-10-12 12:50:00', 3, 3, 'ORDER'),
(7, '', 25, '2019-10-13 16:11:53', 3, 3, 'PAYMENT');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `member_type` varchar(15) NOT NULL,
  `username` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `status` varchar(15) NOT NULL,
  `last_login` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`member_id`, `first_name`, `last_name`, `member_type`, `username`, `password`, `status`, `last_login`) VALUES
(1, 'dodong', 'Laboriki', 'GROCER', 'grocerako', 'grocerako', 'active', ''),
(2, 'Barbz', 'Klauzer', 'COOK', 'cookako', 'cookako', 'active', ''),
(3, 'Gear', 'Clockworks', 'STAFF', 'Staffako', 'staffako', 'active', ''),
(4, 'Anthony', 'Uy', 'CUSTOMER', 'cust', 'cust', 'active', ''),
(5, 'anthony', 'uy', 'CUSTOMER', 'yes', 'yes', 'active', ''),
(6, 'Hello', 'World', 'ADMIN', 'admin', 'admin', 'active', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountbalance`
--
ALTER TABLE `accountbalance`
  ADD PRIMARY KEY (`accountID`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`balanceID`);

--
-- Indexes for table `customeraccount`
--
ALTER TABLE `customeraccount`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`Dish_ID`);

--
-- Indexes for table `dish_stockin`
--
ALTER TABLE `dish_stockin`
  ADD PRIMARY KEY (`dish_stockinID`),
  ADD KEY `Dish_ID` (`Dish_ID`),
  ADD KEY `Dish_AddedBy` (`Dish_AddedBy`);

--
-- Indexes for table `dish_stockout`
--
ALTER TABLE `dish_stockout`
  ADD PRIMARY KEY (`dish_stockoutID`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `ingredients_stockin`
--
ALTER TABLE `ingredients_stockin`
  ADD PRIMARY KEY (`ing_stockInID`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `ingredients_stockout`
--
ALTER TABLE `ingredients_stockout`
  ADD PRIMARY KEY (`ing_stockoutID`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `Dish_ID` (`Dish_ID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `orderdish`
--
ALTER TABLE `orderdish`
  ADD PRIMARY KEY (`idorderdish`,`dish_Dish_ID`,`orders_idorder`,`orders_user_member_id`),
  ADD KEY `fk_orderdish_dish1` (`dish_Dish_ID`),
  ADD KEY `fk_orderdish_orders1` (`orders_idorder`,`orders_user_member_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idorder`,`user_member_id`);

--
-- Indexes for table `paymentreceipt`
--
ALTER TABLE `paymentreceipt`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`Recipe_ID`),
  ADD KEY `Dish_ID` (`Dish_ID`),
  ADD KEY `Ingredient_ID` (`Ingredient_ID`);

--
-- Indexes for table `transactionlogs`
--
ALTER TABLE `transactionlogs`
  ADD PRIMARY KEY (`logsID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountbalance`
--
ALTER TABLE `accountbalance`
  MODIFY `accountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `balanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customeraccount`
--
ALTER TABLE `customeraccount`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `Dish_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `dish_stockin`
--
ALTER TABLE `dish_stockin`
  MODIFY `dish_stockinID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `dish_stockout`
--
ALTER TABLE `dish_stockout`
  MODIFY `dish_stockoutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `ingredients_stockin`
--
ALTER TABLE `ingredients_stockin`
  MODIFY `ing_stockInID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `ingredients_stockout`
--
ALTER TABLE `ingredients_stockout`
  MODIFY `ing_stockoutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdish`
--
ALTER TABLE `orderdish`
  MODIFY `idorderdish` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `idorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `paymentreceipt`
--
ALTER TABLE `paymentreceipt`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `Recipe_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transactionlogs`
--
ALTER TABLE `transactionlogs`
  MODIFY `logsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dish_stockin`
--
ALTER TABLE `dish_stockin`
  ADD CONSTRAINT `dish_stockin_ibfk_1` FOREIGN KEY (`Dish_ID`) REFERENCES `dish` (`Dish_ID`),
  ADD CONSTRAINT `dish_stockin_ibfk_2` FOREIGN KEY (`Dish_AddedBy`) REFERENCES `user` (`member_id`);

--
-- Constraints for table `ingredients_stockin`
--
ALTER TABLE `ingredients_stockin`
  ADD CONSTRAINT `ingredients_stockin_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`),
  ADD CONSTRAINT `ingredients_stockin_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `user` (`member_id`);

--
-- Constraints for table `ingredients_stockout`
--
ALTER TABLE `ingredients_stockout`
  ADD CONSTRAINT `ingredients_stockout_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`),
  ADD CONSTRAINT `ingredients_stockout_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `user` (`member_id`),
  ADD CONSTRAINT `ingredients_stockout_ibfk_3` FOREIGN KEY (`Dish_ID`) REFERENCES `dish` (`Dish_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

