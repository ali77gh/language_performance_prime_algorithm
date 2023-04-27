
echo "*---- c native (opt-level=3) -----*"
gcc --version | head -n 1
gcc ./src/prime.c -o prime -lm -g -O3

sleep 5 # cpu cool down

./prime
rm ./prime
echo "" 



echo "*--- c++ native (opt-level=3) ----*"
g++ --version | head -n 1
g++ ./src/prime.cpp -o prime -g -O3

sleep 5 # cpu cool down

./prime
rm ./prime
echo "" 



echo "*--- rust native (opt-level=3) ---*"
rustc --version
rustc -C opt-level=3 -C target-cpu=native ./src/prime.rs 

sleep 5 # cool down cpu

./prime
rm ./prime
echo "" 



echo "*-------- java (open-jdk) --------*"
javac --version
javac ./src/Prime.java

sleep 5 # cpu cool down

cd src
java Prime
rm ./Prime.class
cd ..
echo "" 



echo "*------------ nodejs -------------*"
node --version

sleep 5 # cool down cpu

node ./src/prime.js
echo "" 


echo "*------------ c# Mono ------------*"
mcs --version
mcs ./src/prime.cs

sleep 5 # cpu cool down

mono ./src/prime.exe
rm ./src/prime.exe
echo "" 



echo "*---------- dart native ----------*"
dart --version
dart compile exe ./src/prime.dart

sleep 5 # cpu cool down

./src/prime.exe
rm ./src/prime.exe
echo "" 



echo "*--------- python codon ----------*"
codon --version
codon build -release -exe ./src/prime.py

sleep 5 # cpu cool down

./src/prime
rm ./src/prime
echo "" 


echo "*-------------- go ---------------*"
go version
go build ./src/prime.go

sleep 5 # cpu cool down

./prime
rm ./prime
echo ""
echo ""


echo "*------------ python -------------*"
python3 --version

sleep 5 # cpu cool down

python3 ./src/prime.py
echo "" 


