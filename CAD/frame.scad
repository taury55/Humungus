include <./parameters.scad>

module frame_lowpoly() {
    difference() {
        union() {
            difference() {
                translate([box_length/2, 0, box_height/2])
                cube([box_length, box_width, box_height], true);
                
                translate([-box_length/2-10+sin(45)*2*(cos(30)*(box_width-box_roof_width)-box_profile_width/3*2-100), 0, cabine_height+box_height/2+100])
                cube([box_length, box_width+400, box_height], true);
            }
            
            // front panorama
            hull() {
                translate([5, 0, cabine_height+100])
                cube([10, box_width, box_profile_width], true);
                
                translate([5+sin(45)*2*(cos(30)*(box_width-box_roof_width)-box_profile_width/3*2-100), 0, cabine_height+cos(30)*(box_width-box_roof_width)-box_profile_width/3*2])
                cube([10, box_width, box_profile_width], true);
                
                translate([5+sin(45)*2*(cos(30)*(box_width-box_roof_width)-box_profile_width/3*2-100), 0, cabine_height+100])
                cube([10, box_width, box_profile_width], true);
                
                translate([5+sin(45)*2*(cos(30)*(box_width-box_roof_width)-box_profile_width/3*2-100), 0, box_height-box_profile_width/2])
                cube([10, box_width, box_profile_width], true);
                
                translate([-box_profile_width/2-box_front_length, 0, cabine_height+100])
                cube([box_profile_width, box_front_width, box_profile_width], true);
                
                translate([-box_profile_width/2-box_front_length+sin(25)*400, 0, cabine_height+500])
                cube([box_profile_width, box_front_width-200, box_profile_width], true);
            }
        }
        
        // back angle wall
        translate([box_length, 0, -350])
        rotate([0, -40, 0])
        cube([1600, box_width+400, 1600], true);
        
        // top angle walls
        translate([box_length/2, -box_width/2-box_roof_width/2, box_height+325])
        rotate([30, 0, 0])
        cube([box_length*2, box_width, 1600], true);
        
        translate([box_length/2, box_width/2+box_roof_width/2, box_height+325])
        rotate([-30, 0, 0])
        cube([box_length*2, box_width, 1600], true);
        
        
        // top angle walls front panorama
        rotate([0, -10, 0])
        union() {
            translate([box_length/2, -box_width/2-box_roof_width/2, box_height+sin(45)*(cos(30)*(box_width-box_roof_width))/2-40])
            rotate([30, 0, -10])
            cube([box_length*2, box_width, 1600], true);
            
            translate([box_length/2, box_width/2+box_roof_width/2, box_height+sin(45)*(cos(30)*(box_width-box_roof_width))/2-40])
            rotate([-30, 0, 10])
            cube([box_length*2, box_width, 1600], true);
        }
        
        
        // side angle walls front panorama
        union() {
            translate([-box_height/2, -box_width/2-box_roof_width/2+box_profile_width*2+5, box_height+250])
            rotate([-15, 15, -18.5])
            cube([box_height*2, box_width, box_height], true);
            
            translate([-box_height/2, box_width/2+box_roof_width/2-box_profile_width*2-5, box_height+250])
            rotate([15, 15, 18.5])
            cube([box_height*2, box_width, box_height], true);
        }
        
    }
}

#frame_lowpoly();