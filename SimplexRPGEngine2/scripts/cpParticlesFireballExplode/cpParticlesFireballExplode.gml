/// cpParticlesFireballExplode(x, y, number)

var xx,yy,number;
xx     = x;
yy     = y;
number = 10;

if (argument_count > 0) {xx     = argument[0];}
if (argument_count > 1) {yy     = argument[1];}
if (argument_count > 2) {number = argument[2];}



particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.24,0.74,0,0.20);
part_type_scale(particle1,1,1);
part_type_color3(particle1,65535,33023,255);
part_type_alpha3(particle1,0,1,0);
part_type_speed(particle1,4.25,4.41,0,0);
part_type_direction(particle1,0,359,0,20);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,1);
part_type_life(particle1,67,100);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle1,number);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_flare);
part_type_size(particle2,0.30,0.70,-0.01,0);
part_type_scale(particle2,1,1);
part_type_color3(particle2,12632256,8421504,12632256);
part_type_alpha3(particle2,0,0.50,1);
part_type_speed(particle2,2,7,0,0);
part_type_direction(particle2,0,359,0,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,40,50);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle2,number);