# EXE are binaries we don't know how to remake.  These will likely require
# Windows or MSDOS.
EXE	= AtaToWin.exe InstallOS8.exe WinToAta.exe
# These we do know how to make, or at least we have source code.
ALL	= bindump flsend flx8 mkdltxt mkid01 pal palx pdp2hex
CFLAGS	= -g

all:	$(ALL)

clean:
	rm -f *.o $(ALL)

flx8:	command.o diskette.o flx8.o os8.o
	$(CC) -o $@ $^

pdp2hex: pdp2hex.o romtools.o pdpfile.o
	$(CC) -o $@ $^
