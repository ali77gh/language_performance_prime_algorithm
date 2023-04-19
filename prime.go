package main

import (
    "fmt"
    "math"
    "time"
)

func isPrime(n int) bool {
    if n <= 1 {
        return false
    }

    end := int(math.Sqrt(float64(n)))
    for i := 2; i <= end; i++ {
        if n%i == 0 {
            return false
        }
    }
    return true
}

func main() {
    start := float64(time.Now(). UnixMilli()) 
    c := 0
    for i := 0; i < 9000000; i++ {
        if isPrime(i) {
            c++
        }
    }
    fmt.Println(c)
    end := float64(time.Now().UnixMilli())
    fmt.Printf("Execution time: %vms", end-start)
}
