/// effectSpellLevelUp(x, y, number)
var xx,yy,number;
xx     = x;
yy     = y;
number = 20;

if (argument_count > 0) {xx     = argument[0];}
if (argument_count > 1) {yy     = argument[1];}
if (argument_count > 2) {number = argument[2];}

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.30,0.50,0.01,0.10);
part_type_scale(particle1,1,1);
part_type_color3(particle1,4227200,65535,8454143);
part_type_alpha2(particle1,1,0);
part_type_speed(particle1,1,4,0,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle1,number);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_star);
part_type_size(particle2,0.10,0.40,0,0);
part_type_scale(particle2,1,1);
part_type_color3(particle2,12632256,65535,14286847);
part_type_alpha3(particle2,0,1,0);
part_type_speed(particle2,1,4,0,0);
part_type_direction(particle2,0,359,0,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,359,2,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,60,60);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle2,number);

particle3 = part_type_create();
part_type_shape(particle3,pt_shape_spark);
part_type_size(particle3,0.30,0.40,0,0.20);
part_type_scale(particle3,1,1);
part_type_color3(particle3,65280,16777088,255);
part_type_alpha3(particle3,0,0.50,0);
part_type_speed(particle3,1,10,0,0);
part_type_direction(particle3,0,359,0,0);
part_type_gravity(particle3,0,270);
part_type_orientation(particle3,0,0,0,0,1);
part_type_blend(particle3,1);
part_type_life(particle3,60,60);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle3,number);


