
public class Recurssive {
    public static void main(String[] args) {
        System.out.println("je fonctionne");
        System.out.println(fibo(50));
}

    public static int A(int n){
        if (n == 1){
            return 1;
        }else{
            return A(n-1)*n;
        }
    }
    public static double fibo(int n){
        if (n <= 1){
            return 1;
        }
        else{
            return fibo(n-1) + fibo(n-2);
        }
    }
}
