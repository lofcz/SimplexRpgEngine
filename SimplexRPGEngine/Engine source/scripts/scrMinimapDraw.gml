#define scrMinimapDraw
/// scrMinimapDraw()

/// Draw Surface to Screen

// Check for surface before drawing, it could be dead already. Should not happen, but can.
if (surface_exists(oSurface))
{
    // Draw the surface first. But, since this surface is quite big, we are going to scale it down a bit and draw it to the top left on the screen.
     //shader_set(shdCircle);
 //    draw_set_blend_mode(bm_subtract);
  //   draw_surface_stretched( oSurface, view_xview+40, view_yview+40, 512, 512);
    // draw_sprite(sLightGradient, 0, 40, 40);
   //  draw_set_blend_mode(bm_normal);
 //    shader_reset();
 //   // Save the old color that was set
  //  var old = draw_get_color();

    // Get us a nice red
  //  draw_set_color(c_red);

    // Draw a red rectangle around it, so we can even better distinguish it from the actual room.
 //   draw_rectangle( 40, 40, room_width/8+40, room_height/8+40, true);

    // Set the old draw color
  //  draw_set_color(old);
}

if (draw)
{
x        = view_xview+(view_wview - width);
y        = view_yview;

clr(c_black, 0.5);
rr = (r / 2);
//draw_circle(x + rr, y + rr, r, false);
clr();
//draw_circle(x + rr, y + rr, r, true);


scrMinimapProcessInstance(oPlayer);

clr(c_blue, 1);
draw_circle(x + returnArray[0], y + returnArray[1], 16, false);



if (drawMode == 0)
{
x1       = 0;
y1       = 0;
x2       = zoom_x;
y2       = zoom_y;
m_alpha  = 1;

   
if (instance_number(oPlayer) > 0 && draw) 
{
m_alpha = min(1, oHUD.hudAlpha);

//shader_set(shdCircle);

draw_set_alpha(min(0.3, oHUD.hudAlpha))
draw_set_color(c_black)
//draw_circle(x + (width / 2),y + (width / 2), width, false);//
draw_roundrect_ext(x,y,x+width-1,y+height-2,256, 256, false);
draw_set_color(c_black)
draw_set_alpha(min(1, oHUD.hudAlpha))
//draw_circle(x + (width / 2),y + (width / 2), width, true);//
draw_roundrect_ext(x,y,x+width-2,y+height-2,256,256,true)


draw_set_alpha(min(1, oHUD.hudAlpha))      
draw_set_color(c_gray)
             
draw_circle(x + 100, y + 195, 16, false);
draw_set_color(c_black)
             
draw_circle(x + 100, y + 195, 16, true);

draw_set_alpha(min(1, oHUD.hudAlpha))




//shader_reset();

//draw_sprite_stretched(screenSave, 0, x, y, 128, 128);

draw_set_color(c_aqua)

with (oPlayer)
{
if x>oMinimap.x1
if y>oMinimap.y1
if x<oMinimap.x2
if y<oMinimap.y2

dx = oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex);
dy = oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey);

if (point_in_circle(dx, dy, oMinimap.x + 100, oMinimap.y + 100, 96))
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
    if (pointListMap[| i] == room)
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


if (drawMode == 1)
{

view_visible[1] = true;

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
     show_message(string(pointListMap[| i]));
     if (pointListMap[| i] == room)
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

//DEBUG

if (mouse_check_button_pressed(mb_left))
{
drawMode = 0;
}

}

}

if (instance_number(oPlayer) > 0)
   { 
   if (oPlayer.can_move2)
      {
      if (keyboard_check_pressed(ord(action_key))) {draw = !draw;}
      }
   }

#define scrMinimapProcessInstance
/// scrMinimapProcessInstance(instance)

var i, qx, qy;
i = -1;

if (argument_count > 0) {i = argument[0];}

if (instance_exists(i))
   {
    qx = ((zoomFactor / room_width)  * i.x);
    qy = ((zoomFactor / room_height) * i.y);    
   }
   
returnArray[0] = qx;
returnArray[1] = qy;