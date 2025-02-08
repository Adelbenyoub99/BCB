-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 08 fév. 2025 à 17:45
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bcb`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

DROP TABLE IF EXISTS `abonne`;
CREATE TABLE IF NOT EXISTS `abonne` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(50) NOT NULL,
  `mot_de_pass` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `adresse` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `num_tel` varchar(50) NOT NULL,
  `date_naiss` date NOT NULL,
  `type` varchar(50) NOT NULL,
  `paiementSF` tinyint(1) NOT NULL,
  `paiement` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `abonne`
--

INSERT INTO `abonne` (`id_utilisateur`, `nom_utilisateur`, `mot_de_pass`, `nom`, `prenom`, `genre`, `adresse`, `email`, `num_tel`, `date_naiss`, `type`, `paiementSF`, `paiement`) VALUES
(1, 'Abonné1', '0000', 'Abonné', '1', 'male', 'bejaia', 'abonne@gmail.com', '0123456789', '1999-10-14', 'abonne', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `bibliothecaire`
--

DROP TABLE IF EXISTS `bibliothecaire`;
CREATE TABLE IF NOT EXISTS `bibliothecaire` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(50) NOT NULL,
  `mot_de_pass` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adresse` varchar(150) NOT NULL,
  `num_tel` varchar(50) NOT NULL,
  `date_naiss` date NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bibliothecaire`
--

INSERT INTO `bibliothecaire` (`id_utilisateur`, `nom_utilisateur`, `mot_de_pass`, `nom`, `prenom`, `email`, `adresse`, `num_tel`, `date_naiss`) VALUES
(1, 'Bibliothécaire1', '0000', 'Bibliothécaire ', '1', 'bibliothécaire@gmail.com', 'bejaia', '0123456789', '1977-08-06');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `id_emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_restitution` date NOT NULL,
  `abonne` int(11) NOT NULL,
  `ouvrage` int(11) NOT NULL,
  PRIMARY KEY (`id_emprunt`),
  KEY `fk_id_abonne` (`abonne`),
  KEY `fk_id_ouvrage` (`ouvrage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gestionnaire`
--

DROP TABLE IF EXISTS `gestionnaire`;
CREATE TABLE IF NOT EXISTS `gestionnaire` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(50) NOT NULL,
  `mot_de_pass` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gestionnaire`
--

INSERT INTO `gestionnaire` (`id_utilisateur`, `nom_utilisateur`, `mot_de_pass`, `nom`, `prenom`) VALUES
(1, 'admin1', '0000', 'Admin', '1');

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

DROP TABLE IF EXISTS `ouvrage`;
CREATE TABLE IF NOT EXISTS `ouvrage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `auteur` varchar(255) DEFAULT NULL,
  `description` text,
  `annee` int(11) NOT NULL,
  `disponible` int(11) DEFAULT '1',
  `type` varchar(50) NOT NULL,
  `faculte` varchar(255) DEFAULT NULL,
  `promoteur` varchar(255) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `penalisation`
--

DROP TABLE IF EXISTS `penalisation`;
CREATE TABLE IF NOT EXISTS `penalisation` (
  `id_penalisation` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `abonne` int(11) NOT NULL,
  PRIMARY KEY (`id_penalisation`),
  KEY `fk_id_abonne` (`abonne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `abonne` int(11) NOT NULL,
  `ouvrage` int(11) NOT NULL,
  KEY `fk_id_abonne` (`abonne`),
  KEY `fk_id_ouvrage` (`ouvrage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
