/// @description Insert description here
// You can write your code in this editor

event_inherited();

draw_self();

if (!v_alive)
{
    if (image_xscale > 0)
       {
        image_xscale -= 0.1;
        image_yscale = image_xscale;
       }
       else {instance_destroy();}	
}