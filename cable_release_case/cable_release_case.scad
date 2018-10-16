first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 2*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;
height = 20;

module controller() {
    width = 45;
    depth = 160;
    
    difference() {
        translate([-wall_thickness, -wall_thickness,-bottom_thickness])
        cube([width+2*wall_thickness,depth+2*wall_thickness,height+bottom_thickness]);
        cube([width,depth,height+5]);
        
        translate([12.5,-1,2])
        cube([20,20,30]);
    }
}

module cable() {
    width = 30;
    depth = 130;
    
    difference() {
        translate([-wall_thickness, -wall_thickness,-bottom_thickness])
        cube([width+2*wall_thickness,depth+2*wall_thickness,height+bottom_thickness]);
        cube([width,depth,height+5]);
        
        translate([10,1,10])
        rotate(90, [1,0,0])
        cylinder(2,2,2);
        
        translate([10,-4,8])
        cube([10,10,4]);
        
        translate([20,1,10])
        rotate(90, [1,0,0])
        cylinder(2,2,2);
        
        translate([18,-4,10])
        #cube([4,10,12]);
    }
}

module adapter() {
    width = 10;
    depth = 130;
    
    difference() {
        translate([-wall_thickness, -wall_thickness,-bottom_thickness])
        cube([width+2*wall_thickness,depth+2*wall_thickness,height+bottom_thickness]);
        cube([width,depth,height+5]);
    }
}

controller();
translate([-30-wall_thickness,0,0])
cable();

translate([-40-2*wall_thickness,0,0])
adapter();
translate([-50-3*wall_thickness,0,0])
adapter();
