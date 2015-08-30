/// effectFrozenTrail(x,y,number)
var xx,yy,number;
xx     = x;
yy     = y;
number = 1;

if (argument_count > 0) {xx     = argument[0];}
if (argument_count > 1) {yy     = argument[1];}
if (argument_count > 2) {number = argument[2];}


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.10,0.20,0,0.02);
part_type_scale(particle1,3.28,2.68);
part_type_color3(particle1,16777156,11844132,13845282);
part_type_alpha3(particle1,0.64,0.77,0.07);
part_type_speed(particle1,0,1,-0.06,0);
part_type_direction(particle1,0,359,1,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,1);
part_type_life(particle1,20,35);

emitter1 = part_emitter_create(Sname);

part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_stream(Sname,emitter1,particle1,number);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_flare);
part_type_size(particle2,0.10,0.20,0,0);
part_type_scale(particle2,1,1);
part_type_color3(particle2,16744576,16777088,16744448);
part_type_alpha3(particle2,0.70,0.40,0);
part_type_speed(particle2,0,1,-0.05,0);
part_type_direction(particle2,0,359,0,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,30,40);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_stream(Sname,emitter1,particle2,number);


