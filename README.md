# Performance Test
is_prime function implemented in many languages in same algorithm to compare different languages and runtimes


# How to run:
```bash
./run.sh
```

# Result:
```
*--- c++ native (opt-level=3) ----*
g++ (Debian 10.2.1-6) 10.2.1 20210110
602489
3193ms

*--- rust native (opt-level=3) ---*
rustc 1.65.0 (897e37553 2022-11-02)
602489
3608ms

*-------- java (open-jdk) --------*
javac 11.0.12
602489
4670ms

*------------ nodejs -------------*
v12.22.12
602489
4778ms

*------------ c# Mono ------------*
Mono C# compiler version 6.8.0.105
602489
5555ms

*---------- dart native ----------*
Dart SDK version: 2.17.0 (stable) on "linux_x64"
602489
5952ms

*--------- python codon ----------*
0.16.0
602489
10247.4

*------------ python -------------*
Python 3.9.2
602489
68955.783203125


```

# Table of times
| Ranking | Language | Runtime/Compiler | Time      |  n% slower then C++ |
|---------|----------|------------------|-----------|---------------------|
| #1      | C++      | G++              | 3.19s     | NaN                 |
| #2      | Rust     | Native 1.65.0    | 3.60s     | 12%                 |
| #3      | Java     | OpenJDK 11       | 4.67s     | 46%                 |
| #4      | Js       | Nodejs 12        | 4.77s     | 49%                 |
| #5      | C#       | Mono 6.8         | 5.55s     | 73%                 |
| #6      | Dart     | Dart 2.17.0      | 5.95s     | 86%                 |
| #7      | Python   | Codon 0.16.0     | 10.24s    | 321%                |
| #8      | Python   | Python 3.9.2     | 68.95s    | 2161%               |

# Contribute
1. Optimize your favorite programming language
2. Add new language or new runtime.

# TODO
- [x] Python codon
- [ ] Golang
- [ ] Rust nightly