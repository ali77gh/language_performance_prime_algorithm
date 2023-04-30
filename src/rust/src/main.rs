#[global_allocator]
static GLOBAL: mimalloc::MiMalloc = mimalloc::MiMalloc;

use std::time::Instant;

fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }

    let end = (n as f32).sqrt() as u32;
    !(2..=end).any(|i| n % i == 0)
}

fn main() {
    let start = Instant::now();

    let c = (0..9000000).filter(|&x| is_prime(x)).count();

    let elapsed = start.elapsed().as_millis();

    println!("{c}");
    println!("{elapsed}ms");
}
