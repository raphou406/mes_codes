import numpy
def multiplication(a,b):
    for i in range(a):
        b+=b
    return b
goto8 = []

def liste(n):
    for i in range(1,n):
        goto8.append(i)
def dessin():
    for i in goto8:
        print(17 * "-") # permet d’afficher 17 tirets
        for j in goto8:
            # le end='' est là pour éviter un retour à la ligne
            print("|", end='') 
            if (i+j)%2 == 0:
                print(' ', end='')
            else:
                print('■', end='')
        print("|")
    print(17 * "-")

print(numpy.exp(1))