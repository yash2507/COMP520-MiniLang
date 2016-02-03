#!/bin/sh

cd src/
if [ $# != 0 ]; then
    if [ $1 = "S" ] ; then
        alex -gi Scanner.x
        happy -gi Parser.y
    fi
fi
ghc -fno-warn-tabs  Main\'.hs
cd ..

echo "\n"
./src/Main\' < programs/valid/V1.min
echo
./src/Main\' < programs/valid/V2.min
echo "\n"
./src/Main\' < programs/invalid/I1.min
echo
./src/Main\' < programs/invalid/I2.min
echo
./src/Main\' < programs/invalid/I3.min
echo
./src/Main\' < programs/invalid/I4.min
echo
./src/Main\' < programs/invalid/I5.min
echo "\n"







