# Performance Test
is_prime function implemented in many languages in same algorithm to compare speed of different languages and runtimes.


# How to run:
```bash
./run.sh 
```

# Result:
see [result](https://github.com/ali77gh/language_performance_prime_algorithm/tree/master/result)

### Add your result:
```bash
./run.sh > "./result/YOUR_CPU_MODEL_HERE"
```
Example:
```bash
./run.sh > "./result/Intel(R) Core(TM) i7-8550U"
```
Get cpu model by running:
```bash
lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p'
```

# My Laptop (Intel(R) Core(TM) i7-8550U)

Note: times are 5% more or less on different runs, so C and C++ can win somtimes.

| Ranking | Language | Runtime/Compiler | Time      |  n% slower than Winner  |
|---------|----------|------------------|-----------|-------------------------|
| #1      | Assembly | NASM             | 3.10s     | Winner                  |
| #2      | C        | GCC              | 3.12s     | 0.64%                   |
| #3      | C++      | G++              | 3.15s     | 1.6%                    |
| #4      | Rust     | Native 1.67.1    | 3.31s     | 6.7%                    |
| #5      | Go       | Go 1.20.3        | 3.81s     | 22%                     |
| #6      | Java     | OpenJDK 17       | 5.73s     | 84%                     |
| #7      | Js       | Nodejs 12        | 5.85s     | 88%                     |
| #8      | C#       | Mono 6.8         | 6.54s     | 110%                    |
| #9      | Dart     | Dart 2.19.0      | 7.11s     | 129%                    |
| #10     | Python   | Codon 0.16.0     | 10.89s    | 251%                    |
| #11     | Pascal   | FPC 3.2.2        | 13.68s    | 341%                    |
| #12     | Python   | Python 3.9.2     | 99.79s    | 3008%                   |

n% slower formulla: <br>
( (LanguageTime - WinnerTime) * 100 ) / WinnerTime

# Contribute
1. Optimize your favorite programming language <b>Without changing algorithm</b> and without using concurrency.
2. Add new language by using <b>same algorithm</b>.
3. Add new Runtime.
4. Share your test result.
5. Add your result.
