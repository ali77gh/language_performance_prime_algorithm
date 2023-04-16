# general way for this problem
# import math
# import time

# def is_prime(n):
#     if n <= 1:
#         return False;
    
#     end = int(math.sqrt(n))
#     for i in range(2, end+1):
#         if n % i == 0:
#             return False
#     return True


# start = time.time() * 1000
# c = 0
# for i in range(0,9000000):
#     if is_prime(i):
#         c+=1

# print(c);
# print( (time.time()*1000) - start);


# implementation via (Sieve of Eratosthenes) algorithm
import time

def count_primes(n: int) -> int:
    s = time.time() * 1000
    primes = [True] * n
    primes[0] = primes[1] = False
    for i in range(2, int(n ** 0.5) + 1):
        if primes[i]:
            for j in range(i * i, n, i):
                primes[j] = False
    return sum(primes), (time.time() * 1000 - s)
 
c,e = count_primes(9000000)
print(f"Found {c} prime number in {e}ms")
