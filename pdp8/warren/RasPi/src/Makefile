OBJS = bcm2835.o conio.o dos.o tester.o
CFLAGS = -I.

all: tester tarball.gz

tester:	$(OBJS)

clean:
	rm $(OBJS) tester

tarball:
	@cd ..; tar cf tarball src TESTS

tarball.gz: tarball
	@cd ..; rm tarball.gz; gzip tarball

tester.o:: conio.h dos.h
conio.o:: conio.h
dos.o:: dos.h
