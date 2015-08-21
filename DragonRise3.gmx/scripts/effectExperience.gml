/// effectExperience(x,y,number)

var xx,yy,number;
xx     = x;
yy     = y;
number = 10;

if (argument_count > 0) {xx     = argument[0];}
if (argument_count > 1) {yy     = argument[1];}
if (argument_count > 2) {number = argument[2];}

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.1,0.2,.01,0.50);
part_type_scale(particle1,1,1.08);
part_type_color3(particle1,12582911,8454143,65535);
part_type_alpha3(particle1,0.70,1,0);
part_type_speed(particle1,3.76,5.84,0,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,25,30);
part_system_depth(Sname,-12);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle1,number);