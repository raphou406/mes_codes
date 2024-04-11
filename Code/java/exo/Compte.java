public class Compte{
    double solde;

    public Compte(double s){
        this.solde = s;
    }

    public void deposer(float depo){
        this.solde += depo;
    }
    public void retirer(float retrait){
        this.solde -= retrait;
    }

    public void afficheSolde(){
        System.out.println(this.solde);
    }
}