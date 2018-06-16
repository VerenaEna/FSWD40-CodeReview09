-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Jun 2018 um 11:18
-- Server-Version: 10.1.32-MariaDB
-- PHP-Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_verena_carpella_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_changes`
--

CREATE TABLE `additional_changes` (
  `additional_ID` int(11) NOT NULL,
  `add_Type` varchar(55) DEFAULT NULL,
  `add_Price` int(11) DEFAULT NULL,
  `fk_add_Type_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additonal_charges_types`
--

CREATE TABLE `additonal_charges_types` (
  `type_ID` int(11) NOT NULL,
  `type_name` varchar(55) DEFAULT NULL,
  `type_price` int(11) DEFAULT NULL,
  `fk_additional_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bill`
--

CREATE TABLE `bill` (
  `bill_ID` int(11) NOT NULL,
  `final_bill_price` int(11) DEFAULT NULL,
  `fk_additional_ID` int(11) DEFAULT NULL,
  `fk_return_ID` int(11) DEFAULT NULL,
  `fk_driver_ID` int(11) DEFAULT NULL,
  `fk_invoice_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_ID` int(11) NOT NULL,
  `car_type` varchar(55) DEFAULT NULL,
  `car_color` varchar(55) DEFAULT NULL,
  `car_price` int(11) DEFAULT NULL,
  `fk_insurance_ID` int(11) DEFAULT NULL,
  `fk_model_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_model`
--

CREATE TABLE `car_model` (
  `model_ID` int(11) NOT NULL,
  `model_name` varchar(55) DEFAULT NULL,
  `model_no` int(11) DEFAULT NULL,
  `manufacture` varchar(55) DEFAULT NULL,
  `ZIP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `licence` int(11) DEFAULT NULL,
  `nationality` varchar(55) DEFAULT NULL,
  `fk_car_ID` int(11) DEFAULT NULL,
  `fk_bill_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `insurance_ID` int(11) NOT NULL,
  `insurance_price` int(11) DEFAULT NULL,
  `fk_insurance_company_ID` int(11) DEFAULT NULL,
  `fk_insurance_type_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance_company`
--

CREATE TABLE `insurance_company` (
  `company_ID` int(11) NOT NULL,
  `company_name` varchar(55) DEFAULT NULL,
  `company_address` varchar(55) DEFAULT NULL,
  `ZIP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance_type`
--

CREATE TABLE `insurance_type` (
  `insurance_type_ID` int(11) NOT NULL,
  `type_name` varchar(55) DEFAULT NULL,
  `insurance_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_ID` int(11) NOT NULL,
  `invoice_Date` date DEFAULT NULL,
  `invoice_price` int(11) DEFAULT NULL,
  `fk_driver_ID` int(11) DEFAULT NULL,
  `fk_location_ID` int(11) DEFAULT NULL,
  `fk_reservation_ID` int(11) DEFAULT NULL,
  `fk_additional_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_ID` int(11) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `fk_car_ID` int(11) DEFAULT NULL,
  `fk_driver_ID` int(11) DEFAULT NULL,
  `fk_location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `return_location`
--

CREATE TABLE `return_location` (
  `return_ID` int(11) NOT NULL,
  `return_Loc_name` varchar(55) DEFAULT NULL,
  `return_Loc_Address` varchar(255) DEFAULT NULL,
  `return_Loc_ZIP` int(11) DEFAULT NULL,
  `fk_car_ID` int(11) DEFAULT NULL,
  `fk_driver_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_location`
--

CREATE TABLE `start_location` (
  `location_ID` int(11) NOT NULL,
  `location_name` varchar(55) DEFAULT NULL,
  `location_address` varchar(255) DEFAULT NULL,
  `location_ZIP` int(11) DEFAULT NULL,
  `fk_car_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_changes`
--
ALTER TABLE `additional_changes`
  ADD PRIMARY KEY (`additional_ID`),
  ADD KEY `fk_add_Type_ID` (`fk_add_Type_ID`);

--
-- Indizes für die Tabelle `additonal_charges_types`
--
ALTER TABLE `additonal_charges_types`
  ADD PRIMARY KEY (`type_ID`),
  ADD KEY `fk_additional_ID` (`fk_additional_ID`);

--
-- Indizes für die Tabelle `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_ID`),
  ADD KEY `fk_additional_ID` (`fk_additional_ID`),
  ADD KEY `fk_return_ID` (`fk_return_ID`),
  ADD KEY `fk_driver_ID` (`fk_driver_ID`),
  ADD KEY `fk_invoice_ID` (`fk_invoice_ID`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_ID`),
  ADD KEY `fk_insurance_ID` (`fk_insurance_ID`),
  ADD KEY `fk_model_ID` (`fk_model_ID`);

--
-- Indizes für die Tabelle `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`model_ID`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_car_ID` (`fk_car_ID`),
  ADD KEY `fk_bill_ID` (`fk_bill_ID`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_ID`),
  ADD KEY `fk_insurance_company_ID` (`fk_insurance_company_ID`),
  ADD KEY `fk_insurance_type_ID` (`fk_insurance_type_ID`);

--
-- Indizes für die Tabelle `insurance_company`
--
ALTER TABLE `insurance_company`
  ADD PRIMARY KEY (`company_ID`);

--
-- Indizes für die Tabelle `insurance_type`
--
ALTER TABLE `insurance_type`
  ADD PRIMARY KEY (`insurance_type_ID`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_ID`),
  ADD KEY `fk_driver_ID` (`fk_driver_ID`),
  ADD KEY `fk_location_ID` (`fk_location_ID`),
  ADD KEY `fk_reservation_ID` (`fk_reservation_ID`),
  ADD KEY `fk_additional_ID` (`fk_additional_ID`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_ID`),
  ADD KEY `fk_car_ID` (`fk_car_ID`),
  ADD KEY `fk_driver_ID` (`fk_driver_ID`),
  ADD KEY `fk_location_ID` (`fk_location_ID`);

--
-- Indizes für die Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_ID`),
  ADD KEY `fk_car_ID` (`fk_car_ID`),
  ADD KEY `fk_driver_ID` (`fk_driver_ID`);

--
-- Indizes für die Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`location_ID`),
  ADD KEY `fk_car_ID` (`fk_car_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additional_changes`
--
ALTER TABLE `additional_changes`
  ADD CONSTRAINT `additional_changes_ibfk_1` FOREIGN KEY (`fk_add_Type_ID`) REFERENCES `additonal_charges_types` (`type_ID`);

--
-- Constraints der Tabelle `additonal_charges_types`
--
ALTER TABLE `additonal_charges_types`
  ADD CONSTRAINT `additonal_charges_types_ibfk_1` FOREIGN KEY (`fk_additional_ID`) REFERENCES `additional_changes` (`additional_ID`);

--
-- Constraints der Tabelle `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`fk_additional_ID`) REFERENCES `additional_changes` (`additional_ID`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`fk_return_ID`) REFERENCES `return_location` (`return_ID`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`fk_driver_ID`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `bill_ibfk_4` FOREIGN KEY (`fk_invoice_ID`) REFERENCES `invoice` (`invoice_ID`),
  ADD CONSTRAINT `bill_ibfk_5` FOREIGN KEY (`fk_invoice_ID`) REFERENCES `invoice` (`invoice_ID`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_insurance_ID`) REFERENCES `insurance` (`insurance_ID`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_model_ID`) REFERENCES `car_model` (`model_ID`);

--
-- Constraints der Tabelle `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_car_ID`) REFERENCES `car` (`car_ID`),
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`fk_bill_ID`) REFERENCES `bill` (`bill_ID`);

--
-- Constraints der Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`fk_insurance_company_ID`) REFERENCES `insurance_company` (`company_ID`),
  ADD CONSTRAINT `insurance_ibfk_2` FOREIGN KEY (`fk_insurance_type_ID`) REFERENCES `insurance_type` (`insurance_type_ID`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_driver_ID`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_location_ID`) REFERENCES `start_location` (`location_ID`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_reservation_ID`) REFERENCES `reservation` (`reservation_ID`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fk_additional_ID`) REFERENCES `additional_changes` (`additional_ID`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_car_ID`) REFERENCES `car` (`car_ID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_driver_ID`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_location_ID`) REFERENCES `start_location` (`location_ID`);

--
-- Constraints der Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD CONSTRAINT `return_location_ibfk_1` FOREIGN KEY (`fk_car_ID`) REFERENCES `car` (`car_ID`),
  ADD CONSTRAINT `return_location_ibfk_2` FOREIGN KEY (`fk_driver_ID`) REFERENCES `driver` (`driver_id`);

--
-- Constraints der Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD CONSTRAINT `start_location_ibfk_1` FOREIGN KEY (`fk_car_ID`) REFERENCES `car` (`car_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
