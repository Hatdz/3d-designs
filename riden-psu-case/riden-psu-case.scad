include <../.libraries/Round-Anything/polyround.scad>

$fa = 1;
$fs = 0.4;

difference() {

    main_box([160, 74, 50], 3, 2);
    
    // Back air holes
    translate([22, 7, -1])
    air_holes([10, 10], 4, 1, 5);
    
    // Top air holes
    translate([-1, 5.5, 13.5])
    rotate([0, 90, 0])
    air_holes([2, 14], 4, 1, 5);
    
    // Power input
    translate([162, 6, 6])
    rotate([90, 0, 90])
    xt60_mount(5);
}



module main_box(inner_size, wall_thickness, corner_radius) {
    outer_x = inner_size[0] + (wall_thickness * 2);
    outer_y = inner_size[1] + (wall_thickness * 2);
    
    radiiPoints = [
        [0, 0, corner_radius],
        [0, outer_y, corner_radius],
        [outer_x, outer_y, corner_radius],
        [outer_x, 0, corner_radius]
    ];
    
    difference() {
        linear_extrude(inner_size[2] + wall_thickness)
        polygon(polyRound(radiiPoints, 30));
       
        translate([wall_thickness, wall_thickness, wall_thickness])
        cube([inner_size[0], inner_size[1], inner_size[2] + 1]);
    }
}

module air_holes(amount, diameter, spacing, height) {
    center_dist = diameter + spacing;
    
    for (x = [diameter / 2 : center_dist : amount[0] * center_dist]) {
        for (y = [diameter / 2 : center_dist : amount[1] * center_dist]) {           
            translate([x, y])
            cylinder(d = diameter, h = height);
        }
    }
}

module xt60_mount(height) {
    // XT60E-M
    curve = 3.2;
    width = 8.1;
    length = 15.5;
    
    radiiPoints = [
        [0, 0, 0],
        [0, width, 0],
        [length, width, curve],
        [length, 0, curve]
    ];
    
    // Connector block
    translate([3, 0, 0])
    linear_extrude(height)
    polygon(polyRound(radiiPoints, 20));
    
    // Screw hole markers
    translate([1, width / 2, height - 1])
    sphere(d = 2);
    
    translate([length + 5, width / 2, height - 1])
    sphere(d = 2);
    
    // Polarity markings
    translate([3.5, 8.5, height - 1.4])
    linear_extrude(1.4)
    text("+", size = 5);
    
    translate([13.5, 8.9, height - 1.4])
    linear_extrude(1.4)
    scale([1.8, 1, 1])
    text("-", size = 5);
    
    // Input info
    translate([1.7, 13.5, height - 1.4])
    linear_extrude(1.4)
    text("7-70V DC", size = 3);
}

module retention_slot() {
    
}

