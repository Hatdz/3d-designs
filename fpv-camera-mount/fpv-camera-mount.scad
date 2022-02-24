$fa = 1;
$fs = 0.1;

height = 6;
length = 12;
hole_diameter = 5;

// Adjust for printing inaccuracies
hole_diameter_offset = 0.35;

difference() {  

    difference() {
        
        union() {
            // Outer cylinder
            cylinder(h=height, d=8);
        
            // Arm to hold camera
            translate([0, 2, 0]) cube([length + 3, 2, height]);
        
            // Arm brace
            translate([3.9, 0, 0]) rotate([0, 0, 45]) cube([3, 2, height]);
        }
        
        
        // Dimple for guide drilling screw hole
        translate([length, 1.3, height / 2]) sphere(d=2);
    }

    
    // Hole for frame standoff
    translate([0, 0, -1]) cylinder(h=height + 2, d=hole_diameter + hole_diameter_offset);
}
