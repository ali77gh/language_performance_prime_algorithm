function is_prime(n::UInt32)::Bool
    if n <= 1
        return false
    end

    endloop = floor(Int, sqrt(n))
    for i in 2: endloop
        if n % i == 0
            return false
        end
    end
    return true    
end

let
    start = time()
    c::UInt32 = 0
    for i in 0: 9000000
        @inbounds if is_prime(UInt32(i))
            c += 1
        end
    end

    println("Primes: $c")
    dt = time() - start
    println("Time: $dt (s)")
end