import 'dart:math';

bool is_prime(int n){
    if(n <= 1) {
        return false;
    }
    var end = sqrt(n); // ((n as f64).sqrt() as u64);
    for(var i=2 ; i <= end ; i++){
        if (n % i == 0) {
            return false;
        }

    }
    return true;
}

void main(){

	var start = DateTime.now().millisecondsSinceEpoch;
	var c = 0;
	for(var i=0;i<9000000;i++) {
		if (is_prime(i)){
			c++;
		}
	}
	var end = DateTime.now().millisecondsSinceEpoch;
	print(c);
	print( (end - start).toString() + "ms");
}

