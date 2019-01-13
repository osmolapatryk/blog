-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Sty 2019, 09:29
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
-- Baza danych: `bancroot`
--
CREATE DATABASE IF NOT EXISTS `bancroot` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `bancroot`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id_produktu` int(11) NOT NULL,
  `nazwa` text COLLATE utf8_polish_ci NOT NULL,
  `cena` float NOT NULL,
  `kategoria` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`id_produktu`, `nazwa`, `cena`, `kategoria`) VALUES
(1, 'banan', 0.99, 'owoce'),
(2, 'jablko', 0.49, 'owoce'),
(3, 'czeresnie', 2.99, 'owoce'),
(4, 'grejfrut', 0.65, 'owoce'),
(5, 'brzoskwinie', 0.89, 'owoce'),
(6, 'ananas', 1.29, 'owoce'),
(7, 'maliny', 1.79, 'owoce'),
(8, 'arbuz', 2.29, 'owoce'),
(9, 'burak', 1.89, 'warzywa'),
(10, 'marchew', 2.49, 'warzywa'),
(11, 'kukurydza', 3.99, 'warzywa'),
(12, 'ogorek', 2.39, 'warzywa'),
(13, 'cebula', 2.99, 'warzywa'),
(14, 'papryka', 3.29, 'warzywa'),
(15, 'rzodkiewka', 1.99, 'warzywa'),
(16, 'pomidor', 0.49, 'warzywa'),
(17, 'maslo', 2.25, 'nabial'),
(18, 'gouda', 3.79, 'nabial'),
(19, 'twarog', 2.49, 'nabial'),
(20, 'jogurt truskawkowy', 1.79, 'nabial'),
(21, 'jajka', 0.29, 'nabial'),
(22, 'ser szwajcarski', 3.39, 'nabial'),
(23, 'mleko', 2.29, 'nabial'),
(24, 'musli', 1.49, 'nabial'),
(25, 'wino czerwone', 7.99, 'napoje'),
(26, 'herbata', 2.99, 'napoje'),
(27, 'sprite', 1.49, 'napoje'),
(28, 'pepsi', 1.79, 'napoje'),
(29, 'sok pomaranczowy', 2.29, 'napoje'),
(30, 'Mountain dew', 2.99, 'napoje'),
(31, 'coca cola', 3.79, 'napoje'),
(32, 'kawa', 1.99, 'napoje'),
(33, '7 days', 1.49, 'slodycze'),
(34, 'baton proteinowy', 2.99, 'slodycze'),
(35, 'czekolada', 1.99, 'slodycze'),
(36, 'ciastka czekoladowe', 3.49, 'slodycze'),
(37, 'lody owocowe', 2.99, 'slodycze'),
(38, 'krowki', 1.29, 'slodycze'),
(39, 'lizak', 1.49, 'slodycze'),
(40, 'wafle', 3.19, 'slodycze');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id_uzytkownika` int(11) NOT NULL,
  `log` text COLLATE utf8_polish_ci NOT NULL,
  `pass` text COLLATE utf8_polish_ci NOT NULL,
  `mail` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id_uzytkownika`, `log`, `pass`, `mail`) VALUES
(1, 'admin', 'admin', 'admin@o2.pl'),
(2, 'Roman', '$2y$10$gxl7DjghFSoLinz1bOUMuOOcm6iHT6HgWU7CktqGCRv1LeOdy9dQ.', 'roman@o2.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `id_zamowienia` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `koszt` float NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id_produktu`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id_uzytkownika`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id_produktu` (`id_produktu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id_produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id_uzytkownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id_produktu`);
--
-- Baza danych: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `id8407192_bini`;

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
--
-- Baza danych: `osadnicy`
--
CREATE DATABASE IF NOT EXISTS `osadnicy` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `osadnicy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `user` text COLLATE utf8_polish_ci NOT NULL,
  `pass` text COLLATE utf8_polish_ci NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `drewno` int(11) NOT NULL,
  `kamien` int(11) NOT NULL,
  `zboze` int(11) NOT NULL,
  `dnipremium` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `user`, `pass`, `email`, `drewno`, `kamien`, `zboze`, `dnipremium`) VALUES
(1, 'adam', 'qwerty', 'adam@gmail.com', 213, 5675, 342, 0),
(2, 'marek', 'asdfg', 'marek@gmail.com', 324, 1123, 4325, 15),
(3, 'anna', 'zxcvb', 'anna@gmail.com', 4536, 17, 120, 25),
(4, 'andrzej', 'asdfg', 'andrzej@gmail.com', 5465, 132, 189, 0),
(5, 'justyna', 'yuiop', 'justyna@gmail.com', 245, 890, 554, 0),
(6, 'kasia', 'hjkkl', 'kasia@gmail.com', 267, 980, 109, 12),
(7, 'beata', 'fgthj', 'beata@gmail.com', 565, 356, 447, 77),
(8, 'jakub', 'ertyu', 'jakub@gmail.com', 2467, 557, 876, 0),
(9, 'janusz', 'cvbnm', 'janusz@gmail.com', 65, 456, 2467, 0),
(10, 'roman', 'dfghj', 'roman@gmail.com', 97, 226, 245, 23);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"blog\",\"table\":\"wpisy\"},{\"db\":\"blog\",\"table\":\"komentarze\"},{\"db\":\"bancroot\",\"table\":\"zamowienie\"},{\"db\":\"bancroot\",\"table\":\"produkty\"},{\"db\":\"blog\",\"table\":\"users\"},{\"db\":\"bancroot\",\"table\":\"uzytkownicy\"},{\"db\":\"bancroot\",\"table\":\"users\"},{\"db\":\"Bancroot\",\"table\":\"users\"},{\"db\":\"osadnicy\",\"table\":\"uzytkownicy\"},{\"db\":\"quiz\",\"table\":\"pytania\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('blog', 'komentarze', 'tresc'),
('blog', 'wpisy', 'tresc');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'blog', 'komentarze', '[]', '2019-01-09 08:08:15'),
('root', 'blog', 'wpisy', '[]', '2019-01-09 07:37:24');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-01-13 08:28:07', '{\"lang\":\"pl\",\"Console\\/Mode\":\"show\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `quiz`
--
CREATE DATABASE IF NOT EXISTS `quiz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `quiz`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytania`
--

CREATE TABLE `pytania` (
  `id` int(11) NOT NULL,
  `tresc` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `odpa` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `odpb` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `odpc` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `odpd` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `kategoria` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `rok` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `pytania`
--

INSERT INTO `pytania` (`id`, `tresc`, `odpa`, `odpb`, `odpc`, `odpd`, `answer`, `kategoria`, `rok`) VALUES
(1, 'Wypisanie na ekranie zawartości zmiennej char s = \"To jest tylko test\" zostanie wykonane w języku C++ za pomocą instrukcji', 'cin&lt;&lt;s', 'cout&gt;&gt;s', 'cout&lt;&lt;s', 'cin&gt;&gt;s', 'c', 'programowanie', 2012),
(2, 'Destruktor w języku C++ to metoda', 'wywoływana w momencie usuwania obiektu', 'wywoływana w momencie tworzenia obiektu', 'zwalniająca pamięć przydzieloną dynamicznie w obiekcie', 'porządkująca pamięć operacyjną po usuniętych obiektach', 'a', 'programowanie', 2009),
(3, 'Dziedziczenie w programowaniu obiektowym pozwala na', 'łączenie obiektów', 'kopiowanie cech jednego obiektu do innego', 'usunięcie z istniejącej klasy zbędnych elementów.', 'tworzenie nowej klasy na podstawie jednej lub kilku już istniejących klas', 'd', 'programowanie', 2008),
(4, 'Złącze AGP służy do podłączenia', 'szybkich pamięci dyskowych', 'urządzeń wejścia/wyjścia', 'kart graficznych', 'modemu', 'c', 'urządzenia techniki komp.', 2007),
(5, 'Do którego wyprowadzenia należy podłączyć głośniki aktywne w karcie dźwiękowej, której schemat funkcjonalny przedstawia rysunek?', 'Mic in', 'Line in', 'Line out', 'Speaker out', 'c', 'urządzenia techniki komp.', 2006),
(6, 'Który blok karty dźwiękowej służy do cyfrowego przetwarzania sygnałów?', 'Przetwornik A/D', 'Procesor DSP', 'Syntezator', 'Mikser', 'b', 'urządzenia techniki komp.', 2011),
(7, 'Warunkiem niezbędnym przy archiwizacji danych jest', 'kompresja danych', 'kopiowanie danych', 'kompresja i kopiowanie danych', 'kompresja i kopiowanie danych z jednoczesnym ich szyfrowaniem', 'b', 'systemy operacyjne i sieci', 2006),
(8, 'Która warstwa modelu ISO/OSI jest związana z protokołem IP?', 'Sieciowa', 'Fizyczna', 'Transportowa', 'Łącza danych', 'a', 'systemy operacyjne i sieci', 2010),
(9, 'Ile komórek pamięci można zaadresować bezpośrednio w 64 bitowym procesorze, który ma 32 bitową szynę adresową?', '2 do potęgi 32', '2 do potęgi 64', '32 do potęgi 2', '64 do potęgi 2', 'a', 'urządzenia techniki komp.', 2006),
(10, 'Co oznacza zwrot \"wykonanie backupu systemu\"?', 'Zamknięcie systemu', 'Ponowne uruchomienie systemu', 'Wykonanie aktualizacji systemu', 'Wykonanie kopii zapasowej systemu', 'd', 'systemy operacyjne i sieci', 2012),
(11, 'Klaster komputerowy to', 'komputer z macierzą dyskową', 'komputer z wieloma procesorami', 'grupa komputerów pracujących współbieżnie tak, jakby był to jeden komputer', 'komputer zapasowy, na którym co pewien czas wykonywana jest kopia systemu głównego', 'c', 'urządzenia techniki komp.', 2007),
(12, 'Jaką ilość rzeczywistych danych można przesłać w czasie 1 s przez łącze synchroniczne o przepustowości 512 kbps, bez sprzętowej i programowej kompresji?', 'Około 5 kB', 'Około 55 kB', 'Ponad 64 kB', 'Ponad 500 kB', 'b', 'systemy operacyjne i sieci', 2012),
(13, 'Jakiej liczbie kolorów odpowiada kolor zakodowany na 16 bitach?', '16 kolorom', 'około 64 tysiącom kolorów', 'około 65 tysiącom kolorów', 'około 16 milionom kolorów', 'c', 'multimedia i grafika', 2008),
(14, 'Pamięć oznaczona symbolem PC3200 nie może współpracować z magistralą', '300 MHz', '333 MHz', '400 MHz', '533 MHz', 'd', 'urządzenia techniki komp.', 2006),
(15, 'Co oznacza jednostka dpi podawana w parametrach katalogowych skanerów i drukarek?', 'Punkty na cal', 'Gęstość optyczną', 'Punkty na milimetr', 'Punkty na centymetr', 'a', 'urządzenia techniki komp.', 2009),
(16, 'Jaka jest maksymalna prędkość odczytu płyt CD-R w napędzie oznaczonym x48?', '480 kB/s', '4800 kB/s', '7200 kB/s', '10000 kB/s', 'c', 'urządzenia techniki komp.', 2006),
(17, 'Funkcje różnych kategorii (daty i czasu, finansowe, tekstowe, matematyczne, statystyczne) są elementem składowym', 'edytora tekstu', 'przeglądarki internetowej', 'arkusza kalkulacyjnego', 'programów do tworzenia prezentacji multimedialnych', 'c', 'oprogramowanie biurowe', 2010),
(18, 'Który z podanych języków programowania nie jest językiem webowym?', 'HTML5', 'JavaScript', 'PHP', 'C++', 'd', 'programowanie', 2012),
(19, 'W języku C++ różnica między funkcją a procedurą polega na tym, że', 'funkcja zwraca wartość, a procedura nie', 'do funkcji jako parametr można przekazywać zmienną, a do procedur tylko wartość', 'do procedury jako parametr można przekazywać zmienną, a do funkcji tylko wartość', 'funkcja może być zdefiniowana z tylko jednym parametrem, a procedura z wieloma', 'a', 'programowanie', 2006),
(20, 'Jaki jest kod koloru w języku HTML, jeśli kolor ten ma składowe w zapisie dziesiętnym: czerwony = 27, zielony = 90 i niebieski = 104?', '#279004', '#1B5A68', '#1C9D4A', '#5A681B', 'b', 'multimedia i grafika', 2010);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pytania`
--
ALTER TABLE `pytania`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `pytania`
--
ALTER TABLE `pytania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
