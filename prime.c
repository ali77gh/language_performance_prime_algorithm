#include <stdio.h>
#include <math.h>
#include <time.h>

int is_prime(int n) {
    if (n <= 1)
        return 0;
    
    for (int i = 2, end=sqrt(n); i <= end; i++) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main() {
    clock_t start = clock();
    int c = 0;
    for (int i = 0; i < 9000000; i++) {
        if (is_prime(i))
            c += 1;
    }
    printf("Found %d Prime Number\n", c);
    printf("in %ldms\n", (clock() - start)/1000);
    return 0;
}
