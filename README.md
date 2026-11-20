# 📚 Médiathèque — Modélisation & Requêtes SQL Avancées

Projet de conception de base de données relationnelle et d'extraction de données pour la gestion d'une médiathèque municipale (gestion des livres, des catégories, des adhérents et du suivi des emprunts/retards).

Projet de modélisation relationnelle et requêtes SQL d'analyse métier (MySQL / MariaDB).

---

## 🏗️ Modèle Relationnel (MLD)

La base de données repose sur 4 tables reliées par des contraintes d'intégrité référentielle (`FOREIGN KEY`) :

- **`categorie`** (`id_categorie`, `libelle`)
- **`livre`** (`id_livre`, `isbn`, `titre`, `auteur`, `annee_parution`, `nb_pages`, `#id_categorie`)
- **`adherent`** (`id_adherent`, `nom`, `prenom`, `email`, `ville`, `date_naissance`, `date_inscription`)
- **`emprunt`** (`#id_livre`, `#id_adherent`, `date_emprunt`, `date_retour_prevue`, `date_retour`)  
  *Clé primaire composite : (`id_livre`, `id_adherent`, `date_emprunt`)*

---

## 🎯 Compétences SQL Démontrées

Le dossier `queries/03_requetes_analyse.sql` regroupe plus de **60 requêtes SQL progressives et commentées**, couvrant 6 niveaux de complexité :

1. **Niveau 1 — Fondations** : Projections (`SELECT`), restrictions simples (`WHERE`), tris (`ORDER BY ASC/DESC`) et pagination (`LIMIT`).
2. **Niveau 2 — Filtres avancés & Opérateurs** : `DISTINCT`, `IN`, `BETWEEN`, motifs `LIKE`, traitement rigoureux des valeurs absentes (`IS NULL` / `IS NOT NULL`) et colonnes calculées (calcul de l'âge d'un livre).
3. **Niveau 3 — Fonctions d'agrégat & Statistiques** : `COUNT(*)`, `COUNT(colonne)`, `SUM`, `AVG`, `MIN`, `MAX`, regroupements par groupes (`GROUP BY`) et filtrage sur agrégats (`HAVING`).
4. **Niveau 4 — Jointures internes (`INNER JOIN`)** : Croisement entre 2 tables avec utilisation d'alias courts et conditions spécifiques.
5. **Niveau 5 — Jointures multi-tables** : Traversée complète des associations (Adhérent ➔ Emprunt ➔ Livre ➔ Catégorie), calcul des retards avec `DATEDIFF`.
6. **Niveau 6 — Jointures externes (`LEFT JOIN` / `RIGHT JOIN`)** : Détection des lignes sans correspondance (catégories vides, adhérents sans emprunt, livres jamais empruntés) et conservation des zéros statistiques avec `COUNT(colonne)`.

---

## 🚀 Utilisation & Déploiement

### Prérequis
* Un serveur MariaDB ou MySQL (via DBeaver, phpMyAdmin, XAMPP, Docker ou MariaDB local).

### Exécution des scripts dans l'ordre
```bash
# 1. Créer la structure de la base et les tables
mysql -u root -p < schema/01_creation_tables.sql

# 2. Insérer le jeu d'essai
mysql -u root -p < data/02_insertion_donnees.sql

# 3. Exécuter ou tester les requêtes d'analyse
mysql -u root -p < queries/03_requetes_analyse.sql
```

Vous pouvez également ouvrir directement les scripts dans **DBeaver** ou **phpMyAdmin** et les exécuter séquentiellement.

---

## 👤 Auteur

* **Tom Vernier-Fétu** — Développeur junior en recherche d'alternance.
