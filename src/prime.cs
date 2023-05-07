using System;

class Program{
    static bool is_prime(int n) {
        if (n <= 1) {
            return false;
        }
        var end = (int)Math.Sqrt(n);
        for(int i = 2 ; i <= end ; i++)
            if (n % i == 0) {
                return false;
            }
        return true;
    }
    static void Main(string[] args){
        var start = DateTime.Now;
        var c = 0;
        for (int i=0;i<9000000;i++){
            if (is_prime(i)){
                c++;
            }
        }

        var end = DateTime.Now;

        Console.WriteLine(c);
        Console.Write( (int) (end-start).TotalMilliseconds );
        Console.WriteLine("ms");
    }

}
