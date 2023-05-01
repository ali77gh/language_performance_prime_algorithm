package main

import (
	"fmt"
	"math"
	"sync"
	"time"
)

func main() {
	start := time.Now()

	// 602_489 is just channel buffer size value!
	ch := make(chan int, 602_490)

	var wg sync.WaitGroup
	wg.Add(9_000_000)

	c := 0
	for i := 0; i < 9_000_000; i++ {
		go func(i int) {
			if i <= 1 {
				wg.Done()
				return
			}

			end := int(math.Sqrt(float64(i)))
			for j := 2; j <= end; j++ {
				if i%j == 0 {
					wg.Done()
					return
				}
			}

			ch <- 1
			wg.Done()
			return
		}(i)
	}

	wg.Wait()
	close(ch)

	for range ch {
		c += 1
	}

	elapsed := time.Since(start)

	fmt.Println(c)
	fmt.Println(elapsed)

	return
}
