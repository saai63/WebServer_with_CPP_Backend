MY_BOOST_INC=/home/ksp3kor/Study/myGitHub/WebServer_with_CPP_Backend/ThirdParty/boost_1_68_0
MY_BOOST_LIBS=/home/ksp3kor/Study/myGitHub/WebServer_with_CPP_Backend/ThirdParty/boost_1_68_0/stage/lib
MY_PYTHON_INC=/usr/include/python3.5m
BOOST_PYTHON_LIB_NAME=boost_python35
MY_INCLUDE_PATH=include
MY_SRC_PATH=src
MY_LIB_PATH=lib
MY_BIN_PATH=bin
MY_TESTS_PATH=test

all : getSystemTime cppTest

getSystemTime:
	g++ -std=c++11 -I $(MY_INCLUDE_PATH) -I $(MY_PYTHON_INC) -I $(MY_BOOST_INC) $(MY_SRC_PATH)/getSystemTime.cpp -o $(MY_LIB_PATH)/libSystemInfo.so -fPIC -shared -lpython3.5m -L$(MY_BOOST_LIBS) -l$(BOOST_PYTHON_LIB_NAME)
cppTest:
	g++ -I $(MY_INCLUDE_PATH) $(MY_TESTS_PATH)/testLib.cpp -o $(MY_BIN_PATH)/testLibcpp -L $(MY_LIB_PATH) -lSystemInfo -lpython3.5m -L$(MY_BOOST_LIBS) -l$(BOOST_PYTHON_LIB_NAME)
clean:
	rm -rf lib/* bin/*
