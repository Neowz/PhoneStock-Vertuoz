-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 23 fév. 2022 à 15:16
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `vertuozTest`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220223075421', '2022-02-23 07:54:40', 114);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_limit` int(11) NOT NULL,
  `update_datetime` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `model`
--

INSERT INTO `model` (`id`, `brand`, `name`, `creation_year`, `description`, `stock_limit`, `update_datetime`, `active`) VALUES
(1, 'Apple', 'Iphone 13 mini', '2021', 'L’iPhone 13 et l’iPhone 13 mini ont été entièrement repensés. Ils sont proposés en cinq superbes coloris dans un design aux bords plats très résistant avec un élégant cadre en aluminium gris', 0, '2022-02-23 14:35:25', 1),
(2, 'Samsung', 'Galaxy S7', '2016', '', 0, '2022-02-23 09:17:24', 1),
(3, 'Apple', 'Iphone 13', '2021', '', 0, '2022-02-23 09:18:35', 1),
(4, 'Apple', 'Iphone 11', '2019', 'L\'iphone cher as fuck', 3, '2022-02-23 10:45:21', 1),
(5, 'Sony', 'Xperia Z2', '2014', 'Le Sony Xperia Z2 embarque un processeur quad-core Qualcomm Snapdragon 801, cadencé à 2,3 GHz et accompagné par 3 Go de mémoire vive (RAM) et 16 Go de mémoire interne. Ce processeur à 4 cœurs sophistiqué est 75 % plus rapide que le S4 Pro.', 5, '2022-02-23 14:48:50', 1);

-- --------------------------------------------------------

--
-- Structure de la table `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `imei` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone`
--

INSERT INTO `phone` (`id`, `model_id`, `imei`, `active`) VALUES
(1, 1, '993535005861913', 1),
(2, 2, '353452103560906', 1),
(3, 3, '015233623511466', 1),
(4, 1, '989034244462713', 1),
(5, 1, '515559182044696', 1),
(6, 1, '355263653378567', 1),
(7, 2, '519626417667918', 1),
(8, 1, '519888524979350', 1),
(9, 1, '519888524979358', 1),
(10, 1, '519888524979354', 1),
(11, 1, '519888524979351', 1),
(12, 1, '519888524979852', 1),
(13, 2, '519626417667841', 1),
(14, 2, '519626417667874', 1),
(15, 2, '519626417667875', 1),
(16, 2, '519626417667741', 1),
(17, 2, '519626417667785', 1),
(18, 2, '519626417667963', 1),
(19, 3, '015233623511856', 1),
(20, 3, '015233623511853', 1),
(21, 3, '015233623511840', 1),
(22, 3, '015233623511820', 1),
(23, 5, '518272823070552', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_444F97DD7975B7E7` (`model_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `FK_444F97DD7975B7E7` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);

