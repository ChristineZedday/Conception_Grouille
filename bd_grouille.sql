-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 21 nov. 2019 à 15:54
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_grouille`
--

-- --------------------------------------------------------

--
-- Structure de la table `actus`
--

DROP TABLE IF EXISTS `actus`;
CREATE TABLE IF NOT EXISTS `actus` (
  `id_actu` int(5) NOT NULL AUTO_INCREMENT,
  `date_actu` date NOT NULL,
  `texte_actu` varchar(300) NOT NULL,
  `id_membre` int(5) NOT NULL,
  PRIMARY KEY (`id_actu`),
  KEY `fk_id_membre` (`id_membre`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires_actu`
--

DROP TABLE IF EXISTS `commentaires_actu`;
CREATE TABLE IF NOT EXISTS `commentaires_actu` (
  `id_commentaire_actu` int(5) NOT NULL AUTO_INCREMENT,
  `id_membre` int(5) NOT NULL,
  `id_actu` int(5) NOT NULL,
  PRIMARY KEY (`id_commentaire_actu`),
  KEY `id_membre` (`id_membre`),
  KEY `id_actu` (`id_actu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires_recettes`
--

DROP TABLE IF EXISTS `commentaires_recettes`;
CREATE TABLE IF NOT EXISTS `commentaires_recettes` (
  `id_commentaire_recette` int(5) NOT NULL AUTO_INCREMENT,
  `id_recette` int(5) NOT NULL,
  `id_membre` int(5) NOT NULL,
  PRIMARY KEY (`id_commentaire_recette`),
  KEY `fk_id_recette` (`id_recette`) USING BTREE,
  KEY `fk_id_membre` (`id_membre`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `faq_questions`
--

DROP TABLE IF EXISTS `faq_questions`;
CREATE TABLE IF NOT EXISTS `faq_questions` (
  `id_faq_question` int(5) NOT NULL AUTO_INCREMENT,
  `faq_date` date NOT NULL,
  `faq_texte` text NOT NULL,
  `id_membre` int(5) NOT NULL,
  PRIMARY KEY (`id_faq_question`),
  KEY `id_membre` (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `faq_reponses`
--

DROP TABLE IF EXISTS `faq_reponses`;
CREATE TABLE IF NOT EXISTS `faq_reponses` (
  `id_faq_reponse` int(5) NOT NULL AUTO_INCREMENT,
  `id_membre` int(5) NOT NULL,
  `faq_reponse_texte` varchar(300) NOT NULL,
  `id_faq_question` int(5) NOT NULL,
  PRIMARY KEY (`id_faq_reponse`),
  KEY `id_membre` (`id_membre`),
  KEY `id_faq_question` (`id_faq_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `image_sujet`
--

DROP TABLE IF EXISTS `image_sujet`;
CREATE TABLE IF NOT EXISTS `image_sujet` (
  `id_image` int(5) NOT NULL AUTO_INCREMENT,
  `id_recette` int(5) DEFAULT NULL,
  `id_actu` int(5) DEFAULT NULL,
  `id_img_insecte` int(5) NOT NULL,
  PRIMARY KEY (`id_image`),
  KEY `id_pic_insecte` (`id_img_insecte`),
  KEY `id_actu` (`id_actu`),
  KEY `id_recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id_ingredient` int(5) NOT NULL AUTO_INCREMENT,
  `titre_ingredient` varchar(30) NOT NULL,
  `id_insecte` int(5) NOT NULL,
  `id_saison` int(5) NOT NULL,
  PRIMARY KEY (`id_ingredient`),
  KEY `id_insecte` (`id_insecte`),
  KEY `id_saison` (`id_saison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ingredients_recettes`
--

DROP TABLE IF EXISTS `ingredients_recettes`;
CREATE TABLE IF NOT EXISTS `ingredients_recettes` (
  `id_ingredient_recette` int(5) NOT NULL AUTO_INCREMENT,
  `id_ingredient` int(5) NOT NULL,
  `id_recette` int(5) NOT NULL,
  `quantite` float NOT NULL,
  `id_unite` int(5) NOT NULL,
  PRIMARY KEY (`id_ingredient_recette`),
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_recette` (`id_recette`),
  KEY `id_unite` (`id_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `insectes`
--

DROP TABLE IF EXISTS `insectes`;
CREATE TABLE IF NOT EXISTS `insectes` (
  `id_insecte` int(5) NOT NULL AUTO_INCREMENT,
  `nom_insecte` varchar(255) NOT NULL,
  `nom_latin_insecte` varchar(255) NOT NULL,
  `ordre_insecte` varchar(255) NOT NULL,
  `description_insecte` text NOT NULL,
  PRIMARY KEY (`id_insecte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id_membre` int(5) NOT NULL AUTO_INCREMENT,
  `nom_membre` varchar(30) NOT NULL,
  `prenom_membre` varchar(30) NOT NULL,
  `e-mail_membre` varchar(40) NOT NULL,
  `pseudo_membre` varchar(20) NOT NULL,
  `mot_de_passe_membre` varchar(10) NOT NULL,
  `acces_bo_membre` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
CREATE TABLE IF NOT EXISTS `recettes` (
  `id_recette` int(5) NOT NULL AUTO_INCREMENT,
  `titre_recette` varchar(30) NOT NULL,
  `id_membre` int(5) NOT NULL,
  `description_recette` varchar(100) NOT NULL,
  `temps_preparation_recette` int(4) NOT NULL,
  `temps_cuisson_recette` int(4) NOT NULL,
  `difficulte_recette` int(5) NOT NULL,
  `deroule_recette` varchar(500) NOT NULL,
  `appetence` varchar(3) NOT NULL,
  `portions_recette` int(11) NOT NULL,
  PRIMARY KEY (`id_recette`),
  KEY `id_membre` (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

DROP TABLE IF EXISTS `saison`;
CREATE TABLE IF NOT EXISTS `saison` (
  `id_saison` int(1) NOT NULL AUTO_INCREMENT,
  `nom_saison` varchar(30) NOT NULL,
  PRIMARY KEY (`id_saison`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `saison`
--

INSERT INTO `saison` (`id_saison`, `nom_saison`) VALUES
(1, 'Printemps'),
(2, 'Eté'),
(3, 'Automne'),
(4, 'Hiver');

-- --------------------------------------------------------

--
-- Structure de la table `sites_partenaires`
--

DROP TABLE IF EXISTS `sites_partenaires`;
CREATE TABLE IF NOT EXISTS `sites_partenaires` (
  `id_site_partenaire` int(5) NOT NULL AUTO_INCREMENT,
  `e_mail_site_partenaire` varchar(30) NOT NULL,
  `titre_site_partenaire` varchar(30) NOT NULL,
  `logo_partenaire` varchar(300) NOT NULL,
  PRIMARY KEY (`id_site_partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `unites_ingredients`
--

DROP TABLE IF EXISTS `unites_ingredients`;
CREATE TABLE IF NOT EXISTS `unites_ingredients` (
  `id_unite` int(5) NOT NULL AUTO_INCREMENT,
  `nom_unite` varchar(30) NOT NULL,
  PRIMARY KEY (`id_unite`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `unites_ingredients`
--

INSERT INTO `unites_ingredients` (`id_unite`, `nom_unite`) VALUES
(1, 'gramme'),
(2, 'kilogramme'),
(3, 'litre'),
(4, 'centilitre'),
(5, 'cuillère à café'),
(6, '1/2 cuillère à café'),
(7, 'cuillère à soupe'),
(8, '1/2 cuillère à soupe'),
(9, 'pincée');

-- --------------------------------------------------------

--
-- Structure de la table `ustensiles`
--

DROP TABLE IF EXISTS `ustensiles`;
CREATE TABLE IF NOT EXISTS `ustensiles` (
  `id_ustensile` int(5) NOT NULL AUTO_INCREMENT,
  `titre_ustensile` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ustensile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ustensile_recette`
--

DROP TABLE IF EXISTS `ustensile_recette`;
CREATE TABLE IF NOT EXISTS `ustensile_recette` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_ustensile` int(5) NOT NULL,
  `id_recette` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ustensile` (`id_ustensile`),
  KEY `id_recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actus`
--
ALTER TABLE `actus`
  ADD CONSTRAINT `actus_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`);

--
-- Contraintes pour la table `commentaires_actu`
--
ALTER TABLE `commentaires_actu`
  ADD CONSTRAINT `commentaires_actu_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`),
  ADD CONSTRAINT `commentaires_actu_ibfk_2` FOREIGN KEY (`id_actu`) REFERENCES `actus` (`id_actu`);

--
-- Contraintes pour la table `commentaires_recettes`
--
ALTER TABLE `commentaires_recettes`
  ADD CONSTRAINT `commentaires_recettes_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`);

--
-- Contraintes pour la table `faq_questions`
--
ALTER TABLE `faq_questions`
  ADD CONSTRAINT `faq_questions_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`);

--
-- Contraintes pour la table `faq_reponses`
--
ALTER TABLE `faq_reponses`
  ADD CONSTRAINT `faq_reponses_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`),
  ADD CONSTRAINT `faq_reponses_ibfk_2` FOREIGN KEY (`id_faq_question`) REFERENCES `faq_questions` (`id_faq_question`);

--
-- Contraintes pour la table `image_sujet`
--
ALTER TABLE `image_sujet`
  ADD CONSTRAINT `image_sujet_ibfk_1` FOREIGN KEY (`id_actu`) REFERENCES `actus` (`id_actu`),
  ADD CONSTRAINT `image_sujet_ibfk_2` FOREIGN KEY (`id_img_insecte`) REFERENCES `insectes` (`id_insecte`),
  ADD CONSTRAINT `image_sujet_ibfk_3` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`);

--
-- Contraintes pour la table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`id_insecte`) REFERENCES `insectes` (`id_insecte`),
  ADD CONSTRAINT `ingredients_ibfk_2` FOREIGN KEY (`id_saison`) REFERENCES `saison` (`id_saison`);

--
-- Contraintes pour la table `ingredients_recettes`
--
ALTER TABLE `ingredients_recettes`
  ADD CONSTRAINT `ingredients_recettes_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id_ingredient`),
  ADD CONSTRAINT `ingredients_recettes_ibfk_2` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`),
  ADD CONSTRAINT `ingredients_recettes_ibfk_3` FOREIGN KEY (`id_unite`) REFERENCES `unites_ingredients` (`id_unite`);

--
-- Contraintes pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD CONSTRAINT `recettes_ibfk_2` FOREIGN KEY (`id_membre`) REFERENCES `membres` (`id_membre`);

--
-- Contraintes pour la table `ustensile_recette`
--
ALTER TABLE `ustensile_recette`
  ADD CONSTRAINT `ustensile_recette_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ustensile_recette_ibfk_2` FOREIGN KEY (`id_ustensile`) REFERENCES `ustensiles` (`id_ustensile`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
