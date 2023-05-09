use std::time::Instant;

fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }

    let end = (n as f32).sqrt() as u32;
    for i in 2..=end {
        if n % i == 0 {
            return false;
        }
    }
    true
}

fn main() {
    let start = Instant::now();

    let mut c= 0;
    for i in 0..9000000{
        if is_prime(i){
            c+=1;
        }
    }

    let elapsed = start.elapsed().as_millis();

    println!("{c}");
    println!("{elapsed}ms" );
}
