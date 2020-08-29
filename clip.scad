module bull_nose(nose, depth, length) {
	 r = (pow(depth, 2) / (8 * nose)) + (nose / 2);
	 translate([0,-r+(depth/2)]) intersection() {
		  hull() {
			   translate([r,r]) circle($fn=100, r);
			   translate([length-1,0]) square([1, r*2]);
		  }
		  translate([0,r-(depth/2)]) square([length,depth]);
	 }
}

module clip(depth, base, nose, wall, width, height) {
	 linear_extrude(height=height) union() {
		  half_clip(depth, base, nose, 5, wall);
		  translate([width+(2*wall),0]) mirror([1,0]) half_clip(depth, base, nose, 5, wall);
	 }
}

module half_clip(depth, base, nose, length, wall) {
	 difference() {
		  bull_nose(nose, depth+base, length+wall);
		  translate([wall,base]) bull_nose(nose, depth, length);
		  $fn=100;
		  offset(r=-1) offset(r=1) union() {
			   translate([0,depth+base]) square([wall+(nose/2),2]);
			   translate([wall+(nose/2), (depth/2)+base]) square([nose,depth]);
		  }
	 }
}

module corner_clip(depth, base, nose, length, wall, radius) {
	 rotate_extrude(angle=90, convexity=10) translate([wall+radius,0]) rotate([0,180,0]) half_clip(depth, base, nose, length, wall);
}
