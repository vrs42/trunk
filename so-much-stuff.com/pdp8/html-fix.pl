#!/usr/bin/perl

$top = "..";

%remap = (
    "/index.html", "OK",
    "/pdp8/01-04.html", "/pdp8/blog/01-04.html",
    "/pdp8/01-05.html", "DELETE",
    "/pdp8/02-04.html", "/pdp8/blog/01-04.html",
    "/pdp8/02-05.html", "DELETE",
    "/pdp8/03-04.html", "/pdp8/blog/01-04.html",
    "/pdp8/03-05.html", "DELETE",
    "/pdp8/04-04.html", "/pdp8/blog/04-04.html",
    "/pdp8/05-04.html", "/pdp8/blog/05-04.html",
    "/pdp8/06-04.html", "/pdp8/blog/06-04.html",
    "/pdp8/07-04.html", "/pdp8/blog/07-04.html",
    "/pdp8/08-04.html", "/pdp8/blog/08-04.html",
    "/pdp8/09-04.html", "/pdp8/blog/09-04.html",
    "/pdp8/10-04.html", "/pdp8/blog/10-04.html",
    "/pdp8/11-03.html", "/pdp8/blog/11-03.html",
    "/pdp8/11-04.html", "/pdp8/blog/11-04.html",
    "/pdp8/11-05.html", "DELETE",
    "/pdp8/12-03.html", "/pdp8/blog/12-03.html",
    "/pdp8/12-04.html", "/pdp8/blog/12-04.html",
    "/pdp8/bulbs.html", "/pdp8/repair/bulbs.php",
    "/pdp8/cad/projects/boards.html", "/pdp8/cad/boards.php",
    "/pdp8/cadlib.html", "/pdp8/cad/cad.php",
    "/pdp8/index.html", "/pdp8/index.php",
    "/pdp8/kc8a.html", "/pdp8/kc8a/kc8a.php",
    "/pdp8/molds.html", "/pdp8/repair/molds.php",
    "/pdp8/newstuff/01-04.html", "DELETE",
    "/pdp8/newstuff/01-05.html", "DELETE",
    "/pdp8/newstuff/02-04.html", "DELETE",
    "/pdp8/newstuff/02-05.html", "DELETE",
    "/pdp8/newstuff/03-04.html", "DELETE",
    "/pdp8/newstuff/03-05.html", "DELETE",
    "/pdp8/newstuff/04-04.html", "DELETE",
    "/pdp8/newstuff/05-04.html", "DELETE",
    "/pdp8/newstuff/06-04.html", "DELETE",
    "/pdp8/newstuff/07-04.html", "DELETE",
    "/pdp8/newstuff/08-04.html", "DELETE",
    "/pdp8/newstuff/09-04.html", "DELETE",
    "/pdp8/newstuff/10-04.html", "DELETE",
    "/pdp8/newstuff/11-03.html", "DELETE",
    "/pdp8/newstuff/11-04.html", "DELETE",
    "/pdp8/newstuff/11-05.html", "DELETE",
    "/pdp8/newstuff/12-03.html", "DELETE",
    "/pdp8/newstuff/12-04.html", "DELETE",
    "/pdp8/newstuff/bak/01-04.html", "DELETE",
    "/pdp8/newstuff/bak/01-05.html", "DELETE",
    "/pdp8/newstuff/bak/02-04.html", "DELETE",
    "/pdp8/newstuff/bak/02-05.html", "DELETE",
    "/pdp8/newstuff/bak/03-04.html", "DELETE",
    "/pdp8/newstuff/bak/03-05.html", "DELETE",
    "/pdp8/newstuff/bak/04-04.html", "DELETE",
    "/pdp8/newstuff/bak/06-04.html", "DELETE",
    "/pdp8/newstuff/bak/07-04.html", "DELETE",
    "/pdp8/newstuff/bak/08-04.html", "DELETE",
    "/pdp8/newstuff/bak/09-04.html", "DELETE",
    "/pdp8/newstuff/bak/10-04.html", "DELETE",
    "/pdp8/newstuff/bak/11-03.html", "DELETE",
    "/pdp8/newstuff/bak/11-05.html", "DELETE",
    "/pdp8/newstuff/bak/12-03.html", "DELETE",
    "/pdp8/newstuff/bak/12-04.html", "DELETE",
    "/pdp8/newstuff/bak/bulbs.html", "DELETE",
    "/pdp8/newstuff/bak/cadlib.html", "DELETE",
    "/pdp8/newstuff/bak/index.html", "DELETE",
    "/pdp8/newstuff/bak/pics.html", "DELETE",
    "/pdp8/newstuff/bak/todo.html", "DELETE",
    "/pdp8/newstuff/bak/ttycrd.html", "DELETE",
    "/pdp8/newstuff/bak/w076m452.html", "DELETE",
    "/pdp8/newstuff/bak/y2003.html", "DELETE",
    "/pdp8/newstuff/bak/y2004.html", "DELETE",
    "/pdp8/newstuff/bak/y2005.html", "DELETE",
    "/pdp8/newstuff/bulbs.html", "DELETE",
    "/pdp8/newstuff/cadlib.html", "DELETE",
    "/pdp8/newstuff/index.html", "DELETE",
    "/pdp8/newstuff/kc8a.html", "DELETE",
    "/pdp8/newstuff/molds.html", "DELETE",
    "/pdp8/newstuff/pics.html", "DELETE",
    "/pdp8/newstuff/repair.html", "DELETE",
    "/pdp8/newstuff/sw-handles.html", "DELETE",
    "/pdp8/newstuff/todo.html", "DELETE",
    "/pdp8/newstuff/ttycrd.html", "DELETE",
    "/pdp8/newstuff/tu56repair.html", "DELETE",
    "/pdp8/newstuff/y2003.html", "DELETE",
    "/pdp8/newstuff/y2004.html", "DELETE",
    "/pdp8/newstuff/y2005.html", "DELETE",
    "/pdp8/newstuff/zero.html", "DELETE",
    "/pdp8/oldstuff/id1.html", "DELETE",
    "/pdp8/oldstuff/id10.html", "DELETE",
    "/pdp8/oldstuff/id11.html", "DELETE",
    "/pdp8/oldstuff/id2.html", "DELETE",
    "/pdp8/oldstuff/id5.html", "DELETE",
    "/pdp8/oldstuff/id6.html", "DELETE",
    "/pdp8/oldstuff/id8.html", "DELETE",
    "/pdp8/oldstuff/id9.html", "DELETE",
    "/pdp8/oldstuff/index.html", "DELETE",
    "/pdp8/oldstuff/test.html", "DELETE",
    "/pdp8/pics.html", "OK",
    "/pdp8/repair.html", "/pdp8/repair/repair.php",
    "/pdp8/sw-handles.html", "/pdp8/repair/sw-handles.php",
    "/pdp8/tapes/dec.html", "OK",
    "/pdp8/tapes/decus.html", "OK",
    "/pdp8/tapes/digital.html", "OK",
    "/pdp8/tapes/index.html", "OK",
    "/pdp8/tapes/maindec.html", "OK",
    "/pdp8/tapes/misc.html", "OK",
    "/pdp8/todo.html", "OK",
    "/pdp8/top.html", "DELETE",
    "/pdp8/ttycrd.html", "/pdp8/ttycards/ttycards.php",
    "/pdp8/tu56repair.html", "/pdp8/tu56/tu56repair.php",
    "/pdp8/y2003.html", "/pdp8/blog/y2003.html",
    "/pdp8/y2004.html", "/pdp8/blog/y2004.html",
    "/pdp8/y2005.html", "/pdp8/blog/blog.php",
    "/pdp8/zero.html", "/pdp8/repair/zero.php",
);

foreach $k (keys %remap) {
    # print "'$k $remap{$k}'\n";
    if ($remap{$k} eq 'OK') {
      die "$k: no such file" unless -f "$top$k";
    } elsif ($remap{$k} eq 'DELETE') {
      die "Please delete $k" if -f "$top$k";
    } else {
      die "$remap{$k}: illegal target" unless $remap{$k} =~ m:^/:;
      die "$remap{$k}: no such file for $k" unless -f "$top$remap{$k}";
      die "$k: cannot map to self" if $k eq $remap{$k};
      warn "$k: remapping missing file" unless -f "$top$k";

      #
      # OK, now the real work.  Emit a .html for $k which 
      # refers the viewer to $remap{$k} instead.
      open(OUTPUT, ">$top$k") || die "$top$k: $!";
      print OUTPUT "<HTML>\n<HEAD>\n<META\n";
      print OUTPUT "     HTTP-EQUIV=\"Refresh\"\n";
      print OUTPUT "     CONTENT=\"5; URL=$remap{$k}\">\n";
      print OUTPUT "</HEAD>\n<BODY>\n<HR>\n";
      print OUTPUT "<H1>URL has changed -- please update your links ";
      print OUTPUT "and bookmarks!</H1>\n";
      print OUTPUT "Your browser should automatically go to the new page ";
      print OUTPUT "after five seconds.\n<P>\n";
      print OUTPUT "If not, click <A HREF=$remap{$k} TARGET=_top>here</A>.\n";
      print OUTPUT "</BODY>\n";
      close(OUTPUT) || die "$top$k: $!";
    }
}
