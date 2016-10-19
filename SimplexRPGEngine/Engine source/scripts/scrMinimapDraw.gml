/// scrMinimapDraw()

if (draw)
{
x1       = 0;
y1       = 0;
x2       = zoom_x;
y2       = zoom_y;
m_alpha  = 1;
x        = view_xview+(view_wview - width);
y        = view_yview+(view_hview - height);

   
if (instance_number(oPlayer) > 0 && draw) 
{
m_alpha = min(1, oHUD.hudAlpha);

draw_set_alpha(min(0.3, oHUD.hudAlpha))
draw_set_color(c_black)
draw_roundrect(x,y,x+width-1,y+height-2,0)
draw_set_color(c_black)
draw_set_alpha(min(1, oHUD.hudAlpha))
draw_roundrect(x,y,x+width-2,y+height-2,1)

//draw_sprite_stretched(screenSave, 0, x, y, 128, 128);

draw_set_color(c_aqua)

with (oPlayer)
{
if x>oMinimap.x1
if y>oMinimap.y1
if x<oMinimap.x2
if y<oMinimap.y2
draw_circle(oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex),oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey),2,false)
}
with (parEnemy)
{
if x>oMinimap.x1
if y>oMinimap.y1
if x<oMinimap.x2
if y<oMinimap.y2

if (distance_to_object(oPlayer) < 500)
   {
   m_alpha = 5-(distance_to_object(oPlayer)/100);
   
   draw_set_alpha(min(m_alpha, oHUD.hudAlpha));
   draw_circle_colour(oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex),oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey),2,c_red,c_red,0);
   draw_set_alpha(1);
   }
}


with (parTree)
{
if x>oMinimap.x1
if y>oMinimap.y1
if x<oMinimap.x2
if y<oMinimap.y2

if (distance_to_object(oPlayer) < 500)
   {
   m_alpha = 5-(distance_to_object(oPlayer)/100);
   
   draw_set_alpha(min(m_alpha, oHUD.hudAlpha));
   draw_rectangle_colour(oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex),oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey),oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex)+4,oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey)+4,m_color,m_color,m_color,m_color,0);
   draw_set_alpha(1);
   }
}

}

// Draw waypoints

if (ds_list_size(pointList) > 0)
{
decA  = true;
drawI = -1

for (i = 0; i < ds_list_size(pointList); i++)
    {
     alg("center", fntPixelSmall);
     clr(pointListColor[| i], oHUD.hudAlpha);
     draw_text(oMinimap.x+(( pointListX[| i]-oMinimap.x1)*oMinimap.sizex), oMinimap.y+((pointListY[| i]-oMinimap.y1)*oMinimap.sizey), pointListSymbol[| i]);
     if (pointListSprite[| i] != -1) {draw_sprite_ext(sMinimapIcons, pointListSprite[| i], oMinimap.x+(( pointListX[| i]-oMinimap.x1)*oMinimap.sizex), oMinimap.y+((pointListY[| i]-oMinimap.y1)*oMinimap.sizey), 0.5, 0.5, 0, c_white, min(1, oHUD.hudAlpha)); }
     alg();
     
     if (mouse_in(oMinimap.x+(( pointListX[| i]-oMinimap.x1)*oMinimap.sizex) - 8, oMinimap.x+(( pointListX[| i]-oMinimap.x1)*oMinimap.sizex) + 2, oMinimap.y+((pointListY[| i]-oMinimap.y1)*oMinimap.sizey) - 5, oMinimap.y+((pointListY[| i]-oMinimap.y1)*oMinimap.sizey) + 5))
        {
         decA = false;
         drawI = i;
        }
    }

if (drawI != -1)
    {
     if (hoverAlpha < 1) {hoverAlpha = lerp(hoverAlpha, 1.01, 0.1);}
     lastI = drawI;
    }
else
    {
     if (hoverAlpha > 0) {hoverAlpha = lerp(hoverAlpha, 0, 0.1);}    
    }
    
clr(c_white, min(hoverAlpha, oHUD.hudAlpha));
if (lastI != -1) 
    {
    s = dialogueParse(pointListText[| lastI]);
    fnt(fntPixelTiny);
    
    clr(c_black, min(0.4, hoverAlpha, oHUD.hudAlpha));
    draw_roundrect(x - 2, y - string_height(pointListText[| lastI]), x + string_width(s) + 2, y - 2, false);  
    clr(c_black, min(hoverAlpha, oHUD.hudAlpha));
    draw_roundrect(x - 2, y - string_height(pointListText[| lastI]), x + string_width(s) + 2, y - 2, true);  

    clr(c_white, min(hoverAlpha, oHUD.hudAlpha));
    draw_text_colored(x + 2, y - string_height(pointListText[| lastI]), pointListText[| lastI]);
    
    }
}
/*
//DEBUG

if (mouse_check_button_pressed(mb_left) && mouse_in(view_xview+(800-width),view_yview+(600-height),view_xview+(800),y+height))
{
show_message("Minimap zoom");

 if (zoom_level < 3) 
 {
 zoom_level++;
 zoom_x -= 100;
 zoom_y -= 75;

 } else {zoom_level = 1; zoom_x = 800; zoom_y = 600;}

}
*/
}

if (instance_number(oPlayer) > 0)
   { 
   if (oPlayer.can_move2)
      {
      if (keyboard_check_pressed(ord(action_key))) {draw = !draw;}
      }
   }
