#2345678901234567890123456789012345678901234567890123456789012345678901234567890
WS378	= loadb7.pa dskhnd.pa dskacp.pa wpsys.pa wpfils.pa wpedt1.pa \
	wpedt2.pa wpedo1.pa wpedo2.pa cpydsk.pa cpyfil.pa verify.pa mncom.pa \
	mn1.pa mn2.pa wpcx.pa wpax.pa wpcut.pa wpcu2.pa wpcu3.pa wpcu4.pa \
	wpindx.pa wpudkd.pa wpudks.pa fmtrul.pa wptrns.pa wtrlrp.pa wppars.pa \
	wpselc.pa wpstpr.pa wpsr.pa tmath.pa mnhelp.pa wpsetu.pa wplog.pa \
	winutl.pa wpsc.pa
WS378A	= mthpfx.pa wtrlrp.pa loadb7.pa loadb4.pa dskhnd.pa dskacp.pa \
	verify.pa cpydsk.pa cpyfil.pa wpcut.pa wpcu2.pa wpcu3.pa wpcu4.pa \
	fmtrul.pa wp2cmf.pa tmath.pa
WS378B	= wpfils.pa wpsys.pa wpindx.pa wptrns.pa wppars.pa wpselc.pa wpcx.pa \
	wpax.pa wpstpr.pa wpsr.pa wpudks.pa wpudkd.pa
WS378C	= wprint.pa wprto1.pa wprto2.pa mn1.pa mn2.pa mnhelp.pa mncom.pa \
	regis.pa prim.pa
WS378D	= wpedt1.pa wpedt2.pa wpedck.pa wpedo1.pa wpedo2.pa wpsc.pa wpspel.pa \
	wpsff.pa winutl.pa wplog.pa dskhnd.pa wputil.pa wpsetu.pa
WS378U	= loadb7.pa dskhnd.pa dskacp.pa wpsys.pa wputil.pa wpspel.pa \
	wpsff.pa prim.pa regis.pa
BIN	= wa378.bin wa378a.bin wa378b.bin wa378c.bin wa378d.bin wa378u.bin

all:	$(BIN)

%.bin:	%.pal
	pal -d -e -l $<

wa378.pal: $(WS378)
	cat $(WS378) >$@

wa378a.pal: $(WS378A)
	cat $(WS378A) >$@

wa378b.pal: $(WS378B)
	cat $(WS378B) >$@

wa378c.pal: $(WS378C)
	cat $(WS378C) >$@

wa378d.pal: $(WS378D)
	cat $(WS378D) >$@

wa378u.pal: $(WS378U)
	cat $(WS378U) >$@
