// Customize invocations the invocations (which follow
// the modules declarations) at the bottom of the file.

// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm.

inch = 25.4;
$fn=50;

// The basic handle without text.
module Handle() {
    color("maroon") {
        difference () {
            cube([0.463*inch, 2.436*inch, 0.080*inch]);
            translate([0.275*inch, 0.218*inch, -.001])
                cylinder(r=0.068*inch, h=0.082*inch);
            translate([0.275*inch, 2.218*inch, -.001])
                cylinder(r=0.068*inch, h=0.082*inch);
        }
        // Two holes are needed to mount to the PCB.
        cube([0.080*inch, 0.968*inch, 0.240*inch]);
        translate([0, 1.468*inch, 0])
            cube([0.080*inch, 0.968*inch, 0.240*inch]);
        // Create stepped walls x=.373 y=.08 z=.48.
        difference () {
            translate([-0.293*inch, 0.968*inch, 0])
                cube([0.373*inch, 0.080*inch, 0.480*inch]);
            translate([-0.168*inch, 0.967*inch, 0.410*inch])
                cube([0.249*inch, 0.082*inch, 0.071*inch]);
            translate([0.080*inch, 0.967*inch, 0.240*inch])
                rotate([0, -55.5, 0])
                    cube([0.240*inch, 0.082*inch, 0.301*inch]);
        }
        difference () {
            translate([-0.293*inch, 1.388*inch, 0])
                cube([0.373*inch, 0.080*inch, 0.480*inch]);
            translate([-0.168*inch, 1.387*inch, 0.410*inch])
                cube([0.249*inch, 0.082*inch, 0.071*inch]);
            translate([0.080*inch, 1.387*inch, 0.240*inch])
                rotate([0, -55.5, 0])
                    cube([0.240*inch, 0.082*inch, 0.301*inch]);
        }
        // Create a wall x=.075 y=.5 z=.48
        translate([-0.293*inch, 0.968*inch, 0])
            cube([0.106*inch, 0.500*inch, 0.480*inch]);
        // Fill in the hole in the floor.
        translate([-0.293*inch, 0.968*inch, 0])
            cube([0.293*inch, 0.500*inch, 0.080*inch]);
        // Now do the wings that form the grips.
        // The wings are centered at (-0.421, .710)
        // and (-0.421, 1.710).
        // Each wing consists of a cylinder
        // and two rectangular solids.
        translate([-.421*inch, 0.710*inch]) {
            cylinder(r=0.031*inch, h=.48*inch);
            rotate([0, 0, -32])
            translate([-.031*inch, 0, 0])
                cube([0.062*inch, 0.310*inch, 0.480*inch]);
            rotate([0, 0, -39.5])
            translate([-.031*inch, 0, 0])
                cube([0.062*inch, 0.360*inch, 0.480*inch]);
        }
        translate([-.421*inch, 1.726*inch, 0]) {
            cylinder(r=0.031*inch, h=.48*inch);
            rotate([0, 0, 180+32])
            translate([-.031*inch, 0, 0])
                cube([0.062*inch, 0.310*inch, 0.480*inch]);
            rotate([0, 0, 180+39.5])
            translate([-.031*inch, 0, 0])
                cube([0.062*inch, 0.360*inch, 0.480*inch]);
        }
    }
}

module Label(mname) {
    lwidth = 0.42*inch;
    lheight = 0.480*inch;
    // Create a wall x=.031 y=.5 z=0.480.
    // Rabbits on two edges.
    color("maroon") {
        cube([lwidth, lheight, .062*inch]);
        translate([-0.031*inch, 0, 0])
            cube([0.031*inch, lheight, 0.031*inch]);
        translate([lwidth, 0, 0])
            cube([0.031*inch, lheight, 0.031*inch]);
    }
    // Now to place the module name.
    color("white") {
        translate([lwidth/2, lheight/2, 0])
            rotate([0, 0, 90])
                linear_extrude(0.072*inch)
                    text(mname, size=2.7, //font=":style=Bold",
                        halign="center", valign="center");
    }
}

// Subtract the socket for the label from the basic handle.
// (Requires both routines above.)
module LabelHandle () {
    difference () {
        Handle();
        // Create a space for a label.
        // Offset subtractions by .01 inch to allow insertion.
        translate([(-0.231+.005)*inch, 1.425*inch, 0])
            rotate([90, 0, -90])
                Label("");
        translate([(-0.231-.005)*inch, 1.425*inch, 0])
            rotate([90, 0, -90])
                Label("");
    }
}

// Change invocations below to generate dessired handles
// and labels.
LabelHandle();
translate ([1*inch, 0, 0]) LabelHandle();

translate([-1*inch, 0*inch, 0]) Label("M220");
translate([-1*inch, 1*inch, 0]) Label("M220");
//translate([-1*inch, 2*inch, 0]) Label("M8330");