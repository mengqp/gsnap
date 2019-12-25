#!/bin/bash

nr_jobs=8
host=arm-none-linux-gnueabi

cc=/opt/arm-2011.03/bin/arm-none-linux-gnueabi-gcc
cxx=/opt/arm-2011.03/bin/arm-none-linux-gnueabi-g++
ld=/opt/arm-2011.03/bin/arm-none-linux-gnueabi-ld
as=/opt/arm-2011.03/bin/arm-none-linux-gnueabi-as
ar=/opt/arm-2011.03/bin/arm-none-linux-gnueabi-ar

cd zlib
CC=$cc \
  CXX=$cxx \
  LD=$ld \
  AS=$as \
  AR=$ar \
  ./configure --prefix=$PWD/../build \
  --shared;
make -j$nr_jobs ; make install
cd ..

cd libjpeg
CC=$cc \
      CXX=$cxx \
      LD=$ld \
      AS=$as \
      AR=$ar \
      ./configure --prefix=$PWD/../build \
                       --build=i386-linux \
                       --host=$host \
                       --target=$host \
                       --enable-shared;
make -j$nr_jobs ; make install
cd ..

cd libpng
CC=$cc \
      CXX=$cxx \
      LD=$ld \
      AS=$as \
      AR=$ar \
      CPPFLAGS="-I$PWD/../build/include -I/opt/arm-2009q1/arm-none-linux-gnueabi/include" \
      LDFLAGS="-L$PWD/../build/lib -L/opt/arm-2009q1/arm-none-linux-gnueabi/libc/lib/" \
      ./configure --prefix=$PWD/../build \
      --build=i386-linux \
      --host=$host \
      --target=$host
make -j$nr_jobs ; make install
cd ..

