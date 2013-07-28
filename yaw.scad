showFull=true;
showRoll=true;

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

pitchClearance=camHeight/2+camDepth/5+thickness+3;
rollWidth=141/2+largeScrewSpacing+10;
balanceOffset=15;

translate([0,-69,-rollWidth/2+largeScrewSpacing/2+thickness/2])
cube([largeScrewSpacing+14, thickness, rollWidth+balanceOffset], true);

//Verical t support
translate([0,-69,-rollWidth/2-largeScrewSpacing/2+thickness/2])
cube([7, thickness*7, rollWidth-largeScrewSpacing], true);

translate([0,-pitchClearance/2-thickness,-rollWidth+thickness])
cube([largeScrewSpacing+14, pitchClearance*2, thickness], true);

//translate([])
//cube(

if (showFull) {
	//motor
	//translate([0,-64,0])
	//rotate(-90,[1,0,0])
	//import("motor.stl");
}

if (showRoll) {
	rotate(-88,[0,1,0])
	import("roll-full.stl");
}

/*if (showPitch) {
	//motor
	translate([-52.5-12,0,0])
	rotate(90,[0,1,0])
	import("motor.stl");

	rotate(-85,[1,0,0])
	translate([-12,0,-camHeight/2])
	rotate(180,[0,0,1])
	import("pitch4-full.stl");
}*/