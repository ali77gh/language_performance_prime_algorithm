
echo "*--- c++ native (opt-level=3) ----*"
g++ --version
g++ prime.cpp -o prime -g -O3

sleep 5 # cpu cool down

./prime
rm ./prime
echo "" 



echo "*--- rust native (opt-level=3) ---*"
rustc --version
rustc -C opt-level=3 -C target-cpu=native prime.rs 

sleep 5 # cool down cpu

./prime
rm ./prime
echo "" 



echo "*-------- java (open-jdk) --------*"
javac --version
javac Prime.java

sleep 5 # cpu cool down

java Prime
rm Prime.class
echo "" 



echo "*------------ nodejs -------------*"
node --version

sleep 5 # cool down cpu

node prime.js
