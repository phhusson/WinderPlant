$fn=60;

// bearing is 4x9x4

module arc() {
    translate([9.5, 0, 0.5]) {
        union() {
            for(i=[0:44]) {
                translate([i*1.5, 0, 0]) square(0.8, center=true);
            }
        }
    }
}

module spinner() {
    difference() {
        cylinder(h = 4, r = 20);
        translate([0,0,-0.05]) 
                linear_extrude(height = 8.1, scale = 0.90, slices=20) {
                    circle(4.9);
        };
    }

    rotate([0, 0, -90]) translate([0,40,3]) cube([2, 71, 2], center=true);
    rotate([0, 0, 30]) translate([0,40,3]) cube([2, 71, 2], center=true);
    rotate([0, 0, 150]) translate([0,40,3]) cube([2, 71, 2], center=true);
    
    offset=10;
    for(i=[1:10]) {
        rotate([0, 0, 150 - (45*(i/10))]) translate([0,42.5,4+4*i]) rotate([90,0,0]) cylinder(h = 66, r = 0.4, center=true);
    }
    rotate([0, 0, 120]) for(i=[1:10]) {
        rotate([0, 0, 150 - (45*(i/10))]) translate([0,42.5,4+4*i]) rotate([90,0,0]) cylinder(h = 66, r = 0.4, center=true);
    }
    rotate([0, 0, 240]) for(i=[1:10]) {
        rotate([0, 0, 150 - (45*(i/10))]) translate([0,42.5,4+4*i]) rotate([90,0,0]) cylinder(h = 66, r = 0.4, center=true);
    }
    
    translate([0, 0, 4]) {
            
            linear_extrude(height = 40, slices = 60, scale = 1.0, twist = 45) {
            arc();
            rotate(120) arc();
                rotate(240) arc();
        }
    }
}

module base() {
    cylinder(h=4, r = 18);
    translate([0,0,4])
        linear_extrude(height=10, slices = 20, scale = 0.75) circle(2.3);
}

translate([0, 0, 8]) ! union() {
    spinner();
}

base();

