-- =============================================================================
-- PROJET BASE DE DONNEES : MEDIATHEQUE MUNICIPALE
-- Script 01 : Création de la base et structure des tables (DDL)
-- Auteur : Tom Vernier-Fétu
-- =============================================================================

DROP DATABASE IF EXISTS mediatheque;
CREATE DATABASE mediatheque CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE mediatheque;

-- 1. Table des catégories d'ouvrages
CREATE TABLE categorie (
  id_categorie INT AUTO_INCREMENT PRIMARY KEY,
  libelle      VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- 2. Table des livres
CREATE TABLE livre (
  id_livre       INT AUTO_INCREMENT PRIMARY KEY,
  isbn           VARCHAR(13)  NOT NULL,
  titre          VARCHAR(150) NOT NULL,
  auteur         VARCHAR(100) NOT NULL,
  annee_parution INT          NOT NULL,
  nb_pages       INT          NULL,
  id_categorie   INT          NOT NULL,
  CONSTRAINT fk_livre_categorie
    FOREIGN KEY (id_categorie) REFERENCES categorie (id_categorie)
) ENGINE=InnoDB;

-- 3. Table des adhérents
CREATE TABLE adherent (
  id_adherent      INT AUTO_INCREMENT PRIMARY KEY,
  nom              VARCHAR(50)  NOT NULL,
  prenom           VARCHAR(50)  NOT NULL,
  email            VARCHAR(100) NULL,
  ville            VARCHAR(50)  NOT NULL,
  date_naissance   DATE         NOT NULL,
  date_inscription DATE         NOT NULL
) ENGINE=InnoDB;

-- 4. Table des emprunts (association avec attributs)
CREATE TABLE emprunt (
  id_livre           INT  NOT NULL,
  id_adherent        INT  NOT NULL,
  date_emprunt       DATE NOT NULL,
  date_retour_prevue DATE NOT NULL,
  date_retour        DATE NULL,
  PRIMARY KEY (id_livre, id_adherent, date_emprunt),
  CONSTRAINT fk_emprunt_livre
    FOREIGN KEY (id_livre) REFERENCES livre (id_livre),
  CONSTRAINT fk_emprunt_adherent
    FOREIGN KEY (id_adherent) REFERENCES adherent (id_adherent)
) ENGINE=InnoDB;
