#define scrMinimapDraw
/// scrMinimapDraw()

/// Draw Surface to Screen

// Check for surface before drawing, it could be dead already. Should not happen, but can.
if (draw)
{
x = view_xview+(view_wview - width);
y = view_yview;

if (drawMode == 0)
{
x1              = max(view_xview - minimapZoom, 0);
y1              = max(view_yview - minimapZoom, 0);
x2              = min(view_xview + view_wview + minimapZoom, room_width);
y2              = min(view_yview + view_hview + minimapZoom, room_height);
m_alpha         = 1;

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
clr(c_aqua, -1);

// Draw points on map
with (oPlayer)
{
    dx = oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex);
    dy = oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey);
    
    if (point_in_circle(dx, dy, oMinimap.x + 100, oMinimap.y + 100, 96)) {draw_circle(dx,dy,2,false);}
}

with (parEnemy)
{
m_alpha = 5-(distance_to_object(oPlayer)/100);

if (m_alpha > 0.02)
{
    dx = oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex);
    dy = oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey);

    clr(-1, min(m_alpha, oHUD.hudAlpha));
    if (point_in_circle(dx, dy, oMinimap.x + 100, oMinimap.y + 100, 96)) {draw_circle_colour(oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex),oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey),2,c_red, c_red,false);}
}
}


with (parTree)
{
m_alpha = 5-(distance_to_object(oPlayer)/100);

if (m_alpha > 0.02)
{
    dx = oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex);
    dy = oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey);

    clr(-1, min(m_alpha, oHUD.hudAlpha));
    if (point_in_circle(dx, dy, oMinimap.x + 100, oMinimap.y + 100, 96)) {draw_rectangle_colour(oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex),oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey),oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex)+4,oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey)+4,m_color,m_color,m_color,m_color,0);}
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
     dx = oMinimap.x+(( pointListX[| i]-oMinimap.x1)*oMinimap.sizex);
     dy = oMinimap.y+((pointListY[| i]-oMinimap.y1)*oMinimap.sizey);
     
     if (point_in_circle(dx, dy, oMinimap.x + 100, oMinimap.y + 100, 96)) {if (pointListSprite[| i] != -1) {draw_sprite_ext(sMinimapIcons, pointListSprite[| i], dx, dy, 0.5, 0.5, 0, c_white, min(1, oHUD.hudAlpha));}}
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

// Hp  + shield bar
draw_ring_part(x + 101, y + 100, 100, 5, 32, 32, -90, 90, -1, c_black, false, oHUD.hudAlpha);
draw_ring_part(x + 102, y + 100, 100, 4, 32, 32, -90, 90, -1, c_red, false, oHUD.hudAlpha);
draw_ring_part(x + 102, y + 100, 100, 4, 32, 32, -90, 90 * (oPlayer.last_hp / apiPlayerGetPropertyValue(vlastnost_max_zivot)), -1, c_lime, false, oHUD.hudAlpha);
draw_ring_part(x + 102, y + 100, 100, 4, 32, 32, -90, 90 * (oPlayer.last_stit / apiPlayerGetPropertyValue(vlastnost_max_stit)), -1, c_yellow, false, min(oHUD.hudAlpha, 0.5));
                                               
clr(c_black, -1);
draw_line(x - 5, y + 100, x, y + 100);

// Mp bar
draw_ring_part(x + 101, y + 100, 100, 5, 32, 32, -180, 90, -1, c_black, false, oHUD.hudAlpha);
draw_ring_part(x + 102, y + 100, 100, 4, 32, 32, -180, 90, -1, c_red, false, oHUD.hudAlpha);
draw_ring_part(x + 102, y + 100, 100, 4, 32, 32, -180, 90 * (oPlayer.last_mana / apiPlayerGetPropertyValue(vlastnost_max_mana)), -1, c_blue, false, oHUD.hudAlpha);

// Stamina bar
draw_ring_part(x + 100, y + 100, 95, 2, 32, 32, -90, 180 * min((oPlayer.last_stamina / apiPlayerGetPropertyValue(vlastnost_max_stamina)), 1), 1, make_color_rgb(255,255,0), false, min(oHUD.hudAlpha, 0.3));

scrMinimapDrawIcon(0, sInventory, x + 100, y + 195, 20, 3);
scrMinimapDrawIcon(1, sBestiary,  x + 152, y + 180, 20, 2);
scrMinimapDrawIcon(2, sQuestIcon, x + 185, y + 140, 20, 2);
scrMinimapDrawIcon(3, sStatus,    x + 45, y + 20, 20, 2);

scrMinimapDrawTool(sZoomInIcon,  x + 155, y + 20, 0);
scrMinimapDrawTool(sZoomOutIcon, x + 178, y + 40, 1);

/*
draw_set_alpha(min(1, oHUD.hudAlpha))      
draw_set_color(c_gray)             
draw_circle_colour(x + 100, y + 195, 14, c_gray, c_dkgray, false);
draw_sprite_stretched(sInventory, 0, x + 100 - 11, y + 195 - 12, 26, 26); 
draw_set_color(c_black)             
draw_circle(x + 100, y + 195, 14, true);
draw_set_alpha(min(1, oHUD.hudAlpha))*/

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
clr(-1, min(oHUD.hudAlpha, iconAlpha[i])); 
draw_circle_colour(xx, yy, 14, c_white, c_white, false); 
clr(c_black, min(1, oHUD.hudAlpha));  
draw_sprite_stretched(s, 0, xx - 11 + o, yy - 12 + o, is, is);          
draw_circle(xx, yy, 14, true);


#define scrMinimapDrawTool
/// scrMinimapDrawTool(sprite, x, y, index)

var s, xx, yy, i
s  = 1;
xx = x;
yy = y;
i  = 0;

if (argument_count > 0) {s  = argument[0];}
if (argument_count > 1) {xx = argument[1];}
if (argument_count > 2) {yy = argument[2];}
if (argument_count > 3) {i  = argument[3];}

clr(c_black, min(1, oHUD.hudAlpha));               
draw_circle_colour(xx, yy, 10, c_gray, c_dkgray, false);
draw_sprite_stretched(s, 0, xx - 5, yy - 5, 12, 12);     
clr(c_black, min(1, oHUD.hudAlpha));       
draw_circle(xx, yy, 10, true);

if (mouse_check_button_pressed(mb_left))
   {
    if (point_in_circle(mouse_x, mouse_y, xx, yy, 10))
       {
        if (i == 0) {oMinimap.minimapZoom -= 100;}
        if (i == 1) {oMinimap.minimapZoom += 100;}  
        x1              = 0 - minimapZoom;
y1              = 0 - minimapZoom;
x2              = 0 + view_wview + minimapZoom;
y2              = 0 + view_hview + minimapZoom;
lenx            = x2-x1;
leny            = y2-y1;
sizex           = width/lenx;
sizey           = height/leny;
      
       }
   }



