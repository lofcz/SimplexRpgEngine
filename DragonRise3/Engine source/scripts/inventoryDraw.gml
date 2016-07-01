#define inventoryDraw
/// inventoryDraw(x,y)

xx             = x;
yy             = y+36;
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
 
 clr();
 draw_set_font(fntPixelHuge);
 draw_sprite(sInventoryTitle,0,x,y);
 scrCenterText();
 draw_text(x+144,y+16,inventory_title);
 draw_set_font(fntPixel);
// draw_text(x+144,y+24,oPlayer.gold);
 scrCenterText(0);
 draw_set_font(fntText);
 
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

   if (!proceed)
  { 
   clr(c_yellow,hover_slot_alpha[a]);
   draw_rectangle(xx,yy,xx+32,yy+32,0);  
  }
  
 if (mouse_x > xx && mouse_x < xx+32 && mouse_y > yy && mouse_y < yy+32)
 {  

  if (hover_slot_alpha[a] < 0.5) {hover_slot_alpha[a] += 0.03;}
  hover    = 1;
 hover_id = a;
 hover_x  = xx;
 hover_y  = yy;
 
 hover_x_stand = hover_x;
 hover_y_stand = hover_y;

 


 } 
 else {if (hover_slot_alpha[a] > 0) {hover_slot_alpha[a] -= 0.03}}
 
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

 if (hover_id != combine_default_slot)
 {
     id1 = slot[combine_default_slot,inv_id];
     id2 = slot[hover_id,inv_id];   
                                                                                           //show_message("Id1: "+string(id1)+string("#Id2: ")+string(id2)+string("##Slot1: ")+string(combine_default_slot)+string("#Slot2: ")+string(hover_id
     
      inventoryCombine(id1,id2,combine_default_slot,hover_id);
     combine = 0;
 }
 }     
     
     } 
 }    

 draw_sprite(sSlotOutline,0,xx,yy);
 if (slot[a,inv_item_star] = 1) {draw_sprite(sRarityEffect,5,xx,yy);}
 
 xx+=36;//32
 if (xx > x+256) {yy+=36; xx=x;} //32

}
used_y = yy;

/*
clr(c_white)
draw_rectangle(x,used_y+128dr,x+256+32,used_y+256,0);
clr();
draw_rectangle(x,used_y+128,x+256+32,used_y+256,1);
*/
draw_set_font(fntTextBold);

  if (proceed) {hover_alpha = 1;}
  clr(c_black,hover_alpha);

draw_sprite(sInfoboxTexture,0,x,used_y+128);
draw_rectangle_colour(x+2,used_y+128,x+287,used_y+322,c_black,c_black,c_black,c_black,1);

clr(c_black,hover_alpha/2);
//  draw_roundrect_ext(x,used_y+128,x+287,used_y+128+28,16,16,0);
clr(c_black,hover_alpha);  
//  draw_roundrect_ext(x,used_y+128,x+287,used_y+128+28,16,16,1);
  
if (hover = 1)
  {
  if (slot[hover_id,inv_item_info_head] != "") { if (hover_alpha < 1) {hover_alpha += 0.1;} } else {if (hover_alpha > 0 && !proceed) {hover_alpha -= 0.1;} }

  
  scrCenterText();

   if (!proceed) {f = hover_id;}
   else {f = hover_idd;}
  if (proceed) {hover_alpha = 1;}  
   clr(slot[f,inv_item_info_color],hover_alpha);
   scrCenterText();
   draw_text(x+128,used_y+128+12,slot[f,inv_item_info_head]);
   clr(c_black,hover_alpha);
      
draw_set_font(fntText);
  
      if (slot[f,inv_slot_stackable] = 1)
      {
      draw_text_colour(x+256+8,used_y+137,"x"+string(slot[f,inv_number]),c_black,c_black,c_black,c_black,1);
      }
 
 scrCenterText(0);
   
  
   draw_text_colored(x+4,used_y+128+24,slot[f,inv_item_info_text]);
   inventoryDrawStats(string_height(slot[f,inv_item_info_text]));
   clr();                                                                      //  for(a=0 a<10 a++) { draw_text(x+4,used_y+196+a*16,slot_option[hover_id,a]); }
  }
  else {if (hover_alpha > 0) {hover_alpha -= 0.1;}}
clr();   
  
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
t_text = "";



if (!proceed) {f = hover_id;}
else {f = hover_idd;}

for(a = 0; a < celkem_vlastnosti; a++)
      {
      if (slot[f,inv_id] = 0) {break;}      

       if (slot_vlastnosti[f,a] > 0)
          {
           switch(a)
                    {
                     case(vlastnost_poskozeni):
                         {
                           t_text += "#Poškození: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_max_zivot):
                         {
                           t_text += "#Život: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_stamina_cost):
                         {
                           t_text += "#Stamina za úder: -"+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_mana):
                         {
                           t_text += "#Mana: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_sila):
                         {
                           t_text += "#Síla: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_obratnost):
                         {
                           t_text += "#Obratnost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_kovarstvi):
                         {
                           t_text += "#Kovářství: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tezarstvi):
                         {
                           t_text += "#Těžařství: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_odolnost):
                         {
                           t_text += "#Odolnost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_vytrvalost):
                         {
                           t_text += "#Vytrvalost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_presnost):
                         {
                           t_text += "#Přesnost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_rychlost):
                         {
                           t_text += "#Rychlost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zrucnost):
                         {
                           t_text += "#Zručnost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_svadeni):
                         {
                           t_text += "#Svádění: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zastrasovani):
                         {
                           t_text += "#Zastrašování: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_dustojnost):
                         {
                           t_text += "#Důstojnost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_vyrecnost):
                         {
                           t_text += "#Výřečnost: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_elegance):
                         {
                           t_text += "#Elegance: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_cest):
                         {
                           t_text += "#Čest: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                         
                    case(vlastnost_kapsarstvi):
                         {
                           t_text += "#Kapsářství: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_paceni_zanmku):
                         {
                           t_text += "#Páčení zámků: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_vule):
                         {
                           t_text += "#Vůle: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_inteligence):
                         {
                           t_text += "#Inteligence: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_ritualy):
                         {
                           t_text += "#Rituály: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tradicni_magie):
                         {
                           t_text += "#Tradiční magie: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_astralni_videni):
                         {
                           t_text += "#Astrální vidění: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_mece):
                         {
                           t_text += "#Meče: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_dyky):
                         {
                           t_text += "#Dýky: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_luky):
                         {
                           t_text += "#Lukostřelba: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_kopi):
                         {
                           t_text += "#Kopí: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                     case(vlastnost_jednorucni):
                         {
                           t_text += "#Jednoruční zbraně: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_dvojrucni):
                         {
                           t_text += "#Dvojruční zbraně: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_stity):
                         {
                           t_text += "#Štíty: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vse):
                         {
                           t_text += "#Ochrana proti všem elementům: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_zeme):
                         {
                           t_text += "#Ochrana proti zemi: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_ohen):
                         {
                           t_text += "#Ochrana proti ohni: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_voda):
                         {
                           t_text += "#Ochrana proti vodě: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_temnota):
                         {
                           t_text += "#Ochrana proti temnotě: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                         
                     case(vlastnost_rezistence_svetlo):
                         {
                           t_text += "#Ochrana proti světlu: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vitr):
                         {
                           t_text += "#Ochrana proti vodě: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zivot):
                         {
                           t_text += "#Obnoví zdraví: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_mana):
                         {
                           t_text += "#Obnoví manu: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_stamina):
                         {
                           t_text += "#Obnoví výdrž: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                         
                    case(vlastnost_max_stamina):
                         {
                           t_text += "#Výdrž: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_sance):
                         {
                           t_text += "#Šance na kritický úder: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_nasobic):
                         {
                           t_text += "#Násobič kritického úderu: "+string(slot_vlastnosti[f,a])+"%";
                           break;                                                                   
                         }
                    case(vlastnost_stit):
                         {
                           t_text += "#Obnoví štít: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_stit):
                         {
                           t_text += "#Štít: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zkusenosti):
                         {
                           t_text += "#Přidá zkušenosti: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_zkusenosti):
                         {
                           t_text += "#Zvýší tkušenosti potřebné k dosažení další úravně: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_level):
                         {
                           t_text += "#Zváší úroveň: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina):
                         {
                           t_text += "#Zvýší rychlost obnovy výdrže: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina_add):
                         {
                           t_text += "#Zváší množství obnovené výdrže: "+string(slot_vlastnosti[f,a]);
                           break;                                                                   
                         }


                    
                    }                    
          }      
      }


draw_text(x+4,used_y+128+24+height,t_text);
#define inventoryDrawWrapper
/// inventoryDrawWrapper(x,y)

var tX,tY;

tX = view_xview;
tY = view_yview;

if (argument_count > 0) {tX = argument[0];}
if (argument_count > 1) {tY = argument[1];}


x = tX;
y = tY;
draw_set_font(fntText);

if (instance_number(oPlayer) > 0)
{ 
if (oPlayer.can_move2)
{
if (keyboard_check_pressed(ord("I")))
{
draw_inventory = !draw_inventory;
hover_alpha = 0;
} 
if (keyboard_check_pressed(ord("O")))
{
draw_equipment = !draw_equipment;
} 
if (keyboard_check_pressed(ord("Q")))
{
draw_quest = !draw_quest;
} 
}
}

if (draw_equipment = 1)
{
equipmentDraw();
}

if (draw_inventory = 1)
{
inventoryDraw();
}


if (draw = 1)
     {
     if (effect_scale < 1.2 && draw_inventory = 1) {effect_scale += 0.02;}
     draw_sprite_ext(sprite_index,0,view_xview+48+16,view_yview+560+16,effect_scale,effect_scale,0,c_black,0.7);
     draw_sprite(sprite_index,-1,view_xview+48+16,view_yview+560+16)
     }
     if (effect_scale > 1 && draw_inventory = 0) {effect_scale -= 0.02;}
 