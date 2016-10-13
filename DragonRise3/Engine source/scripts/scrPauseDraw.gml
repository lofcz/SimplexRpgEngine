/// scrPauseDraw()

if (mass < maxBlur) {mass += pauseSpeed;}  

      qX = 1;
      qY = 0.1;      

    //  shader_set(shdVignette);
    //  shader_set_uniform_f(vignetteSettings, 1.0+mass, 1.0+mass/2, 0.06, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
   //   shader_set_uniform_f(vignetteSettingsColor, 245, 223, 201);
   //   shader_set_uniform_f(vignetteSettingsM, 1.0, 255, 1.0);
   //   shader_set_uniform_f(vignetteSettingsP, qX, qY);
   //   shader_reset();
   clr();
   draw_sprite(s, 0, 0, 0);  
   
   clr(c_black, bacAlpha);
   draw_rectangle(0, 0, view_wview, view_hview, false);
   clr(c_white, bacAlpha * 2);   
   alg("center", fntPixelHuge);
   draw_text(view_wview / 2, 50, "Hra je pozastavena");
   alg();
   fnt(fntPixelBig);
   
   if (menuMode == 1) {xoffset = lerp(xoffset, -40, 0.1); yoffset = lerp(yoffset, 60, 0.1); textAlpha = lerp(textAlpha, 0.2, 0.1);}
   
   // Draw base menu
   for (i = 0; i < array_length_1d(pauseText); i++)
        {
         color = c_white;
         text  = pauseText[i];
         
         if (i == pauseItemSelected && menuMode == 0) {color = c_yellow; text = ("> " + pauseText[i]);}
         
         clr(color, min(bacAlpha * 2, textAlpha));
         draw_text((view_wview / 2) - (string_width(text) / 2) + xoffset, 200 + (i * 48) + yoffset, text);         
        }
    
   // Draw settings     
   if (menuMode == 1)
        {
         settingsAlpha = lerp(settingsAlpha, 1, 0.1);
         
         for (i = 0; i < 3; i++)
            {
             color = c_white;
             text  = settingsText[i];
         
             if (i == settingsTextSelected && menuMode == 1) {color = c_yellow; text = ("> " + settingsText[i]);}
         
             clr(color, min(bacAlpha * 2, settingsAlpha));
             draw_text((view_wview / 2) - (string_width(text) / 2) + xoffset2, 200 + (i * 48) + yoffset2, text);         
            }
        }
        
   // Navigation
   if (keyboard_check_pressed(ord("W"))) 
        {
         if (pauseItemSelected > 0) {pauseItemSelected--;}
         else {pauseItemSelected = (array_length_1d(pauseText) - 1);}
        }
        
   if (keyboard_check_pressed(ord("S"))) 
        {
         if (pauseItemSelected < (array_length_1d(pauseText) - 1)) {pauseItemSelected++;}
         else {pauseItemSelected = 0;}
        }
        
         // Confirm selection
         if (keyboard_check_pressed(vk_enter) && activated && menuMode == 0)
            {
              if (pauseItemSelected == 0) {fadeMode = "out";}
              if (pauseItemSelected == 1) {menuMode = 1;}
            }   
        
   
           
   clr();
   
if (keyboard_check_pressed(vk_escape) && activated) {fadeMode = "out";}

   if (fadeMode == "in")       {bacAlpha = lerp(bacAlpha, 0.8,  0.1);}
   else if (fadeMode == "out") {bacAlpha = lerp(bacAlpha, -0.02, 0.1); if (bacAlpha < 0.05) {instance_destroy();}}

