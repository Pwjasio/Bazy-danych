-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Paź 2024, 13:10
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cw01`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `id_asortymentu`
--

CREATE TABLE `id_asortymentu` (
  `Id_sklad` int(11) NOT NULL,
  `sushi` varchar(20) NOT NULL,
  `Stawka podatku VAT` varchar(4) NOT NULL,
  `Cena za jeden krazek` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `id_asortymentu`
--

INSERT INTO `id_asortymentu` (`Id_sklad`, `sushi`, `Stawka podatku VAT`, `Cena za jeden krazek`) VALUES
(1, 'Futomaki sake', '', ''),
(2, 'Hosomaki sake', '', ''),
(3, 'Nigiri sake', '', ''),
(4, 'Uramaki Suzuki', '', ''),
(5, 'Hosomaki kappa', '', ''),
(6, 'Hosomaki ebi', '', ''),
(7, 'Nigiri egi', '', ''),
(8, 'Nigiri Suzuki', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `id_klient`
--

CREATE TABLE `id_klient` (
  `id_klient` int(11) NOT NULL,
  `Imie i nazwisko` varchar(20) NOT NULL,
  `NIP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `id_klient`
--

INSERT INTO `id_klient` (`id_klient`, `Imie i nazwisko`, `NIP`) VALUES
(10, 'HDK Kujawy', '927-132-87-90'),
(11, 'Jan Nowak', '-');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przygotowal`
--

CREATE TABLE `przygotowal` (
  `id_k` int(11) NOT NULL,
  `Imie i nazwisko` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `przygotowal`
--

INSERT INTO `przygotowal` (`id_k`, `Imie i nazwisko`) VALUES
(1, 'Jan Kowalski'),
(2, 'Andrzej Nowak');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sklad zestawu`
--

CREATE TABLE `sklad zestawu` (
  `id_a` int(11) NOT NULL,
  `nazwa zestawu` varchar(20) NOT NULL,
  `sklad zestawu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zestaw`
--

CREATE TABLE `zestaw` (
  `id_zestaw` int(11) NOT NULL,
  `Nazwa zestawu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zestaw`
--

INSERT INTO `zestaw` (`id_zestaw`, `Nazwa zestawu`) VALUES
(1, 'Sake'),
(2, 'Hiroshima');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `id_asortymentu`
--
ALTER TABLE `id_asortymentu`
  ADD PRIMARY KEY (`Id_sklad`);

--
-- Indeksy dla tabeli `id_klient`
--
ALTER TABLE `id_klient`
  ADD PRIMARY KEY (`id_klient`);

--
-- Indeksy dla tabeli `przygotowal`
--
ALTER TABLE `przygotowal`
  ADD PRIMARY KEY (`id_k`);

--
-- Indeksy dla tabeli `sklad zestawu`
--
ALTER TABLE `sklad zestawu`
  ADD PRIMARY KEY (`id_a`),
  ADD KEY `sklad zestawu` (`sklad zestawu`);

--
-- Indeksy dla tabeli `zestaw`
--
ALTER TABLE `zestaw`
  ADD PRIMARY KEY (`id_zestaw`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `id_asortymentu`
--
ALTER TABLE `id_asortymentu`
  MODIFY `Id_sklad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `id_klient`
--
ALTER TABLE `id_klient`
  MODIFY `id_klient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `przygotowal`
--
ALTER TABLE `przygotowal`
  MODIFY `id_k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `sklad zestawu`
--
ALTER TABLE `sklad zestawu`
  MODIFY `id_a` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zestaw`
--
ALTER TABLE `zestaw`
  MODIFY `id_zestaw` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `sklad zestawu`
--
ALTER TABLE `sklad zestawu`
  ADD CONSTRAINT `sklad zestawu_ibfk_1` FOREIGN KEY (`sklad zestawu`) REFERENCES `id_asortymentu` (`Id_sklad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
