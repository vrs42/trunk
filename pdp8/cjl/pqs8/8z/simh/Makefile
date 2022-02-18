#2345678901234567890123456789012345678901234567890123456789012345678901234567890
BIN	= ../bin
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
	z12k.pa z4k.pa z8k.pa byhand.du readme.tx tcboot.tx
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
.IGNORE: dt0.dt

all:	pqs8build.new ab.new scrtmp.new dt0.dt verify

# Verify the dt0.dt result against the canonical media.
verify:	dt0.dsk
	./pqs8xplode dt0.dsk
	for i in pqs8_tc08.0/*.sd pqs8_tc08.0/.[a-z]*; do cmp $$i dt0.0/`basename $$i`; done

# Rebuild the PQS8 DECtape when the TMP half of pqs8build.new changes.
# (Rebuild anyway if the "runbuild" script is changed.)
dt0.dt: pqs8build.new runbuild ab.new
	./runbuild

pqs8build.new: pqs8build.xml+
	mkdsk $<

%.dsk:	%.dt
	dt2dk $< && mv $<.dsk $@

# BUGBUG: It is not the case that over-writing a/b modifies a.
# So these dependency checks aren't quire right.  A size change in
# a/b will cause the .xml to fail, rather than get rebuilt.
pqs8build.xml+: pqs8build.0 pqs8build.1 pqs8build.0/pal12.sv
	os8implode pqs8build

# Kludge -- just copy sources onto scratch drive for now.
# (Better might be to create them zeroed.)
scrtmp.new: ab.new
	cp $< $@

ab.new: ab.xml+
	mkdsk $<

# BUGBUG: It is not the case that over-writing a/b modifies a.
# So these dependency checks aren't quire right.  A size change in
# a/b will cause the .xml to fail, rather than get rebuilt.
ab.xml+: ab.0 ab.1
	os8implode ab

ab.0: $(afiles)
	./movema

ab.1: $(bfiles)
	./movemb

%.bn:	%.pa
	$(BIN)/pal -d -e -j $<
	($(BIN)/bin2bn.pl $(@:.bn=.bin) >$@ || rm $@) && rm $(@:.bn=.bin)

focl69.bn: focalz.zm floatz.zm
	cat focalz.zm floatz.zm >focl69.pal
	$(BIN)/pal -d -j focl69.pal
	($(BIN)/bin2bn.pl focl69.bin >$@ || rm $@) && rm focl69.bin

# NB: Parallel make will fail on LINCTape handlers, as multiple are made from
# the same source code.
ltdhnd.bn: ltahnd.pa
	$(BIN)/pal -d -j $<
	($(BIN)/bin2bn.pl ltahnd.bin >$@ || rm $@) && rm ltahnd.bin

lidhnd.bn: linhnd.pa
	$(BIN)/pal -d -j $<
	($(BIN)/bin2bn.pl linhnd.bin >$@ || rm $@) && rm linhnd.bin

# BUGBUG: PDP12 sources don't build yet, as the cross assembler can't generate
# LINC mode code.

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

#all::	$(COMGEN) $(SD)

# Most binaries are 4K
%.sv:	z4k.bn %.bn
	$(BIN)/bn2sv $^
	mv foo.sv $@

# These have their own rules
rk4mat.sv: z4k.bn rklfmt.bn rklpch.bn
	$(BIN)/bn2sv $^
	mv foo.sv $@

dt4mat.sv: z4k.bn dtfrmt.bn dt4pch.bn
	$(BIN)/bn2sv $^
	mv foo.sv $@

dtcopy.sv: z4k.bn dtcopy.bn dtcpch.bn
	$(BIN)/bn2sv $^
	mv foo.sv $@

focpqs.sv: z8k.bn focl69.bn focpqs.bn
	$(BIN)/bn2sv $^
	mv foo.sv $@

asmblr.sv: z8k.bn asmblr.bn
	$(BIN)/bn2sv $^
	mv foo.sv $@

%.sd:	%.sv
	$(BIN)/sv2sd $<

# Maintenance stuff:

clean:
	rm -f $(PABIN)
