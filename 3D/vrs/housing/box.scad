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
gheight = oheight - theight - bheight; // Height of gap
twidth = 1;
tlength = 3.9;
glength = 5;

rows = 2;
cols = 22;

width = 81;
length = 44.6;
//height = 2;
height = 3*inch;
oww = 2.5; // ww we must fit inside
ww = oww + 1; // Our wall width

// A simple box, the right size for a housing.abs
slack = 0.2;
hwidth = oheight + 2*slack;
hheight = owidth + slack;
hlength = owidth*cols + 2*slack;
difference() {
    cube([hwidth+oww, hlength+oww, hheight+oww/2]);
    translate([oww/2, oww/2, oww/2])
        cube([hwidth, hlength, hheight]);
    translate([oww/2, oww/2, 0])
        cube([5, hlength, oww/2]);
}