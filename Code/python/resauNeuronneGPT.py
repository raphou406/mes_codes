import numpy as np

# Fonction d'activation (sigmoid dans cet exemple)
def sigmoid(x):
    return 1 / (1 + np.exp(-x))

# Définition des données d'entrée
input_data = np.array([[0, 0],
                       [0, 1],
                       [1, 0],
                       [1, 1]])

# Définition des poids et du biais
weights = np.random.rand(2, 1)
bias = np.random.rand(1)

# Entraînement du réseau
epochs = 10000
learning_rate = 0.1

for epoch in range(epochs):
    # Calcul de la prédiction
    output = sigmoid(np.dot(input_data, weights) + bias)

    # Calcul de l'erreur
    error = np.array([[0], [1], [1], [0]]) - output

    # Mise à jour des poids et du biais
    weights += learning_rate * np.dot(input_data.T, error)
    bias += learning_rate * np.sum(error)

# Test du réseau
new_input = np.array([1, 0])
result = sigmoid(np.dot(new_input, weights) + bias)

print("Résultat pour l'entrée [1, 0] :", result)
