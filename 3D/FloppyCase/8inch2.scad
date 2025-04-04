//
// Make a box suitable for floppy storage.

inch = 25.4; // mm
$fn = 24;

// Wall thickness is shared
wall = 0.055*inch; // 0.06
// Lid parameters
lheight = 4.2*inch;
llength = 8.875*inch;
lwidth = 1.6*inch;
// Base parameters
height = 8.25*inch;
length = 8.625*inch;
width = 1.48*inch;
rheight = 8.25*inch;
fheight = 5.75*inch;
//slack = 0.01*inch;

module box (height, length, width, wall) {
    difference () {
        cube ([length, width, height]);
        translate ([wall, wall, wall])
            cube ([length-wall*2, width-wall*2, height]);

    }
}

difference () {
    box(rheight, length, width, wall);
//    translate([0, width, height])
  //      rotate([180, 0, 0])
    //        box(lheight, length, width, wall);
    translate ([0, 0, fheight])
        rotate([70, 0, 0])
            cube([length, 2*width, lheight]);
}


module lid() {
    box(lheight, llength, lwidth, wall);
}

translate ([0, 2*inch, 0])
lid();