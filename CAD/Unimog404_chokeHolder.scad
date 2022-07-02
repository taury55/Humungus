difference() {
    union() {
        rotate_extrude(angle=60, convexity = 10, $fn=100)
        translate([100, 0, 0])
        circle(d = 12, $fn=30);
        
        hull() {
            rotate([0, 0, 10])
            translate([100, 0, 0])
            rotate([90, 0, 0])
            cylinder(d = 12, h=3, $fn=30);
            
            translate([100+12/2+9, 0, 0])
            rotate([0, 90, 0])
            cylinder(d = 12, h=3, $fn=30);
            
            translate([100+12/2+9, -20, 0])
            rotate([0, 90, 0])
            cylinder(d = 12, h=3, $fn=30);
        }
        
        rotate([0, 0, 57])
        hull() {
            rotate([0, 0, -3.5])
            translate([100, 0, 0])
            rotate([90, 0, 0])
            cylinder(d = 12, h=3, $fn=30);
            
            rotate([0, 0, 4.5])
            translate([100, 0, 0])
            rotate([90, 0, 0])
            cylinder(d = 12, h=3, $fn=30);
            
            translate([100+12/2+3, 0, 0])
            rotate([0, 90, 0])
            cylinder(d = 12, h=3, $fn=30);
        }
    }
    
    rotate([0, 0, -30])
    rotate_extrude(angle=100, convexity = 10, $fn=100)
    translate([100, 0, 0])
    circle(d=8.5, $fn=30);
    
    translate([100+12/2+7, -20, 0])
    rotate([0, 90, 0])
    hull() {
        cylinder(d =4, h=7, $fn=30);
        
        translate([0, 12, 0,])
        cylinder(d =4, h=7, $fn=30);
    }
    
    translate([15, -49.9, -20])
    cube([100, 50, 50]);
            
    rotate([0, 0, 57])
    translate([100+2, 0, 0])
    rotate([0, 90, 0])
    union() {
        cylinder(d = 3.2, h=40, $fn=30);
        
        hull() {
            cylinder(d = 5.6, h=7, $fn=6);
            
            translate([0, 20, 0,])
            cylinder(d = 5.6, h=7, $fn=6);
        }
    }
}