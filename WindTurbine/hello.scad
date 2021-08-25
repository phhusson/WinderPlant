$fn=60;

// bearing is 4x9x4

module arc() {
    translate([3.5, -2, 0.5]) {
        difference() {
            circle(8);
            circle(7.6);
    
            translate([-10.1, 0, -2]) square(30);
        }
    }
}

module spinner() {
    difference() {
        cylinder(h = 4, r = 12);
        translate([0,0,-0.05]) 
                linear_extrude(height = 4.1, scale = 0.97, slices=20) {
                    circle(4.55);
        };
    }

    translate([0, 0, 4]) {
            linear_extrude(height = 20, slices = 20, scale = 1.0, twist = 90) {
            arc();
            rotate(180) arc();
        }
    }
}

module base() {
    cylinder(h=4, r = 18);
    translate([0,0,4])
        linear_extrude(height=6, slices = 20, scale = 0.95) circle(2.05);
}

translate([0, 0, 6]) spinner();

! base();



