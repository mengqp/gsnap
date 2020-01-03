#!/bin/bash

# nr_jobs=8
host=arm-linux-gnueabi

toolpath=/usr/local/MCGS/gcc-mcgs/bin/arm-linux-gnueabi-
buildpath=$PWD/build

cc=${toolpath}gcc
cxx=${toolpath}g++
ld=${toolpath}ld
as=${toolpath}as
ar=${toolpath}ar


cd zlib
make uninstall
make distclean
CC=$cc \
	CXX=$cxx \
	LD=$ld \
	AS=$as \
	AR=$ar \
	./configure --prefix=$buildpath \
	--shared
make -j$nr_jobs
make install
cd ..

cd libjpeg
make uninstall
make distclean
CC=$cc \
	CXX=$cxx \
	LD=$ld \
	AS=$as \
	AR=$ar \
	CPPFLAGS=$cppflags \
	LDFLAGS=$ldflags \
	./configure --prefix=$buildpath \
	--build=i386-linux \
	--host=$host \
	--target=$host \
	--enable-shared
make -j$nr_jobs
make install
cd ..

cd libpng/
echo $PWD
make uninstall
make distclean
CC=$cc \
	CXX=$cxx \
	LD=$ld \
	AS=$as \
	AR=$ar \
	# CPPFLAGS=$cppflags \
	# LDFLAGS=$ldflags \
	./configure --prefix=$buildpath \
	--build=i386-linux \
	--host=$host \
	--target=$host
make -j$nr_jobs
make install
cd ..
