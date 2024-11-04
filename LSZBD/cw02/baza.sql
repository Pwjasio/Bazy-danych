-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 21, 2024 at 02:51 PM
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
-- Database: `cw02`
--
CREATE DATABASE IF NOT EXISTS `cw02` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cw02`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `klient_id` int(11) NOT NULL,
  `nazwisko_imie` varchar(50) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `miejscowosc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`klient_id`, `nazwisko_imie`, `adres`, `miejscowosc`) VALUES
(1, 'Mrówczyński Jan', 'Braniborska 28', 'Zielona Góra'),
(2, 'Nikodem Kajetan', 'Bolesława', 'Rzepin'),
(5, 'Nowak Jakub', 'Gdzies ', 'Zielona Góra');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `isbn` char(17) NOT NULL,
  `autor` varchar(20) NOT NULL,
  `tytul` varchar(20) NOT NULL,
  `cena` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`isbn`, `autor`, `tytul`, `cena`) VALUES
('0-6554-8825-1', 'Ja i kolega', 'my', 21.99),
('0-7030-0431-X', 'On i ona', 'relacja', 23.99),
('9783140464079', 'Antoine de Saint-Exu', 'Mały Książę', 9.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki_zamowienia`
--

CREATE TABLE `ksiazki_zamowienia` (
  `zamowienie_id` int(11) NOT NULL,
  `isbn` char(17) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ksiazki_zamowienia`
--

INSERT INTO `ksiazki_zamowienia` (`zamowienie_id`, `isbn`, `ilosc`) VALUES
(1, '9783140464079', 2),
(2, '0-6554-8825-1', 2),
(3, '0-7030-0431-X', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recenzja_ksiazki`
--

CREATE TABLE `recenzja_ksiazki` (
  `isbn` varchar(17) NOT NULL,
  `recenzja` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recenzja_ksiazki`
--

INSERT INTO `recenzja_ksiazki` (`isbn`, `recenzja`) VALUES
('0-6554-8825-1', 'Super 11/10'),
('0-7030-0431-X', 'Słabo 2/10'),
('9783140464079', 'Ok 5/10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `zamowienie_id` int(11) NOT NULL,
  `klient_id` int(11) NOT NULL,
  `wartosc` decimal(20,2) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zamowienie`
--

INSERT INTO `zamowienie` (`zamowienie_id`, `klient_id`, `wartosc`, `data`) VALUES
(1, 1, 19.98, '2024-10-21'),
(2, 2, 43.98, '2024-10-21'),
(3, 5, 47.98, '2024-10-21');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`klient_id`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`isbn`);

--
-- Indeksy dla tabeli `ksiazki_zamowienia`
--
ALTER TABLE `ksiazki_zamowienia`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `isbn` (`isbn`);

--
-- Indeksy dla tabeli `recenzja_ksiazki`
--
ALTER TABLE `recenzja_ksiazki`
  ADD PRIMARY KEY (`isbn`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `klient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `zamowienie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ksiazki_zamowienia`
--
ALTER TABLE `ksiazki_zamowienia`
  ADD CONSTRAINT `ksiazki_zamowienia_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`),
  ADD CONSTRAINT `ksiazki_zamowienia_ibfk_2` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienie` (`zamowienie_id`);

--
-- Constraints for table `recenzja_ksiazki`
--
ALTER TABLE `recenzja_ksiazki`
  ADD CONSTRAINT `recenzja_ksiazki_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`);

--
-- Constraints for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`klient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
