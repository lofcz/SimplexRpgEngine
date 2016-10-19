/// effectSmoke(x,y,number)
var xx,yy,number;
xx     = x;
yy     = y;
number = 1;

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.10,0.42,0.01,0);
part_type_scale(particle1,1,1);
part_type_color3(particle1,9152692,8421504,12632256);
part_type_alpha2(particle1,1,0);
part_type_speed(particle1,0,0,0,0);
part_type_direction(particle1,260,280,0,10);
part_type_gravity(particle1,0.40,90);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,1);
part_type_life(particle1,30,40);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,xx,xx,yy,yy,0,0);
part_emitter_burst(Sname,emitter1,particle1,number);


