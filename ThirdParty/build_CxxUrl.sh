#!/bin/bash
if [ ! -d CxxUrl ]; then
   echo "CxxUrl is not found."
   echo "Please clone CxxUrl into ThirdParty folder"
   echo "Refer to README under ThirdParty for more details"
   exit
fi

echo "Building CxxUrl"
cd CxxUrl
cmake .
make
cp lib* ../../lib/
cd ..
echo "Building CxxUrl complete"
