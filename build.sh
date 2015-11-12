#!/bin/bash

set -e
set -u

CXX=i686-w64-mingw32-g++
#CXX=g++

"$CXX" -std=c++11 -Iasio-1.10.6/include -Iwebsocketpp-0.6.0/include -D_WEBSOCKETPP_CPP11_THREAD_=1 -DASIO_STANDALONE=1 main.cpp -lpthread
