
echo "*--- c native (opt-level=3) ----*"
gcc --version | head -n 1
gcc prime.c -o prime -lm

sleep 5 # cpu cool down

./prime
rm ./prime
echo "" 



echo "*--- c++ native (opt-level=3) ----*"
g++ --version | head -n 1
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



echo "*------------ c# Mono ------------*"
mcs --version
mcs prime.cs

sleep 5 # cpu cool down

mono ./prime.exe
rm ./prime.exe
echo "" 



echo "*---------- dart native ----------*"
dart --version
dart compile exe prime.dart

sleep 5 # cpu cool down

./prime.exe
rm ./prime.exe
echo "" 



echo "*--------- python codon ----------*"
codon --version
codon build -release -exe prime.py

sleep 5 # cpu cool down

./prime
rm ./prime
echo "" 



echo "*------------ python -------------*"
python3 --version

sleep 5 # cpu cool down

python3 prime.py
echo "" 



echo "*---------- go ----------*"
go version
go build ./prime.go

sleep 5 # cpu cool down

./prime.exe
rm ./prime.exe
echo ""
