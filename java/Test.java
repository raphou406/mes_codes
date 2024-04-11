import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Test {
    public static void main(String[] args){
        System.out.println("Hello World");
        int add = addition(50, 25);
        System.err.println(boucle());
        System.out.println(add);
        List<Integer> list = new ArrayList<Integer>(){{
            for (int i = 0; i<10; i++){
                add(i);
            }
        }};
        for (int i = 0; i<list.size(); i++){
            System.err.print(list.get(i) + " ");
        }
        System.out.println(fiboacci(5));
        tableMultiplication(5);
        List<String> mots = new ArrayList<String>(){{
            add("je");
            add("baise");
            add("nolan");
        }};
        decompositionStr(mots.toArray(new String[0]));
        List<Integer> findMax = new ArrayList<Integer>(){{
            Random intRandom = new Random();
            for (int i = 0; i<25; i++){
                add(intRandom.nextInt(50));
            }
        }};
        for (int i : findMax){
            System.out.print(i + " ");
        }
        System.out.println("\nElement Max de la liste => " + maxList(findMax));
    }

    public static int addition(int a, int b){
        return a + b;
    }

    public static float f(int x){
        return x^2;
    }

    public static int boucle(){
        int total = 0;
        for(int i = 0; i < 10; i++){
            total += i;
        }
        return total;
    }

    public static int fiboacci(int n){
        List<Integer> fibo = new ArrayList<>(){{
            add(0);
            add(1);
        }};
        int ans = 0;
        for (int i = 1; i<n; i++){
            ans = fibo.get(i - 1) + fibo.get(i);
            fibo.add(ans);
        }
        return ans;
    }

    public static void tableMultiplication(int n){
        for (int i = 0; i<=10; i++){
            System.out.println(i+"x"+n+"="+i*n);
        }
    }

    public static int maxList(List<Integer> tab){
        int max = tab.get(0);
        for (int i = 0; i<tab.size(); i++){
            int elem = tab.get(i);
            if (max < elem){
                max = elem;
            }
        }
        return max;
    }

    public static void decompositionStr(String... mot){
        for (String lettre : mot){
            System.out.println(lettre);
        }
    }
}