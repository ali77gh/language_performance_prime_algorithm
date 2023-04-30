package main

import (
	"fmt"
	"math"
	"time"
)

func isPrime(n int32) bool {
	if n <= 1 {
		return false
	}

	end := int32(math.Sqrt(float64(n)))
	var i int32
	for i = 2; i <= end; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	start := time.Now()
	c := 0

	var i int32
	for i = 0; i < 9000000; i++ {
		if isPrime(i) {
			c++
		}
	}
	fmt.Println(c)

	duration := time.Since(start)
	fmt.Printf("%s\n", duration)
}
