# WebServer_with_C++_Backend
Web server with a C++ backend. 
Ideal for people who want to expose C++ functionalities over web

# Motivation
There are lots of posts on StackOverflow and many other discussion forums that scoff at the idea of using Web applications with a C++ backend. They are justified to some extent as there are frameworks tailor made for web applications. Most of these new frameworks are based on python, javascript etc., These are really good if you are developing the whole stack from scratch. However, there will be cases where the backend is already developed in C++ or needs to be only in C++ for a variety of reasons such as speed, complexity etc.,
This repository is for such cases where the backend needs to be in C++.

# Approach
There are two really good approaches to tackle this,
* Completely C++ - Using boost::beast
* Hybrid approach - Using boost::python to expose C++ interfaces using python

# Sample use case
To demonstrate the use of C++ as a web backend, we will use an extremely simple example.
* A library that reads the current system and returns the same is written in C++
* This service needs to be accessed by users over a web interface

# Build instructions
* Copy boost package of your choice (>=1.68.0) to the ThirdParty folder
* Make sure you have python3 and python3 includes
* Run './configure'
* Run 'make clean all' to compile
* Run '. run_tests.sh' to run the test cases. This calls the library from C++ and also python

# Running the flask based web server
* Run '. run_webserver.sh'
* This will start a flask based web server at http://127.0.0.1:5000
* Navigate to http://127.0.0.1:5000/flask_server to see the web server with C++ backend in action :)

# Running the boost::beast web server
* Run '. run_beast_server.sh'
* This will start a boost::beast based web server at http://127.0.0.1:5050
* Navigate to http://127.0.0.1:5050/beast to see the web server with C++ backend in action :)
