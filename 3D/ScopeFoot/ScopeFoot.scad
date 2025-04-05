// Customize invocations the invocations (which follow
// the modules declarations) at the bottom of the file.

// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm.

inch = 25.4; // mm
eighth = inch / 8;
$fn=30;

screwbore = 0.15 * inch;
screwhead = .27 * inch;

// A stepped hole for a #6 screw.
module screwhole () {
    cylinder(d=screwbore, h=eighth);
    translate([0, 0, eighth])
        cylinder(d=screwhead, h=eighth);
}

// The basic foot without bevels.
module foot () {
    difference () {
        cube([1.25*inch, 0.5*inch, 0.25*inch]);
        // Two screw holes
        translate([0.25*inch, 0.25*inch, 0])
            screwhole();
        translate([1.0*inch, 0.25*inch, 0])
            screwhole();
        // Bevel some edges
        translate([1.25*inch, 0, 0.25*inch])
        rotate([180, 0, 180])
        bevel();
    }
}



// Compute a bevel
module bevel2 () {
         rotate ([90, 0, 90])
             linear_extrude (height=1.25*inch) 
                 polygon([[0, 0], [0, 1], [1, 0]]);
         rotate ([90, -90, 180])
             linear_extrude (height=0.5*inch) 
                 polygon([[0, 0], [0, 1], [1, 0]]);
}
module bevel() {
        bevel2();
        translate([1.25*inch, 0.5*inch, 0])
            rotate([0, 0, 180])
                bevel2();
}
//translate([1.25*inch, 0.5*inch, 0]) rotate([0, 0, 180]) bevel2();
//translate([1.25*inch, 0*inch, 0.25*inch]) rotate([180, 0, 180]) bevel();

// Change invocations below to generate dessired feet.
//screwhole();
foot();

//translate([0, 0*inch, 0]) foot();
//translate([0, 1*inch, 0]) foot();
//translate([0, 2*inch, 0]) foot();
