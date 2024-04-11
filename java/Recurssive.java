
public class Recurssive {
    public static void main(String[] args) {
        for (int i = 1; i<5; i++){
            System.out.println(A(i));
    }
}

    public static int A(int n){
        if (n == 0){
            return 1;
        }else{
            return A(n-1)*n;
        }
    }
}
