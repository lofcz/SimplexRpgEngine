/// scrPauseDraw()

if (mass < maxBlur) {mass += pauseSpeed;}  

shader_set(shdGaussHor);

shader_set_uniform_f(uni_resolution_hoz, var_resolution_x, var_resolution_y);
shader_set_uniform_f(uni_mass_h, mass);    
draw_sprite(s,0,0,0);
shader_reset();

shader_set(shdGaussVer);

shader_set_uniform_f(uni_resolution_vert, var_resolution_x, var_resolution_y);
shader_set_uniform_f(uni_mass_v, mass);
     
shader_reset();

draw_text(0, 0, "Hra je pozastavena");

if (keyboard_check_pressed(vk_escape) && activated) {instance_destroy();}
