-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 14-Jan-2024 às 23:32
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `body` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `body`) VALUES
(1, 'First', 'me@yahoo.com', 'Something', 'hehe'),
(2, 'First', 'me@yahoo.com', 'Something', 'hehe'),
(3, 'First Second', 'me1235@yahoo.com', 'Something else', '21341234'),
(4, 'First', 'werqwrweqr', 'rqerqwer', 'wreqwreqre'),
(5, '34123412', '1241234', '2141234', '124124'),
(6, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(7, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(8, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(9, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(10, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(11, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(12, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(13, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(14, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(15, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(16, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(17, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(18, 'Some Cliente', 'somecliente@gmail.com', 'Something', 'Random body text'),
(19, 'Some Cliente', 'teste@gmail.com', 'Something', 'Semething');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel_review`
--

DROP TABLE IF EXISTS `hotel_review`;
CREATE TABLE IF NOT EXISTS `hotel_review` (
  `id_hotel_review` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `Comment` varchar(1000) NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_hotel_review`),
  KEY `fk_hotel_review_id_user_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `hotel_review`
--

INSERT INTO `hotel_review` (`id_hotel_review`, `rating`, `Comment`, `id_user`) VALUES
(1, 9, 'I liked it.', 1),
(2, 10, 'I liked it very much.', 1),
(3, 5, 'It was ok. I can\'t complain. It was what I needed.', 6),
(4, 6, 'It was ok. I can\'t complain. It was what I needed.', 7),
(5, 10, 'Testing', 1),
(6, 8, 'Testing', 1),
(7, 10, 'Random review', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1702396126),
('m150214_044831_init_user', 1702396132);

-- --------------------------------------------------------

--
-- Estrutura da tabela `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Extraindo dados da tabela `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `created_at`, `updated_at`, `full_name`, `timezone`) VALUES
(1, 1, '2023-12-12 15:48:52', NULL, 'the one', NULL),
(6, 6, '2024-01-13 19:00:58', '2024-01-13 19:00:58', NULL, NULL),
(7, 7, '2024-01-13 19:01:53', '2024-01-13 19:01:53', 'senha123', NULL),
(8, 8, '2024-01-14 15:34:59', '2024-01-14 15:34:59', 'First_Name Second_Name', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `check_in_date` datetime NOT NULL,
  `check_out_date` datetime NOT NULL,
  `guests_number` int NOT NULL,
  `promotion` decimal(10,0) NOT NULL,
  `id_user` int NOT NULL,
  `id_room` int NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `fk_id_room_idx` (`id_room`),
  KEY `fk_reservation_id_user_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `check_in_date`, `check_out_date`, `guests_number`, `promotion`, `id_user`, `id_room`) VALUES
(1, '2024-01-14 16:03:53', '2024-01-14 16:03:53', 2, '0', 8, 1),
(2, '2024-01-14 00:00:00', '2024-01-16 00:00:00', 1, '1', 1, 1),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '1', 1, 1),
(4, '2024-01-14 00:00:00', '2024-01-14 00:00:00', 1, '0', 1, 1),
(5, '2024-02-01 00:00:00', '2024-02-14 00:00:00', 1, '0', 1, 3),
(6, '2024-01-14 00:00:00', '2024-01-14 00:00:00', 1, '0', 8, 6),
(7, '2024-01-14 00:00:00', '2024-01-14 00:00:00', 2, '0', 8, 2),
(8, '2024-01-15 00:00:00', '2024-01-15 00:00:00', 2, '0', 8, 6),
(9, '2024-01-15 00:00:00', '2024-01-15 00:00:00', 2, '0', 8, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `can_admin` smallint NOT NULL DEFAULT '0',
  `can_client` smallint NOT NULL DEFAULT '0',
  `can_staff` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Extraindo dados da tabela `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`, `can_admin`, `can_client`, `can_staff`) VALUES
(1, 'Admin', '2023-12-12 15:48:52', NULL, 1, 0, 0),
(2, 'Client', NULL, NULL, 0, 1, 0),
(3, 'Staff', NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `id_room` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `capacity` int NOT NULL,
  `price` float NOT NULL,
  `status` int NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `room`
--

INSERT INTO `room` (`id_room`, `name`, `type`, `capacity`, `price`, `status`, `description`) VALUES
(1, 'Room 1', 'Buget', 3, 400, 1, 'In ultricies fermentum aliquet. Pellentesque dui magna, condimentum non ullamcorper at, cursus in sem. Nunc condimentum, purus ac sagittis ultricies, metus leo pharetra mi, non vehicula felis elit et nisi. Etiam venenatis commodo libero, vel ullamcorper nibh lobortis vel. Aliquam auctor porta tortor, nec consequat nibh finibus a. Sed ultrices risus eget iaculis luctus. Mauris vel gravida magna.'),
(2, 'Room 2', 'Luxury', 2, 400, 1, 'In ultricies fermentum aliquet. Pellentesque dui magna, condimentum non ullamcorper at, cursus in sem. Nunc condimentum, purus ac sagittis ultricies, metus leo pharetra mi, non vehicula felis elit et nisi. Etiam venenatis commodo libero, vel ullamcorper nibh lobortis vel. Aliquam auctor porta tortor, nec consequat nibh finibus a. Sed ultrices risus eget iaculis luctus. Mauris vel gravida magna.'),
(3, 'Room 3', 'Expensive', 4, 800, 2, 'In ultricies fermentum aliquet. Pellentesque dui magna, condimentum non ullamcorper at, cursus in sem. Nunc condimentum, purus ac sagittis ultricies, metus leo pharetra mi, non vehicula felis elit et nisi. Etiam venenatis commodo libero, vel ullamcorper nibh lobortis vel. Aliquam auctor porta tortor, nec consequat nibh finibus a. Sed ultrices risus eget iaculis luctus. Mauris vel gravida magna.'),
(4, 'Room 4', 'Relaxing', 2, 500, 1, 'In ultricies fermentum aliquet. Pellentesque dui magna, condimentum non ullamcorper at, cursus in sem. Nunc condimentum, purus ac sagittis ultricies, metus leo pharetra mi, non vehicula felis elit et nisi. Etiam venenatis commodo libero, vel ullamcorper nibh lobortis vel. Aliquam auctor porta tortor, nec consequat nibh finibus a. Sed ultrices risus eget iaculis luctus. Mauris vel gravida magna.'),
(5, 'Room 5', 'Luxury', 2, 700, 1, 'In ultricies fermentum aliquet. Pellentesque dui magna, condimentum non ullamcorper at, cursus in sem. Nunc condimentum, purus ac sagittis ultricies, metus leo pharetra mi, non vehicula felis elit et nisi. Etiam venenatis commodo libero, vel ullamcorper nibh lobortis vel. Aliquam auctor porta tortor, nec consequat nibh finibus a. Sed ultrices risus eget iaculis luctus. Mauris vel gravida magna.'),
(6, 'Room 6', 'Expensive', 3, 750, 1, 'In ultricies fermentum aliquet. Pellentesque dui magna, condimentum non ullamcorper at, cursus in sem. Nunc condimentum, purus ac sagittis ultricies, metus leo pharetra mi, non vehicula felis elit et nisi. Etiam venenatis commodo libero, vel ullamcorper nibh lobortis vel. Aliquam auctor porta tortor, nec consequat nibh finibus a. Sed ultrices risus eget iaculis luctus. Mauris vel gravida magna.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `room_image`
--

DROP TABLE IF EXISTS `room_image`;
CREATE TABLE IF NOT EXISTS `room_image` (
  `id_room_image` int NOT NULL AUTO_INCREMENT,
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_room` int NOT NULL,
  PRIMARY KEY (`id_room_image`),
  KEY `fk_id_room_idx` (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `room_image`
--

INSERT INTO `room_image` (`id_room_image`, `path`, `id_room`) VALUES
(1, 'uploads/events1.jpg', 1),
(2, 'uploads/events2.jpg', 2),
(3, 'uploads/events3.jpg', 3),
(4, 'uploads/events4.jpg', 4),
(5, 'uploads/events5.jpg', 5),
(6, 'uploads/events6.jpg', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `status` smallint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `logged_in_ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `logged_in_at` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  `banned_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`email`),
  UNIQUE KEY `user_username` (`username`),
  KEY `user_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `role_id`, `status`, `email`, `username`, `password`, `auth_key`, `access_token`, `logged_in_ip`, `logged_in_at`, `created_ip`, `created_at`, `updated_at`, `banned_at`, `banned_reason`) VALUES
(1, 1, 1, 'neo@neo.com', 'neo', '$2y$13$dyVw4WkZGkABf2UrGWrhHO4ZmVBv.K4puhOL59Y9jQhIdj63TlV.O', 'nIE_iutZsTJEFZLw8MQVkRFEDD1fyJCe', 'bmyYtVpAIQHDu1TE2CJlulnHR71eqneU', '::1', '2024-01-14 23:27:03', NULL, '2023-12-12 15:48:52', NULL, NULL, NULL),
(6, 2, 1, 'teste@gmail.com', 'teste', '$2y$13$AoTegdLPejg.MKM3cnFgqe4BFh.hw08ycvXMOoYpn4feXmt7.VOTq', 'NN-mwTCZ8nZp-vVNWfMwmFb4cyUxyjqJ', 'teLg8eB1Q_d6ky1GcyTMFkI1pFdNScs8', '::1', '2024-01-14 22:45:48', '::1', '2024-01-13 19:00:58', '2024-01-13 19:00:58', NULL, NULL),
(7, 3, 1, 'staff1@gmail.com', 'staff1', '$2y$13$lse/yo6OHFFGoWm4uXqzzO9YR5TuPZ9GbJQG2t0EOur6LpXLH/ofu', NULL, NULL, '::1', '2024-01-14 23:27:52', NULL, '2024-01-13 19:01:53', '2024-01-13 19:02:22', NULL, NULL),
(8, 2, 1, 'user1@yahoo.com', 'user1', '$2y$13$wznU5bwI.WZJgYEpmzBM5OIhUPkfqGSS9.RTmZZeXNndHSgznfvDG', 'ELl1Kfp5QXIXUuu0sCa-LsoK8zksDtch', 'MjewpH0_JUnLDQHpJ8RT_52HFrP5Hs_0', '::1', '2024-01-14 22:47:41', '::1', '2024-01-14 15:34:59', '2024-01-14 15:34:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE IF NOT EXISTS `user_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `provider_attributes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_auth_provider_id` (`provider_id`),
  KEY `user_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_token`
--

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `type` smallint NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_token_token` (`token`),
  KEY `user_token_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `hotel_review`
--
ALTER TABLE `hotel_review`
  ADD CONSTRAINT `fk_hotel_review_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_id_room` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`),
  ADD CONSTRAINT `fk_reservation_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `room_image`
--
ALTER TABLE `room_image`
  ADD CONSTRAINT `fk_room_image_id_room` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`);

--
-- Limitadores para a tabela `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Limitadores para a tabela `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `user_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `user_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
