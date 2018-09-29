first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 2*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;
height = 40;

module charger() {
    width = 75;
    depth = 130;
    cube([width,depth,height]);
}

module powersupply() {
    // plug
    pwidth = 85;
    pdepth = 20;    
    cube([pwidth,pdepth,height]);
    
    // body
    bwidth = 50;
    bdepth = 80;
    cube([bwidth,bdepth,height]);

    // cable
    cwidth = 50;
    cdepth = 75;
    translate([0,cdepth+wall_thickness,0])
    cube([cwidth,cdepth,height]);
}

module walls() {
    width = 75 + 50 + 3*wall_thickness;
    depth = 130 + 2*wall_thickness;
     
    translate([-wall_thickness,20,-bottom_thickness])  
    cube([width, depth, height]);
    
    topwidth = 85 + 2*wall_thickness;
    topdepth = 20 + 2*wall_thickness;
    translate([-wall_thickness,-wall_thickness,-bottom_thickness])
    cube([topwidth, topdepth, height]);
}

// bottom part
difference() {
  walls();

  // just roughly model the things to store
  translate([50+wall_thickness,20+wall_thickness,0])
  charger();
  powersupply();
}

// top part
translate([0,160,0])
difference() {
    width = 75 + 50 + 5*wall_thickness;
    
    linear_extrude(height=20) {
        polygon(points=[[0,0], [width,20], [width,40], [0,40]]);
    }
    
    translate([wall_thickness,0,-bottom_thickness])
    cube([width-2*wall_thickness,40-wall_thickness,20]);
}