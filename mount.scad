include <MCAD/metric_fastners.scad>
apply_chamfer=false;

module mount_screws() {
	 translate([-25/2, -32.5/2]) {
		  translate ([25,32.5,0]) scale([1.3,1.3,2]) cap_bolt(3,10);
		  translate ([25,0,0]) scale([1.3,1.3,2]) cap_bolt(3,10);
		  translate ([0,32.5,0]) scale([1.3,1.3,2]) cap_bolt(3,10);
		  translate ([0,0,0]) scale([1.3,1.3,2]) cap_bolt(3,10);
	 }
}

module mount_nuts() {
	 //flat nut height from libray
	 h=.8*3*2;
	 translate([-25/2, -32.5/2, 0]) {
		  translate ([25,32.5,0]) scale([1.3,1.3,1.3]) union() {
			   flat_nut(3);
			   translate([0,0,h/2-.1]) cylinder($fn=100, r=3, h=20);
		  }
		  translate ([25,0,0]) scale([1.3,1.3,1.3]) union() {
			   flat_nut(3);
			   translate([0,0,h/2-.1]) cylinder($fn=100, r=3, h=20);
		  }
		  translate ([0,32.5,0]) scale([1.3,1.3,1.3]) union() {
			   flat_nut(3);
			   translate([0,0,h/2-.1]) cylinder($fn=100, r=3, h=20);
		  }
		  translate ([0,0,0]) scale([1.3,1.3,1.3]) union() {
			   flat_nut(3);
			   translate([0,0,h/2-.1]) cylinder($fn=100, r=3, h=20);
		  }
	 }
}
