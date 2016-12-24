/// effectSpawnEnemy(x,y,number)
var xx,yy,number;
xx     = x;
yy     = y;
number = 30;

if (argument_count > 0) {xx     = argument[0];}
if (argument_count > 1) {yy     = argument[1];}
if (argument_count > 2) {number = argument[2];}

part_system_depth(Sname, -30);

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_smoke);
part_type_size(particle1,0.24,0.94,0,0);
part_type_scale(particle1,2,2);
part_type_color3(particle1,1271346,16384,6834263);
part_type_alpha3(particle1,1,0.50,0);
part_type_speed(particle1,0,5.95,-0.20,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,1);
part_type_life(particle1,39,52);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle1,number);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_flare);
part_type_size(particle2,0.20,0.40,0,0);
part_type_scale(particle2,1,1);
part_type_color3(particle2,16384,32768,65280);
part_type_alpha2(particle2,1,0);
part_type_speed(particle2,1,3,0.10,0);
part_type_direction(particle2,0,359,0,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,40,40);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle2,number / 3);


