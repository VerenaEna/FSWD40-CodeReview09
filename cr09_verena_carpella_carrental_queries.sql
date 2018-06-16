-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Jun 2018 um 15:24
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
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_ID` int(11) NOT NULL,
  `car_color` varchar(55) DEFAULT NULL,
  `car_price` int(11) DEFAULT NULL,
  `fk_insurance_ID` int(11) DEFAULT NULL,
  `fk_model_ID` int(11) DEFAULT NULL,
  `fk_car_type_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_type_ID`, `name`) VALUES
(1, 'SUV'),
(2, 'Concept Car');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_ID`),
  ADD KEY `fk_insurance_ID` (`fk_insurance_ID`),
  ADD KEY `fk_model_ID` (`fk_model_ID`),
  ADD KEY `fk_car_type_ID` (`fk_car_type_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_insurance_ID`) REFERENCES `insurance` (`insurance_ID`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_model_ID`) REFERENCES `car_model` (`model_ID`),
  ADD CONSTRAINT `car_ibfk_3` FOREIGN KEY (`fk_car_type_ID`) REFERENCES `car_type` (`car_type_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
