Websocketpp tutorial code + standalone asio
===========================================

An unexplained compilation failure is observed when cross-compiling this tutorial code from websocketpp using mingw,
and attempting to use stand-alone ASIO with c++11 threads.

## Compilation line

"$CXX" -std=c++11 -Iasio-1.10.6/include -Iwebsocketpp-0.6.0/include -D_WEBSOCKETPP_CPP11_THREAD_=1 -DASIO_STANDALONE=1 main.cpp -lpthread

## Observed error

```
$ ./build.sh 
In file included from websocketpp-0.6.0/include/websocketpp/config/asio_no_tls_client.hpp:32:0,
                 from main.cpp:7:
websocketpp-0.6.0/include/websocketpp/transport/asio/endpoint.hpp: In member function ‘void websocketpp::transport::asio::endpoint<config>::handle_accept(websocketpp::transport::accept_handler, const error_code&)’:
websocketpp-0.6.0/include/websocketpp/transport/asio/endpoint.hpp:764:28: error: ‘operation_canceled’ is not a member of ‘std::errc’
             if (asio_ec == lib::asio::errc::operation_canceled) {
                            ^
```

## Sources of libs and toolchains

Asio url: `https://github.com/chriskohlhoff/asio/archive/asio-1-10-6.tar.gz`
sha256: `bfc7d8ed40a690d33ea5e8269e66b13236cbc22cd8b862cf2daf978325527b50  asio-1-10-6.tar.gz`

websocketpp url: `https://github.com/zaphoyd/websocketpp/archive/0.6.0.tar.gz`
sha256: `688c52772b90a4694496c08f4ec1d712e24af17dc060d3392f0f3b4e18062898  0.6.0.tar.gz`

My mingw version:

```
$ i686-w64-mingw32-g++ -v
Using built-in specs.
COLLECT_GCC=i686-w64-mingw32-g++
COLLECT_LTO_WRAPPER=/usr/lib/gcc/i686-w64-mingw32/4.8/lto-wrapper
Target: i686-w64-mingw32
Configured with: ../../src/configure --build=x86_64-linux-gnu --prefix=/usr --includedir='/usr/include' --mandir='/usr/share/man' --infodir='/usr/share/info' --sysconfdir=/etc --localstatedir=/var --libexecdir='/usr/lib/gcc-mingw-w64' --disable-maintainer-mode --disable-dependency-tracking --prefix=/usr --enable-shared --enable-static --disable-multilib --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --libdir=/usr/lib --enable-libstdcxx-time=yes --with-tune=generic --enable-version-specific-runtime-libs --enable-threads=posix --enable-fully-dynamic-string --enable-sjlj-exceptions --enable-libgomp --enable-languages=c,c++,fortran,objc,obj-c++ --enable-lto --with-plugin-ld --target=i686-w64-mingw32 --with-gxx-include-dir=/usr/include/c++/4.8 --with-as=/usr/bin/i686-w64-mingw32-as --with-ld=/usr/bin/i686-w64-mingw32-ld
Thread model: posix
gcc version 4.8.2 (GCC) 
```

Apt-file info:
```
$ apt-file find i686-w64-mingw32-g++
g++-mingw-w64-i686: /usr/bin/i686-w64-mingw32-g++
```

Linux version:
```
$ cat /etc/issue
Linux Mint 17.2 Rafaela \n \l
```

Debian package info: `http://packages.ubuntu.com/trusty/devel/g++-mingw-w64-i686`
