-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 09 Novembre 2017 à 17:15
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cplay`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publishedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `game_id`, `content`, `publishedAt`) VALUES
(1, 1, 3, 'Super jeu', '2017-11-01 10:11:00'),
(2, 1, 3, 'Meilleur jeu de l''univers', '2017-09-06 12:27:00'),
(3, 1, 2, 'Pas mal ', '2017-11-04 06:12:00'),
(5, 1, 2, 'Au top', '2017-11-04 21:33:11');

-- --------------------------------------------------------

--
-- Structure de la table `developer`
--

CREATE TABLE `developer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `developer`
--

INSERT INTO `developer` (`id`, `name`) VALUES
(2, 'Blizzard Entertainment'),
(3, 'Bluehole, Inc.'),
(4, 'Psyonix'),
(5, 'Ubisoft'),
(6, 'Frictional Games'),
(7, 'Davilex'),
(8, 'Quantic Dream');

-- --------------------------------------------------------

--
-- Structure de la table `editor`
--

CREATE TABLE `editor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `editor`
--

INSERT INTO `editor` (`id`, `name`) VALUES
(2, 'Blizzard Entertainment'),
(3, 'Bluehole, Inc.'),
(4, 'Psyonix'),
(5, 'Ubisoft'),
(6, 'Frictional Games'),
(7, 'Davilex'),
(8, 'Sony Entertainment');

-- --------------------------------------------------------

--
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://ctoc.consostatic.com/images/media/demande/large/000/158/561/recherche-consoles-et-jeux-videos.jpg?1502975150',
  `type_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date DEFAULT NULL,
  `press_review` float DEFAULT NULL,
  `player_review` float DEFAULT NULL,
  `developer_id` int(11) NOT NULL,
  `editor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `games`
--

INSERT INTO `games` (`id`, `name`, `picture`, `type_id`, `description`, `release_date`, `press_review`, `player_review`, `developer_id`, `editor_id`) VALUES
(2, 'Overwatch', 'http://image.jeuxvideo.com/medias-sm/145763/1457626578-574-jaquette-avant.png', 3, 'Jeu d''action en vue à la première personne, Overwatch prend place dans un futur proche, en 2074 pour être exact. Dans des parties en 6 contre 6, le joueur incarne un héros parmi la palette proposée. Chaque personnage a des caractéristiques et des capacités particulières et un rôle défini parmi Attaque, Défense, Tank et Soutien. Les équipes cherchent donc un équilibre afin d''être le plus efficace possible dans l''accomplissement des objectifs.', '2016-05-24', 17, 15, 2, 2),
(3, 'Rocket League', 'https://rocketleague.media.zestyio.com/boxart_comp1.f1cb27a519bdb5b6ed34049a5b86e317.jpg', 5, 'Jeu d''action et de sport, Rocket League vous plonge dans dans des matchs d\\''arène où votre but sera de marquer des buts. Vous pourrez mettre au point différentes tactiques, soit éviter les attaques des joueurs ennemis pour aller marquer, soit démolir la défense.', '2015-07-07', 16, 17, 4, 4),
(4, 'Detroit : Become Human', 'public/data/media_5518412454.jpg', 8, 'Prochain jeu de Quantic Dream, Detroit : Become Human semble être un film interactif à la manière des derniers projets de David Cage. Dans celui-ci, le joueur semble pouvoir incarner Connor ou Kara, et l''ensemble de l''histoire se déroulera dans la ville de Detroit, devenue le centre névralgique de la production d''androïdes. Ces derniers se contentent pour la plupart de s''employer à effectuer les tâches pour lesquelles ils ont été créés. Toutefois, leur présence ne fait pas l''unanimité et certains individus estiment que ces être mécaniques volent le travail des humain.', NULL, NULL, NULL, 8, 8),
(5, 'Heavy Rain', 'http://image.jeuxvideo.com/images-sm/jaquettes/00016381/jaquette-heavy-rain-playstation-3-ps3-cover-avant-g.jpg', 8, 'Heavy Rain sur Playstation 3 est un jeu d''aventure. Vous incarnez 4 personnages différents ayant tous un lien avec le tueur à l''Origami. Chacun tente d''enquêter sur l''identité du criminel. Le jeu se présente sous la forme de phases d''exploration et d''actions durant lesquelles le joueur doit réaliser des actions contextuelles pour effectuer ses actions. Le titre autorise un choix conséquent d''actions ce qui permet quasiment d''agir dans le jeu comme dans la réalité.', '2010-02-24', NULL, 17, 8, 8),
(6, 'Amnesia : The Dark Descent', 'public/data/media_59fcfc1a79143.jpg', 7, 'Amnesia : The Dark Descent est un jeu d''action horrifique à la première personne sur PC se déroulant au XVIIIe siècle dans les entrailles d''un vieux château. Une gestion de la physique importante ainsi que la possibilité d''éditer tous les niveaux du jeu à sa convenance grâce à des outils avancés offrent une grande liberté au joueur.', '2010-09-08', 15, 17, 6, 6),
(8, 'Call of Duty : WWII', 'public/data/media_5a005a7d51bf6.jpg', 3, 'Description : Call of Duty : WWII est le nouveau jeu d''action FPS du studio Sledgehammer Games. Pour ce nouvel opus, les développeurs ont opéré un retour aux sources de la saga en traitant la période historique de la Seconde Guerre mondiale. Cette fois-ci, exit les conflits futuristes et manichéens et place à un traitement plus réaliste et viscéral de ce conflit qui a chamboulé le monde entier.', '2017-11-01', 17, 13, 2, 2),
(9, 'regsddfsgfg', 'public/data/media_5a006355bdf63.jpg', 1, 'Call of Duty : WWII est le nouveau jeu d''action FPS du studio Sledgehammer Games. Pour ce nouvel opus, les développeurs ont opéré un retour aux sources de la saga en traitant la période historique de la Seconde Guerre mondiale. Cette fois-ci, exit les conflits futuristes et manichéens et place à un traitement plus réaliste et viscéral de ce conflit qui a chamboulé le monde entier.', '2017-11-06', 12, 11, 2, 2),
(20, ' Dragon Ball FighterZ', 'public/data/media_5a0068fe62f09.png', 5, 'Description : Dragon Ball FighterZ est un jeu de combat 2D développé par Arc System Works et édité par Bandai Namco. Cette nouvelle adaptation de la franchise Dragon Ball met en scène les personnages iconiques de la série dans des affrontements explosifs en 3 versus 3.', '2017-11-06', 14, 13, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `games_type`
--

CREATE TABLE `games_type` (
  `id` int(11) NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `games_type`
--

INSERT INTO `games_type` (`id`, `genre`) VALUES
(1, 'Action'),
(2, 'RPG'),
(3, 'FPS'),
(4, 'MMO'),
(5, 'Sport'),
(6, 'Adulte'),
(7, 'Horreur'),
(8, 'Aventure');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `premium` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `contest_time` datetime DEFAULT NULL,
  `reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_expire` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `premium`, `admin`, `contest_time`, `reset_token`, `reset_expire`) VALUES
(1, 'Meco', 'hello@rdelbaere.fr', 'UnMotDePasseTrèsSecrectPersonneNePourraLeTrouverMemeJeRisqueDavoirDuMalAMenSouvenir', 1, 1, '2017-11-07 13:01:57', NULL, NULL),
(6, 'dsfsgfdgsd', 'fdqsgfdsgdfg', '$2y$10$tB6lJ2yemyeVljZiGFbEV.EpHOY1EjVOzx0tXVkWHsYPXEuzYH..i', 0, 0, NULL, NULL, NULL),
(7, 'lambor56', 'francois.lamboray@gmail.com', '$2y$10$hz06ulJx9/F5fiqbFbCOv.R5FC6zO9ObB0hO/G3logdz9TC/i4VHm', 1, 1, NULL, '6f9d4e10464daed996876f7e8edb54c1', '2017-11-10 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `users_game`
--

CREATE TABLE `users_game` (
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `users_game`
--

INSERT INTO `users_game` (`game_id`, `user_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(8, 1),
(9, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_fk0` (`user_id`),
  ADD KEY `comment_fk1` (`game_id`);

--
-- Index pour la table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `editor`
--
ALTER TABLE `editor`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_fk0` (`type_id`),
  ADD KEY `developer_id` (`developer_id`),
  ADD KEY `editor_id` (`editor_id`);

--
-- Index pour la table `games_type`
--
ALTER TABLE `games_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `users_game`
--
ALTER TABLE `users_game`
  ADD PRIMARY KEY (`game_id`,`user_id`),
  ADD KEY `users_game_fk0` (`game_id`),
  ADD KEY `users_game_fk1` (`user_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `developer`
--
ALTER TABLE `developer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `editor`
--
ALTER TABLE `editor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `games_type`
--
ALTER TABLE `games_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_fk1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`);

--
-- Contraintes pour la table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_fk0` FOREIGN KEY (`type_id`) REFERENCES `games_type` (`id`),
  ADD CONSTRAINT `games_fk1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`),
  ADD CONSTRAINT `games_fk2` FOREIGN KEY (`editor_id`) REFERENCES `editor` (`id`);

--
-- Contraintes pour la table `users_game`
--
ALTER TABLE `users_game`
  ADD CONSTRAINT `users_game_fk0` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `users_game_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
