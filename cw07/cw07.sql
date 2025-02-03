-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Lut 2025, 14:44
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cw07`
--
CREATE DATABASE IF NOT EXISTS `cw07` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cw07`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa`
--

CREATE TABLE `klasa` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `klasa`
--

INSERT INTO `klasa` (`id`, `nazwa`) VALUES
(1, '4Ta'),
(2, '4Tb');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(16) NOT NULL,
  `nazwa_skr` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`id`, `nazwa`, `nazwa_skr`) VALUES
(1, 'niedostateczny', 'ndst'),
(2, 'dopuszczajacy', 'dop'),
(3, 'dostateczny', 'dst'),
(4, 'dobry', 'db'),
(5, 'bardzo dobry', 'bdb'),
(6, 'celujacy', 'cel');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekun`
--

CREATE TABLE `opiekun` (
  `id` int(11) NOT NULL,
  `imie` varchar(128) NOT NULL,
  `nazwisko` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `opiekun`
--

INSERT INTO `opiekun` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Mama', 'Mamowa'),
(2, 'Tata', 'Tatowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekun_uczen`
--

CREATE TABLE `opiekun_uczen` (
  `id_uczen` int(11) NOT NULL,
  `id_opiekun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `opiekun_uczen`
--

INSERT INTO `opiekun_uczen` (`id_uczen`, `id_opiekun`) VALUES
(5, 2),
(6, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `przedmioty`
--

INSERT INTO `przedmioty` (`id`, `nazwa`) VALUES
(1, 'Matematy'),
(2, 'Geografia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen`
--

CREATE TABLE `uczen` (
  `id` int(11) NOT NULL,
  `imie` varchar(128) NOT NULL,
  `nazwisko` varchar(128) NOT NULL,
  `id_klasa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `uczen`
--

INSERT INTO `uczen` (`id`, `imie`, `nazwisko`, `id_klasa`) VALUES
(5, 'Jan', 'Mrówczyński', 1),
(6, 'Kajetan', 'Nikodem', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen_przedmiot_ocena`
--

CREATE TABLE `uczen_przedmiot_ocena` (
  `id` int(11) NOT NULL,
  `id_uczen` int(11) NOT NULL,
  `id_ocena` int(11) NOT NULL,
  `id_przedmiot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `uczen_przedmiot_ocena`
--

INSERT INTO `uczen_przedmiot_ocena` (`id`, `id_uczen`, `id_ocena`, `id_przedmiot`) VALUES
(1, 5, 6, 1),
(2, 6, 4, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klasa`
--
ALTER TABLE `klasa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `opiekun`
--
ALTER TABLE `opiekun`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `opiekun_uczen`
--
ALTER TABLE `opiekun_uczen`
  ADD KEY `id_opiekun` (`id_opiekun`),
  ADD KEY `id_uczen` (`id_uczen`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasa` (`id_klasa`);

--
-- Indeksy dla tabeli `uczen_przedmiot_ocena`
--
ALTER TABLE `uczen_przedmiot_ocena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ocena` (`id_ocena`),
  ADD KEY `id_przedmiot` (`id_przedmiot`),
  ADD KEY `id_uczen` (`id_uczen`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klasa`
--
ALTER TABLE `klasa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `opiekun`
--
ALTER TABLE `opiekun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `uczen`
--
ALTER TABLE `uczen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `uczen_przedmiot_ocena`
--
ALTER TABLE `uczen_przedmiot_ocena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `opiekun_uczen`
--
ALTER TABLE `opiekun_uczen`
  ADD CONSTRAINT `opiekun_uczen_ibfk_1` FOREIGN KEY (`id_opiekun`) REFERENCES `opiekun` (`id`),
  ADD CONSTRAINT `opiekun_uczen_ibfk_2` FOREIGN KEY (`id_uczen`) REFERENCES `uczen` (`id`);

--
-- Ograniczenia dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD CONSTRAINT `uczen_ibfk_1` FOREIGN KEY (`id_klasa`) REFERENCES `klasa` (`id`);

--
-- Ograniczenia dla tabeli `uczen_przedmiot_ocena`
--
ALTER TABLE `uczen_przedmiot_ocena`
  ADD CONSTRAINT `uczen_przedmiot_ocena_ibfk_1` FOREIGN KEY (`id_ocena`) REFERENCES `oceny` (`id`),
  ADD CONSTRAINT `uczen_przedmiot_ocena_ibfk_2` FOREIGN KEY (`id_przedmiot`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `uczen_przedmiot_ocena_ibfk_3` FOREIGN KEY (`id_uczen`) REFERENCES `uczen` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
