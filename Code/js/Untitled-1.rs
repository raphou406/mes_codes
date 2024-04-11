// Fonction principale
fn main() {
    // Afficher du texte
    println!("Bonjour, bienvenue en Rust!");

    // Déclarer une variable immuable
    let x = 5;
    println!("La valeur de x est: {}", x);

    // Déclarer une variable mutable
    let mut y = 10;
    println!("La valeur de y avant modification est: {}", y);

    // Modifier la variable mutable
    y = 15;
    println!("La valeur de y après modification est: {}", y);

    // Appeler une fonction avec un paramètre
    afficher_message("C'est amusant d'apprendre Rust!");

    // Utiliser la gestion des erreurs avec Result
    let resultat = diviser(10, 2);
    match resultat {
        Ok(v) => println!("Le résultat de la division est: {}", v),
        Err(e) => println!("Erreur de division: {}", e),
    }
}

// Définir une fonction avec un paramètre
fn afficher_message(message: &str) {
    println!("{}", message);
}

// Définir une fonction qui retourne un Result
fn diviser(a: i32, b: i32) -> Result<i32, &'static str> {
    if b == 0 {
        Err("Division par zéro")
    } else {
        Ok(a / b)
    }
}
