

particle1 = part_type_create();
part_type_sprite(particle1,image,0,0,0);
part_type_size(particle1,0.20,0.60,0,0);
part_type_scale(particle1,1,1);
part_type_color3(particle1,32768,65280,8453888);
part_type_alpha2(particle1,1,0);
part_type_speed(particle1,1,1,-0.01,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,359,1,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_stream(Sname,emitter1,particle1,5);


