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
            
            translate([17.2, 0, 0])
            union()
            {
                base = 2.8;
                
                translate([base, 15, 0])
                rotate([0, 180, 90])
                gopro_finger();
                
                translate([base + 5.9, 15, 0])
                rotate([0, 180, 90])
                gopro_finger();
            }
        }
        
        translate([16, 0, 4])
        finger_seperator();
        
        translate([3, -1, 3])
        camera_cutout();
    }
}


module gopro_finger()
{
    width = 2.8;
    length = 16;
    height = 15;
    hole = 5.2;
    
    radiiPoints = [
        [0, 0, 0],
        [0, length, 15],
        [height, length, 15],
        [height, 0, 0]
    ];
    
    translate([0, width, 0])
    rotate([90, 0, 0])
    difference()
    {
        linear_extrude(width)
        polygon(polyRound(radiiPoints, 30));
        
        translate([7.5, 9.5, -1])
        cylinder(d = hole, h = width + 2);
    }  
}


module finger_seperator()
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


module rounded_box(dimensions, curve)
{
    radiiPoints = [
        [0, 0, curve],
        [0, dimensions[0], curve],
        [dimensions[1], dimensions[0], curve],
        [dimensions[1], 0, curve]
    ]; 
    linear_extrude(dimensions[2])
    polygon(polyRound(radiiPoints, 30));
}


module outer_mount()
{   
    translate([0, 15, 0])
    rotate([90, 0, 0])
    rounded_box([44, 44, 15], 5);
}


module camera_cutout()
{   
    translate([0, 17, 0])
    rotate([90, 0, 0])
    rounded_box([38, 38, 17], 3);
}