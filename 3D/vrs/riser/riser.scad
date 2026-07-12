// Customize the invocations (which follow
// the modules declarations) at the bottom of the file.

// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm.

minh = 1;	// Minimum height
inch = 25.4;
$fn=50;

width = 81;
length = 44.6;
//height = 2;
height = 3*inch;
oww = 2.5; // ww we must fit inside
ww = oww + 1; // Our wall width

// Draw the main box.
difference() {
    cube([width, length, height]);
    translate([ww, ww, 0])
        cube([width-2*ww, length-2*ww, height]);
}

translate([oww, oww, height])
difference() {
    cube([width-2*oww, length-2*oww, 2]);
    translate([ww-oww, ww-oww, 0])
        cube([width-2*ww, length-2*ww, 2]);
}
