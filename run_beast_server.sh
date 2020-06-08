#!/bin/bash

echo $LD_LIBRARY_PATH > libpath.txt
grep $PWD\/lib libpath.txt 1>/dev/null 2>/dev/null
if [ $? == 0 ]; then
   echo "LD_LIBRARY_PATH is OK"
else
   echo "Adjusting LD_LIBRARY_PATH"
   BOOST_STAGE_PATH=`cat ThirdParty/boost_libraries.txt`
   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/lib/:$BOOST_STAGE_PATH:$PWD/ThirdParty/CxxUrl/
fi
rm -rf libpath.txt
echo "Running Beast server"
./bin/boost_webserver 127.0.0.1 5050 . 1
