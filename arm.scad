include <MCAD/metric_fastners.scad>
use <clip.scad>
use <shapes.scad>
use <mount.scad>

difference() {
	 linear_extrude(height=4) {
		  translate([0,13,0]) rounded_square(51,60, 2);
	 }
	 rotate([0,0,90]) union() {
		  translate([0,0,-10]) mount_screws();
		  translate([0,0,1.5]) mount_nuts();
	 }
}
translate([0,0,0]) gopro_2(20);
//24.8 center, 22 side = 1.6mm nose
translate([-25.5,18,0]) rotate([90,0,90]) clip(12.5, 4, 1.6, 3, 25, 51);

module mount_point() {
	 translate([0,0,9]) rotate([0,90,0]) cylinder($fn=100, r=8, h=2.85);
	 translate([0,-8,0]) cube([2.85, 16,9]);
}


module gopro_2(height) {
	 difference() {
		  union() {
			   translate([1.5,0,height]) mount_point();
			   translate([-4.5,0,height]) mount_point();
		  }
		  translate([-10,0,height+9]) rotate([0,90,0]) cylinder($fn=100, r=2, h=20);
	 }
	 intersection() {
		  difference() {
			   linear_extrude(height=height+2) rounded_square(15,16, 3);
			   translate([-7.5,0,height+9]) rotate([0,90,0]) cylinder($fn=100, r=8, h=15);
		  }
		  translate([-7.5,0,height-27.7]) rotate([0,90,0]) cylinder($fn=100, r=30, h=15);
	 }
}
