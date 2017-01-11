/// daynightDraw()

if (global.mapType != mapEnum.mapInterier)
{
image_alpha = fase-0.1;

if (to == 1) {image_alpha = fase-0.3;} 
if (image_alpha > 0.7) {image_alpha = 0.7;}
   
redr = ((red/255))*239;
redg = ((red/255))*92;
redb = ((red/255))*50;
col  = make_color_rgb(redr,redg,50);

draw_set_alpha(image_alpha);
draw_set_color(col);
draw_rectangle(view_xview-1,view_yview-1,view_xview+view_wview+1,view_yview+view_hview+1,0);
draw_set_alpha(1);
draw_set_color(c_white);

// Fix focus-loss error
if (!surface_exists(surf))
    {
     surf = surface_create(view_wview, view_hview);
    }


if (alpha > 0.01)
{
surface_set_target(surf);
draw_clear(c_black);

draw_set_blend_mode(bm_src_color);
if (instance_number(oLight) > 0)
{
with(oLight)
    {
     for (var i = 0; i < array_length_1d(slSprite); i++)
         {         
          if (slPMaxSize[i] > 0) {if (slPMode[i] == 0) {slPSize[i] = lin(slPSize[i], slPMaxSize[i], slPSpd[i]); if (slPSize[i] >= slPMaxSize[i]) {slPMode[i] = 1;}} if (slPMode[i] == 1) {slPSize[i] = lin(slPSize[i], 1, -slPSpd[i]); if (slPSize[i] <= 1) {slPMode[i] = 0;}}}
          draw_sprite_ext(slSprite[i], slIndex[i], x - view_xview, y - view_yview, slScale[i] * (slPSize[i]), slScale[i] * (slPSize[i]), slRot[i], slColor[i], slAlpha[i]);
         }
    }    
}

if (instance_number(oFireplace) > 0)
{
with(oFireplace)
    {
     for (var i = 0; i < array_length_1d(slSprite); i++)
         {    
          if (slPMaxSize[i] > 0) {if (slPMode[i] == 0) {slPSize[i] = lin(slPSize[i], slPMaxSize[i], slPSpd[i]); if (slPSize[i] >= slPMaxSize[i]) {slPMode[i] = 1;}} if (slPMode[i] == 1) {slPSize[i] = lin(slPSize[i], 1, -slPSpd[i]); if (slPSize[i] <= 1) {slPMode[i] = 0;}}}
          draw_sprite_ext(slSprite[i], slIndex[i], x - view_xview, y - view_yview, slScale[i] * (slPSize[i]), slScale[i] * (slPSize[i]), slRot[i], slColor[i], slAlpha[i]);
         }
     }    
}

    
with(oPlayer)
    {
     for (var i = 0; i < array_length_1d(slSprite); i++)
         {    
          if (slPMaxSize[i] > 0) {if (slPMode[i] == 0) {slPSize[i] = lin(slPSize[i], slPMaxSize[i], slPSpd[i]); if (slPSize[i] >= slPMaxSize[i]) {slPMode[i] = 1;}} if (slPMode[i] == 1) {slPSize[i] = lin(slPSize[i], 1, -slPSpd[i]); if (slPSize[i] <= 1) {slPMode[i] = 0;}}}
          draw_sprite_ext(slSprite[i], slIndex[i], x - view_xview, y - view_yview, slScale[i] * (slPSize[i]), slScale[i] * (slPSize[i]), slRot[i], slColor[i], slAlpha[i]);
      }     
    }
draw_set_blend_mode(bm_normal);
surface_reset_target();

draw_surface_ext(surf, view_xview, view_yview, 1, 1, 0, c_white, alpha);
 }
}
