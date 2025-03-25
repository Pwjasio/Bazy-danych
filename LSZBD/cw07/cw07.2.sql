-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Lut 2025, 15:16
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
  `nazwa` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`id`, `nazwa`) VALUES
(1, 'niedostateczny'),
(2, 'dopuszczajacy'),
(3, 'dostateczny'),
(4, 'dobry'),
(5, 'bardzo dobry'),
(6, 'celujacy');

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
(5, 8),
(6, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoba`
--

CREATE TABLE `osoba` (
  `id` int(11) NOT NULL,
  `imie` varchar(128) NOT NULL,
  `nazwisko` varchar(128) NOT NULL,
  `typ` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `osoba`
--

INSERT INTO `osoba` (`id`, `imie`, `nazwisko`, `typ`) VALUES
(5, 'Jan', 'Mrówczyński', 'u'),
(6, 'Kajetan', 'Nikodem', 'u'),
(7, 'Nuczyciel', 'Fajny', 'n'),
(8, 'Rodzic', 'Niefajny', 'r');

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
-- Struktura tabeli dla tabeli `uczen_klasa`
--

CREATE TABLE `uczen_klasa` (
  `id_uczen` int(11) NOT NULL,
  `id_klasa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `uczen_klasa`
--

INSERT INTO `uczen_klasa` (`id_uczen`, `id_klasa`) VALUES
(5, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen_przedmiot_ocena_nauczyciel`
--

CREATE TABLE `uczen_przedmiot_ocena_nauczyciel` (
  `id` int(11) NOT NULL,
  `id_uczen` int(11) NOT NULL,
  `id_ocena` int(11) NOT NULL,
  `id_przedmiot` int(11) NOT NULL,
  `id_nauczyciel` int(11) NOT NULL,
  `czas` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `uczen_przedmiot_ocena_nauczyciel`
--

INSERT INTO `uczen_przedmiot_ocena_nauczyciel` (`id`, `id_uczen`, `id_ocena`, `id_przedmiot`, `id_nauczyciel`, `czas`) VALUES
(1, 5, 6, 1, 7, '2025-02-03 14:06:47'),
(2, 6, 4, 2, 7, '2025-02-03 14:06:47');

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
-- Indeksy dla tabeli `opiekun_uczen`
--
ALTER TABLE `opiekun_uczen`
  ADD KEY `id_opiekun` (`id_opiekun`),
  ADD KEY `id_uczen` (`id_uczen`);

--
-- Indeksy dla tabeli `osoba`
--
ALTER TABLE `osoba`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uczen_klasa`
--
ALTER TABLE `uczen_klasa`
  ADD PRIMARY KEY (`id_uczen`),
  ADD KEY `id_klasa` (`id_klasa`);

--
-- Indeksy dla tabeli `uczen_przedmiot_ocena_nauczyciel`
--
ALTER TABLE `uczen_przedmiot_ocena_nauczyciel`
  ADD KEY `id_ocena` (`id_ocena`),
  ADD KEY `id_przedmiot` (`id_przedmiot`),
  ADD KEY `id_uczen` (`id_uczen`),
  ADD KEY `id_nauczyciel` (`id_nauczyciel`);

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
-- AUTO_INCREMENT dla tabeli `osoba`
--
ALTER TABLE `osoba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `opiekun_uczen`
--
ALTER TABLE `opiekun_uczen`
  ADD CONSTRAINT `opiekun_uczen_ibfk_1` FOREIGN KEY (`id_opiekun`) REFERENCES `osoba` (`id`),
  ADD CONSTRAINT `opiekun_uczen_ibfk_2` FOREIGN KEY (`id_uczen`) REFERENCES `osoba` (`id`);

--
-- Ograniczenia dla tabeli `uczen_klasa`
--
ALTER TABLE `uczen_klasa`
  ADD CONSTRAINT `uczen_klasa_ibfk_1` FOREIGN KEY (`id_klasa`) REFERENCES `klasa` (`id`),
  ADD CONSTRAINT `uczen_klasa_ibfk_2` FOREIGN KEY (`id_uczen`) REFERENCES `osoba` (`id`);

--
-- Ograniczenia dla tabeli `uczen_przedmiot_ocena_nauczyciel`
--
ALTER TABLE `uczen_przedmiot_ocena_nauczyciel`
  ADD CONSTRAINT `uczen_przedmiot_ocena_nauczyciel_ibfk_1` FOREIGN KEY (`id_ocena`) REFERENCES `oceny` (`id`),
  ADD CONSTRAINT `uczen_przedmiot_ocena_nauczyciel_ibfk_2` FOREIGN KEY (`id_przedmiot`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `uczen_przedmiot_ocena_nauczyciel_ibfk_3` FOREIGN KEY (`id_uczen`) REFERENCES `osoba` (`id`),
  ADD CONSTRAINT `uczen_przedmiot_ocena_nauczyciel_ibfk_4` FOREIGN KEY (`id_nauczyciel`) REFERENCES `osoba` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
