#!/usr/bin/perl

#
# This script knows the old coding conventions and tries to rewrite stuff
# to conform to the new conventions.
#
foreach $f (@ARGV) {
    # Only regular files are processed.
    next unless -f $f;
    # A .php file is assumed to adhere to the new conventions already.
    next if $f =~ /\.php$/;
    # Extract the basename and extension.
    $b = $f; ($b =~ s/\.([^.]*)$//)? $e = $1 : '';
    # If the file has already got a .php version, we are done with it.
    next if -f "$b.php";
    # The file may need conversion, if it is a recognised HTML type.
    if ($e eq "html") {
        # Skip it if there exists a .shtml version.
        next if -f "$b.shtml";
        next if $b eq "top";
        next if $b eq "footer";
        print STDERR "Processing $f...\n";
        # Parse it looking for the title.
        open(INPUT, $f) || die "$f: $!";
        $title = undef;
        while (<INPUT>) {
            if (/<TITLE>(.*)<\/TITLE>/) {
                $title = $1;
                last;
            }
            last if /"Refresh"/;
        }
        next if /"Refresh"/;
        warn "No <TITLE> for $f\n" unless defined $title;
        next unless defined $title;
        # Now flush until the end of the first table (in the top banner).
        while (<INPUT>) {
            last if (/\/TABLE>/);
        }
        # Emit the prolog.
        open(OUTPUT, ">$b.php") || die "$b.php: $!";
        print OUTPUT "<?php\n";
        print OUTPUT "  \$title = \"$title\";\n";
        print OUTPUT "  include \$_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';\n";
        print OUTPUT "?>\n";
        # Now copy the body, deleting the last table.
        $body = '';
        while (<INPUT>) {
            if (/<TABLE>/) {
                $body =~ s/\r//g;
                print OUTPUT $body;
                $body = '';
            }
            s/<FONT.*>//g;
            $body .= $_;
            last if ?</BODY>?;
        }
        # Emit the epilogue.
        print OUTPUT "<?php include \$_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>\n";
        close(OUTPUT) || die "$b.php: $!";
        next;
    }
    if ($e eq "shtml") {
        print STDERR "Processing $f...\n";
        # Parse it looking for the title.
        open(INPUT, $f) || die "$f: $!";
        $title = undef;
        while (<INPUT>) {
            if (/<TITLE>(.*)<\/TITLE>/) {
                $title = $1;
                last;
            }
        }
        warn "No <TITLE> for $f\n" unless defined $title;
        next unless defined $title;
        # Now flush until the end of the first blank line.
        while (<INPUT>) {
            last if (/^$/);
        }
        # Emit the prolog.
        open(OUTPUT, ">$b.php") || die "$b.php: $!";
        print OUTPUT "<?php\n";
        print OUTPUT "  \$title = \"$title\";\n";
        print OUTPUT "  include \$_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';\n";
        print OUTPUT "?>\n";
        # Now copy the body, deleting the #include 
        $body = '';
        while (<INPUT>) {
            if (/<!--#include/) {
                chop $body;
                $body =~ s/\r//g;
                print OUTPUT $body;
                last;
            }
            s/<FONT.*>//g;
            $body .= $_;
        }
        # Emit the epilogue.
        print OUTPUT "<?php include \$_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>\n";
        close(OUTPUT) || die "$b.php: $!";
        next;
    }
}
