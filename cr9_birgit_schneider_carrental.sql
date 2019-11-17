-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Nov 2019 um 22:07
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr9_birgit_schneider_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additionalcharge`
--

CREATE TABLE `additionalcharge` (
  `additionalChargeID` int(11) NOT NULL,
  `carID` int(11) NOT NULL,
  `gasoline` int(11) DEFAULT NULL,
  `damage` varchar(255) DEFAULT NULL,
  `km` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additionalcharge`
--

INSERT INTO `additionalcharge` (`additionalChargeID`, `carID`, `gasoline`, `damage`, `km`) VALUES
(1, 1, NULL, NULL, 60),
(2, 5, 70, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additionalpayment`
--

CREATE TABLE `additionalpayment` (
  `addpaymentID` int(11) NOT NULL,
  `additionalChargeID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additionalpayment`
--

INSERT INTO `additionalpayment` (`addpaymentID`, `additionalChargeID`, `customerID`, `paymentDate`, `price`) VALUES
(1, 1, 3, '2019-11-23', 45),
(2, 2, 4, '2019-11-29', 90);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adress`
--

CREATE TABLE `adress` (
  `adressID` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `houseNumber` int(11) NOT NULL,
  `postcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `adress`
--

INSERT INTO `adress` (`adressID`, `street`, `houseNumber`, `postcode`) VALUES
(1, 'Neustiftgasse', 28, 1070),
(2, 'Halbrittergasse', 10, 1230),
(3, 'Burgring', 55, 1010),
(4, 'Wiener Straße', 123, 2380),
(5, 'Grazer Straße', 36, 8010),
(6, 'Am Flußufer', 2, 5020),
(7, 'Linzer Straße', 223, 4020);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `bookingId` int(11) NOT NULL,
  `carId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `bookingStartID` int(11) NOT NULL,
  `bookingEndID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`bookingId`, `carId`, `customerId`, `bookingStartID`, `bookingEndID`) VALUES
(1, 1, 3, 1, 1),
(2, 1, 2, 2, 2),
(3, 2, 1, 3, 3),
(4, 5, 3, 4, 4),
(5, 4, 4, 5, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookingend`
--

CREATE TABLE `bookingend` (
  `bookingEndID` int(11) NOT NULL,
  `endLocation` int(11) NOT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bookingend`
--

INSERT INTO `bookingend` (`bookingEndID`, `endLocation`, `endDate`) VALUES
(1, 3, '2019-11-23'),
(2, 1, '2019-12-03'),
(3, 1, '2019-11-19'),
(4, 4, '2019-12-31'),
(5, 2, '2019-11-29');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookingpayment`
--

CREATE TABLE `bookingpayment` (
  `paymentID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `price` float DEFAULT NULL,
  `ccID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bookingpayment`
--

INSERT INTO `bookingpayment` (`paymentID`, `customerID`, `paymentDate`, `price`, `ccID`) VALUES
(1, 3, '2019-11-15', 590, 1),
(2, 2, '2019-11-05', 490, 3),
(3, 1, '2019-11-05', 690, 4),
(4, 3, '2019-11-16', 740, 5),
(5, 4, '2019-11-14', 470, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookingstart`
--

CREATE TABLE `bookingstart` (
  `bookingStartID` int(11) NOT NULL,
  `startLocation` int(11) NOT NULL,
  `startDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bookingstart`
--

INSERT INTO `bookingstart` (`bookingStartID`, `startLocation`, `startDate`) VALUES
(1, 3, '2019-11-17'),
(2, 3, '2019-11-26'),
(3, 1, '2019-11-12'),
(4, 2, '2019-12-24'),
(5, 4, '2019-11-21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `carID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `purchaseDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`carID`, `name`, `purchaseDate`) VALUES
(1, 'Audi A4', '2018-07-19'),
(2, 'Mercedes EQC', '2018-12-10'),
(3, 'Mercedes GLE', '2018-09-13'),
(4, 'Opel Corsa', '2019-07-17'),
(5, 'Opel Astra', '2017-11-14');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carlocated`
--

CREATE TABLE `carlocated` (
  `carLocatedID` int(11) NOT NULL,
  `carID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `carlocated`
--

INSERT INTO `carlocated` (`carLocatedID`, `carID`, `locationID`, `fromDate`, `toDate`) VALUES
(1, 1, 3, '2019-11-15', '2019-11-17'),
(2, 1, 3, '2019-11-23', '2019-11-26'),
(3, 2, 1, '2019-11-10', '2019-11-12'),
(4, 2, 1, '2019-11-19', '2019-11-22'),
(5, 5, 2, '2019-12-22', '2019-11-24'),
(6, 5, 4, '2019-12-31', '2020-01-02'),
(7, 4, 4, '2019-11-20', '2019-11-21'),
(8, 4, 2, '2019-11-29', '2019-12-02'),
(9, 3, 1, '2019-11-16', '2019-11-20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carlocation`
--

CREATE TABLE `carlocation` (
  `locationID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `adressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `carlocation`
--

INSERT INTO `carlocation` (`locationID`, `name`, `adressID`) VALUES
(1, 'Wien', 3),
(2, 'Graz', 5),
(3, 'Salzburg', 6),
(4, 'Linz', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `creditcard`
--

CREATE TABLE `creditcard` (
  `expiryDate` date DEFAULT NULL,
  `ccNumber` bigint(20) NOT NULL,
  `ccID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `creditcard`
--

INSERT INTO `creditcard` (`expiryDate`, `ccNumber`, `ccID`) VALUES
('2020-11-01', 1234567890987, 1),
('2021-09-01', 909876543212, 3),
('2022-04-01', 6789098765432, 4),
('2020-06-01', 9067455322134, 5),
('2020-06-01', 9067455322134, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(55) DEFAULT NULL,
  `surname` varchar(55) NOT NULL,
  `adressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customerID`, `firstName`, `surname`, `adressID`) VALUES
(1, 'Birgit', 'Schneider', 1),
(2, 'Susi', 'Sorglos', 2),
(3, 'Hans', 'Albers', 4),
(4, 'Peter', 'Faust', 6),
(5, 'Tina', 'Turner', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `postcode`
--

CREATE TABLE `postcode` (
  `postcode` int(11) NOT NULL,
  `city` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `postcode`
--

INSERT INTO `postcode` (`postcode`, `city`) VALUES
(1010, 'Wien'),
(1070, 'Wien'),
(1230, 'Wien'),
(2380, 'Perchtoldsdorf'),
(4020, 'Linz'),
(5020, 'Salzburg'),
(8010, 'Graz');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additionalcharge`
--
ALTER TABLE `additionalcharge`
  ADD PRIMARY KEY (`additionalChargeID`),
  ADD KEY `carID` (`carID`);

--
-- Indizes für die Tabelle `additionalpayment`
--
ALTER TABLE `additionalpayment`
  ADD PRIMARY KEY (`addpaymentID`),
  ADD KEY `additionalChargeID` (`additionalChargeID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indizes für die Tabelle `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adressID`),
  ADD KEY `postcode` (`postcode`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingId`),
  ADD KEY `carId` (`carId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `booking_ibfk_3` (`bookingStartID`),
  ADD KEY `booking_ibfk_4` (`bookingEndID`);

--
-- Indizes für die Tabelle `bookingend`
--
ALTER TABLE `bookingend`
  ADD PRIMARY KEY (`bookingEndID`),
  ADD KEY `locationEND` (`endLocation`);

--
-- Indizes für die Tabelle `bookingpayment`
--
ALTER TABLE `bookingpayment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `ccID` (`ccID`);

--
-- Indizes für die Tabelle `bookingstart`
--
ALTER TABLE `bookingstart`
  ADD PRIMARY KEY (`bookingStartID`),
  ADD KEY `locationStart` (`startLocation`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carID`);

--
-- Indizes für die Tabelle `carlocated`
--
ALTER TABLE `carlocated`
  ADD PRIMARY KEY (`carLocatedID`),
  ADD KEY `carID` (`carID`),
  ADD KEY `locationID` (`locationID`);

--
-- Indizes für die Tabelle `carlocation`
--
ALTER TABLE `carlocation`
  ADD PRIMARY KEY (`locationID`),
  ADD KEY `adressID` (`adressID`);

--
-- Indizes für die Tabelle `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`ccID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `adressID` (`adressID`);

--
-- Indizes für die Tabelle `postcode`
--
ALTER TABLE `postcode`
  ADD PRIMARY KEY (`postcode`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `bookingpayment`
--
ALTER TABLE `bookingpayment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `ccID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additionalcharge`
--
ALTER TABLE `additionalcharge`
  ADD CONSTRAINT `additionalcharge_ibfk_1` FOREIGN KEY (`carID`) REFERENCES `car` (`carID`);

--
-- Constraints der Tabelle `additionalpayment`
--
ALTER TABLE `additionalpayment`
  ADD CONSTRAINT `additionalpayment_ibfk_1` FOREIGN KEY (`additionalChargeID`) REFERENCES `additionalcharge` (`additionalChargeID`),
  ADD CONSTRAINT `additionalpayment_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);

--
-- Constraints der Tabelle `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`postcode`) REFERENCES `postcode` (`postcode`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `car` (`carID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`bookingStartID`) REFERENCES `bookingstart` (`bookingStartID`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`bookingEndID`) REFERENCES `bookingend` (`bookingEndID`);

--
-- Constraints der Tabelle `bookingend`
--
ALTER TABLE `bookingend`
  ADD CONSTRAINT `bookingend_ibfk_1` FOREIGN KEY (`endLocation`) REFERENCES `carlocation` (`locationID`);

--
-- Constraints der Tabelle `bookingpayment`
--
ALTER TABLE `bookingpayment`
  ADD CONSTRAINT `bookingpayment_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `bookingpayment_ibfk_2` FOREIGN KEY (`ccID`) REFERENCES `creditcard` (`ccID`);

--
-- Constraints der Tabelle `bookingstart`
--
ALTER TABLE `bookingstart`
  ADD CONSTRAINT `bookingstart_ibfk_1` FOREIGN KEY (`startLocation`) REFERENCES `carlocation` (`locationID`);

--
-- Constraints der Tabelle `carlocated`
--
ALTER TABLE `carlocated`
  ADD CONSTRAINT `carlocated_ibfk_1` FOREIGN KEY (`carID`) REFERENCES `car` (`carID`),
  ADD CONSTRAINT `carlocated_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `carlocation` (`locationID`);

--
-- Constraints der Tabelle `carlocation`
--
ALTER TABLE `carlocation`
  ADD CONSTRAINT `carlocation_ibfk_1` FOREIGN KEY (`adressID`) REFERENCES `adress` (`adressID`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`adressID`) REFERENCES `adress` (`adressID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
