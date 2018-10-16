CFLAGS = -Wall
LFLAGS = -l ncurses
ALL = gtty.o comm.o video.o

all: gtty gtty.zip

gtty: $(ALL)
	$(CC) -o $@ $(ALL) $(LFLAGS)

clean:
	rm -f $(ALL) gtty gtty.exe.stackdump

gtty.zip: $(ALL:.o=.c) comm.h video.h Makefile gtty.txt
	zip $@ $?
