# Performance Test

This repository contains an implementation of the `is_prime` function in multiple programming languages using the same algorithm. The goal is to compare the performance of different languages and runtimes.

## Usage

To run code in various programming languages, use the `run.sh` script:

```bash
./run.sh [LANGUAGE]
```

If no argument is provided, the script will run code in all supported languages. Otherwise, provide a language name to run the corresponding code.

### Supported Languages
- assembly
- c
- cpp
- rust
- go
- java
- nodejs
- csharp_mono
- dart
- python_codon
- pascal
- python
- php
- r
- erlang

### Examples
```bash
# Run code in all supported languages
./run.sh

# Run C++ code
./run.sh cpp
```

To display usage instructions and a list of supported languages, use the `--help` or `-h` flag:

```bash
./run.sh --help
```

If you want to add your own test results, simply run the `run.sh` script with your CPU model name and redirect the output to a file in the `result` directory.

See the [result directory](./result) for the output of running the tests on different CPUs.

## My Laptop (Intel(R) Core(TM) i7-8550U)

Note: times are 5% more or less on different runs, so C and C++ can win sometimes.

| Ranking | Language | Runtime/Compiler | Time   | n% Slower than Winner |
| ------- | -------- | ---------------- | ------ | --------------------- |
| #1      | Assembly | NASM             | 3.10s  | Winner                |
| #2      | C        | GCC              | 3.12s  | 0.64%                 |
| #3      | C++      | G++              | 3.15s  | 1.6%                  |
| #4      | Rust     | Native 1.67.1    | 3.31s  | 6.7%                  |
| #5      | Go       | Go 1.20.3        | 3.81s  | 22%                   |
| #6      | Java     | OpenJDK 17       | 5.73s  | 84%                   |
| #7      | Js       | Nodejs 12        | 5.85s  | 88%                   |
| #8      | C#       | Mono 6.8         | 6.54s  | 110%                  |
| #9      | Dart     | Dart 2.19.0      | 7.11s  | 129%                  |
| #10     | Python   | Codon 0.16.0     | 10.89s | 251%                  |
| #11     | Pascal   | FPC 3.2.2        | 13.68s | 341%                  |
| #12     | PHP      | PHP 7.4.33       | 30.24s | 875%                  |
| #13     | Python   | Python 3.9.2     | 99.79s | 3008%                 |

The `n% Slower than Winner` column shows the percent difference between the time taken by each language and the fastest language (Assembly).

Formula: ((LanguageTime - WinnerTime) * 100) / WinnerTime

## Contribute

You can contribute to this repository in one of the following ways:

1. Optimize your favorite programming language <b>without changing the algorithm</b> and without using concurrency.
2. Add a new language by using <b>the same algorithm</b>.
3. Add a new runtime.
4. Share your test results.
5. Add your result to the `result` directory.
