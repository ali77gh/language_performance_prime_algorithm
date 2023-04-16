// using System;

// class Program{
//     static bool is_prime(int n) {
//         if (n <= 1) {
//             return false;
//         }
//         var end = Math.Sqrt(n);
//         for(int i = 2 ; i <= end ; i++)
//             if (n % i == 0) {
//                 return false;
//             }
//         return true;
//     }
//     static void Main(string[] args){
//         var start = DateTime.Now;
//         var c = 0;
//         for (int i=0;i<9000000;i++){
//             if (is_prime(i)){
//                 c++;
//             }
//         }

//         var end = DateTime.Now;

//         Console.WriteLine(c);
//         Console.Write( (int) (end-start).TotalMilliseconds );
//         Console.WriteLine("ms");
//     }

// }

using System;

class Program
{
    static void Main(string[] args)
    {
        var start = DateTime.Now;
        int N = 9000000;
        bool[] isPrime = new bool[N + 1];

        // Initialize all numbers to be prime
        for (int i = 2; i <= N; i++)
        {
            isPrime[i] = true;
        }

        // Mark all multiples of each prime as not prime
        for (int i = 2; i * i <= N; i++)
        {
            if (isPrime[i])
            {
                for (int j = i * i; j <= N; j += i)
                {
                    isPrime[j] = false;
                }
            }
        }

        int c = 0;
        // Print all prime numbers
        Console.WriteLine("Prime numbers:");
        for (int i = 2; i <= N; i++)
        {
            if (isPrime[i])
            {
                c++;
            }

        }

        var end = (DateTime.Now - start).TotalMilliseconds;


        Console.WriteLine(c);
        Console.WriteLine(String.Format("{0} in {1} ms", c,end));

        Console.ReadKey();
    }
}

