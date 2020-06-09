-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 09 juin 2020 à 07:25
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion`
--

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `adress` varchar(80) NOT NULL,
  `num` int(10) NOT NULL,
  `master_Internship` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `adress`, `num`, `master_Internship`) VALUES
(2, 'Bla', 'Bli', 'Blu', 0, 0),
(3, 'Bim', 'Bam', 'Boom', 987654321, 1),
(6, 'Papa', 'Pat', '82 rue hubert de lisles', 0, 0),
(10, 'Maman', 'Flo', '1 RUE DE LA MAISON', 987654321, 0),
(13, 'Mathilde', 'Ex : Mariakdk', 'Ex : Payetdze', 435219876, 1),
(14, 'RAZAFIMAHATRATRA', 'Mathilde', 'AILFNZIJPjpjefse', 987654321, 0),
(16, 'bob', 'leponge', 'rdezfz', 987654321, 0),
(20, 'fefeferari', 'ekhfkjf', '', 34567890, 1),
(24, 'toto', 'slfojspdf', '', 987654321, 0),
(25, 'Moi', 'MOII', '', 987654321, 0),
(26, 'toto', 'slfojspdf', '', 987654321, 0),
(27, 'Raza', 'PIJDPJ', '', 987654321, 0),
(28, 'dfsqf', 'fs', 'fd', 987654321, 1),
(29, 'leo', 'fs', 'fd', 987654321, 1);

--
-- Déclencheurs `employee`
--
DROP TRIGGER IF EXISTS `BEFORE_DELETE`;
DELIMITER $$
CREATE TRIGGER `BEFORE_DELETE` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN 
INSERT INTO historique(id,first_name,last_name,adress,num,event_histo) VALUES (old.id,old.first_name,old.last_name,old.adress,old.num,"DELETE");
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `BEFORE_UPDATE`;
DELIMITER $$
CREATE TRIGGER `BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN 
INSERT INTO historique(id,first_name,last_name,adress,num,event_histo) VALUES (old.id,old.first_name,old.last_name,old.adress,old.num,"UPDATE");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

DROP TABLE IF EXISTS `historique`;
CREATE TABLE IF NOT EXISTS `historique` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `adress` varchar(80) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `event_histo` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `historique`
--

INSERT INTO `historique` (`id`, `first_name`, `last_name`, `adress`, `num`, `event_histo`) VALUES
(12, 'sdfg', 'KDDK', 'qsd', 987654321, 'UPDATE'),
(12, 'sdfg', 'KDDK', 'qsd', 987654321, 'DELETE'),
(11, 'ze', 'aze', 'ZSDE', 987654321, 'DELETE'),
(12, 'Ryan', 'Lauret', 'Plaine des gregues', 692346587, 'DELETE'),
(3, 'Bim', 'Bam', 'Boom', 987654321, 'UPDATE'),
(13, 'Mathilde', 'Ex : Mariakdk', 'Ex : Payetdze', 435219876, 'UPDATE'),
(23, 'dclskddfsoijs', 'WDFLSI', '', 987654321, 'DELETE'),
(22, ' dgfgfgf', 'dsfllksf', '', 987654321, 'DELETE'),
(21, 'fefeferari', 'ekhfkjf', '', 34567890, 'DELETE'),
(19, 'zddddz', 'sdsdsd', '', 1234567890, 'DELETE'),
(18, 'fghjgfdsghjgftdf', 'dsfijdsjpj', '', 987654321, 'DELETE'),
(17, 'fghjgfdsghjgftdf', 'dsfijdsjpj', '', 987654321, 'DELETE'),
(15, 'resrsdf', 'zeqe', 'ezqe', 987654321, 'DELETE');

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

DROP TABLE IF EXISTS `stagiaire`;
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Institution` varchar(80) DEFAULT NULL,
  `master_Internship_stag` varchar(80) DEFAULT NULL,
  `idEmp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idEmp` (`idEmp`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stagiaire`
--

INSERT INTO `stagiaire` (`id`, `StartDate`, `EndDate`, `Institution`, `master_Internship_stag`, `idEmp`) VALUES
(1, '2020-06-03', '2020-06-19', 'Pierre Poivre', 'Mathilde', 2),
(4, '2020-06-04', '2020-06-04', 'odsp', 'Mathilde', 27);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
