base_mid=16.6;
base_full=27.9;

hx=43;
hy=15.6;
hr=2.5;

mount_width=15;
mount_offset = sqrt(pow(mount_width, 2) / 2);
//mount face
mt_x=base_full+mount_offset;
mt_y=-1+mount_offset;

//print base
p_x = base_full;
p_y = -1+2*mount_offset;

	 
strap_w = 5;

difference() {
	 linear_extrude(height=35) difference() {
		  union() {
			   offset($fn=100, r=-6) offset($fn=100, r=6) union() {
					translate([-47,-15]) rotate([0,0,20]) square([88,4]);
					translate([base_full+8,8]) circle($fn=100, r=8);
					polygon(points=[[0,0], [base_mid,0], [base_full,-1], [base_full,4], [0,4]]);
			   }
			   offset($fn=100, r=-6) offset($fn=100, r=6) union() {
					translate([-hx,-hy]) circle($fn=100, r=5);
					translate([-47,-15]) rotate([0,0,20]) square([50,4]);
			   }
		  }
			   
		  offset($fn=100, r=-1) offset($fn=100, r=1) union() {
			   translate([-hx,-hy]) circle($fn=100, r=hr);
			   translate([-hx,-hy-3]) rotate([0,0,115]) circle($fn=3, r=5);
			   translate([base_full+8,8]) circle($fn=100, r=2);
		  }
	 }

	 translate([0,-5,35/2]) rotate([-90,0,0]) antenna_assembly();
	 translate([-43,25,0]) resize([86,50,5]) rotate([90,0,0]) cylinder($fn=100, r=1, h=100); 
	 translate([-43,25,35]) resize([86,50,5]) rotate([90,0,0]) cylinder($fn=100, r=1, h=100);
	 translate([-43,25,35/2]) resize([86,50,20]) rotate([90,0,0]) cylinder($fn=100, r=1, h=100); 
	 translate([base_full,-5,-15/2]) cube([30,30,35/2]);
	 translate([base_full,-5,35/2+1.5]) cube([30,30,3]);
	 translate([base_full,-5,35/2-4.5]) cube([30,30,3]);
	 translate([base_full,-5,35/2+15/2]) cube([30,30,35/2]);
}
	 
module antenna_assembly() {
	 base_l=35;
	 base_mid=16.6;
	 base_full=27.9;
	 hull() {
		  translate([1,-base_l/2,0]) cylinder($fn=100, r=1, h=5);
		  translate([1,base_l/2,0]) cylinder($fn=100, r=1, h=5);
		  translate([base_mid-1,-base_l/2,0]) cylinder($fn=100, r=1, h=5);
		  translate([base_mid-1,base_l/2,0]) cylinder($fn=100, r=1, h=5);
		  translate([base_full-1,-base_l/2,0]) cylinder($fn=100, r=1, h=4);
		  translate([base_full-1,base_l/2,0]) cylinder($fn=100, r=1, h=4);
	 }
	 antenna_base_r = 10.25;
	 antenna_r = 8.3;
	 rotate([0,2,0]) translate([16,0,5]) {
		  cylinder($fn=100, r=antenna_r, h=50);
		  translate([0,0,-1]) cylinder($fn=100, r=antenna_base_r, h=4.3);
	 }
}
