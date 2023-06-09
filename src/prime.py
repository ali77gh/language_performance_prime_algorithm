import math
import time


def is_prime(n):
    if n % 2 == 0:
        return False

    end = int(math.sqrt(n))
    for i in range(3, end, 2):
        if n % i == 0:
            return False

    return True


start = int(time.time())
c = 1  # value is 1 becuase loop started from 3
for i in range(3, 9000000):
    if is_prime(i):
        c += 1

print("Process time: ", int(time.time()) - start, " second(s)")
print("Count of prime(s): ", c)
