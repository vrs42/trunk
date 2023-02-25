<HTML><HEAD>
<STYLE type="text/css">
BODY { background-color: #000000 }
BODY { color: #00c000 }
H3 { margin-bottom:2 }
</STYLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Expires content=0>
<?php echo "<TITLE>$title</TITLE>"; ?>
</HEAD>
<BODY vLink=#00c000 aLink=#00c000 link=#00ff00 bgColor=#000000>
<HTML><HEAD>
<STYLE type="text/css">
BODY { background-color: #000000 }
BODY { color: #00c000 }
P,H1,H2,H3,H4,H5,H6 { colorx: #00ff00 }
</STYLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Expires content=0>
</HEAD>
<BODY vLink=#00c000 aLink=#00c000 link=#00ff00 bgColor=#000000>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=middle border=0>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center>
      <FONT size=2>
<?php
    // Surely there is an easier way to do this.
    //$dot = $_SERVER['DOCUMENT_ROOT'] . $_SERVER['PHP_SELF'];
    //$i = strrpos($dot, '/');
    //$dot = substr($dot, 0, $i);
    $root = $_SERVER['DOCUMENT_ROOT'] . '/pdp8';
    if ($handle = opendir($root)) {
        echo "<A class=NavBar target=_parent href=/pdp8/index.php><B>Home</B></A> \n";
        /* This is the correct way to loop over the directory. */
        while (false !== ($d = readdir($handle))) {
	    error_reporting(0);
            if (filemtime("$root/$d/$d.php") === false)
                continue;
echo strpos($d, '.');
            echo "| <A class=NavBar target=_parent href=/pdp8/$d/$d.php><B>$d</B></A>\n"; 
        }
        closedir($handle);
    }
?>
      </DIV>
    </TD>
  </TR></TBODY></TABLE>
</BODY>
<P align=center><FONT size=6><B><I>
<?php echo $title; ?>
</I></B></FONT></DIV><P>
