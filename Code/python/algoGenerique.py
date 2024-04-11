import random
import time

class genome():
    def __init__(self, Nombre_gene, puissance=1) -> None:
        self.genes = [random.randint(0, puissance) for x in range(Nombre_gene)]
        self.score = 0

    def getGenes(self):
        return self.genes
    def getScore(self):
        return self.score

    def calcul_score(self):
        self.score = 0
        for gene in self.genes:
            self.score += gene
        return self.score

    def mutation(self):
        index_gene = random.randint(0, len(self.genes)-1)
        gene = self.genes[index_gene]
        gene = 2 if gene == 0 else gene-1
        self.genes[index_gene] = gene

def tri_population(tab_population :list):
    tab_population.sort(key=lambda genome : genome.getScore(), reverse=True)

def create_genome(nombre_de_genome :int)->list:
    population = []
    for individu in range(nombre_de_genome):
        population.append(genome(8))
        population[individu].calcul_score()
    return population

def affiche_population(tab_population :list):
    for population in tab_population:
        print(population.getGenes(), ",", population.getScore())

def shuffle_gene(tab_population :list):
    gene_pere = [tab_population[0].getGenes()[x] for x in range(len(tab_population[0].getGenes())//2)]
    for enfant in range(1,len(tab_population)//2):
        gene_mere = [tab_population[enfant].getGenes()[x] for x in range(len(tab_population[enfant].getGenes())//2, len(tab_population[enfant].getGenes()))]
        tab_population[enfant].genes = gene_pere + gene_mere
        tab_population[enfant].calcul_score()

def nouvel_individu(tab_population :int, nombre_nouveau_nee :int):
    for x in range(nombre_nouveau_nee + 1, len(tab_population)):
        tab_population[x] = genome(8)
        tab_population[x].calcul_score()

def mutation_population(tab_population :list):
    for individu in tab_population:
        individu.mutation()
        individu.calcul_score()

def calcul_score_population(tab_population :list):
    score = 0
    for individu in tab_population:
        score += individu.getScore()
    return score

def generations(tab_population :list,  nombre_generation :int):
    meilleur_population = []
    for generation in range(nombre_generation):
        tri_population(tab_population)
        print("\n Géneration numéro : ", generation)
        print("--------------------------")
        affiche_population(tab_population)
        shuffle_gene(tab_population)
        nouvel_individu(tab_population, 4)
        mutation_population(tab_population)
        print("Score de la population", generation, ": ", calcul_score_population(tab_population))
        time.sleep(0.5)
    """    if calcul_score_population(tab_population) >= 55:
            meilleur_population.append(tab_population)
    for best in meilleur_population:
        affiche_population(best)
        print("score : ", calcul_score_population(best), "\n")"""
if __name__ == "__main__":
    population = create_genome(10)
    generations(population, 20)

