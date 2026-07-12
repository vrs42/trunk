// Customize the invocations (which follow
// the modules declarations) at the bottom of the file.

// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm.

minh = 1;	// Minimum height
inch = 25.4;
$fn=50;

// BUGBUG: Does width/length need fudge for clearance?
awidth = 0.66+.20;	// Aperture width
iwidth = 1.76-.02;	// Box inside width
owidth = 2.54;	// Box outside width
oheight = 14.00; // Box overall height
theight = 8.30;	// Retention tab height
bheight = 3.90; // Pin guide height
gheight = oheight -  theight - bheight; // Height of gap

rows = 2;
cols = 44;

width = 81;
length = 44.6;
//height = 2;
height = 3*inch;
oww = 2.5; // ww we must fit inside
ww = oww + 1; // Our wall width

// x, y are center!
module pin(x, y, a) {
    translate([x, y, oheight/2]) rotate(a) {
        difference() {
            cube([iwidth, iwidth, oheight], true);
            cube([awidth, awidth, oheight], true);
            translate([-iwidth/2, -iwidth/2, -bheight/2])
                cube([iwidth, (iwidth-awidth)/2,
                        bheight]);
            translate([0, -iwidth/2, 1-oheight/2])
                cube([iwidth, 0.2, 0.2], true);
        }
    }
}

// Draw the main box.
{
    // BUGBUG: Need holes for pins in this shape.
    difference() {
        cube([2*owidth, 2*owidth, oheight]);
        translate([1.5*owidth, 0.5*owidth, 0])
            cube([iwidth, iwidth, oheight], true);
        translate([1.5*owidth, 1.5*owidth, 0])
            cube([iwidth, iwidth, oheight], true);
    }
    pin(2.5*owidth, 0.5*owidth, 0);
    pin(2.5*owidth, 1.5*owidth, 180);
    translate([owidth, 0, oheight])
        cube([2*owidth, 2*owidth, 3]);
}