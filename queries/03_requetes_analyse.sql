-- =============================================================================
-- PROJET BASE DE DONNEES : MEDIATHEQUE MUNICIPALE
-- Script 03 : Requêtes d'analyse et d'extraction (Niveaux 1 à 6)
-- Auteur : Tom Vernier-Fétu
-- =============================================================================

USE mediatheque;

-- EXERCICE 1.1 - Afficher toutes les informations de toutes les catégories.
SELECT *
FROM categorie c;
 
-- EXERCICE 1.2 - Afficher toutes les informations de tous les livres.
SELECT *
FROM livre l;
 
-- EXERCICE 1.3 - Afficher le titre et l'auteur de tous les livres.
SELECT l.titre, l.auteur
FROM livre l;
 
-- EXERCICE 1.4 - Afficher le nom et le prénom de tous les adhérents.
SELECT a.nom, a.prenom
FROM adherent a;
 
-- EXERCICE 1.5 - Afficher le libellé des catégories par ordre alphabétique.
SELECT c.libelle
FROM categorie c
ORDER BY c.libelle ASC;
 
-- EXERCICE 1.6 - Afficher le nom, le prénom et la ville des adhérents, triés
-- par nom (ordre alphabétique).
SELECT a.nom, a.prenom, a.ville
FROM adherent a
ORDER BY a.nom ASC;
 
-- EXERCICE 1.7 - Afficher le nom, le prénom et la ville des adhérents, triés par
-- ville, puis par nom à l'intérieur de chaque ville.
SELECT a.nom, a.prenom, a.ville
FROM adherent a
ORDER BY a.ville, a.nom;
 
-- EXERCICE 1.8 - Afficher les adhérents qui habitent Angers.
SELECT *
FROM adherent a
WHERE a.ville = 'Angers';
 
-- EXERCICE 1.9 - Afficher le titre et l'auteur des livres écrits par Agatha Christie.
SELECT l.titre, l.auteur
FROM livre l
WHERE l.auteur = 'Agatha Christie';
 
-- EXERCICE 1.10 - Afficher le titre des livres de la catégorie n°5 (Informatique).
SELECT l.titre
FROM livre l
WHERE l.id_categorie = 5;
 
-- EXERCICE 1.11 - Afficher le titre et l'identifiant de catégorie des livres qui ne sont pas
-- des romans (catégorie n°1).
SELECT l.titre, l.id_categorie
FROM livre l
WHERE l.id_categorie <> 1;
 
-- EXERCICE 1.12 - Afficher le titre et le nombre de pages des livres de moins de 100 pages.
SELECT l.titre, l.nb_pages
FROM livre l
WHERE l.nb_pages < 100;
 
-- EXERCICE 1.13 - Afficher le titre et l'année de parution des livres parus après 2000,
-- du plus récent au plus ancien.
SELECT l.titre, l.annee_parution
FROM livre l
WHERE l.annee_parution > 2000
ORDER BY l.annee_parution DESC;
 
-- EXERCICE 1.14 - Afficher le nom, le prénom et la date d'inscription des adhérents
-- inscrits avant le 1er janvier 2024.
SELECT a.nom, a.prenom, a.date_inscription
FROM adherent a
WHERE a.date_inscription < '2024-01-01';
 
-- EXERCICE 1.15 - Afficher les emprunts réalisés depuis le 1er octobre 2026 (inclus),
-- du plus récent au plus ancien.
SELECT *
FROM emprunt e
WHERE e.date_emprunt >= '2026-10-01'
ORDER BY e.date_emprunt DESC;
 
-- EXERCICE 1.16 - Afficher les 3 livres qui ont le plus de pages (titre et nombre de pages).
SELECT l.titre, l.nb_pages
FROM livre l
ORDER BY l.nb_pages DESC
LIMIT 3;
 
-- EXERCICE 1.17 - Afficher le nom, le prénom et la date d'inscription des 5 adhérents
-- inscrits le plus récemment.
SELECT a.nom, a.prenom, a.date_inscription
FROM adherent a
ORDER BY a.date_inscription DESC
LIMIT 5;
 
-- EXERCICE 1.18 - Afficher le nom, le prénom et la date de naissance de l'adhérent le plus âgé.
SELECT a.nom, a.prenom, a.date_naissance
FROM adherent a
ORDER BY a.date_naissance ASC
LIMIT 1;
 
-- =============================================================================
-- NIVEAU 2 : AFFINER LA SELECTION (OPERATEURS ET VALEURS NULL)
-- =============================================================================

-- EXERCICE 2.1 - Afficher la liste des villes des adhérents, sans doublon, par ordre alphabétique.
SELECT DISTINCT a.ville
FROM adherent a
ORDER BY a.ville ASC;

-- EXERCICE 2.2 - Afficher les livres dont l'auteur est Isaac Asimov ou Albert Camus (utiliser IN).
SELECT *
FROM livre l
WHERE l.auteur IN ('Isaac Asimov', 'Albert Camus');

-- EXERCICE 2.3 - Afficher les livres parus entre 1940 et 1960 (bornes incluses).
SELECT *
FROM livre l
WHERE l.annee_parution BETWEEN 1940 AND 1960;

-- EXERCICE 2.4 - Afficher les livres dont le titre commence par « Le ».
SELECT *
FROM livre l
WHERE l.titre LIKE 'Le%';

-- EXERCICE 2.5 - Afficher les adhérents qui n'ont pas renseigné d'adresse e-mail.
SELECT *
FROM adherent a
WHERE a.email IS NULL;

-- EXERCICE 2.6 - Afficher les livres dont le nombre de pages n'est pas connu.
SELECT *
FROM livre l
WHERE l.nb_pages IS NULL;

-- EXERCICE 2.7 - Afficher les adhérents de Saumur ou de Cholet inscrits à partir du 1er janvier 2024.
SELECT *
FROM adherent a
WHERE a.ville IN ('Saumur', 'Cholet')
  AND a.date_inscription >= '2024-01-01';

-- EXERCICE 2.8 - Afficher le titre des livres et leur âge en années, dans une colonne « age_livre ».
SELECT l.titre, (2026 - l.annee_parution) AS age_livre
FROM livre l;


-- =============================================================================
-- NIVEAU 3 : COMPTER ET REGROUPER (FONCTIONS D'AGREGAT)
-- =============================================================================

-- EXERCICE 3.1 - Combien la médiathèque possède-t-elle de livres ?
SELECT COUNT(*) AS nb_livres
FROM livre;

-- EXERCICE 3.2 - Combien d'adhérents ont renseigné leur e-mail ?
-- Explication : COUNT(email) ignore les NULL alors que COUNT(*) compte toutes les lignes.
SELECT COUNT(a.email) AS nb_emails
FROM adherent a;

-- EXERCICE 3.3 - Année de parution du livre le plus ancien et du plus récent.
SELECT MIN(l.annee_parution) AS annee_plus_ancien,
       MAX(l.annee_parution) AS annee_plus_recent
FROM livre l;

-- EXERCICE 3.4 - Nombre moyen de pages des livres, arrondi à l'entier.
SELECT ROUND(AVG(l.nb_pages)) AS moyenne_pages
FROM livre l;

-- EXERCICE 3.5 - Nombre d'adhérents par ville, de la plus représentée à la moins représentée.
SELECT a.ville, COUNT(*) AS nb_adherents
FROM adherent a
GROUP BY a.ville
ORDER BY nb_adherents DESC;

-- EXERCICE 3.6 - Pour chaque catégorie, le nombre de livres et le nombre total de pages.
SELECT l.id_categorie, COUNT(*) AS nb_livres, SUM(l.nb_pages) AS total_pages
FROM livre l
GROUP BY l.id_categorie;

-- EXERCICE 3.7 - Afficher les auteurs qui ont au moins 2 livres dans la médiathèque.
SELECT l.auteur, COUNT(*) AS nb_livres
FROM livre l
GROUP BY l.auteur
HAVING COUNT(*) >= 2;

-- EXERCICE 3.8 - Afficher le nombre d'emprunts réalisés par année.
SELECT YEAR(e.date_emprunt) AS annee_emprunt, COUNT(*) AS nb_emprunts
FROM emprunt e
GROUP BY YEAR(e.date_emprunt);


-- =============================================================================
-- NIVEAU 4 : JOINTURES INTERNES SIMPLES (INNER JOIN)
-- =============================================================================

-- EXERCICE 4.1 - Titre de chaque livre avec le libellé de sa catégorie.
SELECT l.titre, c.libelle
FROM livre l
INNER JOIN categorie c ON l.id_categorie = c.id_categorie;

-- EXERCICE 4.2 - Titre, auteur et libellé de catégorie, triés par catégorie puis par titre.
SELECT l.titre, l.auteur, c.libelle
FROM livre l
INNER JOIN categorie c ON l.id_categorie = c.id_categorie
ORDER BY c.libelle ASC, l.titre ASC;

-- EXERCICE 4.3 - Livres de la catégorie « Science-fiction », sans utiliser son identifiant.
SELECT l.titre, l.auteur
FROM livre l
INNER JOIN categorie c ON l.id_categorie = c.id_categorie
WHERE c.libelle = 'Science-fiction';

-- EXERCICE 4.4 - Titre et année des livres « Informatique », du plus récent au plus ancien.
SELECT l.titre, l.annee_parution
FROM livre l
INNER JOIN categorie c ON l.id_categorie = c.id_categorie
WHERE c.libelle = 'Informatique'
ORDER BY l.annee_parution DESC;

-- EXERCICE 4.5 - Libellé de la catégorie du livre « Dune ».
SELECT c.libelle
FROM categorie c
INNER JOIN livre l ON c.id_categorie = l.id_categorie
WHERE l.titre = 'Dune';

-- EXERCICE 4.6 - Pour chaque emprunt, nom, prénom de l'adhérent et date d'emprunt.
SELECT a.nom, a.prenom, e.date_emprunt
FROM emprunt e
INNER JOIN adherent a ON e.id_adherent = a.id_adherent;

-- EXERCICE 4.7 - Dates d'emprunt et de retour des adhérents de Saumur.
SELECT e.date_emprunt, e.date_retour
FROM emprunt e
INNER JOIN adherent a ON e.id_adherent = a.id_adherent
WHERE a.ville = 'Saumur';

-- EXERCICE 4.8 - Pour chaque emprunt, titre du livre et date d'emprunt.
SELECT l.titre, e.date_emprunt
FROM emprunt e
INNER JOIN livre l ON e.id_livre = l.id_livre;

-- EXERCICE 4.9 - Titre des livres qui n'ont pas encore été rendus.
SELECT l.titre
FROM emprunt e
INNER JOIN livre l ON e.id_livre = l.id_livre
WHERE e.date_retour IS NULL;

-- EXERCICE 4.10 - Nombre de livres par libellé de catégorie.
SELECT c.libelle, COUNT(l.id_livre) AS nb_livres
FROM categorie c
INNER JOIN livre l ON c.id_categorie = l.id_categorie
GROUP BY c.libelle;

-- EXERCICE 4.11 - Réécriture de la requête 4.1 avec alias courts l et c.
SELECT l.titre, c.libelle
FROM livre l
INNER JOIN categorie c ON l.id_categorie = c.id_categorie;

-- EXERCICE 4.12 - Catégories ayant au moins 4 livres, avec nb de livres et moyenne de pages.
SELECT c.libelle, COUNT(l.id_livre) AS nb_livres, ROUND(AVG(l.nb_pages)) AS moyenne_pages
FROM categorie c
INNER JOIN livre l ON c.id_categorie = l.id_categorie
GROUP BY c.libelle
HAVING COUNT(l.id_livre) >= 4;


-- =============================================================================
-- NIVEAU 5 : JOINTURES MULTI-TABLES (TRAVERSER L'ASSOCIATION)
-- =============================================================================

-- EXERCICE 5.1 - Pour chaque emprunt : nom, prénom, titre et date d'emprunt.
SELECT a.nom, a.prenom, l.titre, e.date_emprunt
FROM emprunt e
INNER JOIN adherent a ON e.id_adherent = a.id_adherent
INNER JOIN livre l ON e.id_livre = l.id_livre
ORDER BY e.date_emprunt ASC;

-- EXERCICE 5.2 - Titres des livres empruntés par Léa Martin.
SELECT l.titre
FROM emprunt e
INNER JOIN adherent a ON e.id_adherent = a.id_adherent
INNER JOIN livre l ON e.id_livre = l.id_livre
WHERE a.nom = 'Martin' AND a.prenom = 'Léa';

-- EXERCICE 5.3 - Nom et prénom des adhérents qui ont emprunté « Dune ».
SELECT a.nom, a.prenom
FROM emprunt e
INNER JOIN livre l ON e.id_livre = l.id_livre
INNER JOIN adherent a ON e.id_adherent = a.id_adherent
WHERE l.titre = 'Dune';

-- EXERCICE 5.4 - Emprunts en cours (non rendus) : nom, prénom, titre, date de retour prévue.
SELECT a.nom, a.prenom, l.titre, e.date_retour_prevue
FROM emprunt e
INNER JOIN adherent a ON e.id_adherent = a.id_adherent
INNER JOIN livre l ON e.id_livre = l.id_livre
WHERE e.date_retour IS NULL;

-- EXERCICE 5.5 - Emprunts en retard au 2 novembre 2026 avec jours de retard.
SELECT a.nom, a.prenom, l.titre, e.date_retour_prevue,
       DATEDIFF('2026-11-02', e.date_retour_prevue) AS jours_retard
FROM emprunt e
INNER JOIN adherent a ON e.id_adherent = a.id_adherent
INNER JOIN livre l ON e.id_livre = l.id_livre
WHERE e.date_retour IS NULL
  AND e.date_retour_prevue < '2026-11-02';

-- EXERCICE 5.6 - Nombre d'emprunts par adhérent, du plus grand au plus petit.
SELECT a.nom, a.prenom, COUNT(*) AS nb_emprunts
FROM adherent a
INNER JOIN emprunt e ON a.id_adherent = e.id_adherent
GROUP BY a.id_adherent, a.nom, a.prenom
ORDER BY nb_emprunts DESC;

-- EXERCICE 5.7 - Adhérents ayant déjà rendu un livre en retard, avec le nombre de retards.
SELECT a.nom, a.prenom, COUNT(*) AS nb_retards
FROM adherent a
INNER JOIN emprunt e ON a.id_adherent = e.id_adherent
WHERE e.date_retour > e.date_retour_prevue
GROUP BY a.id_adherent, a.nom, a.prenom;

-- EXERCICE 5.8 - Titre des livres empruntés et libellé de leur catégorie, sans doublon.
SELECT DISTINCT l.titre, c.libelle
FROM emprunt e
INNER JOIN livre l ON e.id_livre = l.id_livre
INNER JOIN categorie c ON l.id_categorie = c.id_categorie;

-- EXERCICE 5.9 - Nombre d'emprunts par catégorie.
SELECT c.libelle, COUNT(e.id_livre) AS nb_emprunts
FROM categorie c
INNER JOIN livre l ON c.id_categorie = l.id_categorie
INNER JOIN emprunt e ON l.id_livre = e.id_livre
GROUP BY c.libelle;

-- EXERCICE 5.10 - Adhérents ayant emprunté au moins un livre « Policier », sans doublon.
SELECT DISTINCT a.nom, a.prenom
FROM adherent a
INNER JOIN emprunt e ON a.id_adherent = e.id_adherent
INNER JOIN livre l ON e.id_livre = l.id_livre
INNER JOIN categorie c ON l.id_categorie = c.id_categorie
WHERE c.libelle = 'Policier';


-- =============================================================================
-- NIVEAU 6 : JOINTURES EXTERNES (LEFT JOIN / RIGHT JOIN)
-- =============================================================================

-- EXERCICE 6.1 - Libellé de toutes les catégories avec le titre de leurs livres (LEFT JOIN).
SELECT c.libelle, l.titre
FROM categorie c
LEFT JOIN livre l ON c.id_categorie = l.id_categorie;

-- EXERCICE 6.2 - Même résultat avec RIGHT JOIN.
SELECT c.libelle, l.titre
FROM livre l
RIGHT JOIN categorie c ON l.id_categorie = c.id_categorie;

-- EXERCICE 6.3 - Catégories qui ne contiennent aucun livre.
SELECT c.libelle
FROM categorie c
LEFT JOIN livre l ON c.id_categorie = l.id_categorie
WHERE l.id_livre IS NULL;

-- EXERCICE 6.4 - Nombre de livres de chaque catégorie (les vides avec 0).
SELECT c.libelle, COUNT(l.id_livre) AS nb_livres
FROM categorie c
LEFT JOIN livre l ON c.id_categorie = l.id_categorie
GROUP BY c.libelle;

-- EXERCICE 6.5 - Tous les adhérents avec leurs dates d'emprunt (y compris sans emprunt).
SELECT a.nom, a.prenom, e.date_emprunt
FROM adherent a
LEFT JOIN emprunt e ON a.id_adherent = e.id_adherent;

-- EXERCICE 6.6 - Adhérents qui n'ont jamais emprunté de livre (LEFT JOIN).
SELECT a.nom, a.prenom
FROM adherent a
LEFT JOIN emprunt e ON a.id_adherent = e.id_adherent
WHERE e.id_adherent IS NULL;

-- EXERCICE 6.7 - Même requête avec RIGHT JOIN.
SELECT a.nom, a.prenom
FROM emprunt e
RIGHT JOIN adherent a ON e.id_adherent = a.id_adherent
WHERE e.id_adherent IS NULL;

-- EXERCICE 6.8 - Nombre d'emprunts par adhérent (y compris 0).
SELECT a.nom, a.prenom, COUNT(e.date_emprunt) AS nb_emprunts
FROM adherent a
LEFT JOIN emprunt e ON a.id_adherent = e.id_adherent
GROUP BY a.id_adherent, a.nom, a.prenom;

-- EXERCICE 6.9 - Livres qui n'ont jamais été empruntés avec leur catégorie.
SELECT l.titre, c.libelle
FROM livre l
LEFT JOIN emprunt e ON l.id_livre = e.id_livre
INNER JOIN categorie c ON l.id_categorie = c.id_categorie
WHERE e.id_livre IS NULL;

-- EXERCICE 6.10 - Adhérents avec le titre de leur emprunt en cours s'ils en ont un.
SELECT a.nom, a.prenom, l.titre
FROM adherent a
LEFT JOIN emprunt e ON a.id_adherent = e.id_adherent AND e.date_retour IS NULL
LEFT JOIN livre l ON e.id_livre = l.id_livre;
