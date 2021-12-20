fileDescription = "Ring Switch (Mountable) Cord Holder";
fileDetails = "Holds 3.5mm jack in place with a magent";
fileType = "RSMCH";
fileVersion = "1A";

//The Belfry OpenSCAD Library
//https://github.com/revarbat/BOSL
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

overlap = 2; // overlap ensures that subtractions go beyond the edges
$fn=60; //circle smoothness

caseWidthX = 16;
caseDepthY = 16;
caseHeightZ = 16;

jackDiameter=10;
jackLength=caseDepthY+overlap;

//6*2 magnet for mounting
magDiameter=6.1;
magHeight=2.3;
  
  
difference(){
  union() {
      //base rounded cuboid is from the BOSL library
      //I'm using p1 setting to zero bottom (z). X/Y are centered on 0,0,0
      color("steelblue") cuboid([caseWidthX,caseDepthY,caseHeightZ], fillet=4, p1=[-(caseWidthX/2), -(caseDepthY/2), 0]);
  }//union

  // Start of Difference stuff ************************************************************
    

  //jack (side)
  color("lime")
   translate([0, -(caseDepthY/2)-overlap, (caseHeightZ/2)]) 
    rotate([-90,0,0]) cylinder(h=jackLength+overlap, d=jackDiameter);   

  //magnet mount (bottom)
  color("tomato") translate([0, 0, 0-overlap]) cylinder(h=magHeight+overlap, d=magDiameter);


}//difference
  