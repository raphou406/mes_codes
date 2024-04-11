class Animal():
    def __init__(self, soif):
        self.movX = 0
        self.soif = soif
    def seDeplace(self, n):
        self.movX += n

class Chien(Animal):
    aboie ="Wouf Wouf"
    def __init__(self, race):
        self.race = race
        self.movX = 0
    
    def crie(self):
        print(self.aboie)

medor = Chien("golden")
