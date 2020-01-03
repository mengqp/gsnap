CC = /usr/local/MCGS/gcc-mcgs/bin/arm-linux-gnueabi-gcc

all:
	$(CC) -g gsnap.c -I./build/include -L./build/lib  -lpng -ljpeg -lz -lm -o gsnap
clean:
	rm -f gsnap
