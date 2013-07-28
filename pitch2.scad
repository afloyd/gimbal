include<supportTriangle.scad>;

$fn=100;
showCam=false;
camWidth=110;
camHeight=66;
camDepth=23+3;
thickness=3;
//2.5 screw diameter spacing=11mm
smallScrewSpacing=11;
pitchWidth=camWidth/2+thickness;
m25spacing=8;//space between holes
sideH=camHeight/2+thickness+m25spacing+3;

difference() {
	cube([pitchWidth+thickness*2,camDepth, thickness], true);

	//cam screw hole
	translate([pitchWidth/2-46,0,0])
	cylinder(r=3.5, h=5, center=true);
}

//side wall
translate([0, -camDepth/2-.5, sideH/2-thickness/2+.75])
rotate(90,[1,0,0])
difference() {
	cube([pitchWidth+thickness*2,sideH+1.5, 1], true);
	translate([-40,53.5,0])
	#cylinder(r=75,h=2,center=true);
}

translate([0, camDepth/2-.5, sideH/2-thickness/2+.75])
difference() {
	cube([pitchWidth+thickness*2, 1, sideH+1.5], true);
	translate([-40,0,40])
	
	rotate(90,[1,0,0])
	#cylinder(r=75,h=2,center=true);
}

difference() {
	//motor mount support
	translate([pitchWidth/2+thickness/2, 0, sideH/2])
	cube([thickness, camDepth, sideH], true);

	//motor holes
	translate([pitchWidth/2+thickness/2,0,camHeight/2])
	rotate(90,[0,1,0])
	union() {
		//#cylinder(r=1, h=thickness+2, center=true);
		for(smallHole=[1:4]) {
			rotate(smallHole*360/4,[0,0,1])
			translate([0,smallScrewSpacing/2,0])
			//r=1.3 perfect tight screw fit
			#cylinder(r=1.4, h=thickness+2, center=true);
		}
	}
}

/*
translate([-camWidth/2, camDepth/2,sideH/4])
wedge(angle=13, height=sideH/2, center=true);
*/

if (showCam) {
	translate([-28,0,camHeight/2+thickness])
	rotate(180,[0,0,1])
	import("nikon-aw100.stl");
}