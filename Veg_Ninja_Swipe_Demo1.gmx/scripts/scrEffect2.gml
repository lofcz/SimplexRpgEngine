


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.10,0.10,0.01,0);
part_type_scale(particle1,2.41,1.39);
part_type_color3(particle1,16744703,16711808,8388672);
part_type_alpha3(particle1,0,0.3,0);
part_type_speed(particle1,4.17,20,0.05,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,359,2,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,38,50);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_burst(Sname,emitter1,particle1,irandom_range(5,10));


