# gem update --system
# gem install cmath


require 'cmath'
require 'benchmark'

def is_prime(n)
  return false if n <= 1

  end_num = CMath.sqrt(n).to_i
  (2..end_num).each do |i|
    return false if n % i == 0
  end

  true
end

start_time = Benchmark.realtime do
  c = 0
  (0...9_000_000).each do |i|
    c += 1 if is_prime(i)
  end
  puts c
end

puts start_time * 1000
