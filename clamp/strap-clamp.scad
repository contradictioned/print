first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 2.5*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;

height = 20;

// canon strap
length = 42;
inner_space = 12;

// fender strap
//length = 50;
//inner_space = 18;

inwards_rotation = 5;

cube([wall_thickness, length, height]);
translate([wall_thickness,length,0])
cylinder(height, wall_thickness,wall_thickness);
    
cube([inner_space+wall_thickness,2*wall_thickness,height]);

rotate(inwards_rotation, [0,0,1])
translate([inner_space,0,0])
union() {
    cube([wall_thickness, length, height]);
    translate([0,length,0])
    cylinder(height, wall_thickness,wall_thickness);
}