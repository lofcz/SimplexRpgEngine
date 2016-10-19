/// effectTalentUp(x, y, number)
var xx,yy,number;
xx     = x;
yy     = y;
number = 10;

if (argument_count > 0) {xx     = argument[0];}
if (argument_count > 1) {yy     = argument[1];}
if (argument_count > 2) {number = argument[2];}

part_system_depth(Sname, -99999);
particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.47,0.67,0,0);
part_type_scale(particle1,1.13,1.18);
part_type_color3(particle1,8454143,33023,65535);
part_type_alpha3(particle1,0.75,0.51,0);
part_type_speed(particle1,0,1.11,0.02,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,1);
part_type_life(particle1,60,100);


emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle1,number);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_star);
part_type_size(particle2,0.10,0.30,0,0);
part_type_scale(particle2,1,1);
part_type_color3(particle2,33023,65535,255);
part_type_alpha2(particle2,0.70,0);
part_type_speed(particle2,1.65,2,0.00,0);
part_type_direction(particle2,0,359,0,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,0);
part_type_blend(particle2,1);
part_type_life(particle2,31,120);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle2,number);


