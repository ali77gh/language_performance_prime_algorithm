
function is_prime(n){
    if(n <= 1) {
        return false;
    }
    var end = Math.sqrt(n); // ((n as f64).sqrt() as u64);
    for(var i=2 ; i <= end ; i++){
        if (n % i == 0) {
            return false;
        }

    }
    return true
}

var start = Date.now()
let c = 0;
for(var i=0;i<9000000;i++) {
    if (is_prime(i)){
        c++;
    }
}
console.log(c);
console.log( (Date.now()) - start + "ms");
