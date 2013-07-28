$fn=80;
len=21;
dia=27.7;
topRoundness=13;

intersection() {
	cylinder(r=dia/2, h=len);
	
	for(rot=[1:topRoundness]) {
		translate([0,0,2])
		rotate(rot*360/topRoundness,[0,0,1])
		rotate(90,[1,0,0])
		cylinder(r=21.5, h=10, center=true, $fn=8);
	}
}