-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2022 at 07:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_game`
--

-- --------------------------------------------------------

--
-- Table structure for table `average_to_star`
--

CREATE TABLE `average_to_star` (
  `Average_rating` int(11) NOT NULL,
  `Star_rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `average_to_star`
--

INSERT INTO `average_to_star` (`Average_rating`, `Star_rating`) VALUES
(0, 0),
(1, 0),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 4),
(9, 5),
(10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `collaborate`
--

CREATE TABLE `collaborate` (
  `A_C_id` int(11) NOT NULL,
  `B_C_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `collaborate`
--

INSERT INTO `collaborate` (`A_C_id`, `B_C_id`) VALUES
(1, 2),
(1, 3),
(6, 8),
(7, 2),
(7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `console`
--

CREATE TABLE `console` (
  `Model_id` int(11) NOT NULL,
  `Generation` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `console`
--

INSERT INTO `console` (`Model_id`, `Generation`) VALUES
(1, 'defult console'),
(4, 'Nintendo Switch'),
(7, 'PlayStation 4'),
(10, 'PlayStation 5'),
(13, 'Xbox One S'),
(16, 'Nintendo DS'),
(19, 'LONSUN Classic'),
(22, 'HAndPE Retro Classic'),
(25, 'Wii');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `G_id` int(11) NOT NULL,
  `game_name` char(50) DEFAULT NULL,
  `Published_Year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`G_id`, `game_name`, `Published_Year`) VALUES
(1, 'Minecraft', 2011),
(2, 'Animal Crossing', 2021),
(3, 'League Of Legends', 2009),
(4, 'Valorant', 2020),
(5, 'Genshin Impact	', 2020),
(6, 'PUBG', 2017),
(7, 'Clash of Clan', 2012),
(8, 'Dead by Daylight', 2016),
(9, 'Clash Royale', 2016);

-- --------------------------------------------------------

--
-- Table structure for table `game_company`
--

CREATE TABLE `game_company` (
  `C_id` int(11) NOT NULL,
  `C_name` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_company`
--

INSERT INTO `game_company` (`C_id`, `C_name`) VALUES
(1, 'Mojang Studios'),
(2, 'Sony'),
(3, 'Xbox'),
(4, 'Nintendo'),
(5, 'Riot Games'),
(6, 'miHoYo'),
(7, 'Krafton'),
(8, 'Tencent Games'),
(9, 'Supercell'),
(10, 'Behaviour Interactive');

-- --------------------------------------------------------

--
-- Table structure for table `game_history`
--

CREATE TABLE `game_history` (
  `User_id` int(11) NOT NULL,
  `Game_id` int(11) NOT NULL,
  `Record_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_history`
--

INSERT INTO `game_history` (`User_id`, `Game_id`, `Record_time`) VALUES
(1009, 8, '15:00:00'),
(1005, 6, '20:00:00'),
(1000, 1, '50:00:00'),
(1000, 7, '100:00:00'),
(1001, 3, '100:00:00'),
(1010, 2, '100:00:00'),
(1001, 5, '200:00:00'),
(1002, 4, '200:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `game_played_award`
--

CREATE TABLE `game_played_award` (
  `Num_game_played` int(11) NOT NULL,
  `Award` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_played_award`
--

INSERT INTO `game_played_award` (`Num_game_played`, `Award`) VALUES
(5, 'Newbie'),
(10, 'Starter'),
(15, 'Try-Hard'),
(20, 'Typical Gamer'),
(50, 'Expert'),
(100, 'Game Master'),
(200, 'Ace');

-- --------------------------------------------------------

--
-- Table structure for table `game_pop`
--

CREATE TABLE `game_pop` (
  `G_id` int(11) NOT NULL,
  `Game_rating_id` int(11) NOT NULL,
  `Popularity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_pop`
--

INSERT INTO `game_pop` (`G_id`, `Game_rating_id`, `Popularity`) VALUES
(8, 1, 40000),
(6, 1, 527000),
(2, 1, 11000000),
(5, 1, 62320000),
(7, 1, 76000000),
(3, 1, 115000000),
(4, 1, 120000000),
(1, 1, 141000000);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `Genre_id` int(11) NOT NULL,
  `Genre_Type` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`Genre_id`, `Genre_Type`) VALUES
(1, 'Sandbox'),
(2, 'Real-time strategy'),
(3, 'Shooters(FPS and TPS)'),
(4, 'Multiplayer online battle'),
(5, 'Role-playing'),
(6, 'Simulation and sports'),
(7, 'Puzzlers and party games'),
(8, 'Action-adventure'),
(9, 'Survival and horror'),
(10, 'Platformer/Open World');

-- --------------------------------------------------------

--
-- Table structure for table `mobile`
--

CREATE TABLE `mobile` (
  `Model_id` int(11) NOT NULL,
  `OS` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobile`
--

INSERT INTO `mobile` (`Model_id`, `OS`) VALUES
(2, 'defult mobile'),
(5, 'Android'),
(8, 'iOS'),
(11, 'Linux'),
(14, 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `part_of`
--

CREATE TABLE `part_of` (
  `Genre_id` int(11) NOT NULL,
  `G_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part_of`
--

INSERT INTO `part_of` (`Genre_id`, `G_id`) VALUES
(1, 1),
(2, 7),
(3, 4),
(3, 6),
(4, 3),
(4, 6),
(5, 2),
(6, 2),
(8, 3),
(8, 5),
(8, 8),
(9, 8),
(10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `Model_id` int(11) NOT NULL,
  `CPU` char(15) DEFAULT NULL,
  `GPU` char(15) DEFAULT NULL,
  `RAM` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pc`
--

INSERT INTO `pc` (`Model_id`, `CPU`, `GPU`, `RAM`) VALUES
(3, 'def CPU', 'def GPU', 'def RAM'),
(6, 'i7-12900k', 'RTX 3060', '16'),
(9, 'Intel i7', 'RX6900XT', '12'),
(12, 'AMD Ryzen 9', 'RTX 3090', '12'),
(15, 'AMD Ryzen 7', 'RX 6600', '16');

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

CREATE TABLE `platform` (
  `Model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`Model_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `User_id` int(11) NOT NULL,
  `Num_game_played` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`User_id`, `Num_game_played`) VALUES
(1000, 5),
(1006, 5),
(1011, 5),
(1004, 10),
(1002, 20),
(1001, 50),
(1010, 100);

-- --------------------------------------------------------

--
-- Table structure for table `prefer_preference`
--

CREATE TABLE `prefer_preference` (
  `User_id` int(11) NOT NULL,
  `Game_tag_1` int(11) DEFAULT NULL,
  `Game_tag_2` int(11) DEFAULT NULL,
  `Game_tag_3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prefer_preference`
--

INSERT INTO `prefer_preference` (`User_id`, `Game_tag_1`, `Game_tag_2`, `Game_tag_3`) VALUES
(1000, 2, 4, 5),
(1002, 3, 8, 9),
(1003, 9, 10, 6),
(1004, 7, 1, 8),
(1008, 6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `published_by`
--

CREATE TABLE `published_by` (
  `G_id` int(11) NOT NULL,
  `C_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `published_by`
--

INSERT INTO `published_by` (`G_id`, `C_id`) VALUES
(1, 1),
(2, 4),
(3, 5),
(4, 5),
(5, 6),
(6, 7),
(7, 9),
(8, 10),
(9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `G_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `User_rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`G_id`, `User_id`, `User_rating`) VALUES
(1, 1000, 9),
(1, 1001, 10),
(1, 1002, 7),
(1, 1004, 4),
(1, 1005, 8),
(1, 1010, 8),
(2, 1000, 10),
(2, 1001, 6),
(2, 1002, 8),
(2, 1004, 8),
(2, 1007, 9),
(3, 1000, 2),
(3, 1001, 4),
(3, 1002, 9),
(3, 1004, 4),
(3, 1007, 10),
(4, 1000, 4),
(4, 1001, 8),
(4, 1002, 8),
(5, 1000, 8),
(5, 1001, 7),
(5, 1002, 6),
(5, 1009, 6),
(6, 1000, 10),
(6, 1001, 8),
(6, 1002, 4),
(6, 1012, 8),
(7, 1000, 7),
(7, 1001, 3),
(7, 1002, 7),
(7, 1010, 3),
(8, 1000, 9),
(8, 1001, 7),
(8, 1002, 8),
(8, 1010, 6),
(9, 1000, 10),
(9, 1001, 9),
(9, 1002, 10);

-- --------------------------------------------------------

--
-- Table structure for table `record_achievement`
--

CREATE TABLE `record_achievement` (
  `Record_time` time NOT NULL,
  `Achievement` int(11) DEFAULT NULL,
  `Badge` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_achievement`
--

INSERT INTO `record_achievement` (`Record_time`, `Achievement`, `Badge`) VALUES
('05:00:00', 1, 'Starter'),
('15:00:00', 2, 'Novice'),
('20:00:00', 3, 'Apprentice'),
('50:00:00', 4, 'Adept'),
('100:00:00', 5, 'Master'),
('200:00:00', 6, 'Exalted'),
('500:00:00', 7, 'Legendary');

-- --------------------------------------------------------

--
-- Table structure for table `runs`
--

CREATE TABLE `runs` (
  `G_id` int(11) NOT NULL,
  `Model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `runs`
--

INSERT INTO `runs` (`G_id`, `Model_id`) VALUES
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 4),
(3, 3),
(4, 12),
(5, 4),
(5, 5),
(5, 7),
(5, 8),
(5, 13),
(5, 14),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 10),
(6, 13),
(6, 14),
(7, 5),
(7, 8),
(8, 5),
(8, 7),
(8, 8),
(8, 10),
(8, 13),
(8, 14),
(8, 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_id` int(11) NOT NULL,
  `userName` char(25) DEFAULT NULL,
  `Year_joined` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_id`, `userName`, `Year_joined`) VALUES
(1000, 'Sam I am', 2022),
(1001, 'Henry Heh', 2022),
(1002, 'Gaven Great', 2022),
(1003, 'Rick N Morty', 2022),
(1004, 'Best Player', 2022),
(1005, '3-Year-Old Kid', 2022),
(1006, 'Your Prof', 2022),
(1007, 'Kraken', 2022),
(1008, 'Mad Dog', 2022),
(1009, 'BroCode', 2022),
(1010, 'Lady Bug', 2022),
(1011, 'Simpsons', 2022),
(1012, 'Iron hand', 2022),
(1015, 'Gaming Bruh', 2022),
(1017, 'pro player', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `user_age`
--

CREATE TABLE `user_age` (
  `Year_joined` int(11) NOT NULL,
  `Account_age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_age`
--

INSERT INTO `user_age` (`Year_joined`, `Account_age`) VALUES
(2022, 0),
(2023, 1),
(2024, 2),
(2025, 3),
(2026, 4);

-- --------------------------------------------------------

--
-- Table structure for table `viewer`
--

CREATE TABLE `viewer` (
  `User_id` int(11) NOT NULL,
  `num_game_rated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewer`
--

INSERT INTO `viewer` (`User_id`, `num_game_rated`) VALUES
(1000, 2),
(1001, 1),
(1002, 1),
(1003, 0),
(1004, 0),
(1005, 0),
(1006, 0),
(1007, 1),
(1008, 0),
(1009, 0),
(1010, 1),
(1012, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `average_to_star`
--
ALTER TABLE `average_to_star`
  ADD PRIMARY KEY (`Average_rating`);

--
-- Indexes for table `collaborate`
--
ALTER TABLE `collaborate`
  ADD PRIMARY KEY (`A_C_id`,`B_C_id`),
  ADD KEY `B_C_id` (`B_C_id`);

--
-- Indexes for table `console`
--
ALTER TABLE `console`
  ADD PRIMARY KEY (`Model_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`G_id`);

--
-- Indexes for table `game_company`
--
ALTER TABLE `game_company`
  ADD PRIMARY KEY (`C_id`);

--
-- Indexes for table `game_history`
--
ALTER TABLE `game_history`
  ADD PRIMARY KEY (`User_id`,`Game_id`),
  ADD KEY `Record_time` (`Record_time`),
  ADD KEY `Game_id` (`Game_id`);

--
-- Indexes for table `game_played_award`
--
ALTER TABLE `game_played_award`
  ADD PRIMARY KEY (`Num_game_played`);

--
-- Indexes for table `game_pop`
--
ALTER TABLE `game_pop`
  ADD PRIMARY KEY (`G_id`,`Game_rating_id`),
  ADD KEY `Average_rating` (`Popularity`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`Genre_id`);

--
-- Indexes for table `mobile`
--
ALTER TABLE `mobile`
  ADD PRIMARY KEY (`Model_id`);

--
-- Indexes for table `part_of`
--
ALTER TABLE `part_of`
  ADD PRIMARY KEY (`Genre_id`,`G_id`),
  ADD KEY `G_id` (`G_id`);

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`Model_id`);

--
-- Indexes for table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`Model_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Num_game_played` (`Num_game_played`);

--
-- Indexes for table `prefer_preference`
--
ALTER TABLE `prefer_preference`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Game_tag_1` (`Game_tag_1`),
  ADD KEY `Game_tag_2` (`Game_tag_2`),
  ADD KEY `Game_tag_3` (`Game_tag_3`);

--
-- Indexes for table `published_by`
--
ALTER TABLE `published_by`
  ADD PRIMARY KEY (`G_id`,`C_id`),
  ADD KEY `C_id` (`C_id`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`G_id`,`User_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `record_achievement`
--
ALTER TABLE `record_achievement`
  ADD PRIMARY KEY (`Record_time`);

--
-- Indexes for table `runs`
--
ALTER TABLE `runs`
  ADD PRIMARY KEY (`G_id`,`Model_id`),
  ADD KEY `Model_id` (`Model_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- Indexes for table `user_age`
--
ALTER TABLE `user_age`
  ADD PRIMARY KEY (`Year_joined`);

--
-- Indexes for table `viewer`
--
ALTER TABLE `viewer`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `G_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `game_company`
--
ALTER TABLE `game_company`
  MODIFY `C_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `Genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `platform`
--
ALTER TABLE `platform`
  MODIFY `Model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collaborate`
--
ALTER TABLE `collaborate`
  ADD CONSTRAINT `collaborate_ibfk_1` FOREIGN KEY (`A_C_id`) REFERENCES `game_company` (`C_id`),
  ADD CONSTRAINT `collaborate_ibfk_2` FOREIGN KEY (`B_C_id`) REFERENCES `game_company` (`C_id`);

--
-- Constraints for table `console`
--
ALTER TABLE `console`
  ADD CONSTRAINT `console_ibfk_1` FOREIGN KEY (`Model_id`) REFERENCES `platform` (`Model_id`);

--
-- Constraints for table `game_history`
--
ALTER TABLE `game_history`
  ADD CONSTRAINT `game_history_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_history_ibfk_2` FOREIGN KEY (`Record_time`) REFERENCES `record_achievement` (`Record_time`),
  ADD CONSTRAINT `game_history_ibfk_3` FOREIGN KEY (`Game_id`) REFERENCES `game` (`G_id`);

--
-- Constraints for table `game_pop`
--
ALTER TABLE `game_pop`
  ADD CONSTRAINT `game_pop_ibfk_1` FOREIGN KEY (`G_id`) REFERENCES `game` (`G_id`) ON DELETE CASCADE;

--
-- Constraints for table `mobile`
--
ALTER TABLE `mobile`
  ADD CONSTRAINT `mobile_ibfk_1` FOREIGN KEY (`Model_id`) REFERENCES `platform` (`Model_id`);

--
-- Constraints for table `part_of`
--
ALTER TABLE `part_of`
  ADD CONSTRAINT `part_of_ibfk_1` FOREIGN KEY (`Genre_id`) REFERENCES `genre` (`Genre_id`),
  ADD CONSTRAINT `part_of_ibfk_2` FOREIGN KEY (`G_id`) REFERENCES `game` (`G_id`);

--
-- Constraints for table `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`Model_id`) REFERENCES `platform` (`Model_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  ADD CONSTRAINT `player_ibfk_2` FOREIGN KEY (`Num_game_played`) REFERENCES `game_played_award` (`Num_game_played`);

--
-- Constraints for table `prefer_preference`
--
ALTER TABLE `prefer_preference`
  ADD CONSTRAINT `prefer_preference_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  ADD CONSTRAINT `prefer_preference_ibfk_2` FOREIGN KEY (`Game_tag_1`) REFERENCES `genre` (`Genre_id`),
  ADD CONSTRAINT `prefer_preference_ibfk_3` FOREIGN KEY (`Game_tag_2`) REFERENCES `genre` (`Genre_id`),
  ADD CONSTRAINT `prefer_preference_ibfk_4` FOREIGN KEY (`Game_tag_3`) REFERENCES `genre` (`Genre_id`);

--
-- Constraints for table `published_by`
--
ALTER TABLE `published_by`
  ADD CONSTRAINT `published_by_ibfk_1` FOREIGN KEY (`G_id`) REFERENCES `game` (`G_id`),
  ADD CONSTRAINT `published_by_ibfk_2` FOREIGN KEY (`C_id`) REFERENCES `game_company` (`C_id`);

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`G_id`) REFERENCES `game` (`G_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rate_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON UPDATE CASCADE;

--
-- Constraints for table `runs`
--
ALTER TABLE `runs`
  ADD CONSTRAINT `runs_ibfk_1` FOREIGN KEY (`G_id`) REFERENCES `game` (`G_id`),
  ADD CONSTRAINT `runs_ibfk_2` FOREIGN KEY (`Model_id`) REFERENCES `platform` (`Model_id`);

--
-- Constraints for table `viewer`
--
ALTER TABLE `viewer`
  ADD CONSTRAINT `viewer_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
