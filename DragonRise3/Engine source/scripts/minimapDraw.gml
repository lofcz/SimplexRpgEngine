/// minimapDraw()

if (draw)
{
x1       = 0;
y1       = 0;
x2       = zoom_x;
y2       = zoom_y;
m_alpha  = 1;
x        = view_xview+(800-width);
y        = view_yview+(600-height);

if (instance_number(oPlayer) > 0)
   { 
   if (oPlayer.can_move2)
      {
      if (keyboard_check_pressed(ord(action_key))) {draw = !draw;}
      }
   }
   
if (instance_number(oPlayer) > 0 && draw) 
{
m_alpha = 1;

draw_set_alpha(0.3)
draw_set_color(c_green)
draw_rectangle(x,y,x+width,y+height,0)
draw_set_color(c_black)
draw_set_alpha(1)
draw_rectangle(x,y,x+width-1,y+height-1,1)
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
   
   draw_set_alpha(m_alpha);
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
   
   draw_set_alpha(m_alpha);
   draw_rectangle_colour(oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex),oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey),oMinimap.x+((x-oMinimap.x1)*oMinimap.sizex)+4,oMinimap.y+((y-oMinimap.y1)*oMinimap.sizey)+4,m_color,m_color,m_color,m_color,0);
   draw_set_alpha(1);
   }
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
