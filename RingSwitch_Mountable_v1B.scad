fileDescription = "Ring Switch (Mountable)";
fileDetails = "Using a conductive ring to cross the contacts (screw heads)";
fileType = "RSM";
fileVersion = "1B";

//The Belfry OpenSCAD Library
//https://github.com/revarbat/BOSL
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

caseWidthX = 24;
caseDepthY = 14;
caseHeightZ = 11;

// M4*8 Cap/Mushroom Head used for contacts
contactScrewThreadDiameter = 4.0; 
contactScrewThreadHeight = 8.0;
contactScrewHeadDiameter = 7.4; 

//hookup wire diameter
wireDiameter=1.75; // make this a little bigger than measured value
wireLength=caseDepthY; // long enough to extend past model for subtraction


//6*2 magnet for mounting
magDiameter=6.1;
magHeight=2.3;
  
overlap = 2; // overlap ensures that subtractions go beyond the edges
$fn=60; //circle smoothness
  
difference(){
  union() {
      //base rounded cuboid is from the BOSL library
      //I'm using p1 setting to zero bottom (z). X/Y are centered on 0,0,0
      color("steelblue") cuboid([caseWidthX,caseDepthY,caseHeightZ], fillet=4, p1=[-(caseWidthX/2), -(caseDepthY/2), 0]);
  }//union

  // Start of Difference stuff ************************************************************
    
  //screw holes for contacts (top)
  color("orangered")
   translate([-(contactScrewHeadDiameter*0.60), 0, (caseHeightZ-contactScrewThreadHeight)])
    cylinder(h=contactScrewThreadHeight+overlap, d=contactScrewThreadDiameter);
  color("orangered")
   translate([+(contactScrewHeadDiameter*0.60), 0, (caseHeightZ-contactScrewThreadHeight)])
    cylinder(h=contactScrewThreadHeight+overlap, d=contactScrewThreadDiameter); 

  //Hookup wires (side)
  color("lime")
   translate([-(contactScrewHeadDiameter*0.60), -(caseDepthY/2)+(contactScrewThreadDiameter+2), (caseHeightZ-contactScrewThreadHeight+(wireDiameter/2))]) 
    rotate([-90,0,0]) cylinder(h=wireLength, d=wireDiameter);   
 color("lime")
   translate([+(contactScrewHeadDiameter*0.60), -(caseDepthY/2)+(contactScrewThreadDiameter+2), (caseHeightZ-contactScrewThreadHeight+(wireDiameter/2))]) 
    rotate([-90,0,0]) cylinder(h=wireLength, d=wireDiameter);   

  //magnet mount (bottom)
  color("tomato") translate([0, 0, 0-overlap]) cylinder(h=magHeight+overlap, d=magDiameter);


}//difference
  