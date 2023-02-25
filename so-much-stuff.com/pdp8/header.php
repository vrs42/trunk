<HTML><HEAD>
<STYLE type="text/css">
BODY { background-color: #000000 }
BODY { color: #00c000 }
a:link { color: #00ff00 }
a:visited { color: #00c000 }
@media print {
  BODY { background-color: #ffffff }
  BODY { color: #000000 }
  a:link { color: #000000 }
  a:visited { color: #000000 }
}
BODY { font-family: courier, "courier new", monospace }
BODY { font-size: 120% }
H3 { margin-bottom:2 }
P,H1,H2,H3,H4,H5,H6 { colorx: #00ff00 }
</STYLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Expires content=0>
<?php echo "<TITLE>$title</TITLE>"; ?>
</HEAD>
<aBODY vLink=#00c000 aLink=#00c000 link=#00ff00 xbgColor=#000000>
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Expires content=0>
</HEAD>
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
        error_reporting(0);
        /* This is the correct way to loop over the directory. */
        while (false !== ($d = readdir($handle))) {
            if (filemtime("$root/$d/$d.php") === false)
                continue;
            $files[] = $d;
        }
        closedir($handle);
        sort($files);
        echo "<A class=NavBar target=_parent href=/pdp8/index.php><B>Home</B></A>\n";
        foreach ($files as $d) {
            echo strpos($d, '.');
            echo "| <A class=NavBar target=_parent href=/pdp8/$d/$d.php><B>$d</B></A>\n"; 
        }
    }
?>
      </DIV>
    </TD>
  </TR></TBODY></TABLE>
</BODY>
<P align=center><FONT size=6><B><I>
<?php echo $title; ?>
</I></B></FONT></DIV><P>
