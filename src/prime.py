import math
import time


def is_prime(n):
    if n==2:
        return True
    if n <= 1 or not n&1:
        return False

    end = int(math.sqrt(n))
    for i in range(3, end+1,2):
        if n % i == 0:
            return False
    return True


start = time.time() * 1000
c = 0
for i in range(0, 9000000):
    if is_prime(i):
        c += 1

print(c)
print((time.time()*1000) - start)
