#include <iostream>
#include <math.h>
#include <time.h>
#include <cstdint>

bool is_prime(uint32_t n) {
    if (n <= 1) {
        return false;
    }
    
    uint32_t end = uint32_t(sqrt(n));
    for (uint32_t i = 2; i <= end; i++) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    clock_t start = clock();
    uint32_t c = 0;
    for (uint32_t i = 0; i < 9000000; i++) {
        if (is_prime(i)) {
            c += 1;
        }
    }
    std::cout << c << std::endl;
    std::cout << (clock() - start)/1000 << "ms" << std::endl;
    return 0;
}
