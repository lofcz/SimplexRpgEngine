/// daynightDraw()

image_alpha = fase-0.1;

if (to = 1)
   {
   image_alpha = fase-0.3;
   } 

if (image_alpha > 0.7)
   {
  image_alpha = 0.7;
   }
   
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


if (alpha > 0)
{
surface_set_target(surf);
draw_clear(c_black);

draw_set_blend_mode(bm_src_color);
if (instance_number(oLight) > 0)
{
with(oLight)
    {
     draw_sprite_ext(sprite, index, x - view_xview, y - view_yview, scale, scale, rot, color, alpha);
    }
}

    
with(oPlayer)
    {
     draw_sprite_ext(sprLight, sprLightIndex, x - view_xview, y - view_yview, scale, scale, rot, color, sprAlpha);    
    }
draw_set_blend_mode(bm_normal);
surface_reset_target();

draw_surface_ext(surf, view_xview, view_yview, 1, 1, 0, c_white, alpha);
}
