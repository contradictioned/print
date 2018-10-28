first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 2*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;
height = 30;

block_x = 40;
block_y = 100;
cable1_x = 40;
cable1_y = 140+wall_thickness;
bat_x = 60;
bat_y = 40;
cable2_xu = 30;
cable2_xo = 50;
cable2_y = 140+wall_thickness;

outer_x = 4*wall_thickness+cable1_x+block_x+cable2_xo;
outer_y = 2*wall_thickness+cable1_y;

hole=6;
hole_off=height/2;

difference() {
    translate([0,0,-bottom_thickness])
    linear_extrude(height) {
    polygon([
      [0,0],
      [outer_x,0],
      [outer_x,outer_y],
      [0,outer_y],
      ]);}

    translate([2*wall_thickness+cable1_x,2*wall_thickness+bat_y])
    cube([block_x,block_y,height]);

    translate([wall_thickness,wall_thickness])
    cube([cable1_x,cable1_y,height]);
    
    translate([2*wall_thickness+cable1_x,wall_thickness])
    cube([bat_x,bat_y,height]);
    
    translate([3*wall_thickness+cable1_x+bat_x,wall_thickness])
    cube([cable2_xu,cable2_y,height]);
    translate([3*wall_thickness+cable1_x+block_x,2*wall_thickness+bat_y])
    cube([cable2_xo,block_y,height]);
    
    translate([wall_thickness+(cable1_x/2-hole/2),cable1_y,hole_off])
    #cube([hole,10,20]);
      
    translate([wall_thickness+cable1_x+(block_x/2-hole/2),cable1_y,hole_off])
    #cube([hole,10,20]);
      
    translate([wall_thickness+cable1_x,wall_thickness+(bat_y/2-hole/2),hole_off])
    #cube([hole,10,20]);
}