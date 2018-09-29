first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 3*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;
height = 30;

module charger() {
    width = 70;
    depth = 90;
    cube([width,depth,height]);
}

module cable() {
    // plug
    pwidth = 50;
    pdepth = 120+wall_thickness;
    
    translate([0,cdepth+wall_thickness,0])
    cube([pwidth,pdepth,height]);
}

module walls() {
    width = 70 + 50 + 3*wall_thickness;
    depth = 90 + 2*wall_thickness;
     
    translate([-wall_thickness,30,-bottom_thickness])  
    cube([width, depth, height]);
    
    topwidth = 50 + 2*wall_thickness;
    topdepth = 30 + 2*wall_thickness;
    translate([-wall_thickness,-wall_thickness,-bottom_thickness])
    cube([topwidth, topdepth, height]);
}

// bottom part
difference() {
  walls();

  // just roughly model the things to store
  translate([50+wall_thickness,30+wall_thickness,0])
  charger();
  cable();
}

// top part
translate([0,160,0])
difference() {
    width = 70 + 50 + 5*wall_thickness;
    
    linear_extrude(height=20) {
        polygon(points=[[0,0], [width,20], [width,40], [0,40]]);
    }
    
    translate([wall_thickness,0,-bottom_thickness])
    cube([width-2*wall_thickness,40-wall_thickness,20]);
}