-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Sty 2019, 09:10
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `blog`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarze`
--

CREATE TABLE `komentarze` (
  `id_koment` int(11) NOT NULL,
  `autor` text COLLATE utf8_polish_ci NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `id_wpisu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `komentarze`
--

INSERT INTO `komentarze` (`id_koment`, `autor`, `tresc`, `id_wpisu`) VALUES
(1, 'adam', 'awnefanwfz', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` text COLLATE utf8_polish_ci NOT NULL,
  `password` text COLLATE utf8_polish_ci NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `login`, `password`, `email`) VALUES
(1, 'admin', 'adminadmin', 'admin@o2.pl'),
(2, 'adam', '$2y$10$duLZXrF1RjlkZ2nC/0jVPuSSgZ2h1VCH25ikNIfMH5wWY/C1dvRsK', 'adamtest@o2.pl'),
(5, 'janusz', '$2y$10$3T/WjoWY7HvQo8wESiQOfugu9QR5OoV.NY5doi9B4wfW4tk1C8m1C', 'janusz@o2.pl'),
(6, 'Mariusz', '$2y$10$SMEe8ZwDzZ8F4.2zhebLV.Xx2g1IDba.ScPvNlan.T6LocT6PAx7O', 'mariusz@gmao.com'),
(7, 'patryk', '$2y$10$CHZDJg2C/BA.vxH9znxFIu2AwG7FKPsfIJiW1clWivNhvcH45pwly', 'patryk@o2.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wpisy`
--

CREATE TABLE `wpisy` (
  `id_wpisu` int(11) NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `zdj` text COLLATE utf8_polish_ci NOT NULL,
  `tagi` text COLLATE utf8_polish_ci NOT NULL,
  `odsylacz` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wpisy`
--

INSERT INTO `wpisy` (`id_wpisu`, `tresc`, `zdj`, `tagi`, `odsylacz`) VALUES
(1, 'Po długiej przerwie wena wróciła! ', 'img/eye.png', '#illuminati #eye #hand\r\n', 'eye.php'),
(2, 'flower power.', 'img/kobieta.png', '#purple #blindwoman #nosering', 'kobieta.php'),
(3, 'pozostałości po weekendzie ', 'img/skull.php', '#skull #candles #snake\r\n', 'skull.php'),
(4, 'weekendowe nowości.', 'img/monkey.png', '#gorilla #monkey #crown', 'monkey.php'),
(5, 'jeszcze cieplutki!', 'img/osmiornica.png', '#octopus #kotwica #macki', 'osmiornica.php'),
(6, 'swieżutkie!\r\n', 'img/rose.png', '#rose #flower #flowertatto', 'rose.php'),
(7, 'Nowość !', 'img/niebieska.png', '#aquarelle #bluehair #bluemouth', 'niebieska.php'),
(8, 'Meduza !', 'img/meduza.png', '#medusa #bogini #goddess', 'meduza.php');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`id_koment`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeksy dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  ADD PRIMARY KEY (`id_wpisu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `id_koment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  MODIFY `id_wpisu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
