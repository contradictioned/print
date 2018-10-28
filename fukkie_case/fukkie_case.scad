
first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 2*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;

obj_x = 60;
obj_y = 70;
obj_z = 40;

difference() {
    cube([obj_x+2*wall_thickness,obj_y+2*wall_thickness,obj_z+bottom_thickness]);
    
    translate([wall_thickness, wall_thickness, bottom_thickness])
    cube([obj_x,obj_y,obj_z]);
}

translate([70,0,0])
#difference() {
    translate([-wall_thickness, -wall_thickness, -bottom_thickness])
    cube([obj_x+4*wall_thickness,obj_y+4*wall_thickness,obj_z/2]);
    
    cube([obj_x+2*wall_thickness,obj_y+2*wall_thickness,obj_z+bottom_thickness]);
}