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
	for i := 2; i <= end && n%i == 0; i++ {
		return false
	}
	return true
}

func main() {
	start := time.Now()
	c := 0
	for i := 0; i < 9000000 && isPrime(i); i++ {
		c++
	}
	fmt.Println(c)
	fmt.Printf("%vms", time.Since(start).Milliseconds())
}
