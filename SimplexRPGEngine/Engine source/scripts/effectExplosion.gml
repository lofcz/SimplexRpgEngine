/// effectExplosion()

emitter = part_emitter_create(Sname);
part_emitter_region(Sname,emitter,x-sprite_width/2,x+sprite_width/2,y-sprite_height/2,y+sprite_height/2,ps_shape_rectangle,ps_distr_linear);
part_system_depth(Sname, -10000);

flame = part_type_create();
part_type_alpha2(flame,1,0);
part_type_blend(flame,1);
part_type_color2(flame,c_red,c_yellow);
part_type_direction(flame,0,360,0,0);
part_type_gravity(flame,0.5,270);
part_type_life(flame,50,100);
part_type_orientation(flame,0,0,0,0,1);
part_type_shape(flame,pt_shape_line);
part_type_size(flame,0.1,0.2,0,0);
part_type_speed(flame,3,20,0,0);

smoke = part_type_create();
part_type_alpha2(smoke,1,0);
part_type_color1(smoke,c_dkgray);
part_type_direction(smoke,0,360,0,0);
part_type_gravity(smoke,0.05,270);
part_type_life(smoke,50,100);
part_type_orientation(smoke,0,360,0,0,0);
part_type_shape(smoke,pt_shape_smoke);
part_type_size(smoke,0.5,1,0.01,0);
part_type_speed(smoke,1,3,0,0);

fire = part_type_create();
part_type_alpha2(fire,1,0);
part_type_blend(fire,1);
part_type_color1(fire,make_color_rgb(255,128,64));
part_type_direction(fire,0,360,0,0);
part_type_gravity(fire,0.05,270);
part_type_life(fire,50,100);
part_type_orientation(fire,0,360,0,0,0);
part_type_shape(fire,pt_shape_smoke);
part_type_size(fire,0.5,1,0.01,0);
part_type_speed(fire,5,20,-2,0);

part_emitter_burst(Sname,emitter,flame,30);
part_emitter_burst(Sname,emitter,fire,60);
part_emitter_burst(Sname,emitter,smoke,60);
