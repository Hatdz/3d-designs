include <../.libraries/Round-Anything/polyround.scad>

$fa = 2;
$fs = 0.4;

radiiPoints = [
        [0, 0, 2],
        [0, 44, 2],
        [44, 44, 2],
        [44, 0, 2]
    ];

difference()
{
    union()
    {
        translate([0, 15, 0])
        rotate([90, 0, 0])
        linear_extrude(15)
        polygon(polyRound(radiiPoints, 30));
        
        finger1_x = 17;
        finger2_x = finger1_x + 9.1;
        
        
        translate([finger1_x, 15, 0])
        rotate([-90, 0, -90])
        gopro_finger();
        
        translate([finger2_x, 0, 0])
        rotate([-90, 0, 90])
        gopro_finger();
    }
    
    translate([20, 0, -1])
    cube([3.1, 15, 5]);
    
    
    translate([3, -1, 3])
    cube([38, 17, 38]);
}



module gopro_finger()
{
    radiiPoints = [
        [0, 0, 0],
        [0, 14, 10],
        [15, 14, 10],
        [15, 0, 0]
    ];
    
    difference()
    {
        linear_extrude(3)
        polygon(polyRound(radiiPoints, 30));
        
        translate([7.5, 7, 0])
        sphere(d = 2);
    }  
}