package main

import (
	"fmt"
	"math"
	"time"
)

func isPrime(n uint32) bool {
	if n <= 1 {
		return false
	}

	end := uint32(math.Sqrt(float64(n)))
	var i uint32

	for i = 2; i <= end; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func main() {

	start := float64(time.Now().UnixMilli())
	c := 0
	var i uint32

	for i = 0; i < 9000000; i++ {
		if isPrime(i) {
			c++
		}
	}
	fmt.Println(c)
	end := float64(time.Now().UnixMilli())
	fmt.Printf("%vms", end-start)
}
