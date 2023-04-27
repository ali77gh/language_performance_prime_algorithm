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
| Ranking | Language | Runtime/Compiler | Time      |  n% slower then C   |
|---------|----------|------------------|-----------|---------------------|
| #1      | C        | GCC              | 3.55s     | Winner              |
| #2      | C++      | G++              | 3.56s     | 0.1%                |
| #3      | Rust     | Native 1.65.0    | 4.72s     | 13%                 |
| #4      | Java     | OpenJDK 11       | 5.60s     | 15%                 |
| #5      | Js       | Nodejs 12        | 5.89s     | 16%                 |
| #6      | C#       | Mono 6.8         | 6.41s     | 18%                 |
| #7      | Dart     | Dart 2.17.0      | 7.55s     | 21%                 |
| #8      | Python   | Codon 0.16.0     | 10.89s    | 30%                 |
| #9      | Go       | Go 1.20.3        | 12.85s    | 36%                 |
| #10     | Python   | Python 3.9.2     | 95.13s    | 267%                |

# Contribute
1. Optimize your favorite programming language
2. Add new language.
3. Add new Runtime.
4. Share your test result.
5. Add your result.
