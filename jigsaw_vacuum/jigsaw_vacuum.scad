first_layer_height = 0.20;
layer_height = 0.15;
layer_width = 0.45;

$fn = 64;

wall_thickness = 2.5*layer_width;
bottom_thickness = first_layer_height + 2*layer_height;

// vacuum side
ovd = 34*1.03;
ojd = 27*1.03; // check
mount_length = 40;
adapter_length = 20;

// vaccuum mount
difference() {
    cylinder(mount_length, d=ovd+2*wall_thickness);
    cylinder(mount_length, d=ovd);
}

// adapter
translate([0,0,mount_length])
difference() {
    cylinder(adapter_length, d1=ovd+2*wall_thickness, d2=ojd+2*wall_thickness);
    cylinder(adapter_length, d1=ovd, d2=ojd);
}

// jigsaw mount
translate([0,0,mount_length + adapter_length])
difference() {
    cylinder(mount_length, d=ojd+2*wall_thickness);
    cylinder(mount_length, d=ojd);
}
