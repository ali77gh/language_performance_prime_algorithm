function is_prime(n::Int64)::Bool
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
    c::Int32 = 0
    for i in 0: 9000000
        if is_prime(i)
            c += 1
        end
    end

    println("Primes: $c")
    dt = time() - start
    println("Time: $dt (s)")
end