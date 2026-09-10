# 🗃️ SQL de A à Z — Récapitulatif complet (Semaine 3)

Fiche de référence sur tout ce qui a été appris en SQL avec DBeaver. À consulter à chaque fois qu'un doute survient.

---

## 1. Créer une table

```sql
CREATE TABLE aeroports (
    code TEXT,
    name TEXT,
    country TEXT,
    capacite INTEGER
);
```
Les types principaux : `TEXT` (texte), `INTEGER` (nombre entier).

**💡 Astuce mémo :** garde toujours ce `CREATE TABLE` dans ton script, même après l'avoir exécuté — c'est la documentation de la structure de ta base, indispensable si tu dois tout recréer un jour.

---

## 2. Insérer des données

```sql
INSERT INTO aeroports (code, name, country, capacite) VALUES
('CDG', 'Paris Charles de Gaulle', 'France', 76),
('JFK', 'New York JFK', 'USA', 90);
```

**⚠️ Piège n°1 :** ne jamais mettre de guillemets autour des **noms de colonnes** (`code, name...`) — seulement autour des **valeurs texte** (`'CDG'`, `'France'`).

**⚠️ Piège n°2 — LE plus fréquent de la semaine : les doublons.** Si tu resélectionnes et ré-exécutes un bloc `INSERT` déjà exécuté (ou si tu sélectionnes tout le script avec `Ctrl+A` alors qu'il contient plusieurs blocs `INSERT` de tentatives précédentes), tes données se dupliquent silencieusement.

**Règle d'or : ne JAMAIS sélectionner large (`Ctrl+A`) pour exécuter. Toujours sélectionner UNIQUEMENT la requête précise qu'on veut lancer.**

### Détecter des doublons
```sql
SELECT code, COUNT(*) as nombre
FROM aeroports
GROUP BY code
HAVING COUNT(*) > 1;
```

### Corriger (vider puis réinsérer proprement)
```sql
DELETE FROM aeroports;
-- puis réinsérer le bloc INSERT une seule fois
```
⚠️ `DELETE FROM table;` sans `WHERE` supprime TOUT — DBeaver affiche une popup de confirmation, normal et voulu.

---

## 3. Filtrer avec WHERE

```sql
SELECT * FROM aeroports WHERE country = 'France';
```

**🔑 Ce que fait vraiment `WHERE` :** il ne veut PAS dire "où" au sens géographique — il veut dire **"à condition que"**. Il filtre les lignes, ne garde que celles qui remplissent la condition.

**Opérateurs :** `=` `!=` `>` `<` `>=` `<=`, combinables avec `AND` / `OR`
```sql
SELECT * FROM aeroports WHERE country = 'USA' AND capacite > 80;
```

---

## 4. Trier avec ORDER BY

```sql
SELECT * FROM aeroports ORDER BY capacite DESC;   -- du plus grand au plus petit
SELECT * FROM aeroports ORDER BY capacite ASC;    -- du plus petit au plus grand
```

**⚠️ Piège :** `WHERE` (filtrer) et `ORDER BY` (trier) sont deux instructions **séparées** qui se combinent — ne jamais les mélanger en une seule (ex: `ORDER BY capacite < 80` ne fonctionne pas comme un filtre).

**Structure complète correcte :**
```sql
SELECT * FROM aeroports WHERE capacite < 80 ORDER BY capacite ASC;
```
(WHERE avant ORDER BY, toujours dans cet ordre)

---

## 5. Compter et agréger — COUNT, AVG, SUM

```sql
SELECT COUNT(*) FROM aeroports;              -- nombre total de lignes
SELECT AVG(delay) FROM flights;               -- moyenne d'une colonne
```

**⚠️ Piège :** `COUNT(*)` peut compter "toutes les lignes" sans distinction, mais `AVG`, `SUM`, `MAX`, `MIN` ont besoin d'une colonne précise entre les parenthèses — `AVG(*)` n'a pas de sens, il faut `AVG(delay)`.

---

## 6. Regrouper avec GROUP BY

Permet de calculer une statistique **par groupe**, pas juste globalement.

```sql
SELECT flight_departure, COUNT(*)
FROM flights
GROUP BY flight_departure;
```
→ une ligne par aéroport différent, avec le nombre de vols de chacun (au lieu d'une ligne par vol).

```sql
SELECT flight_departure, AVG(delay)
FROM flights
GROUP BY flight_departure;
```
→ le retard moyen, calculé séparément pour chaque aéroport.

**🔑 Règle stricte du GROUP BY :** dans le `SELECT`, on ne peut mettre QUE la colonne groupée ET des fonctions d'agrégation (`COUNT`, `AVG`...) — jamais une colonne brute qui n'est ni l'une ni l'autre.

**💡 Vérification de cohérence (bon réflexe) :** la somme de tous les comptes d'un `GROUP BY` doit toujours égaler le nombre total de lignes de la table — chaque ligne appartient à un seul groupe, jamais zéro, jamais deux.

**⚠️ Piège subtil :** une moyenne calculée sur un groupe d'1 seule valeur = juste cette valeur. Toujours vérifier le nombre d'éléments derrière une moyenne avant de la considérer comme une vraie tendance fiable.

---

## 7. Combiner deux tables — JOIN

Relie deux tables entre elles via une colonne commune.

```sql
SELECT flight_number, delay, aeroports.name, aeroports.country
FROM flights
JOIN aeroports ON flights.flight_departure = aeroports.code;
```

**Décryptage :** `JOIN aeroports ON [condition d'égalité]` — pour chaque ligne de `flights`, SQL va chercher la ligne de `aeroports` où `code` correspond à `flight_departure`, et fusionne les deux.

**🔑 Comment trouver la bonne colonne de jonction :** cherche, dans chaque table, la colonne qui contient le **même type d'info** (ici, un code d'aéroport comme "CDG"). Ne pas confondre avec une colonne qui identifie autre chose (ex: `flight_number` identifie le VOL, pas l'aéroport).

**Syntaxe `table.colonne` :** utile pour préciser de quelle table vient une colonne, surtout utile dès qu'on combine plusieurs tables — évite toute ambiguïté.

---

## 8. Le combo avancé — JOIN + GROUP BY

```sql
SELECT aeroports.country, AVG(flights.delay)
FROM flights
JOIN aeroports ON flights.flight_departure = aeroports.code
GROUP BY aeroports.country;
```
→ d'abord on joint (pour récupérer le pays via l'aéroport), PUIS on groupe par ce pays. Permet d'agréger des données selon une info qui vient d'une AUTRE table que celle où sont les valeurs à agréger.

---

## 🧠 Les erreurs classiques à ne jamais refaire

| Erreur | Ce qu'il faut retenir |
|---|---|
| Guillemets autour des noms de colonnes dans un INSERT | Guillemets seulement sur les valeurs texte, jamais sur les noms de colonnes |
| Sélectionner tout le script (`Ctrl+A`) pour exécuter | Toujours sélectionner UNIQUEMENT la requête précise voulue |
| Mélanger condition et tri en une seule instruction | `WHERE` (filtrer) et `ORDER BY` (trier) sont séparés, se combinent dans cet ordre |
| `AVG(*)` au lieu de `AVG(colonne)` | Les fonctions d'agrégation (sauf COUNT) ont besoin d'une colonne précise |
| Confondre deux colonnes qui semblent similaires pour un JOIN | Vérifier que les deux colonnes contiennent bien le MÊME type de valeur |
| `git commit` sans `git add` avant | Toujours `add` puis `commit`, jamais l'inverse |
| Oublier de sauvegarder le script SQL régulièrement | `Ctrl+S` dans DBeaver, comme dans VS Code — pas juste à la fin |

---

## ✅ Auto-test rapide (à refaire sans regarder cette fiche)

1. Pourquoi `WHERE` ne veut pas dire "où" au sens géographique ?
2. Que se passe-t-il si on exécute deux fois le même bloc `INSERT` ?
3. Dans un `GROUP BY`, quelles colonnes peut-on mettre dans le `SELECT` ?
4. Pourquoi la somme de tous les comptes d'un `GROUP BY` doit égaler le total de la table ?
5. Comment trouver quelle colonne utiliser dans un `JOIN ... ON` ?

---

## 📌 Pour la suite

SQL ne s'arrête pas ici — il continue d'être utilisé tout au long de l'année (Projet 1 en Semaine 4, comparaisons avec MongoDB, tous les futurs pipelines ETL). Pandas, qui arrive juste après, reprend d'ailleurs la même logique : `.groupby()` = `GROUP BY`, `.merge()` = `JOIN`, juste une syntaxe différente pour les mêmes idées.
