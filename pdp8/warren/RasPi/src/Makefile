OBJS = bcm2835.o conio.o dos.o tester.o
CFLAGS = -I.

all: tester

tester:	$(OBJS)

clean:
	rm $(OBJS) tester

tester.o:: conio.h dos.h
conio.o:: conio.h
dos.o:: dos.h
