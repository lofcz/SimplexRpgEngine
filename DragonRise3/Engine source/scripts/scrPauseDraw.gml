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

   if (menuMode == 2) {xoffset = lerp(xoffset, -80, 0.1); yoffset = lerp(yoffset, 120, 0.1); xoffset2 = lerp(xoffset2, -40, 0.1); yoffset2 = lerp(yoffset2, 60, 0.1); textAlpha = lerp(textAlpha, 0.05, 0.1); settingsAlpha = lerp(settingsAlpha, 0.1, 0.1); soundAlpha = lerp(soundAlpha, 1, 0.1);}   
   if (menuMode == 1) {xoffset = lerp(xoffset, -40, 0.1); yoffset = lerp(yoffset, 60, 0.1);  xoffset2 = lerp(xoffset2, 0, 0.1);   yoffset2 = lerp(yoffset2, 0, 0.1);  textAlpha = lerp(textAlpha, 0.1, 0.1);  settingsAlpha = lerp(settingsAlpha, 1, 0.1);   soundAlpha = lerp(soundAlpha, 0, 0.1);}
   if (menuMode == 0) {xoffset = lerp(xoffset, 0, 0.1);   yoffset = lerp(yoffset, 0, 0.1);   xoffset2 = lerp(xoffset, 0, 0.1);   yoffset2 = lerp(yoffset, 0, 0.1);  textAlpha = lerp(textAlpha, 1, 0.1);    settingsAlpha = lerp(settingsAlpha, 0, 0.1);   soundAlpha = lerp(soundAlpha, 0, 0.1);}
   
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
   if (settingsAlpha > 0)
        {         
         for (i = 0; i < array_length_1d(settingsText); i++)
            {
             color = c_white;
             text  = settingsText[i];
         
             if (i == settingsTextSelected && menuMode == 1) {color = c_yellow; text = ("> " + settingsText[i]);}
         
             clr(color, min(bacAlpha * 2, settingsAlpha));
             draw_text((view_wview / 2) - (string_width(text) / 2) + xoffset2, 200 + (i * 48) + yoffset2, text);         
            }
        }
        
   // Draw advanced settings     
   if (soundAlpha > 0)
        {         
         for (i = 0; i < array_length_1d(soundText); i++)
            {
             color = c_white;
             text  = soundText[i];
                          
             if (i == soundTextSelected && menuMode == 2) {color = c_yellow; text = ("> " + soundText[i]);}
             
             if (i == 0) {text += string(global.volFX);}
             if (i == 1) {text += string(global.volMX);}
         
             clr(color, min(bacAlpha * 2, soundAlpha));
             draw_text((view_wview / 2) - (string_width(text) / 2), 200 + (i * 48), text);         
            }
        }
        
   // Navigation
   if (keyboard_check_pressed(ord("W"))) 
        {
         if (menuMode == 0)
            {
             if (pauseItemSelected > 0) {pauseItemSelected--;}
             else {pauseItemSelected = (array_length_1d(pauseText) - 1);}            
            }
         else if (menuMode == 1)
            {
             if (settingsTextSelected > 0) {settingsTextSelected--;}
             else {settingsTextSelected = (array_length_1d(settingsText) - 1);}            
            }
         else if (menuMode == 2)
            {
             if (soundTextSelected > 0) {soundTextSelected--;}
             else {soundTextSelected = (array_length_1d(soundText) - 1);}            
            }         
        }
        
   if (keyboard_check_pressed(ord("S"))) 
        {
         if (menuMode == 0)
            {
             if (pauseItemSelected < (array_length_1d(pauseText) - 1)) {pauseItemSelected++;}
             else {pauseItemSelected = 0;}
            }
         else if (menuMode == 1)
            {
             if (settingsTextSelected < (array_length_1d(settingsText) - 1)) {settingsTextSelected++;}
             else {settingsTextSelected = 0;}
            }
         else if (menuMode == 2)
            {
             if (soundTextSelected < (array_length_1d(soundText) - 1)) {soundTextSelected++;}
             else {soundTextSelected = 0;}
            }
        }
        
         // Confirm selection
         if (keyboard_check_pressed(vk_enter))
            {
             if (menuMode == 0)
                {
                 if (pauseItemSelected == 0) {fadeMode = "out";}
                 if (pauseItemSelected == 1) {menuMode = 1;}                
                }
             else if (menuMode == 1)
                {
                 if (settingsTextSelected == 1) {menuMode = 2;}
                 if (settingsTextSelected == 3) {menuMode = 0;}
                }
             else if (menuMode == 2)
                {
                 if (soundTextSelected == 0) {if (global.volFX < 100) {global.volFX += 5;} else {global.volFX = 0;}}
                 if (soundTextSelected == 1) {if (global.volMX < 100) {global.volMX += 5;} else {global.volMX = 0;}}
                 if (soundTextSelected == 2) {menuMode = 1;}
                }
            }              
clr();   
if (keyboard_check_pressed(vk_escape) && activated) {fadeMode = "out";}
if (fadeMode == "in")       {bacAlpha = lerp(bacAlpha, 0.8,  0.1);}
else if (fadeMode == "out") {bacAlpha = lerp(bacAlpha, -0.02, 0.1); if (bacAlpha < 0.05) {instance_destroy();}}

