include<supportTriangle.scad>;

showCam=false;
camWidth=110;
camHeight=66;
camDepth=23;
thickness=3;
//2.5 screw diameter spacing=11mm
smallScrewSpacing=11;
pitchWidth=camWidth+thickness*2+5;
m25spacing=8;//space between holes
sideH=camHeight/2+thickness+m25spacing+3;

$fn=50;
difference() {
	cube([pitchWidth+thickness*2,23, thickness], true);

	//cam screw hole
	translate([-11,0,0])
	cylinder(r=3, h=5, center=true);
}

difference() {
	union() {
		translate([-pitchWidth/2-thickness/2, 0, sideH/2])
		cube([thickness, camDepth, sideH], true);

		translate([pitchWidth/2+thickness/2, 0, sideH/2])
		cube([thickness, camDepth, sideH], true);
	}

	//motor holes
	translate([-pitchWidth/2-thickness/2,0,camHeight/2+thickness])
	rotate(90,[0,1,0])
	union() {
		#cylinder(r=1, h=thickness+2, center=true);
		for(smallHole=[1:4]) {
			rotate(smallHole*360/4,[0,0,1])
			translate([0,smallScrewSpacing/2,0])
			#cylinder(r=1.3, h=thickness+2, center=true);
		}
	}

	//motor holes
	translate([pitchWidth/2+thickness/2,0,camHeight/2+thickness])
	rotate(90,[0,1,0])
	union() {
		#cylinder(r=1, h=thickness+2, center=true);
		for(smallHole=[1:4]) {
			rotate(smallHole*360/4,[0,0,1])
			translate([0,smallScrewSpacing/2,0])
			#cylinder(r=1.3, h=thickness+2, center=true);
		}
	}
}

/*
translate([-camWidth/2, camDepth/2,sideH/4])
wedge(angle=13, height=sideH/2, center=true);
*/

if (showCam) {
	translate([0,0,camHeight/2+thickness+3])
	import("nikon-aw100.stl");
}