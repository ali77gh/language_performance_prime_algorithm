<?php

function is_prime($n) {
    if ($n <= 1) {
        return false;
    }
    
    $end = intval(sqrt($n));
    for ($i = 2; $i <= $end; $i++) {
        if ($n % $i == 0) {
            return false;
        }
    }
    return true;
}

$start = microtime(true) * 1000;
$c = 0;
for ($i = 0; $i < 9000000; $i++) {
    if (is_prime($i)) {
        $c++;
    }
}

echo "$c\n";
echo (microtime(true) * 1000 - $start);

?>
