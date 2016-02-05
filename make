#!/bin/sh

cd src/
if [ $# != 0 ]; then
    if [ $1 = "S" ] ; then
        alex -gi Scanner.x
        happy -gi Parser.y
    fi
fi
ghc -fno-warn-tabs Main.hs
cd ..

