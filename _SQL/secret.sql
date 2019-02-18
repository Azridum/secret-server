-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Feb 18. 19:59
-- Kiszolgáló verziója: 10.1.37-MariaDB
-- PHP verzió: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `secret`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `secrets`
--

CREATE TABLE `secrets` (
  `hash` varchar(100) NOT NULL,
  `secretText` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiresAt` timestamp NULL DEFAULT NULL,
  `remainingViews` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `secrets`
--

INSERT INTO `secrets` (`hash`, `secretText`, `createdAt`, `expiresAt`, `remainingViews`) VALUES
('558461e960ee88f0f418a370ae64fa15', 'PowerWolf', '2019-02-17 19:09:41', NULL, 2),
('5736a85fcbb1d4e8cfec90d3b020c2e2', 'asd', '2019-02-17 17:19:35', NULL, 7),
('6d639986656cdf032b88ae4323889368', 'expire test', '2019-02-18 18:05:17', '2019-02-18 16:59:00', 2),
('765282f6c4f4cd5e674dda3377825c51', 'Amon Amarth', '2019-02-17 19:08:50', NULL, 2),
('8a1845b91a9ec187eaa761b5ac32d1a7', 'Behemoth', '2019-02-17 17:22:56', NULL, 76),
('bc3fceadd14431b9e7847e91b7e142dd', 'ACDC', '2019-02-17 19:42:09', NULL, 2),
('dsflnjsdflhsdfjlasli', '-lkgjlksdgjlsdllhfiajsaldiad', '2019-02-17 16:10:07', '2019-02-12 23:00:00', 8),
('ee50862e93b10f4efd7f8d37fa53c6e5', 'Yolo', '2019-02-18 17:57:20', NULL, 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `secrets`
--
ALTER TABLE `secrets`
  ADD PRIMARY KEY (`hash`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
