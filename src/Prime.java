import java.lang.Math;
class Prime {
    
    static boolean is_prime(int n) {
        if ((n <= 1)) {
            return false;
        }
        
        var end = Math.sqrt(n);
        for (int i = 2; i <= end; i++) {
            if (((n % i) == 0)) {
                return false;
            }
            
        }
        
        return true;
    }
    
    public static void main(String[] args) {
        var start = System.currentTimeMillis();
        var c = 0;
        for (int i = 0; i < 9000000; i++) {
            if (is_prime(i)) {
                c++;
            }
            
        }
        
        var end = System.currentTimeMillis();
        System.out.println(c);
        System.out.print((end - start));
        System.out.println("ms");
    }
}
