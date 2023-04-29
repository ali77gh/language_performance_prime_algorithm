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
| Ranking | Language | Runtime/Compiler | Time      |  n% slower than C   |
|---------|----------|------------------|-----------|---------------------|
| #1      | C        | GCC              | 3.55s     | Winner              |
| #2      | C++      | G++              | 3.56s     | 0.2%                |
| #3      | Rust     | Native 1.67.1    | 4.72s     | 33%                 |
| #4      | Java     | OpenJDK 17       | 5.60s     | 57%                 |
| #5      | Js       | Nodejs 12        | 5.89s     | 66%                 |
| #6      | C#       | Mono 6.8         | 6.41s     | 80%                 |
| #7      | Dart     | Dart 2.19.0      | 7.55s     | 112%                |
| #8      | Python   | Codon 0.16.0     | 10.89s    | 206%                |
| #9      | Go       | Go 1.20.3        | 12.85s    | 261%                |
| #10     | Pascal   | FPC 3.2.2        | 13.51s    | 280%                |
| #11     | Python   | Python 3.9.2     | 95.13s    | 2576%               |

n% slower formulla: <br>
( (LanguageTime - WinnerTime) * 100 ) / WinnerTime

# Contribute
1. Optimize your favorite programming language <b>Without changing algorithm</b>
2. Add new language by using <b>same algorithm</b>.
3. Add new Runtime.
4. Share your test result.
5. Add your result.
