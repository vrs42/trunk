//
// Make a box suitable for floppy storage.

inch = 25.4; // mm
$fn = 24;
height = (8 + 5/8)*inch;
length = 8.8375*inch;
width = 1.8375*inch;
wall = 0.055*inch;
lheight = 4.25*inch;
rheight = (8 + 3/8)*inch;
fheight = 6*inch;
slack = 0.01*inch;

module box (height, length, width, wall) {
    difference () {
        cube ([length, width, height]);
        translate ([wall, wall, wall])
            cube ([length-wall*2, width-wall*2, height]);

    }
}

difference () {
    box(rheight, length, width, wall*2);
    translate([0, width, height])
        rotate([180, 0, 0])
            box(lheight, length, width, wall+slack);
    translate ([0, 0, fheight])
        rotate([60, 0, 0])
            cube([length, 2*width, lheight]);
}


module lid() {
    box(lheight, length, width, wall);
}

translate ([0, 2*inch, 0])
lid();