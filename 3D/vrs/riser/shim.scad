// Customize the invocations (which follow
// the modules declarations) at the bottom of the file.

// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm.

minh = 1;	// Minimum height
inch = 25.4;
$fn=50;

id1 = .33*inch;
id2 = .37*inch;
od  = .60*inch;
height = 1.5*inch;

// Draw the shim.
difference() {
    cylinder(h=height,   d=od,  center=[0, 0, 0]);
    cylinder(h=height,   d=id2, center=[0, 0, 0]);
    cylinder(h=.38*inch, d=id2, center=[0, 0, 0]);
}
