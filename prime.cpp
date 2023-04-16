#include <iostream>
#include <math.h>
#include <time.h>

bool is_prime(int n) {
    if (n <= 1) {
        return false;
    }
    
    int end = int(sqrt(n));
    for (int i = 2; i <= end; i++) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    clock_t start = clock();
    int c = 0;
    for (int i = 0; i < 9000000; i++) {
        if (is_prime(i)) {
            c += 1;
        }
    }
    std::cout << c << std::endl;
    std::cout << (clock() - start)/1000 << "ms" << std::endl;
    return 0;
}

