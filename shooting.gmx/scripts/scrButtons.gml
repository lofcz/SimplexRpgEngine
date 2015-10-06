// tlačítka pro přechod do hry

image_speed = 0;
var rom = argument0;

if (distance_to_point(mouse_x,mouse_y) = 0)
{
 image_index = 1;
 if mouse_check_button(mb_left)
{ 
 room_goto(argument0);
}
}
else
{
 image_index = 0;
}