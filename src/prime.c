#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdint.h>

uint32_t is_prime(uint32_t n) {
    if (n <= 1)
        return 0;
    
    for (uint32_t i=2, end=sqrt(n); i <= end; i++) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main() {
    clock_t start = clock();
    uint32_t c = 0;
    for (uint32_t i = 0; i < 9000000; i++) {
        if (is_prime(i))
            c += 1;
    }
    printf("%d\n", c);
    printf("%ldms\n", (clock() - start)/1000);
    return 0;
}
