/// scrChestState(activeDis, openDis, openChar)

active_dis = 64;
open_dis   = 32;
open_char  = "E";

if (argument_count > 0) {active_dis = argument[0];}
if (argument_count > 1) {open_dis   = argument[1];}
if (argument_count > 2) {open_char  = argument[2];}

if (instance_number(oPlayer) > 0)
   {
    if (distance_to_object(oPlayer) < active_dis)
       {   
        if (distance_to_object(oPlayer) < open_dis && keyboard_check_pressed(ord(open_char)))
           {
            if (unlocked)
               {
                open = !open;
                if (open) {image_speed = 0.3;}
                else {image_speed = -0.3;}
                text_alpha = 0;
               }
           }
       else if (distance_to_object(oPlayer) > open_dis) {open = 0;}
      }
   }
