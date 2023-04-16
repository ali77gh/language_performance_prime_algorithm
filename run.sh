
echo "*--- rust native (opt-level=3) ---*"
rustc --version
rustc -C opt-level=3 -C target-cpu=native prime.rs 

sleep 5 # cool down cpu

./prime
rm ./prime
echo "" 


echo "*------------ nodejs -------------*"
node --version

sleep 5 # cool down cpu

node prime.js
