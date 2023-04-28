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

	if n == 2 || n == 3 {
		return true
	}
	if n%2 == 0 {
		return false
	}

	end := int(math.Sqrt(float64(n)))
	for i := 3; i <= end; i += 2 {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	start := time.Now()
	c := 0
	for i := 0; i < 9000000; i++ {
		if isPrime(i) {
			c++
		}
	}
	fmt.Println(c)
	elapsed := time.Since(start)
	fmt.Printf("%vms", elapsed.Milliseconds())
}
