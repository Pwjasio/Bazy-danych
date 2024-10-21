-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 07, 2024 at 02:35 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cw03`
--
CREATE DATABASE IF NOT EXISTS `cw03` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cw03`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele`
--

CREATE TABLE `nauczyciele` (
  `NauczycielID` int(11) NOT NULL,
  `NazwiskoImie` varchar(40) NOT NULL,
  `Wyksztalcenie` varchar(60) NOT NULL,
  `StazPracy` int(11) NOT NULL,
  `Telefon` varchar(40) NOT NULL,
  `Mail` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nauczyciele`
--

INSERT INTO `nauczyciele` (`NauczycielID`, `NazwiskoImie`, `Wyksztalcenie`, `StazPracy`, `Telefon`, `Mail`) VALUES
(1, 'Komański Zygmunt', 'Wyższe', 10, '123456789', 'fajnymail@gmail.com'),
(2, 'Gendera Aneta', 'Wyższe', 20, '672076123', 'anetagendera@gmail.com'),
(3, 'Zygmunt Izabela', 'Wyższe', 15, '729071272', 'izabekazygmunt@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `OcenyID` int(11) NOT NULL,
  `UczenID` int(11) NOT NULL,
  `PrzedmiotID` int(11) NOT NULL,
  `NauczycielID` int(11) NOT NULL,
  `OcenyDefID` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Godzina` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oceny`
--

INSERT INTO `oceny` (`OcenyID`, `UczenID`, `PrzedmiotID`, `NauczycielID`, `OcenyDefID`, `Data`, `Godzina`) VALUES
(1, 1, 3, 2, 1, '2024-10-06', '10:22:20'),
(2, 2, 2, 3, 2, '2024-10-05', '12:00:00'),
(3, 3, 1, 1, 3, '2024-10-07', '13:24:18');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ocenydefinicje`
--

CREATE TABLE `ocenydefinicje` (
  `OcenaDefID` int(11) NOT NULL,
  `NazwaPelna` varchar(60) NOT NULL,
  `NazwaSkrot` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ocenydefinicje`
--

INSERT INTO `ocenydefinicje` (`OcenaDefID`, `NazwaPelna`, `NazwaSkrot`) VALUES
(1, 'Niedostateczny', 'NDST'),
(2, 'Dopuszczający', 'DOP'),
(3, 'Dostateczny', 'DST'),
(4, 'Dobry', 'DB'),
(5, 'Bardzo Dobry', 'BDB'),
(6, 'Celujący', 'CEL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `PrzedmiotID` int(11) NOT NULL,
  `NazwaPelna` varchar(60) NOT NULL,
  `NazwaSkot` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`PrzedmiotID`, `NazwaPelna`, `NazwaSkot`) VALUES
(1, 'Tworzenie i administrowanie bazami danych', 'TiA_DB_prac'),
(2, 'Matematyka', 'Mat'),
(3, 'Biologia', 'Biol');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `UczenID` int(11) NOT NULL,
  `NazwiskoImie` varchar(40) NOT NULL,
  `DataUr` date NOT NULL,
  `MiejsceUr` varchar(40) NOT NULL,
  `Kod` char(6) NOT NULL,
  `Miejscowosc` varchar(50) NOT NULL,
  `UlicaNr` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`UczenID`, `NazwiskoImie`, `DataUr`, `MiejsceUr`, `Kod`, `Miejscowosc`, `UlicaNr`) VALUES
(1, 'Mrówczyński Jan', '2007-01-09', 'Zielona Góra', '65-273', 'Zielona Góra', 'Braniborska 28'),
(2, 'Nikodem Kajetan', '2006-06-21', 'Rzepin', '69-110', 'Rzepin', 'Bolesława'),
(3, 'Nowak Kuba', '2006-07-13', 'Zielona Góra', '65-267', 'Zielona Góra', 'Niepodległości');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `nauczyciele`
--
ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`NauczycielID`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`OcenyID`),
  ADD KEY `NauczycielID` (`NauczycielID`),
  ADD KEY `OcenyDefID` (`OcenyDefID`),
  ADD KEY `PrzedmiotID` (`PrzedmiotID`),
  ADD KEY `UczenID` (`UczenID`);

--
-- Indeksy dla tabeli `ocenydefinicje`
--
ALTER TABLE `ocenydefinicje`
  ADD PRIMARY KEY (`OcenaDefID`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`PrzedmiotID`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`UczenID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nauczyciele`
--
ALTER TABLE `nauczyciele`
  MODIFY `NauczycielID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `OcenyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ocenydefinicje`
--
ALTER TABLE `ocenydefinicje`
  MODIFY `OcenaDefID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `PrzedmiotID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `UczenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`NauczycielID`) REFERENCES `nauczyciele` (`NauczycielID`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`OcenyDefID`) REFERENCES `ocenydefinicje` (`OcenaDefID`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`PrzedmiotID`) REFERENCES `przedmioty` (`PrzedmiotID`),
  ADD CONSTRAINT `oceny_ibfk_4` FOREIGN KEY (`UczenID`) REFERENCES `uczniowie` (`UczenID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
