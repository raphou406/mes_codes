
class TestExo{
    public static void main(String[] args) {
        Compte monCompte = new Compte(500.0);
        monCompte.afficheSolde();
        monCompte.retirer(250);
        monCompte.afficheSolde();
        monCompte.deposer(1500);
        monCompte.afficheSolde();
    }
}