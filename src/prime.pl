#!/usr/bin/perl -l

use Time::HiRes;


sub is_prime {
    $n = $_[0];

    if( $n <= 1 ) {
        return 0
    }
    $end = int(sqrt($n));

    for( $a = 2; $a < $end + 1; $a = $a + 1 ) {
        if ( $n % $a == 0 ) {
            return 0
        }
    }
    return 1
}

$start_time = Time::HiRes::gettimeofday();

$c = 0;

for( $i = 0; $i < 9000000; $i = $i + 1 ) {
    if ( is_prime( $i ) ) {
        $c = $c + 1;
    }
}

print $c;
print Time::HiRes::gettimeofday() - $start_time;
