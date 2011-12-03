ofile=top.htm
cat <<! >$ofile+
#include "defines.h"
<HTML>
<BODY vLink=#ffffff aLink=#ffffff link=#ffffff bgColor=#000000>
<MYFONT>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=middle border=0>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center>
      <MYFONT size=6><B><I>PDP-8 Stuff</I></B></FONT></DIV></TD></TR>
  <TR>
    <TD>
      <DIV align=center>
      <MYFONT size=2>

      <A class=NavBar target=_parent href="index.html"><MYFONT><B>Home</B></A> | 
!
for i in *; do
  if test -d $i; then
    cat <<! >>$ofile+
      <A class=NavBar target=_parent href="$i/$i.html"><MYFONT><B>$i</B></A> | 
!
  fi
done
    cat <<! >>$ofile+
      </DIV>
    </TD>
  </TR></TBODY></TABLE>
</BODY>
!
mv $ofile+ $ofile
