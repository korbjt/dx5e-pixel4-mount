module rounded_square(x, y, r) {
	 hull() {
		  translate([-x/2+r,-y/2+r]) circle($fn=100, r=r);
		  translate([-x/2+r,y/2-r]) circle($fn=100, r=r);
		  translate([x/2-r,y/2-r]) circle($fn=100, r=r);
		  translate([x/2-r,-y/2+r]) circle($fn=100, r=r);
	 }
}

