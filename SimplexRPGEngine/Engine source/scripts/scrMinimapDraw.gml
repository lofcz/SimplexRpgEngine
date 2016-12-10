#define scrMinimapDraw
/// scrMinimapDraw()

/// Draw Surface to Screen

// Check for surface before drawing, it could be dead already. Should not happen, but can.

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
draw_set_circle_precision(64);
draw_set_alpha(min(0.3, oHUD.hudAlpha))
draw_set_color(c_black)
//draw_circle(x + (width / 2),y + (width / 2), width, false);//
draw_roundrect_ext(x,y,x+width-1,y+height-2,256, 256, false);
draw_set_color(c_black)
draw_set_alpha(min(1, oHUD.hudAlpha))
//draw_circle(x + (width / 2),y + (width / 2), width, true);//
draw_roundrect_ext(x,y,x+width-2,y+height-2,256,256,true)
draw_set_circle_precision(24);






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
if (oInventory.draw_inventory) {iconAlpha[0] = lerp(iconAlpha[0], 0.5, 0.1);}
else {iconAlpha[0] = lerp(iconAlpha[0], 0, 0.1);}
if (oBestiar.activated) {iconAlpha[1] = lerp(iconAlpha[1], 0.5, 0.1);}
else {iconAlpha[1] = lerp(iconAlpha[1], 0, 0.1);}

scrMinimapDrawIcon(0, sInventory, x + 100, y + 195, 20, 3);
scrMinimapDrawIcon(1, sBestiary,  x + 152, y + 180, 20, 2);
scrMinimapDrawIcon(2, sQuestIcon, x + 185, y + 140, 20, 2);
scrMinimapDrawIcon(3, sStatus,    x + 45, y + 20, 20, 2);

scrMinimapDrawTool(sZoomInIcon,  x + 155, y + 20);
scrMinimapDrawTool(sZoomOutIcon, x + 178, y + 40);


/*
draw_set_alpha(min(1, oHUD.hudAlpha))      
draw_set_color(c_gray)             
draw_circle_colour(x + 100, y + 195, 14, c_gray, c_dkgray, false);
draw_sprite_stretched(sInventory, 0, x + 100 - 11, y + 195 - 12, 26, 26); 
draw_set_color(c_black)             
draw_circle(x + 100, y + 195, 14, true);
draw_set_alpha(min(1, oHUD.hudAlpha))*/

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
#define scrMinimapDrawIcon
/// scrMinimapDrawIcon(index, sprite, x, y, iconSize, offset)

var i, s, xx, yy, is, o;
i  = 0;
s  = sInventory;
xx = x;
yy = y;
is = 26;
o  = 0;

if (argument_count > 0) {i  = argument[0];}
if (argument_count > 1) {s  = argument[1];}
if (argument_count > 2) {xx = argument[2];}
if (argument_count > 3) {yy = argument[3];}
if (argument_count > 4) {is = argument[4];}
if (argument_count > 5) {o  = argument[5];}


clr(c_black, min(1, oHUD.hudAlpha));               
draw_circle_colour(xx, yy, 14, c_gray, c_dkgray, false);
draw_sprite_stretched(s, 0, xx - 11 + o, yy - 12 + o, is, is);   
clr(-1, min(oHUD.hudAlpha, iconAlpha[i])); 
draw_circle_colour(xx, yy, 14, c_white, c_white, false);   
clr(c_black, min(1, oHUD.hudAlpha));       
draw_circle(xx, yy, 14, true);


#define scrMinimapDrawTool
/// scrMinimapDrawTool(sprite, x, y)

var s, xx, yy
s  = 1;
xx = x;
yy = y;

if (argument_count > 0) {s  = argument[0];}
if (argument_count > 1) {xx = argument[1];}
if (argument_count > 2) {yy = argument[2];}

clr(c_black, min(1, oHUD.hudAlpha));               
draw_circle_colour(xx, yy, 10, c_gray, c_dkgray, false);
draw_sprite_stretched(s, 0, xx - 5, yy - 5, 12, 12);     
clr(c_black, min(1, oHUD.hudAlpha));       
draw_circle(xx, yy, 10, true);

