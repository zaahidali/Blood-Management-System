-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2018 at 09:14 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `blooddonortable`
--

CREATE TABLE `blooddonortable` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `BloodGroup` varchar(10) NOT NULL,
  `EID` varchar(50) NOT NULL,
  `QTY` int(11) NOT NULL,
  `Amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blooddonortable`
--

INSERT INTO `blooddonortable` (`Id`, `Name`, `Gender`, `Address`, `Date`, `BloodGroup`, `EID`, `QTY`, `Amount`) VALUES
(1, 'arnold', 'Male', 'xyz xyz xyz', '2018-09-06', 'O +ve', '223', 3, 200);

-- --------------------------------------------------------

--
-- Table structure for table `doctortable`
--

CREATE TABLE `doctortable` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `CONTACT` varchar(30) NOT NULL,
  `Address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctortable`
--

INSERT INTO `doctortable` (`Id`, `Name`, `CONTACT`, `Address`) VALUES
(1, 'dr.smith', '87687687687', 'xyz xyz xyz');

-- --------------------------------------------------------

--
-- Table structure for table `emptable`
--

CREATE TABLE `emptable` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `EID` int(11) NOT NULL,
  `CONTACT` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emptable`
--

INSERT INTO `emptable` (`Id`, `Name`, `EID`, `CONTACT`) VALUES
(1, 'johnny', 223, '234234');

-- --------------------------------------------------------

--
-- Table structure for table `inventorytable`
--

CREATE TABLE `inventorytable` (
  `Id` int(11) NOT NULL,
  `BloodGroup` varchar(30) NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventorytable`
--

INSERT INTO `inventorytable` (`Id`, `BloodGroup`, `Qty`) VALUES
(1, 'O +ve', 3),
(2, 'A +ve', 0);

-- --------------------------------------------------------

--
-- Table structure for table `recievertable`
--

CREATE TABLE `recievertable` (
  `Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(35) NOT NULL,
  `BloodGroup` varchar(10) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `DoctorName` varchar(30) NOT NULL,
  `EID` int(11) NOT NULL,
  `AMount` int(11) NOT NULL,
  `QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recievertable`
--

INSERT INTO `recievertable` (`Id`, `Date`, `Name`, `BloodGroup`, `Gender`, `Contact`, `DoctorName`, `EID`, `AMount`, `QTY`) VALUES
(1, '2018-09-06', 'mark', 'A +ve', 'Male', '1212312312', 'dr.smith', 223, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactiontable`
--

CREATE TABLE `transactiontable` (
  `Id` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `EName` varchar(30) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `TYP` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blooddonortable`
--
ALTER TABLE `blooddonortable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `doctortable`
--
ALTER TABLE `doctortable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `emptable`
--
ALTER TABLE `emptable`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EID` (`EID`);

--
-- Indexes for table `inventorytable`
--
ALTER TABLE `inventorytable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `recievertable`
--
ALTER TABLE `recievertable`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EID` (`EID`),
  ADD KEY `par_Tind` (`EID`);

--
-- Indexes for table `transactiontable`
--
ALTER TABLE `transactiontable`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blooddonortable`
--
ALTER TABLE `blooddonortable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctortable`
--
ALTER TABLE `doctortable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emptable`
--
ALTER TABLE `emptable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventorytable`
--
ALTER TABLE `inventorytable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recievertable`
--
ALTER TABLE `recievertable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactiontable`
--
ALTER TABLE `transactiontable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recievertable`
--
ALTER TABLE `recievertable`
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`EID`) REFERENCES `emptable` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
