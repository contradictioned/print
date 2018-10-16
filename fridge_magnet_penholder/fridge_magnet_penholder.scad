first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 2.5*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;

magnet_diam = 8;
magnet_height = 3;

base_plate_width = 40;
base_plate_length = 60;
base_plate_thickness = 4;

holder_inner_diam = 18;
holder_outer_diam = holder_inner_diam + 2*wall_thickness;

difference() {
    cube([base_plate_width, base_plate_length, base_plate_thickness]);
    
    translate([5,10,0])
    cylinder(magnet_height, d=magnet_diam);
    
    translate([35,10,0])
    cylinder(magnet_height, d=magnet_diam);
    
    translate([5,50,0])
    cylinder(magnet_height, d=magnet_diam);
    
    translate([35,50,0])
    cylinder(magnet_height, d=magnet_diam);
}

difference() {
    
union() {
    translate([(base_plate_width - holder_outer_diam)/2,0,base_plate_thickness])
    cube([holder_outer_diam, base_plate_length, holder_outer_diam/2]);

    translate([20,0,base_plate_thickness+(holder_outer_diam/2)])
    rotate(270, [1,0,0])
    cylinder(base_plate_length, d=holder_outer_diam);
}

    translate([20,0,base_plate_thickness+(holder_outer_diam/2)])
    rotate(270, [1,0,0])
    cylinder(base_plate_length-bottom_thickness, d=holder_inner_diam);

    translate([9,10,base_plate_thickness])
    cube([22, base_plate_length/2, holder_outer_diam]);
}