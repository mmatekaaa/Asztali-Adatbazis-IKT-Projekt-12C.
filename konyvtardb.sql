-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Okt 15. 17:13
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `konyvtardb`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `konyvek`
--

CREATE TABLE `konyvek` (
  `Id` int(11) NOT NULL,
  `Szerzo` varchar(100) DEFAULT NULL,
  `Cim` varchar(150) DEFAULT NULL,
  `KiadasEve` varchar(100) DEFAULT NULL,
  `Oldalszam` int(11) DEFAULT NULL,
  `Ar` int(11) DEFAULT NULL,
  `Kategoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `konyvek`
--

INSERT INTO `konyvek` (`Id`, `Szerzo`, `Cim`, `KiadasEve`, `Oldalszam`, `Ar`, `Kategoria`) VALUES
(1, 'J.K. Rowling', 'Harry Potter és a Bölcsek Köve', '1997', 320, 4500, 'Ifjúsági'),
(2, 'George Orwell', '1984', '1949', 328, 3800, 'Regény'),
(3, 'Isaac Asimov', 'Alapítvány', '1951', 256, 4200, 'Sci-fi'),
(4, 'Yuval Noah Harari', 'Sapiens', '2011', 512, 5990, 'Tudomány'),
(5, 'Robert C. Martin', 'Tiszta kód', '2008', 464, 7500, 'Informatika'),
(6, 'Stephen Hawking', 'Az idő rövid története', '1988', 256, 4100, 'Tudomány'),
(7, 'J.R.R. Tolkien', 'A Gyűrűk Ura', '1954', 1216, 9900, 'Fantasy'),
(8, 'Frank Herbert', 'Dűne', '1965', 688, 5600, 'Sci-fi'),
(9, 'Daniel Kahneman', 'Gyors és lassú gondolkodás', '2011', 624, 6200, 'Pszichológia'),
(10, 'Andrew Hunt', 'A pragmatikus programozó', '2019', 352, 6800, 'Informatika');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `konyvek`
--
ALTER TABLE `konyvek`
  ADD PRIMARY KEY (`Id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `konyvek`
--
ALTER TABLE `konyvek`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
