-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 04 Janvier 2019 à 13:47
-- Version du serveur :  5.7.24-0ubuntu0.18.10.1
-- Version de PHP :  7.2.10-0ubuntu1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Sourcing_TEST_1`
--

-- --------------------------------------------------------

--
-- Structure de la table `ADRESSE`
--

CREATE TABLE `ADRESSE` (
  `Id_Adresse` int(11) NOT NULL,
  `Num_Adresse` int(11) NOT NULL,
  `Voie_Adresse` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Dep_Adresse` int(11) NOT NULL,
  `Ville_Adresse` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `ADRESSE`
--

INSERT INTO `ADRESSE` (`Id_Adresse`, `Num_Adresse`, `Voie_Adresse`, `Dep_Adresse`, `Ville_Adresse`) VALUES
(1, 216, 'rue de la mare a gondre', 77000, 'Vaux le penil');

-- --------------------------------------------------------

--
-- Structure de la table `CANDIDAT_CV`
--

CREATE TABLE `CANDIDAT_CV` (
  `Id_Cv` int(11) NOT NULL,
  `Ficher_Cv` varchar(200) CHARACTER SET latin1 NOT NULL,
  `Titre_Cv` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Description_Cv` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `CV_EXPERIENCE`
--

CREATE TABLE `CV_EXPERIENCE` (
  `Id_CvE` int(11) NOT NULL,
  `Experience_CvE` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Entreprise_CvE` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Fonction_CvE` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Date_Debut_CvE` date NOT NULL,
  `Date_Fin_Cve` date NOT NULL,
  `Description_CvE` varchar(200) CHARACTER SET latin1 NOT NULL,
  `Id_Cv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `CV_FORMATION`
--

CREATE TABLE `CV_FORMATION` (
  `Id_Formation` int(11) NOT NULL,
  `Cv_Formation` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Ecole_Formation` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Date_Debut_Formation` date NOT NULL,
  `Date_Fin_Formation` date NOT NULL,
  `Description_Formation` varchar(200) CHARACTER SET latin1 NOT NULL,
  `Id_Cv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `OFFRES`
--

CREATE TABLE `OFFRES` (
  `Id_Offre` int(11) NOT NULL,
  `Description_Offre` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Date_Debut_Offre` date NOT NULL,
  `Date_Fin_Offre` date NOT NULL,
  `Remuneration_Offre` int(11) NOT NULL,
  `Remuneration_Type_Offre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Titre_Offre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Id_Adresse` int(11) NOT NULL,
  `Id_OffreT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `OFFRES_TYPE`
--

CREATE TABLE `OFFRES_TYPE` (
  `Id_OffreT` int(11) NOT NULL,
  `Type_OffreT` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `POSTULER`
--

CREATE TABLE `POSTULER` (
  `Id_Offre` int(11) NOT NULL,
  `Id_Utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `TYPE_U`
--

CREATE TABLE `TYPE_U` (
  `Id_Type` int(11) NOT NULL,
  `Utilisateur_Type` int(11) NOT NULL,
  `Description_Type` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `TYPE_U`
--

INSERT INTO `TYPE_U` (`Id_Type`, `Utilisateur_Type`, `Description_Type`) VALUES
(1, 0, 'ADMIN'),
(2, 1, 'INTERNE');

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEUR`
--

CREATE TABLE `UTILISATEUR` (
  `Id_Utilisateur` int(11) NOT NULL,
  `Nom_Utilisateur` varchar(50) CHARACTER SET latin1 NOT NULL,
  `PNom_Utilisateur` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Mail_Utilisateur` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Mdp_Utilisateur` text CHARACTER SET latin1 NOT NULL,
  `Id_Adresse` int(11) NOT NULL,
  `Id_Offre` int(11) DEFAULT NULL,
  `Id_Offre_OFFRES` int(11) DEFAULT NULL,
  `Id_Type` int(11) DEFAULT NULL,
  `Id_Cv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `UTILISATEUR`
--

INSERT INTO `UTILISATEUR` (`Id_Utilisateur`, `Nom_Utilisateur`, `PNom_Utilisateur`, `Mail_Utilisateur`, `Mdp_Utilisateur`, `Id_Adresse`, `Id_Offre`, `Id_Offre_OFFRES`, `Id_Type`, `Id_Cv`) VALUES
(1, 'dr', 'drg', 'bak77200@gmail.com', 'yg', 1, NULL, NULL, NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ADRESSE`
--
ALTER TABLE `ADRESSE`
  ADD PRIMARY KEY (`Id_Adresse`);

--
-- Index pour la table `CANDIDAT_CV`
--
ALTER TABLE `CANDIDAT_CV`
  ADD PRIMARY KEY (`Id_Cv`);

--
-- Index pour la table `CV_EXPERIENCE`
--
ALTER TABLE `CV_EXPERIENCE`
  ADD PRIMARY KEY (`Id_CvE`),
  ADD KEY `_CV_EXPERIENCE_CANDIDAT_CV_FK` (`Id_Cv`);

--
-- Index pour la table `CV_FORMATION`
--
ALTER TABLE `CV_FORMATION`
  ADD PRIMARY KEY (`Id_Formation`),
  ADD KEY `CV_FORMATION_CANDIDAT_CV_FK` (`Id_Cv`);

--
-- Index pour la table `OFFRES`
--
ALTER TABLE `OFFRES`
  ADD PRIMARY KEY (`Id_Offre`),
  ADD UNIQUE KEY `OFFRES_ADRESSE_AK` (`Id_Adresse`),
  ADD KEY `OFFRES_OFFRES_TYPE0_FK` (`Id_OffreT`);

--
-- Index pour la table `OFFRES_TYPE`
--
ALTER TABLE `OFFRES_TYPE`
  ADD PRIMARY KEY (`Id_OffreT`);

--
-- Index pour la table `POSTULER`
--
ALTER TABLE `POSTULER`
  ADD PRIMARY KEY (`Id_Offre`,`Id_Utilisateur`),
  ADD KEY `POSTULER_UTILISATEUR0_FK` (`Id_Utilisateur`);

--
-- Index pour la table `TYPE_U`
--
ALTER TABLE `TYPE_U`
  ADD PRIMARY KEY (`Id_Type`);

--
-- Index pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD PRIMARY KEY (`Id_Utilisateur`),
  ADD UNIQUE KEY `UTILISATEUR_ADRESSE_AK` (`Id_Adresse`),
  ADD KEY `UTILISATEUR_OFFRES0_FK` (`Id_Offre`),
  ADD KEY `UTILISATEUR_OFFRES1_FK` (`Id_Offre_OFFRES`),
  ADD KEY `UTILISATEUR_TYPE_U2_FK` (`Id_Type`),
  ADD KEY `UTILISATEUR_CANDIDAT_CV3_FK` (`Id_Cv`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ADRESSE`
--
ALTER TABLE `ADRESSE`
  MODIFY `Id_Adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `CANDIDAT_CV`
--
ALTER TABLE `CANDIDAT_CV`
  MODIFY `Id_Cv` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `CV_EXPERIENCE`
--
ALTER TABLE `CV_EXPERIENCE`
  MODIFY `Id_CvE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `CV_FORMATION`
--
ALTER TABLE `CV_FORMATION`
  MODIFY `Id_Formation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `OFFRES`
--
ALTER TABLE `OFFRES`
  MODIFY `Id_Offre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `OFFRES_TYPE`
--
ALTER TABLE `OFFRES_TYPE`
  MODIFY `Id_OffreT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `TYPE_U`
--
ALTER TABLE `TYPE_U`
  MODIFY `Id_Type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  MODIFY `Id_Utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `CV_EXPERIENCE`
--
ALTER TABLE `CV_EXPERIENCE`
  ADD CONSTRAINT `_CV_EXPERIENCE_CANDIDAT_CV_FK` FOREIGN KEY (`Id_Cv`) REFERENCES `CANDIDAT_CV` (`Id_Cv`);

--
-- Contraintes pour la table `CV_FORMATION`
--
ALTER TABLE `CV_FORMATION`
  ADD CONSTRAINT `CV_FORMATION_CANDIDAT_CV_FK` FOREIGN KEY (`Id_Cv`) REFERENCES `CANDIDAT_CV` (`Id_Cv`);

--
-- Contraintes pour la table `OFFRES`
--
ALTER TABLE `OFFRES`
  ADD CONSTRAINT `OFFRES_ADRESSE_FK` FOREIGN KEY (`Id_Adresse`) REFERENCES `ADRESSE` (`Id_Adresse`),
  ADD CONSTRAINT `OFFRES_OFFRES_TYPE0_FK` FOREIGN KEY (`Id_OffreT`) REFERENCES `OFFRES_TYPE` (`Id_OffreT`);

--
-- Contraintes pour la table `POSTULER`
--
ALTER TABLE `POSTULER`
  ADD CONSTRAINT `POSTULER_OFFRES_FK` FOREIGN KEY (`Id_Offre`) REFERENCES `OFFRES` (`Id_Offre`),
  ADD CONSTRAINT `POSTULER_UTILISATEUR0_FK` FOREIGN KEY (`Id_Utilisateur`) REFERENCES `UTILISATEUR` (`Id_Utilisateur`);

--
-- Contraintes pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD CONSTRAINT `UTILISATEUR_ADRESSE_FK` FOREIGN KEY (`Id_Adresse`) REFERENCES `ADRESSE` (`Id_Adresse`),
  ADD CONSTRAINT `UTILISATEUR_CANDIDAT_CV3_FK` FOREIGN KEY (`Id_Cv`) REFERENCES `CANDIDAT_CV` (`Id_Cv`),
  ADD CONSTRAINT `UTILISATEUR_OFFRES0_FK` FOREIGN KEY (`Id_Offre`) REFERENCES `OFFRES` (`Id_Offre`),
  ADD CONSTRAINT `UTILISATEUR_OFFRES1_FK` FOREIGN KEY (`Id_Offre_OFFRES`) REFERENCES `OFFRES` (`Id_Offre`),
  ADD CONSTRAINT `UTILISATEUR_TYPE_U2_FK` FOREIGN KEY (`Id_Type`) REFERENCES `TYPE_U` (`Id_Type`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
