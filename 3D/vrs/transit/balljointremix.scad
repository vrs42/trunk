$fn=30;
 
fanroundhole=105;
fanbody=120;
fansquareholes=105;
fanbodylenght= fanbody;
fanmouningholes=2.95; // screwin4.3;  //2.95;
framethick =4;
framelenght = 200;
fanmount= 100;
fanmountdiam=8;
framewidth = 8.1;
screwdiam= 2.4;

use <balljoint.scad>;
     //balljoint_ball();
     //balljoint_hole_ball();
     // balljoint_seat();
     //balljoint_hole_seat();
     //balljoint_nut();
/*
**Screw sizes**
mm
#2              diam    hole in plastic              thread forming
#2             2.24              2.5
#4             2.9               3.3                   2.95
#6             3.6 (0.138")      3.9
#8             4.1656            4.5

#8 flat       0.164*25.4 =4.17    headmax= 8.3   min= 7.41  head height= 2.54
#10         4.826
*/

 
//translate([60,8,0])fanmount();
//translate([-10,0,0]) ceiling();
//translate([25,80,2.5])fanduckt(); // fan grill
//translate([-55,40,0])balljoint_nut();


module holeD(dd,hh,OO){
  difference(){
          cylinder(d=OO, h= hh);
    translate ([0,0,-0.1])cylinder (d=dd, h=hh+1);
}
}


 module fanduckt(){
  difference(){
      translate([0,0,0]) rotate([0,0,0]) cube([fanbody,fanbodylenght,5],center=true);
     translate([0,0,-2.7]) cylinder(h=6, d=fanroundhole);
     
  translate([fansquareholes/2,fansquareholes/2,-3]) rotate([0,0,0]) cylinder(h=6, d=fanmouningholes);
      
     translate([fansquareholes/2,-fansquareholes/2,-3]) rotate([0,0,0]) cylinder(h=6, d=fanmouningholes);
     translate([-fansquareholes/2,fansquareholes/2,-3]) rotate([0,0,0]) cylinder(h=6, d=fanmouningholes);
     translate([-fansquareholes/2,-fansquareholes/2,-3]) rotate([0,0,0]) cylinder(h=6, d=fanmouningholes);
 
 }
 translate([fansquareholes/2,fansquareholes/2,2.4])holeD(fanmouningholes,6,fanmouningholes+6);
 translate([fansquareholes/2,-fansquareholes/2,2.4])holeD(fanmouningholes,6,fanmouningholes+6);
 translate([-fansquareholes/2,fansquareholes/2,2.4])holeD(fanmouningholes,6,fanmouningholes+6);
 translate([-fansquareholes/2,-fansquareholes/2,2.4])holeD(fanmouningholes,6,fanmouningholes+6);
 
 // for measuring translate([0,0,-2.5]) rotate([0,0,0]) cube([fanbody,1,0.01],center=true);
for (i = [-50:12:50]) {
    translate([0,i,-1]) rotate([90,0,0]) cube([fanbody,3,1.2],center=true);
    translate([i,0,-1]) rotate([90,0,90]) cube([fanbody,3,1.2],center=true);
}
for (i = [-20,20]) {
translate([i,60,4.3]) rotate([90,0,0]) holeD(3.0,10,3.0+6);
   
}


}











module roundedcube(xx,yy,zz,rr){
    translate([(-xx+(2*rr))/2,(-yy+(2*rr))/2,-zz/2]) minkowski()
{
  cube([xx-(2*rr),yy-(2*rr),zz-1]);
  cylinder(r=rr,h=1);
}
}




module ceiling(){
    
   translate([0,0,2.5]) difference(){
         roundedcube(60,30,5,2); 
         
        translate([0,0,-6])        cylinder(d=12, h=12);
        translate([30-6,15-6,-7])     cylinder(d=4, h=14);
        translate([30-6,-15+6,-7])     cylinder(d=4, h=14);
        translate([-30+6,15-6,-7])     cylinder(d=4, h=14);
        translate([-30+6,-15+6,-7])     cylinder(d=4, h=14); 
    }
    translate([0,0,18])balljoint_hole_seat();
    translate([0,0,4])holeD(12,15,20);
  
}

module fanmount(){
     
   
         translate([0,0,4.9])balljoint_hole_ball(); 
         translate([0,0,2.5]) difference(){
         roundedcube(50,20,5,2); 
         translate([0,0,-6])cylinder(d=8, h=12); // middle hole
         translate([20,0,-7])cylinder(d=4, h=14);   // mounting holes
         translate([-20,0,-7])cylinder(d=4, h=14);   
        }

     
}
