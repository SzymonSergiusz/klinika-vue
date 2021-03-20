-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Mar 2021, 19:50
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `klinika`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarze`
--

CREATE TABLE `lekarze` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `lekarze`
--

INSERT INTO `lekarze` (`id`, `firstname`, `surname`, `specification`) VALUES
(1, 'Franciszek', 'Kowalski', 'Lekarz rodzinny'),
(2, 'Mateusz', 'Nowak', 'Dermatolog');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `termin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `terminy`
--

CREATE TABLE `terminy` (
  `id_lekarza` int(11) NOT NULL,
  `registration_time` varchar(255) DEFAULT NULL,
  `is_booked` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `terminy`
--

INSERT INTO `terminy` (`id_lekarza`, `registration_time`, `is_booked`) VALUES
(1, '8:00', b'0'),
(1, '8:20', b'0'),
(1, '8:40', b'0'),
(1, '9:00', b'0'),
(1, '9:20', b'0'),
(1, '9:40', b'0'),
(1, '10:00', b'0'),
(1, '10:20', b'0'),
(1, '10:40', b'0'),
(1, '11:00', b'0'),
(1, '11:20', b'0'),
(1, '11:40', b'0'),
(1, '12:00', b'0'),
(1, '12:20', b'0'),
(1, '12:40', b'0'),
(1, '13:00', b'0'),
(1, '13:20', b'0'),
(1, '13:40', b'0'),
(2, '14:20', b'0'),
(2, '14:40', b'0'),
(2, '15:00', b'0'),
(2, '15:20', b'0'),
(2, '15:40', b'0'),
(2, '16:00', b'0'),
(2, '16:20', b'0'),
(2, '16:40', b'0'),
(2, '17:00', b'0'),
(2, '17:20', b'0'),
(2, '17:40', b'0'),
(2, '17:00', b'0'),
(2, '18:20', b'0'),
(2, '18:40', b'0'),
(2, '19:00', b'0'),
(2, '19:20', b'0'),
(2, '19:40', b'0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `firstname`, `surname`, `login`, `password`) VALUES
(1, 'Szymon', 'Kluska', 'admin', '123');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `lekarze`
--
ALTER TABLE `lekarze`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `lekarze`
--
ALTER TABLE `lekarze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
