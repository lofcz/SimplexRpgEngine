


particle1 = part_type_create();
part_type_sprite(particle1,f,0,0,0);
part_type_size(particle1,0.87,0.97,0,0);
part_type_scale(particle1,2.68,2.28);
part_type_color3(particle1,12615935,8388863,16711808);
part_type_alpha3(particle1,0,0.5,0);
part_type_speed(particle1,2.43,4.13,0.09,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,359,2,0,0);
part_type_blend(particle1,1);
part_type_life(particle1,48,51);

emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_burst(Sname,emitter1,particle1,argument[0]);


