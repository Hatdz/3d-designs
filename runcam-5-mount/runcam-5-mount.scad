include <../.libraries/Round-Anything/polyround.scad>

$fa = 2;
$fs = 0.4;


root();

module root()
{
    difference()
    {
        union()
        {
            outer_mount();
            
            finger1_x = 17;
            finger2_x = finger1_x + 9.1;
            
            
            translate([finger1_x, 15, 0])
            rotate([-90, 0, -90])
            gopro_finger();
            
            translate([finger2_x, 0, 0])
            rotate([-90, 0, 90])
            gopro_finger();
        }
        
        translate([16, 0, 4])
        outer_finger_seperator();
        
        
        translate([3, -1, 3])
        camera_cutout();
    }
}



module gopro_finger()
{
    radiiPoints = [
        [0, 0, 0],
        [0, 16, 10],
        [15, 16, 10],
        [15, 0, 0]
    ];
    
    difference()
    {
        linear_extrude(3)
        polygon(polyRound(radiiPoints, 30));
        
        translate([7.5, 9.5, 0])
        sphere(d = 2);
    }  
}


module outer_finger_seperator()
{
    curve = 2;
    width = 3.1;
    radiiPoints = [
        [0, 0, 0],
        [1, 0, 0],
        [1, 4, curve],
        [5, 4, 0],
        [5, 7.1, 0],
        [1, 7.1, curve],
        [1, 11.1, 0],
        [0, 11.1, 0]
    ];
    
    translate([11.1,-1, 0])
    rotate([0, 90, 90])
    linear_extrude(17)
    polygon(polyRound(radiiPoints, 30));
}


module outer_mount()
{
    curve = 5;
    radiiPoints = [
        [0, 0, curve],
        [0, 44, curve],
        [44, 44, curve],
        [44, 0, curve]
    ];
    
    translate([0, 15, 0])
    rotate([90, 0, 0])
    linear_extrude(15)
    polygon(polyRound(radiiPoints, 30));
}


module camera_cutout()
{
    size = 38; // Runcam 5 is perfectly square
    curve = 3;
    radiiPoints = [
        [0, 0, curve],
        [0, size, curve],
        [size, size, curve],
        [size, 0, curve]
    ];   
    
    translate([0, 17, 0])
    rotate([90, 0, 0])
    linear_extrude(17)
    polygon(polyRound(radiiPoints, 30));
}