#2345678901234567890123456789012345678901234567890123456789012345678901234567890
BIN	= $(HOME)/pdp8/8tools
# From pqsasm.bi:
afiles	= 00Readme-A.txt cmpara.bi dtfrmt.pa l6dcon.pa map.pa phocal.pa \
	pqslta.pa rt11.pa ascode.pa cmparb.bi floatz.zm lap6w.pa \
	mark12.pa pqsasm.bi pqsmon.pa tc12f.pa asmblr.pa comgen.bi \
	focalz.zm lsptch.pa movema.bi pqsdsu.pa pqsrka.pa bin.pa \
	cpscon.pa ltbodt.pa movemb.bi pqsdta.pa pqsrxa.pa blkodt.pa \
	dtcopy.pa ltdump.pa os8con.pa pqsflp.pa rklfmt.pa
bfiles	= 00Readme-B.txt 4patch.pa 8patch.pa allcat.pa blk400.pa \
	blkcpy.pa bpatch.pa bsave.pa comgen.du consol.pa core.pa \
	date.pa direct.pa dl8hnd.pa dol8.pa dpatch.pa dsugen.du \
	dsuhnd.pa dt4pch.pa dtagen.du dtagen.pa dtahnd.pa dtcpch.pa \
	dump.pa filman.pa fixup.pa flphnd.pa focpqs.pa ipbgen.pa \
	ipboot.pa kl8.pa kl8pch.pa l8mhnd.pa linhnd.pa ltahnd.pa \
	npatch.pa odt.pa opatch.pa print.pa rkagen.du rkahnd.pa \
	rklpch.pa rx4mat.pa rxagen.du rxahnd.pa rxboot.pa rxbut0.pa \
	rxbut1.pa rxinit.pa rxutil.pa set.pa sup4k.pa sup8k.pa \
	syshnd.pa systat.pa vt8e.pa vt8pch.pa xequa.tc \
	z12k.pa z4k.pa z8k.pa
new	= vt8e-comp.txt vt8e.pa vt8pch-comp.txt vt8pch.pa
PABIN	= z4k.bn z8k.bn z12k.bn pqsmon.bn bin.bn odt.bn dump.bn pqsdta.bn \
	pqsrxa.bn pqsdsu.bn pqsrka.bn pqslta.bn pqsflp.bn bsave.bn asmblr.bn \
	map.bn blkodt.bn set.bn core.bn date.bn print.bn filman.bn allcat.bn \
	consol.bn kl8.bn kl8pch.bn vt8e.bn focl69.bn focpqs.bn 8patch.bn \
	4patch.bn npatch.bn bpatch.bn dpatch.bn vt8pch.bn opatch.bn os8con.bn \
	systat.bn direct.bn blkcpy.bn syshnd.bn dtahnd.bn rxahnd.bn rkahnd.bn \
	dsuhnd.bn flphnd.bn rxutil.bn dtfrmt.bn dt4pch.bn dtcopy.bn dtcpch.bn \
	rklfmt.bn rklpch.bn l6dcon.bn ltbodt.bn ltdump.bn dtagen.bn ascode.bn \
	ltahnd.bn ltdhnd.bn lidhnd.bn linhnd.bn
PDP12	= mark12.bn mark12.sv tc12f.bn tc12f.sv
# These files don't seem to be used to build stuff
UNUSEDA	= cpscon.pa lap6w.pa phocal.pa
UNUSEDB	= dl8hnd.pa dol8.pa fixup.pa ipbgen.pa ipboot.pa l8mhnd.pa rxboot.pa \
	rxbut0.pa rxbut1.pa rxinit.pa xequa.tc
# These are the binaries that are run to create the starter systems.
# (One for each possible system device.)
PQS8	= pqsdsu.sv pqsdta.sv pqsflp.sv pqslta.sv pqsrka.sv pqsrxa.sv

all::	$(afiles) $(bfiles) $(PABIN) $(PDP12) $(PQS8)

%.bn:	%.pa
	$(BIN)/pal -d -e -j $<
	($(BIN)/bin2bn $(@:.bn=.bin) >$@ || rm $@) && rm $(@:.bn=.bin)

focl69.bn: focalz.zm floatz.zm
	cat focalz.zm floatz.zm >focl69.pal
	$(BIN)/pal -d -j focl69.pal
	($(BIN)/bin2bn focl69.bin >$@ || rm $@) && rm focl69.bin

# These want TEXT padded.
dtcopy.bn: dtcopy.pa
	$(BIN)/pal -d -l -e $<
	($(BIN)/bin2bn $(@:.bn=.bin) >$@ || rm $@) && rm $(@:.bn=.bin)

dtfrmt.bn: dtfrmt.pa
	$(BIN)/pal -d -l -e $<
	($(BIN)/bin2bn $(@:.bn=.bin) >$@ || rm $@) && rm $(@:.bn=.bin)

rklfmt.bn: rklfmt.pa
	$(BIN)/pal -d -l -e $<
	($(BIN)/bin2bn $(@:.bn=.bin) >$@ || rm $@) && rm $(@:.bn=.bin)

# These need blk400 prepended.
ltdhnd.pa: blk400.pa ltahnd.pa
	cat blk400.pa ltahnd.pa >$@ || rm $@

lidhnd.pa: blk400.pa linhnd.pa
	cat blk400.pa linhnd.pa >$@ || rm $@

# BUGBUG: PDP12 sources don't build correctly yet, as the cross assembler can't
# yet generate correct LINC mode code.

#.R PAL12
#*TMP:MARK12<A:MARK12
#.R PAL12
#*TMP:TC12F<A:TC12F

# From comgen.bi:
# I believe the point of converting to .sv this way is to get all the memory
# contents arranged in consecutive blocks, starting with block 1 of the .sv.
# These were output to a freshly zeroed device in a fixed order, resulting in
# a known position for everything.  Then "dump" was used to dd ("TR") things
# to their new homes and to poke directory entries for them into existance.
#2345678901234567890123456789012345678901234567890123456789012345678901234567890
COMGEN=	bsave.sv map.sv blkodt.sv set.sv core.sv date.sv print.sv filman.sv \
	allcat.sv consol.sv os8con.sv systat.sv direct.sv blkcpy.sv syshnd.sv \
	dtahnd.sv rxahnd.sv rkahnd.sv ltahnd.sv dsuhnd.sv linhnd.sv ltdhnd.sv \
	lidhnd.sv rxutil.sv l6dcon.sv ltbodt.sv ltdump.sv flphnd.sv \
	rk4mat.sv dt4mat.sv dtcopy.sv focpqs.sv asmblr.sv 
SD =	$(COMGEN:.sv=.sd)

all::	$(COMGEN) $(SD)

# Most binaries are 4K
# TODO: Add rules to set starting addresses in the .sv files.
%.sv:	%.bn
	$(BIN)/bn2sv $@ $^

# These have their own rules because they combine source files.
rk4mat.sv: rklfmt.bn rklpch.bn
	$(BIN)/bn2sv $@ $^

dt4mat.sv: dtfrmt.bn dt4pch.bn
	$(BIN)/bn2sv $@ $^

dtcopy.sv: dtcopy.bn dtcpch.bn
	$(BIN)/bn2sv $@ $^

focpqs.sv: focl69.bn focpqs.bn
	$(BIN)/bn2sv $@ $^

# These have their own rules to set the starting address correctly.
# (The default starting address is the load address, or 0200 if that
# is zero.)

map.sv: map.bn
	$(BIN)/bn2sv $@=01200 $^

# BUGBUG:  We are failing to create pal.sd and focal.sd!
# BUGBUG:  We are creating a lot of <driver>.sd.  Need them?

# BUGBUG:  We are loading cruft at 02400, but the load addr s.b. 02600
filman.sv: filman.bn
	$(BIN)/bn2sv $@=07000 $^

# BUGBUG:  We are loading an extra 3 blocks.
consol.sv: consol.bn
	$(BIN)/bn2sv $@ $^

#asmblr.sv: asmblr.bn
#	$(BIN)/bn2sv $@ $^

# Magic sysgen binaries
pqsdsu.sv: z12k.bn pqsmon.bn pqsdsu.bn bin.bn odt.bn dump.bn
	$(BIN)/bn2sv $@ $^

pqsdta.sv: z12k.bn pqsmon.bn pqsdta.bn bin.bn odt.bn dump.bn
	$(BIN)/bn2sv $@ $^

pqsflp.sv: z12k.bn pqsmon.bn pqsflp.bn bin.bn odt.bn dump.bn
	$(BIN)/bn2sv $@ $^

pqslta.sv: z12k.bn pqsmon.bn pqslta.bn bin.bn odt.bn dump.bn
	$(BIN)/bn2sv $@ $^

pqsrka.sv: z12k.bn pqsmon.bn pqsrka.bn bin.bn odt.bn dump.bn
	$(BIN)/bn2sv $@ $^

pqsrxa.sv: z12k.bn pqsmon.bn pqsrxa.bn bin.bn odt.bn dump.bn
	$(BIN)/bn2sv $@ $^

# Sometimes the default is enough.
%.sd:	%.sv
	$(BIN)/sv2sd $< || (rm $@; exit 1)

# But often it isn't.
# odt, batch, bin, get, start, dump, change, find are special
bsave.sd: bsave.sv
	$(BIN)/sv2sd $<-O-4 || (rm $@; exit 1)

pal.sd: pal.sv
	$(BIN)/sv2sd $<-8 || (rm $@; exit 1)

map.sd: map.sv
	$(BIN)/sv2sd $<-2 || (rm $@; exit 1)

#blkodt.sd: blkodt.sv
#	$(BIN)/sv2sd $<-0 || (rm $@; exit 1)

set.sd: set.sv
	$(BIN)/sv2sd $<-R-S || (rm $@; exit 1)

core.sd: core.sv
	$(BIN)/sv2sd $<-S || (rm $@; exit 1)

date.sd: date.sv
	$(BIN)/sv2sd $<-S || (rm $@; exit 1)

print.sd: print.sv
	$(BIN)/sv2sd $<-R-13 || (rm $@; exit 1)

filman.sd: filman.sv
	$(BIN)/sv2sd $<-S || (rm $@; exit 1)

allcat.sd: allcat.sv
	$(BIN)/sv2sd $<-S || (rm $@; exit 1)

consol.sd: consol.sv
	$(BIN)/sv2sd $<-2 || (rm $@; exit 1)

focal.sd: focal.sv
	$(BIN)/sv2sd $<-11 || (rm $@; exit 1)

os8con.sd: os8con.sv
	$(BIN)/sv2sd $<-5 || (rm $@; exit 1)

#systat.sd: systat.sv
#	$(BIN)/sv2sd $<-0 || (rm $@; exit 1)

direct.sd: direct.sv
	$(BIN)/sv2sd $<-R-S || (rm $@; exit 1)

#blkcpy.sd: blkcpy.sv
#	$(BIN)/sv2sd $<-0 || (rm $@; exit 1)

#rk4mat.sd: rk4mat.sv
#	$(BIN)/sv2sd $<-0 || (rm $@; exit 1)

#dt4mat.sd: dt4mat.sv
#	$(BIN)/sv2sd $<-0 || (rm $@; exit 1)

#dtcopy.sd: dtcopy.sv
#	$(BIN)/sv2sd $<-0 || (rm $@; exit 1)

# Maintenance stuff:

clean:
	rm -f $(PABIN) $(PDP12)
