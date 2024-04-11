function calc(taxes, article)
    return article + taxes
end

stop = 0
total = 0
while stop ~= 1 do
    
    print("entrez la valeur de la taxe : ")
    taxe = io.read("*n")
    print("entrez la valeur du produits : ")
    prix = io.read("*n")
    total = total + calc(taxe, prix)

    print("ecrire 1 pour arreter la boucle ")
    stop = io.read("*n")
end

print(total)