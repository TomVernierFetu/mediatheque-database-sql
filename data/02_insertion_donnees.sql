-- =============================================================================
-- PROJET BASE DE DONNEES : MEDIATHEQUE MUNICIPALE
-- Script 02 : Insertion du jeu d'essais et données de test (DML)
-- Auteur : Tom Vernier-Fétu
-- =============================================================================
USE mediatheque;

-- --- Donnees de la table categorie ---
INSERT INTO mediatheque.categorie (id_categorie,libelle) VALUES
	 (4,'Bande dessinée'),
	 (6,'Histoire'),
	 (5,'Informatique'),
	 (8,'Jeunesse'),
	 (7,'Poésie'),
	 (3,'Policier'),
	 (1,'Roman'),
	 (2,'Science-fiction');

-- --- Donnees de la table livre ---
INSERT INTO mediatheque.livre (id_livre,isbn,titre,auteur,annee_parution,nb_pages,id_categorie) VALUES
	 (1,'9782070360024','L''Étranger','Albert Camus',1942,186,1),
	 (2,'9782070368228','La Peste','Albert Camus',1947,352,1),
	 (3,'9782253004226','Le Comte de Monte-Cristo','Alexandre Dumas',1844,1504,1),
	 (4,'9782070413119','Madame Bovary','Gustave Flaubert',1857,512,1),
	 (5,'9782253006329','Germinal','Émile Zola',1885,608,1),
	 (6,'9782070415731','Fondation','Isaac Asimov',1951,416,2),
	 (7,'9782266320481','Dune','Frank Herbert',1965,928,2),
	 (8,'9782070368220','1984','George Orwell',1949,400,2),
	 (9,'9782290349205','Les Robots','Isaac Asimov',1950,320,2),
	 (10,'9782253081692','La Planète des singes','Pierre Boulle',1963,224,2);
INSERT INTO mediatheque.livre (id_livre,isbn,titre,auteur,annee_parution,nb_pages,id_categorie) VALUES
	 (11,'9782253009030','Le Crime de l''Orient-Express','Agatha Christie',1934,256,3),
	 (12,'9782253003717','Ils étaient dix','Agatha Christie',1939,224,3),
	 (13,'9782266154895','Le Chien des Baskerville','Arthur Conan Doyle',1902,256,3),
	 (14,'9782070466160','Pars vite et reviens tard','Fred Vargas',2001,352,3),
	 (15,'9782012101333','Astérix le Gaulois','René Goscinny',1961,48,4),
	 (16,'9782203001015','Tintin au Tibet','Hergé',1960,62,4),
	 (17,'9782800145501','Les Schtroumpfs noirs','Peyo',1963,64,4),
	 (18,'9782412046036','Apprendre SQL','Alan Beaulieu',2020,380,5),
	 (19,'9782409032257','Linux — Administration système','Philippe Banquet',2021,720,5),
	 (20,'9782212678161','Sécurité informatique','Laurent Bloch',2022,400,5);
INSERT INTO mediatheque.livre (id_livre,isbn,titre,auteur,annee_parution,nb_pages,id_categorie) VALUES
	 (21,'9782100801374','Réseaux informatiques','José Dordoigne',2019,640,5),
	 (22,'9782409044281','Python pour les nuls','John Paul Mueller',2023,NULL,5),
	 (23,'9782080712127','Histoire de France','Jules Michelet',1855,480,6),
	 (24,'9782262064877','La Seconde Guerre mondiale','Antony Beevor',2012,1024,6),
	 (25,'9782070409365','Les Fleurs du mal','Charles Baudelaire',1857,288,7),
	 (26,'9782070301492','Alcools','Guillaume Apollinaire',1913,192,7),
	 (27,'9782253096351','Le Petit Prince','Antoine de Saint-Exupéry',1943,96,1),
	 (28,'9782266282383','Le Meilleur des mondes','Aldous Huxley',1932,NULL,2);

-- --- Donnees de la table adherent ---
INSERT INTO mediatheque.adherent (id_adherent,nom,prenom,email,ville,date_naissance,date_inscription) VALUES
	 (1,'Martin','Léa','lea.martin@exemple.fr','Angers','2005-03-14','2023-09-05'),
	 (2,'Bernard','Hugo','hugo.bernard@exemple.fr','Angers','2006-07-22','2023-09-05'),
	 (3,'Dubois','Chloé','chloe.dubois@exemple.fr','Saumur','2004-11-02','2023-10-12'),
	 (4,'Thomas','Lucas',NULL,'Cholet','2005-01-30','2024-01-08'),
	 (5,'Robert','Emma','emma.robert@exemple.fr','Angers','1998-05-17','2024-02-19'),
	 (6,'Richard','Nathan','nathan.richard@exemple.fr','Segré','2006-09-09','2024-03-04'),
	 (7,'Petit','Manon','manon.petit@exemple.fr','Saumur','2005-12-25','2024-09-02'),
	 (8,'Durand','Louis',NULL,'Angers','1987-04-03','2024-09-02'),
	 (9,'Leroy','Camille','camille.leroy@exemple.fr','Château-Gontier','2006-02-11','2024-09-16'),
	 (10,'Moreau','Jules','jules.moreau@exemple.fr','Cholet','2005-08-08','2024-10-01');
INSERT INTO mediatheque.adherent (id_adherent,nom,prenom,email,ville,date_naissance,date_inscription) VALUES
	 (11,'Simon','Inès','ines.simon@exemple.fr','Angers','2007-06-01','2025-01-13'),
	 (12,'Laurent','Théo','theo.laurent@exemple.fr','Saumur','2006-10-19','2025-09-08'),
	 (13,'Lefebvre','Sarah','sarah.lefebvre@exemple.fr','Angers','2007-03-27','2025-09-08'),
	 (14,'Michel','Adam',NULL,'Segré','2007-12-05','2025-09-15'),
	 (15,'Garcia','Jade','jade.garcia@exemple.fr','Cholet','2006-04-14','2026-09-07');

-- --- Donnees de la table emprunt ---
INSERT INTO mediatheque.emprunt (id_livre,id_adherent,date_emprunt,date_retour_prevue,date_retour) VALUES
	 (1,1,'2025-09-15','2025-09-29','2025-09-27'),
	 (1,8,'2025-12-10','2025-12-24','2026-01-05'),
	 (2,8,'2026-01-15','2026-01-29','2026-01-28'),
	 (3,5,'2025-09-25','2025-10-23','2025-10-21'),
	 (4,5,'2025-12-01','2025-12-15','2025-12-14'),
	 (5,5,'2026-03-02','2026-03-16','2026-03-20'),
	 (6,1,'2025-10-02','2025-10-16','2025-10-20'),
	 (6,2,'2026-10-20','2026-11-03',NULL),
	 (6,10,'2026-01-20','2026-02-03','2026-02-01'),
	 (7,1,'2025-11-03','2025-11-17','2025-11-14');
INSERT INTO mediatheque.emprunt (id_livre,id_adherent,date_emprunt,date_retour_prevue,date_retour) VALUES
	 (7,6,'2025-11-20','2025-12-04','2025-12-02'),
	 (7,12,'2026-09-22','2026-10-06','2026-10-05'),
	 (8,2,'2025-09-20','2025-10-04','2025-10-03'),
	 (8,6,'2026-01-05','2026-01-19','2026-01-19'),
	 (9,10,'2026-02-10','2026-02-24','2026-02-24'),
	 (11,3,'2025-09-18','2025-10-02','2025-09-30'),
	 (11,3,'2026-06-01','2026-06-15','2026-06-12'),
	 (12,3,'2025-10-05','2025-10-19','2025-10-17'),
	 (13,3,'2025-11-10','2025-11-24','2025-11-28'),
	 (13,13,'2026-10-22','2026-11-05',NULL);
INSERT INTO mediatheque.emprunt (id_livre,id_adherent,date_emprunt,date_retour_prevue,date_retour) VALUES
	 (14,3,'2026-02-02','2026-02-16','2026-02-10'),
	 (15,2,'2025-10-06','2025-10-20','2025-10-18'),
	 (15,7,'2025-10-15','2025-10-29','2025-10-28'),
	 (16,2,'2025-10-06','2025-10-20','2025-10-25'),
	 (16,11,'2026-03-09','2026-03-23','2026-03-22'),
	 (17,2,'2026-01-12','2026-01-26','2026-01-20'),
	 (17,11,'2026-10-26','2026-11-09',NULL),
	 (18,1,'2026-09-10','2026-09-24','2026-09-22'),
	 (18,6,'2026-02-09','2026-02-23','2026-02-20'),
	 (18,9,'2025-10-20','2025-11-03','2025-11-01');
INSERT INTO mediatheque.emprunt (id_livre,id_adherent,date_emprunt,date_retour_prevue,date_retour) VALUES
	 (18,13,'2026-10-05','2026-10-19','2026-10-16'),
	 (19,4,'2025-10-01','2025-10-15','2025-10-30'),
	 (19,9,'2025-11-05','2025-11-19','2025-11-18'),
	 (19,9,'2026-10-01','2026-10-15',NULL),
	 (20,1,'2026-10-15','2026-10-29',NULL),
	 (20,9,'2026-03-16','2026-03-30','2026-03-28'),
	 (21,4,'2026-09-21','2026-10-05',NULL),
	 (23,8,'2026-04-01','2026-04-15','2026-04-14'),
	 (24,5,'2026-05-04','2026-05-18','2026-05-15'),
	 (25,5,'2026-10-12','2026-10-26',NULL);
INSERT INTO mediatheque.emprunt (id_livre,id_adherent,date_emprunt,date_retour_prevue,date_retour) VALUES
	 (27,7,'2026-01-08','2026-01-22','2026-01-21');
