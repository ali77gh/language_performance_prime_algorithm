function is_prime(n) {
  if (n <= 1) {
    return false;
  }
  if (n === 2 || n === 3) {
    return true;
  }
  if (n % 2 === 0) {
    return false;
  }
  var end = Math.sqrt(n); // ((n as f64).sqrt() as u64);
  for (var i = 3; i <= end; i += 2) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

var start = Date.now();
let c = 0;
for (var i = 0; i < 9000000; i++) {
  if (is_prime(i)) {
    c++;
  }
}
console.log(c);
console.log(Date.now() - start + "ms");
