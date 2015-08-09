Sname = part_system_create();

particle1 = part_type_create();
part_type_sprite(particle1,f,0,0,0);
part_type_size(particle1,0.47,0.77,0,0.40);
part_type_scale(particle1,1.06,1);
part_type_color3(particle1,16711935,16711808,12615935);
part_type_alpha2(particle1,1,0);
part_type_speed(particle1,3,5,0.03,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,359,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,35,58);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_burst(Sname,emitter1,particle1,5);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_pixel);
part_type_size(particle2,1,1,0,0);
part_type_scale(particle2,2.89,1.72);
part_type_color3(particle2,16744703,16711808,8388736);
part_type_alpha3(particle2,0.64,0.71,0.07);
part_type_speed(particle2,2.24,8,0.10,0);
part_type_direction(particle2,0,359,1,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,66,83);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_burst(Sname,emitter1,particle2,5);
