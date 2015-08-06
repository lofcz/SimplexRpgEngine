#define inventoryDraw
/// inventoryDraw(x,y)

xx             = x;
yy             = y;
hover          = 0;
hover_id       = 0;
hover_x        = 0;
hover_y        = 0;
pre_switch     = 0;

 if(combine)
 {
 if (c_a < 0.1) {c_a += 0.01;}
 }
 else {c_a = 0;}

for (a=0; a<array_height_2d(slot); a++)
{

/* 
 clr(c_white);
 draw_rectangle(xx,yy,xx+32,yy+32,0);
*/
 draw_sprite(sSlotTexture,0,xx,yy);
 clr();
 draw_rectangle(xx,yy,xx+32,yy+32,1);
 



                                                                                          //draw_text(xx,yy,slot[0,inv_slot_stackable]);
 draw_sprite(sRarityEffect,itemRarityEffect(slot[a,inv_item_effect]),xx,yy); 
 draw_sprite(slot[a,inv_sprite],slot[a,inv_sprite_number],xx,yy);
 //draw_text(xx,yy,slot[a,inv_id]); 
                                                                                          //  draw_text(xx,yy,slot[a,inv_item_equip_slot]);
                                                                                   
 
 if (slot[a,inv_slot_stackable] = 1)
    {
     scrValueIndex(slot[a,inv_number],a);
    }

   
 clr(c_yellow,0.7);
 if (mouse_x > xx && mouse_x < xx+32 && mouse_y > yy && mouse_y < yy+32)
 {  
 if (!proceed)
  { 
   draw_rectangle(xx,yy,xx+32,yy+32,0);  
  }

  hover    = 1;
 hover_id = a;
 hover_x  = xx;
 hover_y  = yy;
 
 hover_x_stand = hover_x;
 hover_y_stand = hover_y;

 


 } 
 clr();
 
if(combine)
 { 
  if (a = combine_default_slot) {clr(c_yellow,c_a*3); draw_rectangle(xx,yy,xx+32,yy+32,0) clr();}
  if (inventoryCombinations(slot[combine_default_slot,inv_id],slot[a,inv_id]) && a != combine_default_slot ) {clr(c_lime,c_a*3); draw_rectangle(xx,yy,xx+32,yy+32,0) clr();}
  else if (a != combine_default_slot) {clr(c_red,c_a); draw_rectangle(xx,yy,xx+32,yy+32,0) clr();}
  
  if (mouse_check_button_pressed(mb_left)) 
     {
      if (mouse_x > xx && mouse_x < xx+32 && mouse_y > yy && mouse_y < yy+32)
 {  

     id1 = slot[combine_default_slot,inv_id];
     id2 = slot[hover_id,inv_id];   
     show_message("Id1: "+string(id1)+string("#Id2: ")+string(id2)+string("##Slot1: ")+string(combine_default_slot)+string("#Slot2: ")+string(hover_id));     
     
     inventoryCombine(id1,id2,combine_default_slot,hover_id);
     combine = 0;
 }     
     
     } 
 }    
    
 xx+=32;
 if (xx > x+256) {yy+=32; xx=x;}

}
used_y = yy;

/*
clr(c_white)
draw_rectangle(x,used_y+128,x+256+32,used_y+256,0);
clr();
draw_rectangle(x,used_y+128,x+256+32,used_y+256,1);
*/
clr();
draw_sprite(sInfoboxTexture,0,x,used_y+128);
draw_rectangle_colour(x+1,used_y+128,x+287,used_y+255,c_black,c_black,c_black,c_black,1);

if (hover = 1)
  {
   draw_set_halign(fa_center);
   draw_set_valign(fa_middle);
   
   clr(slot[hover_id,inv_item_info_color]);
   draw_text(x+128,used_y+128+8,slot[hover_id,inv_item_info_head]);
   clr();
   
      if (slot[hover_id,inv_slot_stackable] = 1)
      {
      draw_text_colour(x+256+16,used_y+245,"x"+string(slot[hover_id,inv_number]),c_black,c_black,c_black,c_black,1)
      }
  
   draw_set_halign(fa_left);
   draw_set_valign(fa_top);
   
  
   draw_text_colored(x+4,used_y+128+24,slot[hover_id,inv_item_info_text]);
   inventoryDrawStats(string_height(slot[hover_id,inv_item_info_text]));
                                                                          //  for(a=0 a<10 a++) { draw_text(x+4,used_y+196+a*16,slot_option[hover_id,a]); }
  }

 
  
       if (mouse_x > hover_x && mouse_x < hover_x+32 && mouse_y > hover_y && mouse_y < hover_y+32)
       {
  
        if(mouse_check_button_pressed(mb_right))
        {
        proceed = !proceed;
        
        hover_xx = hover_x;
        hover_yy = hover_y;
        hover_idd = hover_id;  
        
        h_dec_x = view_xview;
        h_dec_y = view_yview;        
        }
        if (mouse_check_button_pressed(mb_left) && drag = 0 && proceed = 0 && slot[hover_id,inv_id] != 0)
           {
            h_c = hover_id;
            drag = 1;
            drag_controll = 1;

            
            for (a = 0; a<inv_atributes_total; a++)
            {
             switch_temp[0,a]   = slot[hover_id,a];
             switch_slot        = hover_id;
             temp_equip[a]      = slot[hover_id,a];         
          

             
             if (a!=inv_item_equip_slot)
             { 
             if (a = inv_sprite) {equip_sprite_s[0] = slot[hover_id,a]; }
             if (a = inv_sprite_number) {equip_sprite_s[1] = slot[hover_id,a]; }
             if (a = inv_item_effect) {equip_sprite_s[2] = slot[hover_id,a]; }
             if (a = inv_id) {use_this_id = a;}
           
             
                if(a!= inv_item_info_head && a!= inv_item_info_text && a!= inv_options && a!= inv_item_equip_slot)
                   {
                   slot[hover_id,a] = 0;
                   }
                   else {slot[hover_id,a] = "";}  
                   
                 if (a = inv_sprite) {slot[hover_id,a] = sFreeSlot;}    
             }
            } 

           draw_item_mouse = 1;
           
            for (b = 0; b<10; b++)
                {
                 switch_option[0,b] = slot_option[hover_id,b];
                   temp_option[a]   = slot_option[hover_id,b]

                }
         for(d=0; d<celkem_vlastnosti; d++)
          {
           temp_vlastnosti[0,d] = slot_vlastnosti[hover_id,d];
          }

           
           
           }
       if (mouse_check_button_released(mb_left) && drag = 1 && proceed = 0)
          {
          
          if (!inventorySwitchPre())
          {
            drag          = 0;
            drag_controll = 0;


            for (a = 0; a<inv_atributes_total; a++)
            {
             switch_temp[1,a] = slot[hover_id,a];
             
                if(a!= inv_item_info_head && a!= inv_item_info_text && a!= inv_options && a!= inv_item_equip_slot)
                   {
                   slot[hover_id,a] = 0;
                   }
                   else {slot[hover_id,a] = "";}     
                  
               slot[switch_slot,a] = switch_temp[1,a]; 
               slot[hover_id,a]    = switch_temp[0,a]; 


            }
            for (b = 0; b<10; b++)
                {
                 switch_option[1,b] = slot_option[hover_id,b];
                
                }
                
            for(c = 0; c<10; c++)
                  {
                   slot_option[switch_slot,c] = switch_option[1,c];
                   slot_option[hover_id,c] = switch_option[0,c];

                  }
                  
          for(d=0; d<celkem_vlastnosti; d++)
          {
           slot_vlastnosti[hover_id,d] = slot_vlastnosti[switch_slot,d];
           slot_vlastnosti[switch_slot,d] =  temp_vlastnosti[0,d]; 
          
          }

             draw_item_mouse = 0;
             drag_alpha      = 1;
             h_c = hover_id; // !!!!!!!!!!!!!     (ok)
             }
             else
                 {
                 
                 }
          }
       }
       else
           {
            if (mouse_check_button_released(mb_left))
               {
                if (drag = 1)
                   {
                   drag  = 0;
         
                                                                                          //show_message("Drag em to hell!");
                    
                   for (a = 0; a<inv_atributes_total; a++)
                   {           
                   slot[switch_slot,a] = switch_temp[0,a];      
                   }
         
                
                   for(c = 0; c<10; c++)
                  {
                   slot_option[switch_slot,c] = switch_option[0,c];           
                  }
                  
                  draw_item_mouse = 0;
                  drag_alpha      = 1;
                 
                   }
               }
           
           
           
           }
if (draw_item_mouse)
   {
    if (drag_alpha > 0.5) {drag_alpha -= 0.05;}
    draw_sprite_ext(switch_temp[0,inv_sprite],switch_temp[0,inv_sprite_number],mouse_x-16,mouse_y-16,1,1,0,c_white,drag_alpha);  
    clr(c_black,1);
    if (switch_temp[0,inv_slot_stackable])
       {
        draw_text(mouse_x,mouse_y,switch_temp[0,inv_number]);
       }         
   }  
       
            
       if (proceed = 1)
          {
           inventoryDrawOptionbox()
           
           if (mouse_x > min_x && mouse_x < max_x && mouse_y > min_y && mouse_y < max_y)
              {
               
              }
              else 
                   {
                   proceed = 0;
                                                                                                                                                          //show_message("Out of min/max x/y");

                   }
          }
      
   

#define inventoryDrawStats
/// inventoryDrawStats(string_height_item_text)

height = argument0;
t_text = "#";

for(a = 0; a < celkem_vlastnosti; a++)
      {
      if (slot[hover_id,inv_id] = 0) {break;}      

       if (slot_vlastnosti[hover_id,a] > 0)
          {
           switch(a)
                    {
                     case(vlastnost_poskozeni):
                         {
                           t_text += "Poškození: "+string(slot_vlastnosti[hover_id,a]);
                           break;                                                                   
                         }
                     
                    
                    }                    
          }      
      }

draw_text(x+4,used_y+128+24+height,t_text);

