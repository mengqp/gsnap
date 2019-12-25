CC = /opt/arm-2011.03/bin/arm-none-linux-gnueabi-gcc

all:
	$(CC) -g gsnap.c -I./build/include -L./build/lib  -lpng -ljpeg -lz -lm -o gsnap
clean:
	rm -f gsnap
