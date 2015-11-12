#!/bin/bash

set -e
set -u

CXX=clang++
CXXFLAGS=
LDFLAGS=-lpthread

"$CXX" -std=c++11 $CXXFLAGS -Iasio-1.10.6/include -Iwebsocketpp-0.6.0/include -D_WEBSOCKETPP_CPP11_THREAD_=1 -DASIO_STANDALONE=1 utility_client.cpp -o utility_client $LDFLAGS

"$CXX" -std=c++11 -static-libgcc -static-libstdc++ -Iasio-1.10.6/include -Iwebsocketpp-0.6.0/include -D_WEBSOCKETPP_CPP11_THREAD_=1 -DASIO_STANDALONE=1 echo_server.cpp -o echo_server $LDFLAGS

CXX=i686-w64-mingw32-g++
CXXFLAGS="-static-libgcc -static-libstdc++"
LDFLAGS="-lpthread -lws2_32 -lmswsock"

"$CXX" -std=c++11 $CXXFLAGS -Iasio-1.10.6/include -Iwebsocketpp-0.6.0/include -D_WEBSOCKETPP_CPP11_THREAD_=1 -DASIO_STANDALONE=1 utility_client.cpp -o utility_client.exe $LDFLAGS

"$CXX" -std=c++11 -static-libgcc -static-libstdc++ -Iasio-1.10.6/include -Iwebsocketpp-0.6.0/include -D_WEBSOCKETPP_CPP11_THREAD_=1 -DASIO_STANDALONE=1 echo_server.cpp -o echo_server.exe $LDFLAGS
