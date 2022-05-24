include <./parameters.scad>
include <./lib/curvedPipe.scad>

module steel_profile(length = 1000, width=40, thickness=2) {
	difference() {
		cube([length, width, width],true);
		cube([length+100, width-thickness*2, width-thickness*2],true);
	}
}

module frame_points(sphere_radius = 50, fill = false) {
	color([0, 0, 1])
	if (fill) {
		hull () {
			frame_box_points(20);
		}
		hull () {
			frame_front_points(20);
		}
	} else {
		union() {
			frame_box_points(sphere_radius);
			frame_front_points(sphere_radius);
		}
	}
}

module frame_box_points(sphere_radius=50) {

	front_angle = 45;
	cabine_difference = (box_height-tan(30)*(box_width-box_roof_width)/2)-(cabine_height+50);
	union() {
		translate([0, box_width/2, 0])
		sphere(r=sphere_radius);

		translate([0, -box_width/2, 0])
		sphere(r=sphere_radius);

		// cabine cutout
		translate([0, box_width/2, cabine_height+50])
		sphere(r=sphere_radius);

		translate([0, -box_width/2, cabine_height+50])
		sphere(r=sphere_radius);

		// front box angle
		translate([tan(front_angle)*cabine_difference, box_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);

		translate([tan(front_angle)*cabine_difference, -box_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);
		
		// back cutout
		translate([box_length-750*tan(50), box_width/2, 0])
		sphere(r=sphere_radius);

		translate([box_length, box_width/2, 750])
		sphere(r=sphere_radius);

		translate([box_length-750*tan(50), -box_width/2, 0])
		sphere(r=sphere_radius);

		translate([box_length, -box_width/2, 750])
		sphere(r=sphere_radius);

		// back box angle
		translate([box_length, box_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);

		translate([box_length, -box_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);

		// roof
		translate([box_length, box_roof_width/2, box_height])
		sphere(r=sphere_radius);

		translate([box_length, -box_roof_width/2, box_height])
		sphere(r=sphere_radius);

		translate([tan(front_angle)*cabine_difference, box_roof_width/2, box_height])
		sphere(r=sphere_radius);

		translate([tan(front_angle)*cabine_difference, -box_roof_width/2, box_height])
		sphere(r=sphere_radius);
	}
}


module frame_front_points(sphere_radius=50) {

	front_angle = 45;
	cabine_difference = (box_height-tan(30)*(box_width-box_roof_width)/2)-(cabine_height+50);
	// front panorama points //////////////////////
		// back joint with the box
	color([0, 0.3, 1])
	union() {
		translate([tan(front_angle)*cabine_difference, box_roof_width/2, box_height])
		sphere(r=sphere_radius);

		translate([tan(front_angle)*cabine_difference, -box_roof_width/2, box_height])
		sphere(r=sphere_radius);

		translate([tan(front_angle)*cabine_difference, box_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);

		translate([tan(front_angle)*cabine_difference, -box_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);

		// cabine cutout
		translate([0, box_width/2, cabine_height+50])
		sphere(r=sphere_radius);

		translate([0, -box_width/2, cabine_height+50])
		sphere(r=sphere_radius);

		// cabine front
		translate([-box_front_length, box_roof_width/2, cabine_height+50])
		sphere(r=sphere_radius);

		translate([-box_front_length, -box_roof_width/2, cabine_height+50])
		sphere(r=sphere_radius);

		translate([-box_front_length+tan(front_angle)*cabine_difference, box_roof_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);

		translate([-box_front_length+tan(front_angle)*cabine_difference, -box_roof_width/2, box_height-tan(30)*(box_width-box_roof_width)/2])
		sphere(r=sphere_radius);
	}
}

frame_points();

color([0.2, 0.5, 0.3, 0.3])
frame_points(5, true);


frame_box_points(0,false);
