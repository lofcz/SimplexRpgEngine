/// scrPauseDraw()

if (mass < maxBlur) {mass += pauseSpeed;}  

      qX = 1;
      qY = 0.1;      

      shader_set(shdVignette);
      shader_set_uniform_f(vignetteSettings, 1.0+mass, 1.0+mass/2, 0.06, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
      shader_set_uniform_f(vignetteSettingsColor, 245, 223, 201);
      shader_set_uniform_f(vignetteSettingsM, 1.0, 255, 1.0);
      shader_set_uniform_f(vignetteSettingsP, qX, qY);
      draw_sprite(s, 0, 0, 0);  
      shader_reset();

draw_text(0, 0, "Hra je pozastavena");

if (keyboard_check_pressed(vk_escape) && activated) {instance_destroy();}
