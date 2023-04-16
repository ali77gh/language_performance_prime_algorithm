use std::time::{SystemTime, UNIX_EPOCH};


fn is_prime(n: u64) -> bool {
    if n <= 1 {
        return false;
    }

    let end = (n as f64).sqrt() as u64;
    for i in 2..=end {
        if n % i == 0 {
            return false;
        }
    }
    true
}

fn main() {
    let start = SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_millis();

    let mut c = 0;
    for i in 0..9000000{
        if is_prime(i){
            c+=1;
        }
    }

    let end = SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_millis();
    
    println!("{}",c);
    println!("{}ms",end-start);
}
