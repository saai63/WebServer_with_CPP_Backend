#!/bin/bash

get_python3_version()
{
   pythonPath=`which python3`
   if [ "x"$pythonPath == "x" ];then
      echo "python3 not found. Please install python3"
      exit
   else
      echo "python3 used is $pythonPath"
   fi
}

check_python3_headers()
{
   pythonHeadersPath=""
   for folderName in `ls /usr/include/ | grep python3`
   do
      file /usr/include/$folderName | grep symbolic 1>/dev/null 2>/dev/null
      if [ $? != 0 ];then
         pythonHeadersPath=$folderName
      fi
   done
   #pythonHeadersPath=`ls /usr/include/ | grep python3`
   if [ "x"$pythonHeadersPath == "x" ];then
      echo "python3 headers not found. Please install python3-dev"
      exit
   else
      echo "python3 headers used from /usr/include/$pythonHeadersPath"
      echo /usr/include/$pythonHeadersPath > python_include.txt
   fi
}

extract_and_build_boost()
{
   for boost_folder in `ls -d boost*`
   do
      if [ -d $boost_folder ];then
         echo "Found a boost folder <$boost_folder> and hence deleting it"
         rm -rf $boost_folder
      fi
   done
   boost_tar_name=`ls boost*.tar.bz2 2>/dev/null`
   if [ "x"$boost_tar_name == "x" ];then
      echo "boost package not found"
      exit
   else
      echo "The package is $boost_tar_name"
   fi
   echo "Extracting  $boost_tar_name"
   tar -xvf $boost_tar_name
   for boost_folder in `ls -d boost*`
   do
      if [ -d $boost_folder ];then
         cd $boost_folder
      fi
   done
   ./bootstrap.sh --with-python=$pythonPath --with-libraries=python
   ./b2 --with-python 2>&1 | tee build_boost.txt
   BOOST_INC_PATH=`tail build_boost.txt | grep -A2 "The following directory should be added to compiler include paths" | tail -1`
   BOOST_INC_PATH=`echo $BOOST_INC_PATH | sed 's/ *$//g'`
   BOOST_LIB_PATH=`tail build_boost.txt | grep -A2 "The following directory should be added to linker library paths" | tail -1`
   BOOST_LIB_PATH=`echo $BOOST_LIB_PATH | sed 's/ *$//g'`
   cd -
   echo $BOOST_INC_PATH > boost_include.txt
   echo $BOOST_LIB_PATH > boost_libraries.txt
}

get_python3_version
check_python3_headers
extract_and_build_boost
