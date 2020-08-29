use <clip.scad>
use <shapes.scad>
use <mount.scad>

length=148;
width=69.5;
depth=8.2;
base=5;
nose=2.5;
wall=3;

difference() {
	 union() {
		  translate([90+wall, 0, 0]) rotate([90,0,90]) clip(depth,base,nose,wall,width, 40);
		  translate([0, 15+wall+11, 0]) rotate([90,0,0]) clip(depth,base,nose,wall,length, 15);
		  translate([0, width+wall-11, 0]) rotate([90,0,0]) clip(depth,base,nose,wall,length, 15);
		  
		  linear_extrude(height=base) offset($fn=100, r=-6) offset($fn=100, r=6) union() {
			   translate([wall, wall+11, 0]) square([length,15]);
			   translate([wall, width+wall-11-15, 0]) square([length,15]);
			   translate([(length)/2+wall, (width)/2+wall]) square(center=true, [112,15]);
			   translate([90+wall, wall])  square([40, width-wall]);
		  }
	 }
	 
	 translate([wall+5,width+wall-27-5,3.5]) cube([27,27,3]);
	 translate([(length)/2+wall, (width)/2+wall, 1.5]) rotate([180,0,90]) mount_screws();
}
