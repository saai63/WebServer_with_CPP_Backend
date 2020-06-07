#!/bin/bash

echo $LD_LIBRARY_PATH > libpath.txt
grep $PWD\/lib libpath.txt 1>/dev/null 2>/dev/null
if [ $? == 0 ]; then
   echo "LD_LIBRARY_PATH is OK"
else
   echo "Adjusting LD_LIBRARY_PATH"
   BOOST_STAGE_PATH=`cat ThirdParty/boost_libraries.txt`
   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/lib/:$BOOST_STAGE_PATH
fi
rm -rf libpath.txt
echo "Running CPP test"
./bin/testLibcpp

echo "Running python test"
if [ ! -f test/SystemTime_ext.so ]; then
   cp lib/lib* test/SystemTime_ext.so
fi
python3 test/testLib.py
