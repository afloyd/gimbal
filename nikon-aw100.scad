camWidth=110;
camHeight=66;
camDepth=23;
screwOffset=44;

$fn=40;
difference() {
	//minkowski() {
		cube([camWidth, camDepth, camHeight], true);
		/*cylinder(r=2,h=1);
		rotate(90,[0,1,0])
		cylinder(r=2,h=1);
		rotate(90,[1,0,0])
		cylinder(r=2,h=1);
	}*/
	translate([-camWidth/2+screwOffset, 2, -27])
	#cylinder(r=3, h=15, center=true);
}