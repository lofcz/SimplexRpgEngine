/// itemDraw()


if (loot)
{
if (instance_number((drop_id)) > 0)
{
f = (drop_id).open
}

}



if (p = 1)
{
if (loot) {draw_sprite(sRarityEffect,itemRarityEffect(itm_info_color),x,y);}
draw_self();

if (show_number)
{
draw_text(x+24,y+16,itm_number);
                                                                                                                        //draw_text(x,y+16,itm_stackable);
}
}


if (loot = 1)   
   {
   
    if (instance_number((drop_id)) > 0)
      {
      if (f = 1)
       {
                                                                                                                        //effect_create_above(ef_ring,x,y-80,1,c_green);
       p = 1;
       }
      if (f = 0)
           {
                                                                                                                       //effect_create_above(ef_ring,x,y+80,1,c_red);
            p = 0;
           }
      }
      else {p = 1;}
   }

if (hover_info && p = 1 )
   {
   
  
   
     if (distance_to_point(mouse_x,mouse_y) = 0)
        {
         depth = -2;
         if (instance_number(oItemText) = 0) {i = instance_create(x,y,oItemText); i.parent = (id);}
                                                                                                                        //itemDrawStats()
        
         if (mouse_check_button_pressed(mb_left))
            {
            if (on_click)
               {
               if (instance_number(oItemText) > 0) {with(oItemText) {instance_destroy();}}
               
               inventoryPickUp();
               (drop_id).fill[slot] = 0;
               }            
            }
        }
        else {depth = -1;}
   
   }