#!/usr/bin/perl

#
# Generalized schematic parsing.
#

# Input schematic should be opened on INPUT.
# We work by extracting an XML "token", then identifying 
# it and calling the appropriate routine, essentially 
# forming a top-down parser.
#

#
# Get the next "token".
$input = "";
sub nxt {
  $input =~ s/^\s*//;
  while ($input !~ /</) {
    $input .= <INPUT> || return "EOF";
    $input =~ s/^\s*//;
  }
  while ($input !~ />/) {
    $input .= <INPUT> || die "Premature EOF";
  }
  $input =~ s/^([^<]*)<([^>]*)>//;
  ($txt, $nxt) = ($1, $2);
  return $nxt;
}

#
# Skip an uninteresting subsection.
# (This routine should be unused, if the parser is complete.)
sub skip {
  local ($key) = @_;

  print "Skipping $key...\n";
  while (&nxt !~ /^\/$key\b/) {
    last if $nxt =~ /^EOF$/;
  }
  return;
}

#
# Convert Eagle co-ordinates (in mm) to grid units per the
# LTSpice conventions.
# One silliness is that Eagle schematics normally render on 
# a 1/10" grid, where LTSpice uses 16X of the finest grid.
# We therefore use 1 1/160" grid (25.4/160 == .15875).
# BEWARE -- The Y axis is upside down, but this function 
# desn't know that.
$grid_unit = .15875; # default to 160 dpi.
sub grid_units {
  return int($_[0]/$grid_unit);
}

# Snap component centers to the grid.
sub grid_snap {
  local($gu) = @_;
  return $gu if $gu == 0;
  $gu = $gu/abs($gu)*int(abs($gu)/16+0.5)*16;
  return $gu;
}

#<!ELEMENT description (#PCDATA)>
sub description {
  while (&nxt) {
    if ($nxt =~ /^\/description\b/) {
      # $txt has the description
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT vertex EMPTY>
sub vertex {
  return;
}

#<!ELEMENT polygon (vertex)*>
sub polygon {
  while (&nxt) {
    if ($nxt =~ /^vertex\b/) {
      &vertex();
    } elsif ($nxt =~ /^\/polygon\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT wire EMPTY>
#<!ATTLIST wire
#          x1            %Coord;        #REQUIRED
#          y1            %Coord;        #REQUIRED
#          x2            %Coord;        #REQUIRED
#          y2            %Coord;        #REQUIRED
#          width         %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          extent        %Extent;       #IMPLIED
#          style         %WireStyle;    "continuous"
#          curve         %WireCurve;    "0"
#          cap           %WireCap;      "round"
#          >
sub wire {
  die "x1: $nxt" unless $nxt =~ /\bx1="([^"]*)"/;
  $x1 = &grid_units($1);
  die "y1: $nxt" unless $nxt =~ /\by1="([^"]*)"/;
  $y1 = -&grid_units($1);
  die "x2: $nxt" unless $nxt =~ /\bx2="([^"]*)"/;
  $x2 = &grid_units($1);
  die "y2: $nxt" unless $nxt =~ /\by2="([^"]*)"/;
  $y2 = -&grid_units($1);
  die "width: $nxt" unless $nxt =~ /\bwidth="([^"]*)"/;
  $width = $1;
  die "layer: $nxt" unless $nxt =~ /\blayer="([^"]*)"/;
  $layer = $1;
  $style = "continuous";
  $style = $1 if $nxt =~ /\bstyle="([^"]*)"/;
  $style = "" if $style eq "continuous";
# BUGBUG: There should be a few other styles here.
  $style = "1" if $style ne "";
  $curve = "0";
  $curve = $1 if $nxt =~ /\bcurve="([^"]*)"/;
  $cap = "round";
  $cap = $1 if $nxt =~ /\bcap="([^"]*)"/;
  return;
}

#<!ELEMENT text (#PCDATA)>
#<!ATTLIST text
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          size          %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          font          %TextFont;     "proportional"
#          ratio         %Int;          "8"
#          rot           %Rotation;     "R0"
#          align         %Align;        "bottom-left"
#          distance      %Int;          "50"
#          >
sub text {
  die "x: $nxt" unless $nxt =~ /\bx="([^"]*)"/;
  $x = &grid_units($1);
  die "y: $nxt" unless $nxt =~ /\by="([^"]*)"/;
  $y = -&grid_units($1);
  die "size: $nxt" unless $nxt =~ /\bsize="([^"]*)"/;
  $size = &grid_units($1);
$size = 4; # BUGBUG: Should calculate this!
  die "layer: $nxt" unless $nxt =~ /\blayer="([^"]*)"/;
  $layer = $1;
  $font = "proportional";
  $font = $1 if $nxt =~ /\bfont="([^"]*)"/;
  $ratio = "8";
  $ratio = $1 if $nxt =~ /\bratio="([^"]*)"/;
  $rot = "R0";
  $rot = $1 if $nxt =~ /\brot="([^"]*)"/;
  $align = "bottom-left";
  $align = $1 if $nxt =~ /\balign="([^"]*)"/;
  $distance = "50";
  $distance = $1 if $nxt =~ /\bdistance="([^"]*)"/;
  while (&nxt) {
    if ($nxt =~ /^\/text\b/) {
      # $txt has the text
      $txt =~ s/&gt;/>/ig;
      $txt =~ s/&lt;/</ig;
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT circle EMPTY>
#<!ATTLIST circle
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          radius        %Coord;        #REQUIRED
#          width         %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          >
sub circle {
  die "x: $nxt" unless $nxt =~ /\bx="([^"]*)"/;
  $x = &grid_units($1);
  die "y: $nxt" unless $nxt =~ /\by="([^"]*)"/;
  $y = -&grid_units($1);
  die "radius: $nxt" unless $nxt =~ /\bradius="([^"]*)"/;
  $radius = &grid_units($1);
  die "width: $nxt" unless $nxt =~ /\bwidth="([^"]*)"/;
  $width = $1;
  die "layer: $nxt" unless $nxt =~ /\blayer="([^"]*)"/;
  $layer = $1;
  return;
}

#<!ELEMENT rectangle EMPTY>
#<!ATTLIST rectangle
#          x1            %Coord;        #REQUIRED
#          y1            %Coord;        #REQUIRED
#          x2            %Coord;        #REQUIRED
#          y2            %Coord;        #REQUIRED
#          layer         %Layer;        #REQUIRED
#          rot           %Rotation;     "R0"
#          >
sub rectangle {
  die "x1: $nxt" unless $nxt =~ /\bx1="([^"]*)"/;
  $x1 = &grid_units($1);
  die "y1: $nxt" unless $nxt =~ /\by1="([^"]*)"/;
  $y1 = -&grid_units($1);
  die "x2: $nxt" unless $nxt =~ /\bx2="([^"]*)"/;
  $x2 = &grid_units($1);
  die "y2: $nxt" unless $nxt =~ /\by2="([^"]*)"/;
  $y2 = -&grid_units($1);
  die "layer: $nxt" unless $nxt =~ /\blayer="([^"]*)"/;
  $layer = $1;
  $rot = "R0";
  $rot = $1 if $nxt =~ /\brot="([^"]*)"/;
  return;
}

#<!ELEMENT frame EMPTY>
#<!ATTLIST frame
#          x1            %Coord;       #REQUIRED
#          y1            %Coord;       #REQUIRED
#          x2            %Coord;       #REQUIRED
#          y2            %Coord;       #REQUIRED
#          columns       %Int;         #REQUIRED
#          rows          %Int;         #REQUIRED
#          layer         %Layer;       #REQUIRED
#          border-left   %Bool;        "yes"
#          border-top    %Bool;        "yes"
#          border-right  %Bool;        "yes"
#          border-bottom %Bool;        "yes"
#          >
sub frame {
  die "x1: $nxt" unless $nxt =~ /\bx1="([^"]*)"/;
  $x1 = &grid_units($1);
  die "y1: $nxt" unless $nxt =~ /\by1="([^"]*)"/;
  $y1 = -&grid_units($1);
  die "x2: $nxt" unless $nxt =~ /\bx2="([^"]*)"/;
  $x2 = &grid_units($1);
  die "y2: $nxt" unless $nxt =~ /\by2="([^"]*)"/;
  $y2 = -&grid_units($1);
  die "columns: $nxt" unless $nxt =~ /\bcolumns="([^"]*)"/;
  $columns = $1;
  die "rows: $nxt" unless $nxt =~ /\brows="([^"]*)"/;
  $rows = $1;
  die "layer: $nxt" unless $nxt =~ /\blayer="([^"]*)"/;
  $layer = $1;
  $borderleft = "yes";
  $borderleft = $1 if $nxt =~ /\bborder-left="([^"]*)"/;
  $bordertop = "yes";
  $bordertop = $1 if $nxt =~ /\bborder-top="([^"]*)"/;
  $borderright = "yes";
  $borderright = $1 if $nxt =~ /\bborder-right="([^"]*)"/;
  $borderbottom = "yes";
  $borderbottom = $1 if $nxt =~ /\bborder-bottom="([^"]*)"/;
  return;
}

#<!ELEMENT hole EMPTY>
sub hole {
  return;
}

#<!ELEMENT pad EMPTY>
sub pad {
  return;
}

#<!ELEMENT smd EMPTY>
sub smd {
  return;
}

#<!ELEMENT package (description?, (polygon | wire | text | dimension | circle | rectangle | frame | hole | pad | smd)*)>
sub package {
  while (&nxt) {
    if ($nxt =~ /^description\b/) {
      &description();
    } elsif ($nxt =~ /^polygon\b/) {
      &polygon();
    } elsif ($nxt =~ /^wire\b/) {
      &wire();
    } elsif ($nxt =~ /^text\b/) {
      &text();
    } elsif ($nxt =~ /^dimension\b/) {
      &dimension();
    } elsif ($nxt =~ /^circle\b/) {
      &circle();
    } elsif ($nxt =~ /^rectangle\b/) {
      &rectangle();
    } elsif ($nxt =~ /^frame\b/) {
      &frame();
    } elsif ($nxt =~ /^hole\b/) {
      &hole();
    } elsif ($nxt =~ /^pad\b/) {
      &pad();
    } elsif ($nxt =~ /^smd\b/) {
      &smd();
    } elsif ($nxt =~ /^\/package\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT packages (package)*>
sub packages {
  while (&nxt) {
    if ($nxt =~ /^package\b/) {
      &package();
    } elsif ($nxt =~ /^\/packages\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT pin EMPTY>
#<!ATTLIST pin
#          name          %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          visible       %PinVisible;   "both"
#          length        %PinLength;    "long"
#          direction     %PinDirection; "io"
#          function      %PinFunction;  "none"
#          swaplevel     %Int;          "0"
#          rot           %Rotation;     "R0"
#          >
sub pin {
  die "name: $nxt" unless $nxt =~ /\bname="([^"]*)"/;
  $name = $1;
  die "x: $nxt" unless $nxt =~ /\bx="([^"]*)"/;
  $x = &grid_units($1);
  die "y: $nxt" unless $nxt =~ /\by="([^"]*)"/;
  $y = -&grid_units($1);
  $visible = "both";
  $visible = $1 if $nxt =~ /\bvisible="([^"]*)"/;
  $length = "long";
  $length = $1 if $nxt =~ /\blength="([^"]*)"/;
  $direction = "io";
  $direction = $1 if $nxt =~ /\bdirection="([^"]*)"/;
  $function = "none";
  $function = $1 if $nxt =~ /\bfunction="([^"]*)"/;
  $swaplevel = "0";
  $swaplevel = $1 if $nxt =~ /\bswaplevel="([^"]*)"/;
  $rot = "R0";
  $rot = $1 if $nxt =~ /\brot="([^"]*)"/;
  return;
}

#
# Add a tail for the pin
sub drawpin {
  local($x, $y, $length, $function, $rot) = @_;
  $scale = 32;
  $scale = 0 if $length eq "point";
  $scale = 16 if $length eq "short";
  $scale = 48 if $length eq "long";
  $scale = -$scale if $rot =~ s/^M//;
  die "angle: $rot" unless $rot =~ /^R(\d+)/;
  $angle = $1;
  $x1 = $y1 = 0;
  $x1 = 1 if $angle == 0;
  $y1 = 1 if $angle == 90;
  $x1 = -1 if $angle == 180;
  $y1 = -1 if $angle == 270;
  $x2 = int($x + $x1*$scale);
  $y2 = int($y - $y1*$scale);
  $symdraw .= "LINE Normal $x $y $x2 $y2\n";
  if ($visible ne "off") {
    $y -= 8;
    $symdraw .= "WINDOW 123 $x $y Right 2\n";
  }
  if ($function eq "none") {
    return;
  } elsif ($function eq "dot") {
    $x2 -= $x1/2;
    $y2 += $y1/2;
    $x1 = $x2 - $x1;
    $y1 = $y2 - $y1;
warn "GOT HERE";
    $symdraw .= "CIRCLE Normal $x1 $x2 $x2 $y2\n";
  } else {
    die "drawpin function: $function";
  }
}

#<!ELEMENT symbol (description?, (polygon | wire | text | dimension | pin | circle | rectangle | frame)*)>
#<!ATTLIST symbol
#          name          %String;       #REQUIRED
#          >
sub symbol {
  die "symbol name: $nxt" unless $nxt =~ /\bname="([^"]*)"/;
  $symbol = $1;
  $symdraw = $sympins = "";
  $order = 0;
  while (&nxt) {
    if ($nxt =~ /^description\b/) {
      &description();
    } elsif ($nxt =~ /^polygon\b/) {
die "polygon: $nxt";
      &polygon();
    } elsif ($nxt =~ /^wire\b/) {
      &wire();
      # Add a drawing command for a symbol.
      $symdraw .= "LINE Normal $x1 $y1 $x2 $y2\n";
    } elsif ($nxt =~ /^text\b/) {
      &text();
      # Replace >Name, >Value, etc.
      $txt =~ s/&gt;/>/ig;
      if ($txt =~ />Name/i) {
        $symdraw .= "WINDOW 0 $x $y Left 2\n";
      } elsif ($txt =~ />Value/i) {
        $symdraw .= "WINDOW 3 $x $y Left 2\n";
      } elsif ($txt =~ />Drawing_Name/i) {
        $symdraw .= "TEXT $x $y Left $size $f\n";
      } elsif ($txt =~ />Last_Date_Time/i) {
        $txt = localtime(time());
        $symdraw .= "TEXT $x $y Left $size $txt\n";
#       $symdraw .= "WINDOW 201 $x $y Left 2\n";
      } elsif ($txt =~ />Sheet/i) {
# Kludge: Use Value to pass Sheet number to DOCFIELD
        $symdraw .= "WINDOW 3 $x $y Left 2\n";
      } else {
        $symdraw .= "TEXT $x $y Left $size $txt\n" if $layer == 94;
      }
    } elsif ($nxt =~ /^dimension\b/) {
die "dimension: $nxt";
      &dimension();
    } elsif ($nxt =~ /^pin\b/) {
      &pin();
      # Draw the tail, etc. for the pin.
      $pinx{$symbol} = $x;
      $piny{$symbol} = $y;
      &drawpin($x, $y, $length, $function, $rot);
      # Kludge extra pin for EDGE-RIGHT.
      if ($symbol =~ /^EDGE-/) {
        $name = "1";
        $sympins .= "PIN $x $y $function 0\n";
        $sympins .= "PINATTR PinName $name\n";
        ++$order;
        $name = "2";
        $x -= 32;
      }
      # Place and name the pin.
      $sympins .= "PIN $x $y $function 0\n";
      $sympins .= "PINATTR PinName $name\n";
      ++$order;
# Don't guess SpiceOrder
#     $sympins .= "PINATTR SpiceOrder $order\n";
    } elsif ($nxt =~ /^circle\b/) {
      &circle();
      $x2 = int($x + $radius);
      $y2 = int($y + $radius);
      $x1 = $x - $radius;
      $y1 = $y - $radius;
      $symdraw .= "CIRCLE Normal $x1 $y1 $x2 $y2\n";
    } elsif ($nxt =~ /^rectangle\b/) {
      &rectangle();
      warn "rotated rectangle: $rot" unless $rot eq "R0";
      $symdraw .= "RECTANGLE Normal $x1 $y1 $x2 $y2\n"
        unless $symbol =~ /^EDGE-/
    } elsif ($nxt =~ /^frame\b/) {
      &frame();
      $symdraw .= "LINE Normal $x1 $y1 $x1 $y2\n";
      $symdraw .= "LINE Normal $x1 $y2 $x2 $y2\n";
      $symdraw .= "LINE Normal $x2 $y2 $x2 $y1\n";
      $symdraw .= "LINE Normal $x2 $y1 $x1 $y1\n";
      warn "borderleft labels omitted" unless $borderleft eq "no";
      warn "bordertop labels omitted" unless $bordertop eq "no";
      warn "borderright labels omitted" unless $borderright eq "no";
      warn "borderbottom labels omitted" unless $borderbottom eq "no";
    } elsif ($nxt =~ /^\/symbol\b/) {
      $type = "CELL";
      $type = "GRAPHIC" if $order == 0;
#     mkdir $library unless -d $libraary;
#     open(OUTPUT, ">$library/$symbol.asy") || die "$library/$symbol: $!";
      open(OUTPUT, ">$symbol.asy") || die "$symbol: $!";
      print OUTPUT "Version 4\n";
      print OUTPUT "Symboltype $type\n";
      print OUTPUT "$symdraw";
      print OUTPUT "SYMATTR Value $symbol\n";
      $prefix = "?";
      $prefix = "D" if $library eq "diode";
      $prefix = "R" if ($library eq "rcl") && ($symbol =~ /^R/);
      $prefix = "R" if ($symbol =~ /^POT_US-/);
      $prefix = "R" if ($symbol =~ /^TRIMPOT/);
      $prefix = "C" if ($library eq "rcl") && ($symbol =~ /^C/);
      $prefix = "C" if ($symbol =~ /^CPOL-/);
      $prefix = "C" if ($library =~ /^CRYSTAL/i);
      $prefix = "C" if ($symbol =~ /^CRYSTAL/);
      $prefix = "L" if ($symbol =~ /^L-US/);
      $prefix = "Q" if $library =~ /^transistor/;
      $prefix = "-" if $library =~ /^supply/;
      $prefix = "-" if $library =~ /^frame/;
      $prefix = "-" if $symbol =~ /^device/i;
      $prefix = "R" if $symbol =~ /^EDGE-/;
      $prefix{$symbol} = $prefix;
      print OUTPUT "SYMATTR Prefix $prefix\n";
      print OUTPUT "SYMATTR Description $library/$symbol\n";
      print OUTPUT "$sympins\n";
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}


#<!ELEMENT symbols (symbol)*>
sub symbols {
  while (&nxt) {
    if ($nxt =~ /^symbol\b/) {
      &symbol();
    } elsif ($nxt =~ /^\/symbols\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT gate EMPTY>
#<!ATTLIST gate
#          name          %String;       #REQUIRED
#          symbol        %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          addlevel      %GateAddLevel; "next"
#          swaplevel     %Int;          "0"
#          >
sub gate {
  die "gate name: $nxt" unless $nxt =~ /\bname="([^"]*)"/;
  $gate = $1;
  die "gate symbol: $nxt" unless $nxt =~ /\bsymbol="([^"]*)"/;
  $symbol = $1;
  die "x: $nxt" unless $nxt =~ /\bx="([^"]*)"/;
  $x = &grid_units($1);
  die "y: $nxt" unless $nxt =~ /\by="([^"]*)"/;
  $y = -&grid_units($1);
  $addlevel = "next";
  $addlevel = $1 if $nxt =~ /\baddlevel="([^"]*)"/;
  $swaplevel = "0";
  $swaplevel = $1 if $nxt =~ /\bswaplevel="([^"]*)"/;
  return;
}

#<!ELEMENT gates (gate)*>
sub gates {
  while (&nxt) {
    if ($nxt =~ /^gate\b/) {
      &gate();
      # Remember the symbol and it's offset for each in the device.
      $gates{"$library;$deviceset;$gate"} = "$symbol;$x;$y";
    } elsif ($nxt =~ /^\/gates\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT connect EMPTY>
sub connect {
  return;
}

#<!ELEMENT connects (connect)*>
sub connects {
  while (&nxt) {
    if ($nxt =~ /^connect\b/) {
      &connect();
    } elsif ($nxt =~ /^\/connects\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT attribute EMPTY>
sub attribute {
  return;
}

#<!ELEMENT attributes (attribute)*>
sub attributes {
  while (&nxt) {
    if ($nxt =~ /^attribute\b/) {
      &attribute();
    } elsif ($nxt =~ /^\/attributes\b/) {
      return;
    } elsif ($nxt =~ /^\/technology\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT technology (attribute)*>
sub technology {
  while (&nxt) {
    if ($nxt =~ /^attribute\b/) {
      &attribute();
    } elsif ($nxt =~ /^technology\b/) {
      return;
    } elsif ($nxt =~ /^\/technology\b/) {
      next;
    } elsif ($nxt =~ /^\/technologies\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT technologies (technology)*>
sub technologies {
  &nxt;
  while ($nxt =~ /^technology\b/) {
    &technology();
  }
  if ($nxt =~ /^\/technologies\b/) {
    return;
  } else {
    die "Unrecognized: $nxt";
  }
}

#<!ELEMENT device (connects?, technologies?)>
sub device {
  while (&nxt) {
    if ($nxt =~ /^connects\b/) {
      &connects();
    } elsif ($nxt =~ /^technologies\b/) {
      &technologies();
    } elsif ($nxt =~ /^\/device\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT devices (device)*>
sub devices {
  while (&nxt) {
    if ($nxt =~ /^device\b/) {
      &device();
    } elsif ($nxt =~ /^\/devices\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT deviceset (description?, gates, devices)>
#<!ATTLIST deviceset
#          name          %String;       #REQUIRED
#          prefix        %String;       ""
#          uservalue     %Bool;         "no"
#          >
sub deviceset {
  die "deviceset name: $nxt" unless $nxt =~ /\bname="([^"]*)"/;
  $deviceset = $1;
  $prefix="";
  $prefix = $1 if $nxt =~ /\bprefix="([^"]*)"/;
  $uservalue="no";
  $uservalue = $1 if $nxt =~ /\buservalue="([^"]*)"/;
  while (&nxt) {
    if ($nxt =~ /^description\b/) {
      &description();
    } elsif ($nxt =~ /^gates\b/) {
      &gates();
    } elsif ($nxt =~ /^devices\b/) {
      &devices();
    } elsif ($nxt =~ /^\/deviceset\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT devicesets (deviceset)*>
sub devicesets {
  while (&nxt) {
    if ($nxt =~ /^deviceset\b/) {
      &deviceset();
    } elsif ($nxt =~ /^\/devicesets\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT library (description?, packages?, symbols?, devicesets?)>
#<!ATTLIST library
#          name          %String;       #REQUIRED
#          >
#          <!-- name: Only in libraries used inside boards or schematics -->
sub library {
  die "library name: $nxt" unless $nxt =~ /\bname="([^"]*)"/;
  $library = $1;
  while (&nxt) {
    if ($nxt =~ /^description\b/) {
      &description();
    } elsif ($nxt =~ /^packages\b/) {
      &packages();
    } elsif ($nxt =~ /^symbols\b/) {
      &symbols();
    } elsif ($nxt =~ /^devicesets\b/) {
      &devicesets();
    } elsif ($nxt =~ /^\/library\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT libraries (library)*>
sub libraries {
  %pinx = %piny = %prefix = ();
  while (&nxt) {
    if ($nxt =~ /^library\b/) {
      &library();
    } elsif ($nxt =~ /^\/libraries\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT variantdef EMPTY>
sub variantdef {
  return;
}

#<!ELEMENT variantdefs (variantdef)*>
sub variantdefs {
  while (&nxt) {
    if ($nxt =~ /^variantdef\b/) {
      &variantdef();
    } elsif ($nxt =~ /^\/variantdefs\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT clearance EMPTY>
sub clearance {
  return;
}

#<!ELEMENT class (clearance)*>
sub class {
  while (&nxt) {
    if ($nxt =~ /^clearance\b/) {
      &clearance();
    } elsif ($nxt =~ /^\/class\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT classes (class)*>
sub classes {
  while (&nxt) {
    if ($nxt =~ /^class\b/) {
      &class();
    } elsif ($nxt =~ /^\/classes\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT variant EMPTY>
sub variant {
  return;
}

#<!ELEMENT part (attribute*, variant*)>
#<!ATTLIST part
#          name          %String;       #REQUIRED
#          library       %String;       #REQUIRED
#          deviceset     %String;       #REQUIRED
#          device        %String;       #REQUIRED
#          technology    %String;       ""
#          value         %String;       #IMPLIED
#          >
sub part {
  # attribute* and variant* are often empty,
  # so <part...> directly follows <part...>.
  die "part name: $nxt" unless $nxt =~ /\bname="([^"]*)"/;
  $name = $1;
  die "library: $nxt" unless $nxt =~ /\blibrary="([^"]*)"/;
  $library = $1;
  die "deviceset: $nxt" unless $nxt =~ /\bdeviceset="([^"]*)"/;
  $deviceset = $1;
  die "device: $nxt" unless $nxt =~ /\bdevice="([^"]*)"/;
  $device = $1;
  $technology = "";
  $technology = $1 if $nxt =~ /\btechnology="([^"]*)"/;
  $value = $deviceset;
  $value = $1 if $nxt =~ /\bvalue="([^"]*)"/;
  $value =~ s/\*/$device/ if $deviceset =~ /\*/;
  while (&nxt) {
    if ($nxt =~ /^attribute\b/) {
      &attribute();
    } elsif ($nxt =~ /^variant\b/) {
      &variant();
    } elsif ($nxt =~ /^part\b/) {
      return;
    } elsif ($nxt =~ /^\/parts\b/) {
      return;
    } elsif ($nxt =~ /^\/part\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT parts (part)*>
sub parts {
  while (&nxt) {
    while ($nxt =~ /^part\b/) {
      &part();
      $discrete = 0;
      $discrete = 1 if $library eq "rcl";
      $deviceset{$name} = "$library;$deviceset";
      $value{$name} = $value;
    }
    if ($nxt =~ /^\/parts\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT plain (polygon | wire | text | dimension | circle | rectangle | frame | hole)*>
sub plain {
  $plain = "";
  while (&nxt) {
    if ($nxt =~ /^polygon\b/) {
      &polygon();
die "unimplemented";
    } elsif ($nxt =~ /^wire\b/) {
      &wire();
      $plain .= "LINE Normal $x1 $y1 $x2 $y2 $style\n";
#die "unimplemented";
    } elsif ($nxt =~ /^text\b/) {
      &text();
      $plain .= "TEXT $x $y Left $size $txt\n";
    } elsif ($nxt =~ /^dimension\b/) {
      &dimension();
die "unimplemented";
    } elsif ($nxt =~ /^circle\b/) {
      &circle();
die "unimplemented";
    } elsif ($nxt =~ /^rectangle\b/) {
      &rectangle();
die "unimplemented";
    } elsif ($nxt =~ /^frame\b/) {
      &frame();
die "unimplemented";
    } elsif ($nxt =~ /^hole\b/) {
      &hole();
die "unimplemented";
    } elsif ($nxt =~ /^\/plain\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

sub spicerot {
  local($rot) = @_;
  return $rot unless $rot =~ /(M*R*)(\d+)/;
  ($rot, $angle) = ($1, $2);
  $rot = "R" if $rot eq "";
  $angle = 360 - $angle;
  $angle %= 360;
  return "$rot$angle";
}

#<!ELEMENT instance (attribute)*>
#<!ATTLIST instance
#          part          %String;       #REQUIRED
#          gate          %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          smashed       %Bool;         "no"
#          rot           %Rotation;     "R0"
#          >
#          <!-- rot: Only 0, 90, 180 or 270 -->
sub instance {
  # If attribute* is empty, <instance...> directly follows <instance...>.
  die "part: $nxt" unless $nxt =~ /\bpart="([^"]*)"/;
  $part = $1;
  die "gate: $nxt" unless $nxt =~ /\bgate="([^"]*)"/;
  $gate = $1;
  die "x: $nxt" unless $nxt =~ /\bx="([^"]*)"/;
  $x = &grid_units($1);
  $x = &grid_snap($x);
  die "y: $nxt" unless $nxt =~ /\by="([^"]*)"/;
  $y = -&grid_units($1);
  $y = &grid_snap($y);
  $smashed = "no";
  $smashed = $1 if $nxt =~ /\bsmashed="([^"]*)"/;
  $rot = "r0";
  $rot = $1 if $nxt =~ /\brot="([^"]*)"/;
  while (&nxt) {
    if ($nxt =~ /^attribute\b/) {
      &attribute();
    } elsif ($nxt =~ /^instance\b/) {
      return;
    } elsif ($nxt =~ /^\/instances\b/) {
      return;
    } elsif ($nxt =~ /^\/instance\b/) {
      ;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT instances (instance)*>
sub instances {
  while (&nxt) {
    while ($nxt =~ /^instance\b/) {
      &instance();
      # Place an instance of the part at the specified coordinates.
      # $deviceset{$part}/gate is sufficient to resolve the symbol.
      $symbol = $gates{"$deviceset{$part};$gate"};
      $symbol =~ s/;.*//;
      if ($deviceset{$part} =~ /^supply/) {
        # Convert supply pins into net names,
        # thus connecting up the supplies.
        $rot = &spicerot($rot);
        $xoff = $pinx{$symbol};
        $yoff = $piny{$symbol};
        ($xoff, $yoff) = (-$yoff, $xoff) if $rot =~ /R90$/i;
        ($xoff, $yoff) = (-$xoff, -$yoff) if $rot =~ /R180$/i;
        ($xoff, $yoff) = ($yoff, -$xoff) if $rot =~ /R270$/i;
        $xoff = -$xoff if $rot =~ /^M/;
        $x += $xoff;
        $y += $yoff;
        $sheet .= "FLAG $x $y $symbol\n";
      } else {
        # Place a symbol in the usual way.
        $rot = &spicerot($rot);
        $sheet .= "SYMBOL $symbol $x $y $rot\n";
        $gate = "" if $gate eq 'G$1';
        $sheet .= "SYMATTR InstName $part$gate\n";
        $value = $value{$part};
        $value = "1u" if $symbol =~ /^EDGE-/;
        $value = $sheetno if $symbol eq "DOCFIELD";
        $sheet .= "SYMATTR Value $value\n";
        if ($symbol =~ /^EDGE-/) {
          $offset = 16;
          $mirror = 1;
          $mirror = -$mirror if $rot =~ /^M/;
          $x -= $mirror*$offset if $rot =~ /R0$/i;
          $y -= $offset if $rot =~ /R90$/i;
          $x += $mirror*$offset if $rot =~ /R180$/i;
          $y += $offset if $rot =~ /R270$/i;
          $sheet .= "FLAG $x $y $gate\n";
          $sheet .= "IOPIN $x $y $gate BiDir\n";
        }
      }
    }
    if ($nxt =~ /^\/instances\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT pinref EMPTY>
sub pinref {
  return;
}

#<!ELEMENT junction EMPTY>
sub junction {
  return;
}

#<!ELEMENT label EMPTY>
#<!ATTLIST label
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          size          %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          font          %TextFont;     "proportional"
#          ratio         %Int;          "8"
#          rot           %Rotation;     "R0"
#          xref          %Bool;         "no"
#          >
#          <!-- rot:  Only 0, 90, 180 or 270 -->
#          <!-- xref: Only in <net> context -->
sub label {
  die "x: $nxt" unless $nxt =~ /\bx="([^"]*)"/;
  $x = &grid_units($1);
  $x = &grid_snap($x);
  die "y: $nxt" unless $nxt =~ /\by="([^"]*)"/;
  $y = -&grid_units($1);
  $y = &grid_snap($y);
  die "size: $nxt" unless $nxt =~ /\bsize="([^"]*)"/;
  $size = $1;
  die "layer: $nxt" unless $nxt =~ /\blayer="([^"]*)"/;
  $layer = $1;
  $font = "proportional";
  $font = $1 if $nxt =~ /\bfont="([^"]*)"/;
  $ratio = "8";
  $ratio = $1 if $nxt =~ /\bratio="([^"]*)"/;
  $rot = "R0";
  $rot = $1 if $nxt =~ /\brot="([^"]*)"/;
  $xref = "no";
  $xref = $1 if $nxt =~ /\bxref="([^"]*)"/;
  return;
}

#<!ELEMENT segment (pinref | wire | junction | label)*>
sub segment {
  while (&nxt) {
    if ($nxt =~ /^pinref\b/) {
      &pinref();
    } elsif ($nxt =~ /^wire\b/) {
      &wire();
      $x1 = &grid_snap($x1);
      $y1 = &grid_snap($y1);
      $x2 = &grid_snap($x2);
      $y2 = &grid_snap($y2);
      $sheet .= "WIRE $x1 $y1 $x2 $y2\n";
    } elsif ($nxt =~ /^junction\b/) {
      &junction();
    } elsif ($nxt =~ /^label\b/) {
      &label();
      $segments .= "FLAG $x $y $net\n";
    } elsif ($nxt =~ /^\/segment\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT bus (segment)*>
sub bus {
  while (&nxt) {
    if ($nxt =~ /^segment\b/) {
      &segment();
    } elsif ($nxt =~ /^\/bus\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT busses (bus)*>
sub busses {
  while (&nxt) {
    if ($nxt =~ /^bus\b/) {
      &bus();
    } elsif ($nxt =~ /^\/busses\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT net (segment)*>
#<!ATTLIST net
#          name          %String;       #REQUIRED
#          class         %Class;        "0"
#          >
sub net {
  die "net name: $nxt" unless $nxt =~ /\bname="([^"]*)"/;
  $net = $1;
$net =~ s/^(\d+)$/_\1/;
$net =~ s/=/_/g;
  $class = "0";
  $class = $1 if $nxt =~ /\bclass="([^"]*)"/;
  $segments = "";
  while (&nxt) {
    if ($nxt =~ /^segment\b/) {
      &segment();
    } elsif ($nxt =~ /^\/net\b/) {
      print OUTPUT $segments;
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT nets (net)*>
sub nets {
  while (&nxt) {
    if ($nxt =~ /^net\b/) {
      &net();
    } elsif ($nxt =~ /^\/nets\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT sheet (description?, plain?, instances?, busses?, nets?)>
sub sheet {
  while (&nxt) {
    if ($nxt =~ /^description\b/) {
      &description();
    } elsif ($nxt =~ /^plain\b/) {
      $plain = "";
      &plain();
      print OUTPUT $plain;
      print OUTPUT "TEXT 0 8 Left 2 .lib myparts.lib\n";
    } elsif ($nxt =~ /^instances\b/) {
      &instances();
    } elsif ($nxt =~ /^busses\b/) {
      &busses();
    } elsif ($nxt =~ /^nets\b/) {
      &nets();
    } elsif ($nxt =~ /^\/sheet\b/) {
      print OUTPUT $sheet;
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT sheets (sheet)*>
sub sheets {
  $sheetno = 1;
  while (&nxt) {
    if ($nxt =~ /^sheet\b/) {
      $sheet = "SHEET $sheetno\n";
      &sheet();
      $sheetno++;
    } elsif ($nxt =~ /^\/sheets\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT approved EMPTY>
sub approved {
  return;
}

#<!ELEMENT errors (approved)*>
sub errors {
  while (&nxt) {
    if ($nxt =~ /^approved\b/) {
      &approved();
    } elsif ($nxt =~ /^\/errors\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

sub schematic {
  die "Not a schematic" unless $nxt =~ /^schematic\b/;
  %deviceset = %value = %gates = ();
  #
  # A schematic consists of description, libraries, attributes, variantdefs,
  # classes, parts, sheets, and errors.
  while (&nxt) {
    if ($nxt =~ /^description\b/) {
      &description();
    } elsif ($nxt =~ /^libraries\b/) {
      &libraries();
    } elsif ($nxt =~ /^attributes\b/) {
      &attributes();
    } elsif ($nxt =~ /^variantdefs\b/) {
      &variantdefs();
    } elsif ($nxt =~ /^classes\b/) {
      &classes();
    } elsif ($nxt =~ /^parts\b/) {
      open(OUTPUT, ">$f") || die "$f: $!";
      &parts();
    } elsif ($nxt =~ /^sheets\b/) {
      &sheets();
    } elsif ($nxt =~ /^errors\b/) {
      &errors();
    } elsif ($nxt =~ /^\/schematic\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT note (#PCDATA)>
sub note {
  return;
}

#<!ELEMENT compatibility (note)*>
#<!ELEMENT setting EMPTY>
sub setting {
  return;
}

#<!ELEMENT settings (setting)*>
sub settings {
  while (&nxt) {
    if ($nxt =~ /^setting\b/) {
      &setting();
    } elsif ($nxt =~ /^\/settings\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT grid EMPTY>
#<!ATTLIST grid
#          distance      %Real;         #IMPLIED
#          unitdist      %GridUnit;     #IMPLIED
#          unit          %GridUnit;     #IMPLIED
#          style         %GridStyle;    "lines"
#          multiple      %Int;          "1"
#          display       %Bool;         "no"
#          altdistance   %Real;         #IMPLIED
#          altunitdist   %GridUnit;     #IMPLIED
#          altunit       %GridUnit;     #IMPLIED
#          >
sub grid {
  die "distance: $nxt" unless $nxt =~ /\bdistance="([^"]*)"/;
  $grid_distance = $1;
  die "unitdist: $nxt" unless $nxt =~ /\bunitdist="([^"]*)"/;
  die "should be inches, not $unitdist" unless $1 eq "inch";
  $grid_distance *= 25.4; # convert from mm
  $grid_distance /= 160; # 160 dpi
  return;
}

#<!ELEMENT layer EMPTY>
sub layer {
  return;
}

#<!ELEMENT layers (layer)*>
sub layers {
  while (&nxt) {
    if ($nxt =~ /^layer\b/) {
      &layer();
    } elsif ($nxt =~ /^\/layers\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT drawing (settings?, grid?, layers, (library | schematic | board))>
sub drawing {
  #
  # A schematic consists of description, libraries, attributes, variantdefs,
  # classes, parts, sheets, and errors.
  while (&nxt) {
    if ($nxt =~ /^settings\b/) {
      &settings();
    } elsif ($nxt =~ /^grid\b/) {
      &grid();
    } elsif ($nxt =~ /^layers\b/) {
      &layers();
    } elsif ($nxt =~ /^(library|schematic|board)\b/) {
      &schematic();
    } elsif ($nxt =~ /^\/drawing\b/) {
      return;
    } else {
      die "Unrecognized: $nxt";
    }
  }
}

#<!ELEMENT eagle (compatibility?, drawing, compatibility?)>
sub eagle {
  # An eagle drawing is basically an XML header, and a <drawing>
  &nxt;
  while ($nxt !~ /^drawing\b/) {
    &nxt;
  }
  &drawing();
}

foreach $f (@ARGV) {
  open(INPUT, $f) || die "$f: $!";
warn "Processing $f\n";
  $f =~ s/[.]sch/.asc/ || die "$f: bad extension";
  $f =~ s/.*\///;
  &eagle;
}

#<!--
#  EAGLE version 6.6.0 DTD
#  Copyright (c) 2014 CadSoft Computer GmbH
#  http://www.cadsoft.de
#
#  This file describes the XML file format used by EAGLE version 6.6.0,
#  hereafter referred to as the "EAGLE File Format".
#  It is made available under the creative commons "CC BY-ND 3.0" license
#  (see http://creativecommons.org/licenses/by-nd/3.0).
#  You may use this file to implement a program that reads and/or writes files
#  in the EAGLE File Format. If your program writes files in the EAGLE File
#  Format, these files must be readable by EAGLE version 6.6.0
#  without any error messages or warnings.
#-->
#
#<!-- ### Entity definitions ############################################### -->
#
#<!ENTITY % Int               "CDATA"> <!-- an integer number -->
#<!ENTITY % Real              "CDATA"> <!-- a real number -->
#<!ENTITY % String            "CDATA"> <!-- a character string -->
#<!ENTITY % Bool              "(no | yes)">
#<!ENTITY % Coord             "%Real;"> <!-- coordinates, given in millimeters -->
#<!ENTITY % Dimension         "%Real;"> <!-- dimensions, given in millimeters -->
#<!ENTITY % Layer             "%Int;"> <!-- layer number -->
#<!ENTITY % GridUnit          "(mic | mm | mil | inch)">
#<!ENTITY % GridStyle         "(lines | dots)">
#<!ENTITY % WireStyle         "(continuous | longdash | shortdash | dashdot)">
#<!ENTITY % WireCap           "(flat | round)">
#<!ENTITY % WireCurve         "%Real;"> <!-- curvature of a wire; allowed range: -359.9..359.9 -->
#<!ENTITY % Class             "%Int;"> <!-- net class -->
#<!ENTITY % PadShape          "(square | round | octagon | long | offset)">
#<!ENTITY % ViaShape          "(square | round | octagon)">
#<!ENTITY % TextFont          "(vector | proportional | fixed)">
#<!ENTITY % Rotation          "CDATA"> <!-- rotation of an object; allowed range: [MSR]0..359.9 -->
#<!ENTITY % AttributeDisplay  "(off | value | name | both)">
#<!ENTITY % Extent            "%String;"> <!-- the layers a via or airwire extends through, given as "topmost-bottommost" -->
#<!ENTITY % PolygonPour       "(solid | hatch | cutout)">
#<!ENTITY % PinVisible        "(off | pad | pin | both)">
#<!ENTITY % PinLength         "(point | short | middle | long)">
#<!ENTITY % PinDirection      "(nc | in | out | io | oc | pwr | pas | hiz | sup)">
#<!ENTITY % PinFunction       "(none | dot | clk | dotclk)">
#<!ENTITY % GateAddLevel      "(must | can | next | request | always)">
#<!ENTITY % ContactRoute      "(all | any)">
#<!ENTITY % DimensionType     "(parallel | horizontal | vertical | radius | diameter | leader)">
#<!ENTITY % Severity          "(info | warning | error)">
#<!ENTITY % Align             "(bottom-left | bottom-center | bottom-right | center-left | center | center-right | top-left | top-center | top-right)">
#<!ENTITY % VerticalText      "(up | down)">
#
#<!-- ### Drawing definitions ############################################## -->
#
#<!ELEMENT eagle (compatibility?, drawing, compatibility?)>
#<!ATTLIST eagle
#          version       %Real;         #REQUIRED
#          >
#          <!-- version: The EAGLE program version that generated this file, in the form V.RR -->
#
#<!ELEMENT compatibility (note)*>
#
#<!ELEMENT note (#PCDATA)>
#<!ATTLIST note
#          version       %Real;         #REQUIRED
#          severity      %Severity;     #REQUIRED
#          >
#          <!-- version: The EAGLE program version that introduced this compatibility note -->
#
#<!ELEMENT drawing (settings?, grid?, layers, (library | schematic | board))>
#
#<!ELEMENT library (description?, packages?, symbols?, devicesets?)>
#<!ATTLIST library
#          name          %String;       #REQUIRED
#          >
#          <!-- name: Only in libraries used inside boards or schematics -->
#
#<!ELEMENT schematic (description?, libraries?, attributes?, variantdefs?, classes?, parts?, sheets?, errors?)>
#<!ATTLIST schematic
#          xreflabel     %String;       #IMPLIED
#          xrefpart      %String;       #IMPLIED
#          >
#
#<!ELEMENT board (description?, plain?, libraries?, attributes?, variantdefs?, classes?, designrules?, autorouter?, elements?, signals?, errors?)>
#
#<!-- ### High level objects ############################################### -->
#
#<!ELEMENT sheet (description?, plain?, instances?, busses?, nets?)>
#
#<!ELEMENT package (description?, (polygon | wire | text | dimension | circle | rectangle | frame | hole | pad | smd)*)>
#<!ATTLIST package
#          name          %String;       #REQUIRED
#          >
#
#<!ELEMENT symbol (description?, (polygon | wire | text | dimension | pin | circle | rectangle | frame)*)>
#<!ATTLIST symbol
#          name          %String;       #REQUIRED
#          >
#
#<!ELEMENT deviceset (description?, gates, devices)>
#<!ATTLIST deviceset
#          name          %String;       #REQUIRED
#          prefix        %String;       ""
#          uservalue     %Bool;         "no"
#          >
#
#<!ELEMENT device (connects?, technologies?)>
#<!ATTLIST device
#          name          %String;       ""
#          package       %String;       #IMPLIED
#          >
#
#<!ELEMENT bus (segment)*>
#<!ATTLIST bus
#          name          %String;       #REQUIRED
#          >
#
#<!ELEMENT net (segment)*>
#<!ATTLIST net
#          name          %String;       #REQUIRED
#          class         %Class;        "0"
#          >
#
#<!ELEMENT segment (pinref | wire | junction | label)*>
#          <!-- 'pinref' and 'junction' are only valid in a <net> context -->
#
#<!ELEMENT signal (contactref | polygon | wire | via)*>
#<!ATTLIST signal
#          name          %String;       #REQUIRED
#          class         %Class;        "0"
#          airwireshidden %Bool;        "no"
#          >
#
#<!-- ### Basic objects #################################################### -->
#
#<!ELEMENT variantdef EMPTY>
#<!ATTLIST variantdef
#          name          %String;       #REQUIRED
#          current       %Bool;         "no"
#          >
#
#<!ELEMENT variant EMPTY>
#<!ATTLIST variant
#          name          %String;       #REQUIRED
#          populate      %Bool;         "yes"
#          value         %String;       #IMPLIED
#          technology    %String;       #IMPLIED
#          >
#          <!-- technology: Only in part context -->
#
#<!ELEMENT gate EMPTY>
#<!ATTLIST gate
#          name          %String;       #REQUIRED
#          symbol        %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          addlevel      %GateAddLevel; "next"
#          swaplevel     %Int;          "0"
#          >
#
#<!ELEMENT wire EMPTY>
#<!ATTLIST wire
#          x1            %Coord;        #REQUIRED
#          y1            %Coord;        #REQUIRED
#          x2            %Coord;        #REQUIRED
#          y2            %Coord;        #REQUIRED
#          width         %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          extent        %Extent;       #IMPLIED
#          style         %WireStyle;    "continuous"
#          curve         %WireCurve;    "0"
#          cap           %WireCap;      "round"
#          >
#          <!-- extent: Only applicable for airwires -->
#          <!-- cap   : Only applicable if 'curve' is not zero -->
#
#<!ELEMENT dimension EMPTY>
#<!ATTLIST dimension
#          x1            %Coord;        #REQUIRED
#          y1            %Coord;        #REQUIRED
#          x2            %Coord;        #REQUIRED
#          y2            %Coord;        #REQUIRED
#          x3            %Coord;        #REQUIRED
#          y3            %Coord;        #REQUIRED
#          layer         %Layer;        #REQUIRED
#          dtype         %DimensionType; "parallel"
#          width         %Dimension;    #REQUIRED
#          extwidth      %Dimension;    "0"
#          extlength     %Dimension;    "0"
#          extoffset     %Dimension;    "0"
#          textsize      %Dimension;    #REQUIRED
#          textratio     %Int;          "8"
#          unit          %GridUnit;     "mm"
#          precision     %Int;          "2"
#          visible       %Bool;         "no"
#          >
#
#<!ELEMENT text (#PCDATA)>
#<!ATTLIST text
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          size          %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          font          %TextFont;     "proportional"
#          ratio         %Int;          "8"
#          rot           %Rotation;     "R0"
#          align         %Align;        "bottom-left"
#          distance      %Int;          "50"
#          >
#
#<!ELEMENT circle EMPTY>
#<!ATTLIST circle
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          radius        %Coord;        #REQUIRED
#          width         %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          >
#
#<!ELEMENT rectangle EMPTY>
#<!ATTLIST rectangle
#          x1            %Coord;        #REQUIRED
#          y1            %Coord;        #REQUIRED
#          x2            %Coord;        #REQUIRED
#          y2            %Coord;        #REQUIRED
#          layer         %Layer;        #REQUIRED
#          rot           %Rotation;     "R0"
#          >
#
#<!ELEMENT frame EMPTY>
#<!ATTLIST frame
#          x1            %Coord;       #REQUIRED
#          y1            %Coord;       #REQUIRED
#          x2            %Coord;       #REQUIRED
#          y2            %Coord;       #REQUIRED
#          columns       %Int;         #REQUIRED
#          rows          %Int;         #REQUIRED
#          layer         %Layer;       #REQUIRED
#          border-left   %Bool;        "yes"
#          border-top    %Bool;        "yes"
#          border-right  %Bool;        "yes"
#          border-bottom %Bool;        "yes"
#          >
#
#<!ELEMENT hole EMPTY>
#<!ATTLIST hole
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          drill         %Dimension;    #REQUIRED
#          >
#
#<!ELEMENT pad EMPTY>
#<!ATTLIST pad
#          name          %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          drill         %Dimension;    #REQUIRED
#          diameter      %Dimension;    "0"
#          shape         %PadShape;     "round"
#          rot           %Rotation;     "R0"
#          stop          %Bool;         "yes"
#          thermals      %Bool;         "yes"
#          first         %Bool;         "no"
#          >
#
#<!ELEMENT smd EMPTY>
#<!ATTLIST smd
#          name          %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          dx            %Dimension;    #REQUIRED
#          dy            %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          roundness     %Int;          "0"
#          rot           %Rotation;     "R0"
#          stop          %Bool;         "yes"
#          thermals      %Bool;         "yes"
#          cream         %Bool;         "yes"
#          >
#
#<!ELEMENT element (attribute*, variant*)>
#<!ATTLIST element
#          name          %String;       #REQUIRED
#          library       %String;       #REQUIRED
#          package       %String;       #REQUIRED
#          value         %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          locked        %Bool;         "no"
#          smashed       %Bool;         "no"
#          rot           %Rotation;     "R0"
#          >
#
#<!ELEMENT via EMPTY>
#<!ATTLIST via
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          extent        %Extent;       #REQUIRED
#          drill         %Dimension;    #REQUIRED
#          diameter      %Dimension;    "0"
#          shape         %ViaShape;     "round"
#          alwaysstop    %Bool;         "no"
#          >
#
#<!ELEMENT polygon (vertex)*>
#          <!-- the vertices must define a valid polygon; if the last vertex is the same as the first one, it is ignored -->
#<!ATTLIST polygon
#          width         %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          spacing       %Dimension;    #IMPLIED
#          pour          %PolygonPour;  "solid"
#          isolate       %Dimension;    #IMPLIED
#          orphans       %Bool;         "no"
#          thermals      %Bool;         "yes"
#          rank          %Int;          "0"
#          >
#          <!-- isolate: Only in <signal> or <package> context -->
#          <!-- orphans: Only in <signal> context -->
#          <!-- thermals:Only in <signal> context -->
#          <!-- rank:    1..6 in <signal> context, 0 or 7 in <package> context -->
#
#<!ELEMENT vertex EMPTY>
#<!ATTLIST vertex
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          curve         %WireCurve;    "0"
#          >
#          <!-- curve: The curvature from this vertex to the next one -->
#
#<!ELEMENT pin EMPTY>
#<!ATTLIST pin
#          name          %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          visible       %PinVisible;   "both"
#          length        %PinLength;    "long"
#          direction     %PinDirection; "io"
#          function      %PinFunction;  "none"
#          swaplevel     %Int;          "0"
#          rot           %Rotation;     "R0"
#          >
#
#<!ELEMENT part (attribute*, variant*)>
#<!ATTLIST part
#          name          %String;       #REQUIRED
#          library       %String;       #REQUIRED
#          deviceset     %String;       #REQUIRED
#          device        %String;       #REQUIRED
#          technology    %String;       ""
#          value         %String;       #IMPLIED
#          >
#
#<!ELEMENT instance (attribute)*>
#<!ATTLIST instance
#          part          %String;       #REQUIRED
#          gate          %String;       #REQUIRED
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          smashed       %Bool;         "no"
#          rot           %Rotation;     "R0"
#          >
#          <!-- rot: Only 0, 90, 180 or 270 -->
#
#<!ELEMENT label EMPTY>
#<!ATTLIST label
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          size          %Dimension;    #REQUIRED
#          layer         %Layer;        #REQUIRED
#          font          %TextFont;     "proportional"
#          ratio         %Int;          "8"
#          rot           %Rotation;     "R0"
#          xref          %Bool;         "no"
#          >
#          <!-- rot:  Only 0, 90, 180 or 270 -->
#          <!-- xref: Only in <net> context -->
#
#<!ELEMENT junction EMPTY>
#<!ATTLIST junction
#          x             %Coord;        #REQUIRED
#          y             %Coord;        #REQUIRED
#          >
#
#<!ELEMENT connect EMPTY>
#<!ATTLIST connect
#          gate          %String;       #REQUIRED
#          pin           %String;       #REQUIRED
#          pad           %String;       #REQUIRED
#          route         %ContactRoute; "all"
#          >
#
#<!ELEMENT technology (attribute)*>
#<!ATTLIST technology
#          name          %String;       #REQUIRED
#          >
#
#<!ELEMENT attribute EMPTY>
#<!ATTLIST attribute
#          name          %String;       #REQUIRED
#          value         %String;       #IMPLIED
#          x             %Coord;        #IMPLIED
#          y             %Coord;        #IMPLIED
#          size          %Dimension;    #IMPLIED
#          layer         %Layer;        #IMPLIED
#          font          %TextFont;     #IMPLIED
#          ratio         %Int;          #IMPLIED
#          rot           %Rotation;     "R0"
#          display       %AttributeDisplay; "value"
#          constant      %Bool;         "no"
#          >
#          <!-- display: Only in <element> or <instance> context -->
#          <!-- constant:Only in <device> context -->
#
#<!ELEMENT pinref EMPTY>
#<!ATTLIST pinref
#          part          %String;       #REQUIRED
#          gate          %String;       #REQUIRED
#          pin           %String;       #REQUIRED
#          >
#
#<!ELEMENT contactref EMPTY>
#<!ATTLIST contactref
#          element       %String;       #REQUIRED
#          pad           %String;       #REQUIRED
#          route         %ContactRoute; "all"
#          routetag      %String;       ""
#          >
#
#<!-- ### Object lists ##################################################### -->
#
#<!ELEMENT variantdefs (variantdef)*>
#<!ELEMENT settings (setting)*>
#<!ELEMENT sheets (sheet)*>
#<!ELEMENT layers (layer)*>
#<!ELEMENT packages (package)*>
#<!ELEMENT symbols (symbol)*>
#<!ELEMENT devicesets (deviceset)*>
#<!ELEMENT gates (gate)*>
#<!ELEMENT devices (device)*>
#<!ELEMENT libraries (library)*>
#<!ELEMENT connects (connect)*>
#<!ELEMENT technologies (technology)*>
#<!ELEMENT attributes (attribute)*>
#<!ELEMENT classes (class)*>
#<!ELEMENT parts (part)*>
#<!ELEMENT instances (instance)*>
#<!ELEMENT errors (approved)*>
#<!ELEMENT plain (polygon | wire | text | dimension | circle | rectangle | frame | hole)*>
#<!ELEMENT autorouter (pass)*>
#<!ELEMENT elements (element)*>
#<!ELEMENT signals (signal)*>
#<!ELEMENT busses (bus)*>
#<!ELEMENT nets (net)*>
#
#<!-- ### Miscellaneous objects ############################################ -->
#
#<!ELEMENT setting EMPTY>
#<!ATTLIST setting
#          alwaysvectorfont %Bool;         #IMPLIED
#          verticaltext     %VerticalText; "up"
#          >
#
#<!ELEMENT designrules (description*, param*)>
#<!ATTLIST designrules
#          name          %String;       #REQUIRED
#          >
#
#<!ELEMENT grid EMPTY>
#<!ATTLIST grid
#          distance      %Real;         #IMPLIED
#          unitdist      %GridUnit;     #IMPLIED
#          unit          %GridUnit;     #IMPLIED
#          style         %GridStyle;    "lines"
#          multiple      %Int;          "1"
#          display       %Bool;         "no"
#          altdistance   %Real;         #IMPLIED
#          altunitdist   %GridUnit;     #IMPLIED
#          altunit       %GridUnit;     #IMPLIED
#          >
#
#<!ELEMENT layer EMPTY>
#<!ATTLIST layer
#          number        %Layer;        #REQUIRED
#          name          %String;       #REQUIRED
#          color         %Int;          #REQUIRED
#          fill          %Int;          #REQUIRED
#          visible       %Bool;         "yes"
#          active        %Bool;         "yes"
#          >
#
#<!ELEMENT class (clearance)*>
#<!ATTLIST class
#          number        %Class;        #REQUIRED
#          name          %String;       #REQUIRED
#          width         %Dimension;    "0"
#          drill         %Dimension;    "0"
#          >
#
#<!ELEMENT clearance EMPTY>
#<!ATTLIST clearance
#          class         %Class;        #REQUIRED
#          value         %Dimension;    "0"
#          >
#
#<!ELEMENT description (#PCDATA)>
#<!ATTLIST description
#          language      %String;       "en"
#          >
#
#<!ELEMENT param EMPTY>
#<!ATTLIST param
#          name          %String;       #REQUIRED
#          value         %String;       #REQUIRED
#          >
#
#<!ELEMENT pass (param)*>
#<!ATTLIST pass
#          name          %String;       #REQUIRED
#          refer         %String;       #IMPLIED
#          active        %Bool;         "yes"
#          >
#
#<!ELEMENT approved EMPTY>
#<!ATTLIST approved
#          hash          %String;       #REQUIRED
#          >
