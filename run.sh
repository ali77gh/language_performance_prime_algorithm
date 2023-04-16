
echo "   *--- rust 1.65.0 (opt-level=3) ---*"
rustc -C opt-level=3 -C target-cpu=native prime.rs 

sleep 3 # cool down cpu

./prime
rm ./prime
