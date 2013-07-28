showFull=true;
showPitch=true;

include<supportTriangle.scad>
$fn=50;
camWidth=110;
camHeight=66;
camDepth=23+3;
thickness=.55*5;
smallScrewSpacing=11;
largeScrewSpacing=16;
largeScrewDia=3;
motorLen=21;

pitchClearance=camHeight/2+camDepth/5+thickness;
rollWidth=127/2+smallScrewSpacing+10;


translate([-motorLen-thickness+smallScrewSpacing-12, -pitchClearance, 0])
union() {
	difference() {
		cube([rollWidth+thickness, thickness, smallScrewSpacing+15], true);
		
		//small motor holes
		translate([25, 0, 0])
		rotate(90,[1,0,0])
		union() {
			for(smallHole=[1:4]) {
				rotate(smallHole*360/4,[0,0,1])
				translate([0,smallScrewSpacing/2,0])
				//r=1.3 perfect tight screw fit
				#cylinder(r=1.45/2, h=thickness+2, center=true);
			}
		}	
	}

	supports(1);
	supports(-1);
	
	//x-brace
	translate([0,0,0])
	rotate(60,[0,1,0])
	cube([thickness, thickness+2.5, largeScrewSpacing+29], true);
	translate([0,0,0])
	rotate(-60,[0,1,0])
	cube([thickness, thickness+2.5, largeScrewSpacing+29], true);

	//pitch motor braces
	translate([-rollWidth/2+thickness/2,39, (largeScrewSpacing+14)/2-thickness/2.5])
	rotate(-6,[0,0,1])
	#cube([thickness, 25, thickness/1.25], true);
	translate([-rollWidth/2+thickness/2,39, -(largeScrewSpacing+14)/2+thickness/2.5])
	rotate(-6,[0,0,1])
	#cube([thickness, 25, thickness/1.25], true);

	translate([-rollWidth/2,pitchClearance/2,0])
	difference() {
		translate([0,largeScrewSpacing/1.5/2,0])
		cube([thickness, pitchClearance+largeScrewSpacing/1.5, largeScrewSpacing+14], true);
		
		//large motor holes
		translate([0, 20, 0])
		rotate(90,[0,1,0])
		union() {
			//#cylinder(r=1, h=thickness+2, center=true);
			for(smallHole=[1:4]) {
				rotate(smallHole*360/4,[0,0,1])
				translate([0,largeScrewSpacing/2,0])
				#cylinder(r=largeScrewDia/2+.08, h=thickness+2, center=true);
			}
		}	
	}
}

wedgeWidth=5;
module supports(isLeft) {
	//corner support
	translate([-rollWidth/2+27/2,30/2,isLeft*((largeScrewSpacing+10)/2-wedgeWidth/2)])
	difference() {
		rotate(-90,[1,0,0])
		wedge(angle=40, height=30, wedgeWidth=wedgeWidth, center=true);
		
		translate([-5.5,-6.5,0])
		cylinder(r=4.5, h=wedgeWidth, center=true);
	}

	translate([10, 0, isLeft*(largeScrewSpacing+10)/2-(isLeft*thickness/2)])
	cube([rollWidth-17.5, thickness+3, thickness], true);
}

if (showFull) {
	//motor
	translate([0,-64+10,0])
	rotate(-90,[1,0,0])
	cylinder(r=27.7/2, h=21, center=true);
	//import("motor.stl");
}

if (showPitch) {
	//motor
	//translate([-52.5-12,0,0])
	translate([-52.5,0,0])
	rotate(90,[0,1,0])
	cylinder(r=27.7/2, h=21, center=true);
	//import("motor.stl");

	rotate(-85,[1,0,0])
	translate([-12,0,-camHeight/2])
	rotate(180,[0,0,1])
	import("pitch4-full.stl");
}