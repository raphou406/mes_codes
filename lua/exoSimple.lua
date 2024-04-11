--exo1
-- 1. Déclarez deux variables, x et y, et assignez-leur des valeurs.
-- 2. Affichez la somme, la différence, le produit et le quotient de x et y.

-- Votre code ici
function calculBasique(var1, var2)
    print(var1 + var2, var1 - var2, var1 * var2, var1 / var2)
end
calculBasique(3, 6)


--exo2
-- 1. Déclarez une variable n et assignez-lui une valeur.
-- 2. Utilisez une structure de contrôle pour afficher "Nombre positif" si n est positif,
--    "Nombre nul" si n est égal à zéro, et "Nombre négatif" sinon.

-- Votre code ici
function variation(n)
    if n > 0 then
        print("Nombre positif")
    elseif n == 0 then
        print("Nombre null")
    else
        print("Nombre negatif")
    end
end
variation(-1)

--exo3
-- 1. Utilisez une boucle pour afficher les nombres de 1 à 5.
-- 2. Modifiez la boucle pour afficher seulement les nombres pairs.

-- Votre code ici
function boucle()
    for i = 1, 5 do
        print(i)
    end
end
boucle()
function bouclePairs()
    for i = 1, 5 do
        if i % 2 == 0 then
            print(i)
        end
    end
end
bouclePairs()

--exo4
-- 1. Créez une fonction qui prend deux paramètres et retourne leur somme.
-- 2. Appelez la fonction avec des valeurs différentes et affichez le résultat.

-- Votre code ici
function somme(var1, var2)
    return var1 + var2
end
print(somme(5, 1))

--exo5
-- 1. Créez un tableau contenant les jours de la semaine.
-- 2. Utilisez une boucle pour afficher chaque jour.

-- Votre code ici
joursSemaine = {"Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"}
function afficheSemaine(tab)
    for i = 1, #tab do
        print(tab[i])
    end
end
afficheSemaine(joursSemaine)

--exo6
-- 1. Ajoutez un jour supplémentaire à votre tableau de jours.
-- 2. Supprimez le premier jour de la semaine.
-- 3. Affichez le tableau mis à jour.

-- Votre code ici
function modifTab(tab)
    table.insert(tab, "newDay")
    table.remove(tab, 1)
    return tab
end
modifTab(joursSemaine)
afficheSemaine(joursSemaine)

--exo7
-- 1. Créez une fonction qui prend deux chaînes de caractères en paramètres et les concatène.
-- 2. Appelez la fonction avec deux chaînes différentes et affichez le résultat.

-- Votre code ici
function fusionString(str1, str2)
    local newStr = str1 .. str2 
    return newStr
end
print(fusionString("bon", "jour"))

--exo8
-- 1. Utilisez une boucle 'while' pour afficher les nombres de 1 à 5.
-- 2. Modifiez la boucle pour afficher seulement les nombres impairs.

-- Votre code ici
function whileBoucle(n)
    local i = 1
    while i <= n do
        print(i)
        i = i + 1
    end
end
whileBoucle(5)

--exo9
-- 1. Créez un tableau associatif représentant les informations d'une personne (nom, âge, ville, etc.).
-- 2. Affichez les différentes informations en utilisant des clés.

-- Votre code ici
function dico(tabAssco)
    for i in pairs(tabAssco) do
        for k, v in pairs(tabAssco[i]) do
            print(k,v)
        end
    end
end
personne = {}
personne[1] = {nom = "Raphael", age = 18, ville = "Le Havre"}
personne[2] = {nom = "Antoine", age = 17, ville = "Le Havre"}
dico(personne)

--exo10
-- 1. Créez une fonction récursive qui calcule la factorielle d'un nombre.
-- 2. Appelez la fonction avec une valeur et affichez le résultat.

-- Votre code ici
function factorielle(n)
    if n == 1 then
        return n
    else
        return n * factorielle(n-1)
    end
end
print(factorielle(5))

--exo11
-- 1. Créez un fichier texte contenant quelques lignes de texte.
-- 2. Écrivez une fonction qui lit le contenu du fichier et l'affiche.

-- Votre code ici
function lines_from(file)

    local lines = file:lines()
    print("contenue : ")
    for line in lines do 
            print('\t' .. line)
    end
end
fichier = io.open("lisMoi.txt", "r")
lines_from(fichier)
fichier = io.close()

--Corection
function lireContenuFichier(nomFichier)
    local fichier = io.open(nomFichier, "r")
    
    if fichier then
        local contenu = fichier:read("*a")
        print(contenu)
        fichier:close()
    else
        print("Erreur: Impossible d'ouvrir le fichier.")
    end
end

-- Exemple d'appel de la fonction
lireContenuFichier("lisMoi.txt")

--exo12
-- 1. Créez un module Lua avec une fonction qui réalise une opération mathématique simple.
-- 2. Importez le module dans un autre fichier Lua et utilisez la fonction.

-- Votre code ici
local monModule = {}

function monModule.addition(a, b)
    return a + b
end
function monModule.factorielle(n)
    if n == 1 then
        return 1
    else
        return n * factorielle(n-1)
    end
end
function monModule.soustraction(a, b)
    return a - b
end

print(monModule.factorielle(10))
print(monModule.addition(5, 1))