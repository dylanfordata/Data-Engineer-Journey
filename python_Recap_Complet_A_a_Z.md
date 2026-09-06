# 🐍 Python de A à Z — Récapitulatif complet (Jours 1-8)

Fiche de référence complète sur tout ce qui a été appris. Objectif : pouvoir s'y référer à tout moment, sans avoir à redemander les bases.

---

## 1. Variables et types

Une variable est une boîte étiquetée qui stocke une valeur réutilisable.

```python
airline = "Virgin Atlantic"      # str (texte)
price = 330.80                    # float (nombre à virgule)
number_of_seats = 40              # int (nombre entier)
full_flight = False                # bool (True / False)
```

**💡 Astuce mémo :** `int` = entier, `float` = flotte (a une virgule), `str` = string (chaîne de texte), `bool` = booléen (binaire, comme un interrupteur).

### Les f-strings — afficher une variable dans une phrase

```python
print(f"La compagnie est {airline}, prix : {price}€")
```
Tout ce qui est entre `{}` est remplacé par la valeur de la variable. Le `f` avant les guillemets active ce mode.

---

## 2. Les conditions (`if / elif / else`)

Permettent au programme de choisir un chemin différent selon une situation.

```python
delay = 12

if delay <= 0:
    print("On-Time Flight")
elif delay < 18:
    print("Slight delay, no compensation")
elif delay >= 20 and delay <= 40:
    print("Moderate delay, right to refreshments")
else:
    print("Significant delay, right to financial compensation")
```

**Opérateurs de comparaison :**
| Opérateur | Sens |
|---|---|
| `==` | égal à (⚠️ deux `=`, pas un seul) |
| `!=` | différent de |
| `>` `<` | supérieur, inférieur |
| `>=` `<=` | supérieur/inférieur ou égal |
| `and` / `or` | combiner plusieurs conditions |

**⚠️ Règles à ne jamais oublier :**
- Une seule branche s'exécute, jamais deux — Python s'arrête à la première condition vraie.
- L'indentation (les espaces) N'EST PAS optionnelle en Python — elle définit quel code appartient à quelle condition.
- `=` assigne une valeur, `==` compare deux valeurs. Confondre les deux est l'erreur n°1 des débutants.

**💡 Astuce mémo :** pense à un agent d'embarquement — il vérifie les conditions dans l'ordre et s'arrête dès que l'une d'elles correspond, il ne vérifie jamais tout en même temps.

---

## 3. Les boucles (`for`)

Permettent de répéter une action pour chaque élément d'une liste, sans recopier le code.

```python
vols = ["AF123", "LH456", "BA789"]

for vol in vols:
    print(vol)
```

À chaque tour, la variable (`vol`) prend la valeur suivante de la liste. Le nom de la variable est arbitraire (`vol`, `x`, `element`... peu importe).

### Boucle + condition imbriquée (très fréquent)

```python
notes = [8, 15, 4]

for n in notes:
    if n >= 10:
        print("Reussi")
    else:
        print("Echoue")
```
Le `if` est indenté À L'INTÉRIEUR du `for` → il s'exécute à CHAQUE tour, pas une seule fois à la fin.

**💡 Astuce mémo :** l'indentation = les poupées russes. Plus c'est indenté, plus c'est "dans" le bloc précédent.

---

## 4. Les fonctions (`def` / `return`)

Un bloc de code réutilisable, à qui on donne un nom, pour éviter de recopier la même logique.

```python
def classer_retard(delay):
    if delay <= 0:
        return "On-Time Flight"
    elif delay < 18:
        return "Slight delay, no compensation"
    else:
        return "Significant delay, right to compensation"

resultat = classer_retard(12)
print(resultat)
```

### 🔑 LA distinction la plus importante : `print` vs `return`

| | `print()` | `return` |
|---|---|---|
| Rôle | Affiche à l'écran, pour l'humain | Renvoie une valeur utilisable par le programme |
| Réutilisable ? | Non, disparaît une fois affiché | Oui, stockable dans une variable |

```python
def addition(a, b):
    return a + b        # renvoie le résultat

resultat = addition(5, 3)   # resultat contient 8, réutilisable
print(resultat * 2)          # → 16, possible SEULEMENT car on a un return
```

**💡 Astuce mémo :** `print` = dire à voix haute (personne ne peut réutiliser ce qui est juste dit). `return` = écrire sur un papier et le donner en main (réutilisable ensuite).

### Quand une fonction a-t-elle besoin de `if/elif/else` ?

**Règle simple :** demande-toi *"est-ce que je fais toujours EXACTEMENT le même calcul, ou est-ce que le résultat dépend d'une catégorie/tranche ?"*

| Type de fonction | Besoin de `if` ? | Exemple |
|---|---|---|
| **Conversion** (une seule formule, toujours pareille) | ❌ Non | `return km * 0.621371` (km → miles) |
| **Classification** (plusieurs résultats possibles selon la valeur) | ✅ Oui | `if places < 50: return "Petit porteur"...` |

```python
# CONVERSION - pas de if, juste un calcul
def convertir_km_en_miles(km):
    return km * 0.621371

# CLASSIFICATION - if nécessaire, plusieurs catégories possibles
def categorie_avion(places):
    if places < 50:
        return "Petit porteur"
    elif places <= 200:
        return "Moyen porteur"
    else:
        return "Gros porteur"
```

---

## 5. Les listes

```python
compagnies = ["Air France", "Lufthansa", "Emirates"]

compagnies.append("Ryanair")     # ajoute un élément à la fin
print(compagnies[0])              # 1er élément → "Air France"
print(len(compagnies))            # nombre d'éléments → 4
compagnies.remove("Lufthansa")    # supprime cet élément précis
```

**⚠️ En Python, le comptage commence à 0, pas à 1.** `compagnies[0]` = le premier élément.

**💡 Astuce mémo :** pense à un tiroir numéroté à partir de 0 — le premier tiroir, c'est le tiroir n°0.

---

## 6. Les dictionnaires

Comme une liste, mais avec des étiquettes (clés) au lieu d'un simple ordre — utile quand chaque info a un sens précis.

```python
vol = {"compagnie": "Air France", "retard": 12, "complet": False}

print(vol["compagnie"])    # accède à la VALEUR via sa clé → "Air France"
vol["retard"] = 20          # modifie une valeur existante
vol["prix"] = 450            # ajoute une nouvelle clé/valeur
```

**⚠️ `vol["compagnie"]` donne juste la valeur (`"Air France"`), pas la paire clé/valeur entière.**

### Liste de dictionnaires (structure très fréquente en vrai)

```python
vols = [
    {"compagnie": "Air France", "retard": 12, "complet": False},
    {"compagnie": "Emirates", "retard": 30, "complet": True}
]

for vol in vols:
    print(f"Le vol de {vol['compagnie']} a {vol['retard']} min de retard")
    if vol['complet']:
        print("Ce vol est complet")
```
⚠️ Dans une f-string, utiliser des guillemets **simples** pour la clé (`vol['compagnie']`), pas doubles, sinon conflit avec les guillemets de la f-string elle-même.

**💡 Astuce mémo :** une liste de dictionnaires = plusieurs "fiches" identiques rangées ensemble. C'est exactement la structure qu'utilisent Pandas, MongoDB et les APIs (JSON).

---

## 7. Gestion d'erreurs (`try / except`)

Permet d'éviter qu'un programme plante complètement à cause d'une seule donnée problématique.

```python
delays = [37, 56, 22, "sensor error", 12, 41]

for delay in delays:
    try:
        result = delay + 5
        print(result)
    except TypeError:
        print("Erreur : donnée invalide")
```

**Sans `try/except` :** dès que le programme rencontre `"sensor error" + 5`, tout s'arrête net — même les données valides qui suivaient (`12`, `41`) ne sont jamais traitées.

**Avec `try/except` :** le programme continue sur les éléments suivants malgré l'erreur.

**💡 Astuce mémo :** `try` = "essaie de faire ça", `except` = "si ça plante, fais ça à la place, mais continue le programme après".

**⚠️ Piège classique :** ne jamais réécrire la variable de boucle à l'intérieur du `try` (ex: `delay = "test"`) — ça écraserait la vraie valeur de la boucle et fausserait tout le test.

---

## 8. Lecture et écriture de fichiers

### Écrire dans un fichier

```python
with open("vols.txt", "w") as fichier:
    fichier.write("Air France - retard 12 minutes\n")
    fichier.write("Lufthansa - retard 30 minutes\n")
```
- `"w"` (write) : ⚠️ écrase TOUT le contenu existant avant d'écrire.
- `\n` : force un retour à la ligne, sinon tout le texte est collé.

### Lire un fichier

```python
with open("vols.txt", "r") as fichier:
    contenu = fichier.read()
    print(contenu)
```
- `"r"` (read) : lit le fichier sans le modifier.

### Pourquoi `with...as` plutôt que `open()` + `close()` ?

```python
# Version basique (fonctionne, mais risque d'oubli)
fichier = open("vols.txt", "w")
fichier.write("...")
fichier.close()          # ⚠️ facile à oublier

# Version recommandée (with/as)
with open("vols.txt", "w") as fichier:
    fichier.write("...")
# fichier fermé AUTOMATIQUEMENT, même en cas d'erreur
```
`as fichier` fonctionne comme n'importe quelle variable — le nom est arbitraire (`as f`, `as data`, peu importe).

**💡 Astuce mémo :** `open()` = ouvrir un cahier, `write()`/`read()` = écrire ou lire dedans, `with` = le cahier se referme tout seul quand t'as fini, pas besoin d'y penser.

---

## 🧠 Les erreurs classiques à ne jamais refaire

| Erreur | Ce qu'il faut retenir |
|---|---|
| Confondre `mkdir` et `touch` | `mkdir` = dossier, `touch` = fichier vide |
| Confondre `=` et `==` | `=` assigne, `==` compare |
| Mettre un `if/elif/else` dans une simple conversion | Conversion = 1 seule formule, pas de condition |
| `print()` au lieu de `return` dans une fonction | `print` affiche, `return` renvoie une valeur réutilisable |
| Oublier `Ctrl+S` avant de relancer un script | Le terminal exécute ce qui est SUR LE DISQUE, pas ce qui est affiché dans l'éditeur |
| Modifier la variable de boucle dans un `try` | Ça écrase la vraie valeur testée, fausse tout le résultat |
| Sauvegarder le code (`Ctrl+S`) ≠ exécuter le code | Il faut toujours relancer `python fichier.py` après une modif |

---

## ✅ Auto-test rapide (à refaire de temps en temps, sans regarder cette fiche)

1. Que renvoie `print(avion["places"])` si `avion = {"places": 250}` ?
2. Pourquoi une fonction de conversion n'a-t-elle pas besoin de `if` ?
3. Que se passe-t-il si on remplace `return` par `print` dans une fonction, puis qu'on essaie de réutiliser le résultat ?
4. Pourquoi `try/except` dans une boucle est-il utile avec de vraies données ?
5. Que fait le mode `"w"` s'il existe déjà un fichier avec ce nom ?

*(Réponses dans les sections correspondantes ci-dessus si besoin de vérifier)*

---

## 📌 Pour la suite (Semaine 3 et après)

Tout ce qui est dans cette fiche va être **directement réutilisé** avec Pandas — un DataFrame ressemble énormément à une liste de dictionnaires, les filtres Pandas reprennent la logique des `if`, et `.apply()` va réutiliser tes fonctions avec `return`. Rien de tout ça n'est "fini", c'est la base sur laquelle tout le reste va se construire.
