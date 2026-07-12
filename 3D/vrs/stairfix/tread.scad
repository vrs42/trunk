// Customize the invocations (which follow
// the modules declarations) at the bottom of the file.

// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm.

minh = 1;	// Minimum height
inch = 25.4;
$fn=50;

// The treads are 30 inches wide, which is too wide for the printer.
//treadw = 30 * inch;	// Too large for printer!
treadw = 8 * inch;	// Too large for printer!
//treadw = 2 * inch;	// Too large for printer!
treadl = 8.5 * inch;	// Treaad lengh

module tread (width, height, rise) {
  maxh = minh + height;
  triangle();
}

module deleteme() {
// This thing is a nightmare to describe, so let's set an origin
// at the widest part, nearest the driver, at the bottom. Call that
// the origin. Call it also the "front left bottom" of the object.
flb = [0, 0, 0]; // Front left bottom
// The front face is 69 mm wide, rises to 32 mm, and is tipped back
// to -20mm at the top.
frontxlen = 69;
frontylen = 40;
frontzlen = 30;

// Start with a rectangular solid. Subtract from it suitably
// rotated rectangular solids until the shape is approximated.
// (This bit is buried in the dash.)
difference () {
    cube([frontxlen, frontylen+10, frontzlen]);
    rotate([50, 0, 0]) cube([frontxlen*1.5, frontylen*1.5, frontzlen*1.5]);
    rotate([0, -60, 0]) cube([frontxlen*1.5, frontylen*1.5, frontzlen*1.5]);
    translate([frontxlen, 0, 0])
        rotate([0, -15, 0])
            cube([frontxlen*1.5, frontylen*1.5, frontzlen*1.5]);
    translate([18, frontylen, 1])
        rotate([45, 0, 0])
            cube([43, 150, 5]);
}
// Now attempt a tower for the phone to mount onto.
translate([18, frontylen+15, 0]) 
//    rotate([50, 0, 0])
        difference() {
            cube([43, 150, 5]);
            translate([22, 150-22, 0])
                cylinder(r=2.4, h=5);
        }
}

module fail1() {
scale([treadw,1,1]) cylinder(d1=minh, d2=.75*inch, h=treadl, $fn=4);
}

difference () {
    cube([treadw, treadl, 0.75*inch]); 
    translate([0, 0, minh]) rotate([4.035, 0, 0])
    cube([treadw, treadl+inch, 0.75*inch]); 
}
