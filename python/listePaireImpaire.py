def classif_pair_impair(tab :list[int])->list[int]:
    """
        trie un tableau d'entier en fonction de le parité
        au debut du tableau les nombres pairs et a la fin les nombre impairs
        Ne modifie pas l'ordre d'entrée des nombres
    """
    for _ in range(len(tab)):
        for j in range(len(tab) - 1):
            #verifie si l'element j de la liste est pair et si l'element j + 1 est impaire
            if ( tab[j] % 2 != 0 ) and (tab[j+1] % 2 == 0):
                #echange les valeur tab[j] et tab[j+1] entre elles
                tab[j], tab[j+1] = tab[j+1], tab[j]
    return tab

import random as ra

if __name__ == "__main__":
    #crée un tableau de nombre aleatoire de 50 elements
    tab = [ra.randint(1, 100) for i in range(50)]
    print(tab)
    tab = classif_pair_impair(tab)
    print(tab)