function is_prime(n::UInt32)::Bool
    one_num::UInt8 = 1
    if n <= one_num
        return false
    end
    startloop::UInt8 = 2
    endloop = floor(Int16, sqrt(n))
    for i in startloop: endloop
        zero_num::UInt8 = 0
        if n % i == zero_num
            return false
        end
    end
    return true    
end

let
    start = time()
    one_num::UInt8 = 1
    c::UInt32 = 0
    endloop::UInt32 = 9000000
    startloop::UInt8 = 0
    for i in startloop: endloop
        if is_prime(i)
            c += one_num
        end
    end
    println("Primes: $c")
    dt = time() - start
    println("Time: $dt (s)")
end