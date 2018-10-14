CFLAGS = -Wall
LFLAGS = -l ncurses
ALL = gtty2.0.o comm.o video.o

all: gtty gtty.zip

gtty: $(ALL)
	$(CC) -o $@ $(ALL) $(LFLAGS)

clean:
	rm -f $(ALL) gtty gtty.exe.stackdump

gtty.zip: $(ALL:.o=.c) comm.h video.h Makefile gtty2.0.txt
	zip $@ $?
