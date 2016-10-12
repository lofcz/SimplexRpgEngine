/// scrPauseDraw()

if (global.temp == -1)
{
if (mass < maxBlur) {mass += pauseSpeed;}  

      qX = 1;
      qY = 0.1;      

    //  shader_set(shdVignette);
    //  shader_set_uniform_f(vignetteSettings, 1.0+mass, 1.0+mass/2, 0.06, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
   //   shader_set_uniform_f(vignetteSettingsColor, 245, 223, 201);
   //   shader_set_uniform_f(vignetteSettingsM, 1.0, 255, 1.0);
   //   shader_set_uniform_f(vignetteSettingsP, qX, qY);
      draw_sprite(s, 0, 0, 0);  
   //   shader_reset();
   bacAlpha = lerp(bacAlpha, 0.9, 0.1);
   clr(c_black, bacAlpha);
   draw_rectangle(0, 0, view_wview, view_hview, false);
   clr(c_white);   
   alg("center", fntPixelHuge);
   draw_text(view_wview / 2, 50, "Hra je pozastavena");
   alg();
   fnt(fntPixelBig);
   
   for (i = 0; i < array_length_1d(pauseText); i++)
        {
         color = c_white;
         if (i == pauseItemSelected) {color = c_yellow;}
         
         clr(color, draw_get_alpha());
         draw_text((view_wview / 2) - (string_width(pauseText[i]) / 2), 200 + (i * 48), pauseText[i]);
        }
        
   // Navigation
   if (keyboard_check_pressed(ord("W"))) 
        {
         if (pauseItemSelected > 0) {pauseItemSelected--;}
         else {pauseItemSelected = (array_length_1d(pauseText) - 1);}
        }
        
   if (keyboard_check_pressed(ord("S"))) 
        {
         if (pauseItemSelected < array_length_1d(pauseText)) {pauseItemSelected++;}
         else {pauseItemSelected = 0;}
        }
        
   
           
   clr();
   
if (keyboard_check_pressed(vk_escape) && activated) {instance_destroy();}
}
else
    {
     draw_sprite(s, 0, 0, 0); 
    }
