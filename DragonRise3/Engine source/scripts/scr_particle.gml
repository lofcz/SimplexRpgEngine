

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.10,0.30,0,0);
part_type_scale(particle1,1,1);
part_type_color3(particle1,16384,32768,65280);
part_type_alpha2(particle1,1,0);
part_type_speed(particle1,1,2,-0.01,0);
part_type_direction(particle1,0,359,0,20);
part_type_gravity(particle1,0.05,90);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_stream(Sname,emitter1,particle1,2);


