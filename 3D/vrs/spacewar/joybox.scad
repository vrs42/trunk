// Initialization boilerplate
inch = 25.4; // mm
$fn=50;
thick = inch/16; //0.5; // mm wall thickness
slip = 0;//inch / 100; // friction fit
print = 1; // Position for printing

// Describe the PCB
pcbx = 2 * inch; // width
pcby = 2.9 * inch; // length
pcbz = inch/16; // thickness
over = 5/8 * inch; // IDC connector X overhang

// Describe the base.
// The base supports the PCB, and also
// covers the overhang.
baselx = thick + slip;
basely = thick + slip;
basehx = baselx + pcbx + over;
basehy = basely + pcby;
baselz = 0;
basehz = thick + inch/8;

// Post positions (to match detents in PCB)
detentlx = 1/8 * inch;;
detently = 5/16 * inch;
detenthx = detentlx + inch;
detenthy = 2.57 * inch;

splith = thick + inch/8 + pcbz;

// A post
module post() {
// cylinder(h=inch/8, d=inch/5);
   cylinder(h=splith-thick-pcbz, d=inch/5);
   cylinder(h=splith-pcbz, d=inch/10);
}

// Have enough now to draw the base.
module base() {
  // Base
  cube([basehx-baselx, basehy-basely, thick]);
  // Walls
  cube([thick, pcby, basehz]);
  translate([pcbx-thick, 0, 0])
    cube([thick, pcby, basehz]);
  translate([pcbx+over-thick, 0, 0])
    cube([thick, pcby, basehz]);
  cube([pcbx+over, thick, basehz]);
  translate([0, pcby, 0])
    cube([pcbx+over, thick, basehz]);
  // Detents
  translate([detentlx, detently, thick]) post();
  translate([detentlx, detenthy, thick]) post();
  translate([detenthx, detently, thick]) post();
  translate([detenthx, detenthy, thick]) post();
}

// Describe the PCB.
pcblx = thick + slip;
pcbly = thick + slip;
pcbhx = pcblx + pcbx;
pcbhy = pcbly + pcby;
pcblz = thick + inch/8 + slip;
pcbhz = pcblz + inch/16 + slip;

// Draw a PCB mock-up
module pcb() {
    cube([pcbhx-pcblx, pcbhy-pcbly, pcbhz-pcblz]);
}

// Outer box dimensions
boxh = 0.75 * inch;

boxlx = 0;
boxly = 0;
boxlz = 0;
boxhx = pcbhx + over + slip;
boxhy = pcbhy + thick + slip;
boxhz = pcbhz + inch / 2 + thick;

module top() {
  // Cap
  if (print) { // 0 for debugging
    translate([boxlx, boxly, boxhz-thick])
      cube([boxhx, boxhy, thick]);
  }
  // Walls
  cube([thick, thick+boxhy, boxhz]);
  translate([boxhx, 0, 0])
    cube([thick, boxhy, boxhz]);
  cube([boxhx, thick, boxhz]);
  translate([thick, boxhy, 0])
    cube([boxhx, thick, boxhz]);
  // Ridges
//The flush-mounted DE-9s prevent this ridge.
//translate([thick, 0, pcbhz+slip])
//  cube([thick, pcbhy+slip, thick]);
// The ribbon cable prevents this ridge.  
//translate([pcbhx-thick, 0, pcbhz+slip])
//  cube([thick, pcbhy+slip, thick]);
  translate([0, thick, pcbhz+slip])
    cube([boxhx, thick, boxhz-pcbhz-slip]);
  translate([0, boxhy-thick, pcbhz+slip])
    cube([boxhx, thick, boxhz-pcbhz-slip]);
}

module lid() {
  difference () {
    top();
    // subtract openings
    translate([2*thick, 0, 0])
      cube([1.25*inch, inch/8, pcbhz+inch/2]);
    translate([2*thick, pcbhy+slip, 0])
      cube([1.25*inch, inch/8, pcbhz+inch/2]);
    translate([boxhx, pcbhy/2 - inch, 0])
      cube([inch/8, 2*inch, pcbhz+inch/8]);
  }
}

if (print) {
  translate([baselx, basely, baselz]) base();
  translate([0, 0, boxhz])
    rotate([180, 0, 0])
      translate ([boxlx, boxly, boxlz]) lid();
} else {
  translate([baselx, basely, baselz]) base();
  translate([pcblx, pcbly, pcblz]) pcb();
  translate([boxlx, boxly, boxlz]) lid();
}