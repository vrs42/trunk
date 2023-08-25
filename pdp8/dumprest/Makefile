BIN	= dumprk05.bin dumprx01.bin dumptd8e.bin restrk05.bin restrx01.bin \
	resttd8e.bin setdenrx02.bin testrk05.bin readrk05.bin testrk05s1.bin
EXE	= blkdectp dumbterm dumprk05 dumprx01 dumptd8e restrk05 restrx01 \
	resttd8e sendtape

all:	$(BIN) $(EXE)

clean:
	rm -f $(BIN) $(EXE) $(EXE:=.exe)

%.bin:	%.pal
	pal -d -e $<

%:	%.c
	cc -O -o $@ $<

mybin:	all
	cp $(BIN) $(EXE) ~/bin
