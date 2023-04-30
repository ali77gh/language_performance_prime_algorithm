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
| Ranking | Language | Runtime/Compiler | Time      |  n% slower than Winner  |
|---------|----------|------------------|-----------|-------------------------|
| #1      | Assembly | NASM             | 3.21s     | Winner                  |
| #2      | C        | GCC              | 3.61s     | 12%                     |
| #3      | C++      | G++              | 3.64s     | 13%                     |
| #4      | Rust     | Native 1.67.1    | 4.63s     | 44%                     |
| #5      | Java     | OpenJDK 17       | 5.77s     | 80%                     |
| #6      | Js       | Nodejs 12        | 5.95s     | 85%                     |
| #7      | C#       | Mono 6.8         | 6.50s     | 102%                    |
| #8      | Dart     | Dart 2.19.0      | 7.58s     | 136%                    |
| #9      | Python   | Codon 0.16.0     | 11.13s    | 246%                    |
| #10     | Go       | Go 1.20.3        | 12.75s    | 297%                    |
| #11     | Pascal   | FPC 3.2.2        | 14.33s    | 346%                    |
| #12     | Python   | Python 3.9.2     | 99.79s    | 3008%                   |

n% slower formulla: <br>
( (LanguageTime - WinnerTime) * 100 ) / WinnerTime

# Contribute
1. Optimize your favorite programming language <b>Without changing algorithm</b>
2. Add new language by using <b>same algorithm</b>.
3. Add new Runtime.
4. Share your test result.
5. Add your result.
