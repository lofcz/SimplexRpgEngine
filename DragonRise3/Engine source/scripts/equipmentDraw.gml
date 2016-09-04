#define equipmentDraw
/// equipmentDraw()

xx = x+288;
yy = y;

if (instance_number(oPlayer) > 0)
{
equipmentDrawSlots();
}


#define equipmentDrawSlots
/// equipmentDrawSlots()

// Draw background

/*
clr(c_black,0.7);
draw_rectangle(xx+32,yy,xx+256,yy+256,0);
clr();
*/
clr();
 draw_set_font(fntPixelHuge);
 draw_sprite(sInventoryTitle,2,xx,yy);
 scrCenterText();
 draw_text(xx+124,yy+16,"Výstroj");
 draw_set_font(fntPixel);
// draw_text(x+144,y+24,oPlayer.gold);
 scrCenterText(0);
 draw_set_font(fntText);
 
yy = yy + 36;

draw_sprite_stretched(sUnknownBestiary, 0, xx, yy, 256, 256);
// Draw head slot --------------------------------------------------------------------------------------------------------------------------
if (oPlayer.equ_draw_head)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_head_x,yy+equ_axis_head_y);
if (oInventory.equiped[1] = 1) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[1,2]),xx+equ_axis_head_x,yy+equ_axis_head_y); }
else {draw_sprite(sEquipmentIcons,1,xx+equ_axis_head_x,yy+equ_axis_head_y);}
draw_sprite(equiped_image[1,0],equiped_image[1,1],xx+equ_axis_head_x,yy+equ_axis_head_y)


if (mouse_in(xx+equ_axis_head_x,xx+equ_axis_head_x+32,yy+equ_axis_head_y,yy+equ_axis_head_y+32))
   {
   draw_hover_block(xx+equ_axis_head_x,xx+equ_axis_head_x+32,yy+equ_axis_head_y,yy+equ_axis_head_y+32);

      if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[1] = 1) {equipmentUnequip(1);}
      }
      
    if (mouse_check_button_pressed(mb_right) && oInventory.equiped[1] = 1)
      {
       draw_equ_infobox = !draw_equ_infobox;
       if (draw_equ_infobox) {draw_equ_infobox_xx = xx+equ_axis_head_x; draw_equ_infobox_yy = yy+equ_axis_head_y; draw_equ_infobox_id = 1;}
      }
    

   }
draw_sprite(sSlotOutline,0,xx+equ_axis_head_x-2,yy+equ_axis_head_y-2);  
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "helma" )
   { 
   if (oInventory.equiped[1] = 0) {draw_hover_block(xx+equ_axis_head_x,xx+equ_axis_head_x+32,yy+equ_axis_head_y,yy+equ_axis_head_y+32,c_lime,0.5);}
   equipmentHoldEquip(1,xx+equ_axis_head_x,xx+equ_axis_head_x+32,yy+equ_axis_head_y,yy+equ_axis_head_y+32);
   }    
}
// Draw left plate slot  -
if (oPlayer.equ_draw_left_plate)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_left_plate_x,yy+equ_axis_left_plate_y);
if (mouse_in(xx+equ_axis_left_plate_x,xx+equ_axis_left_plate_x+32,yy+equ_axis_left_plate_y,yy+equ_axis_left_plate_y+32))
   {
   draw_hover_block(xx+equ_axis_left_plate_x,xx+equ_axis_left_plate_x+32,yy+equ_axis_left_plate_y,yy+equ_axis_left_plate_y+32);
   }

}
// Draw right plate slot 
if (oPlayer.egu_draw_right_plate)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_right_plate_x,yy+equ_axis_right_plate_y);
if (mouse_in(xx+equ_axis_right_plate_x,xx+equ_axis_right_plate_x+32,yy+equ_axis_right_plate_y,yy+equ_axis_right_plate_y+32))
   {
   draw_hover_block(xx+equ_axis_right_plate_x,xx+equ_axis_right_plate_x+32,yy+equ_axis_right_plate_y,yy+equ_axis_right_plate_y+32);
   }

}
// Draw body slot 
if (oPlayer.equ_draw_body)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_body_x,yy+equ_axis_body_y);
if (mouse_in(xx+equ_axis_body_x,xx+equ_axis_body_x+32,yy+equ_axis_body_y,yy+equ_axis_body_y+32))
   {
   draw_hover_block(xx+equ_axis_body_x,xx+equ_axis_body_x+32,yy+equ_axis_body_y,yy+equ_axis_body_y+32);
   }

}
// Draw right hand slot -------------------------------------------------------------------------------------------------------------------
if (oPlayer.equ_draw_right_hand)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_right_hand_x,yy+equ_axis_right_hand_y);
if (oInventory.equiped[0] = 1) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[0,2]),xx+equ_axis_right_hand_x,yy+equ_axis_right_hand_y); }
else {draw_sprite(sEquipmentIcons,0,xx+equ_axis_right_hand_x,yy+equ_axis_right_hand_y);}
draw_sprite(equiped_image[0,0],equiped_image[0,1],xx+equ_axis_right_hand_x,yy+equ_axis_right_hand_y)

if (mouse_in(xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32))
   {   
   draw_hover_block(xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32);
   
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[0]) {equipmentUnequip(0);}
      }
      
    if (mouse_check_button_pressed(mb_right) && oInventory.equiped[0] = 1)
      {
       draw_equ_infobox = !draw_equ_infobox;
       if (draw_equ_infobox) {draw_equ_infobox_xx = xx+equ_axis_right_hand_x; draw_equ_infobox_yy = yy+equ_axis_right_hand_y; draw_equ_infobox_id = 0;}
      }
    
   }
      
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "zbraň" )
   { 
   if (oInventory.equiped[0] = 0) {draw_hover_block(xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32,c_lime,0.5);}
   equipmentHoldEquip(0,xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32);
   }
}
// Draw left hand slot 
if (oPlayer.equ_draw_left_hand)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_left_hand_x,yy+equ_axis_left_hand_y);
if (mouse_in(xx+equ_axis_left_hand_x,xx+equ_axis_left_hand_x+32,yy+equ_axis_left_hand_y,yy+equ_axis_left_hand_y+32))
   {
   draw_hover_block(xx+equ_axis_left_hand_x,xx+equ_axis_left_hand_x+32,yy+equ_axis_left_hand_y,yy+equ_axis_left_hand_y+32);
   }

}
// Draw left ring1 slot 
if (oPlayer.equ_draw_left_ring1)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_left_ring1_x,yy+equ_axis_left_ring1_y);
if (mouse_in(xx+equ_axis_left_ring1_x,xx+equ_axis_left_ring1_x+16,yy+equ_axis_left_ring1_y,yy+equ_axis_left_ring1_y+16))
   {
   draw_hover_block(xx+equ_axis_left_ring1_x,xx+equ_axis_left_ring1_x+16,yy+equ_axis_left_ring1_y,yy+equ_axis_left_ring1_y+16);
   }

}
// Draw left ring2 slot 
if (oPlayer.equ_draw_left_ring2)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_left_ring2_x,yy+equ_axis_left_ring2_y);
if (mouse_in(xx+equ_axis_left_ring2_x,xx+equ_axis_left_ring2_x+16,yy+equ_axis_left_ring2_y,yy+equ_axis_left_ring2_y+16))
   {
   draw_hover_block(xx+equ_axis_left_ring2_x,xx+equ_axis_left_ring2_x+16,yy+equ_axis_left_ring2_y,yy+equ_axis_left_ring2_y+16);
   }

}
// Draw right ring1 slot 
if (oPlayer.equ_draw_right_ring1)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_right_ring1_x,yy+equ_axis_right_ring1_y);
if (mouse_in(xx+equ_axis_right_ring1_x,xx+equ_axis_right_ring1_x+16,yy+equ_axis_right_ring1_y,yy+equ_axis_right_ring1_y+16))
   {
   draw_hover_block(xx+equ_axis_right_ring1_x,xx+equ_axis_right_ring1_x+16,yy+equ_axis_right_ring1_y,yy+equ_axis_right_ring1_y+16);
   }

}
// Draw right ring2 slot 
if (oPlayer.equ_draw_right_ring1)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_right_ring2_x,yy+equ_axis_right_ring2_y);
if (mouse_in(xx+equ_axis_right_ring2_x,xx+equ_axis_right_ring2_x+16,yy+equ_axis_right_ring2_y,yy+equ_axis_right_ring2_y+16))
   {
   draw_hover_block(xx+equ_axis_right_ring2_x,xx+equ_axis_right_ring2_x+16,yy+equ_axis_right_ring2_y,yy+equ_axis_right_ring2_y+16);
   }

}
// Draw crown slot 
if (oPlayer.equ_draw_crown)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_crown_x,yy+equ_axis_crown_y);
if (mouse_in(xx+equ_axis_crown_x,xx+equ_axis_crown_x+32,yy+equ_axis_crown_y,yy+equ_axis_crown_y+32))
   {
   draw_hover_block(xx+equ_axis_crown_x,xx+equ_axis_crown_x+32,yy+equ_axis_crown_y,yy+equ_axis_crown_y+32);
   }
}
// Draw trophy1 slot 
if (oPlayer.equ_draw_trophy1)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_trophy1_x,yy+equ_axis_trophy1_y);
if (mouse_in(xx+equ_axis_trophy1_x,xx+equ_axis_trophy1_x+32,yy+equ_axis_trophy1_y,yy+equ_axis_trophy1_y+32))
   {
   draw_hover_block(xx+equ_axis_trophy1_x,xx+equ_axis_trophy1_x+32,yy+equ_axis_trophy1_y,yy+equ_axis_trophy1_y+32);
   }
}
// Draw trophy2 slot 
if (oPlayer.equ_draw_trophy2)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_trophy2_x,yy+equ_axis_trophy2_y);
if (mouse_in(xx+equ_axis_trophy2_x,xx+equ_axis_trophy2_x+32,yy+equ_axis_trophy2_y,yy+equ_axis_trophy2_y+32))
   {
   draw_hover_block(xx+equ_axis_trophy2_x,xx+equ_axis_trophy2_x+32,yy+equ_axis_trophy2_y,yy+equ_axis_trophy2_y+32);
   }
}
// Draw trophy3 slot 
if (oPlayer.equ_draw_trophy2)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_trophy3_x,yy+equ_axis_trophy3_y);
if (mouse_in(xx+equ_axis_trophy3_x,xx+equ_axis_trophy3_x+32,yy+equ_axis_trophy3_y,yy+equ_axis_trophy3_y+32))
   {
   draw_hover_block(xx+equ_axis_trophy3_x,xx+equ_axis_trophy3_x+32,yy+equ_axis_trophy3_y,yy+equ_axis_trophy3_y+32);
   }
}
// Draw special1 slot 
if (oPlayer.equ_draw_special1)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_special1_x,yy+equ_axis_special1_y);
if (mouse_in(xx+equ_axis_special1_x,xx+equ_axis_special1_x+32,yy+equ_axis_special1_y,yy+equ_axis_special1_y+32))
   {
   draw_hover_block(xx+equ_axis_special1_x,xx+equ_axis_special1_x+32,yy+equ_axis_special1_y,yy+equ_axis_special1_y+32);
   }
}
// Draw special2 slot 
if (oPlayer.equ_draw_special2)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_special2_x,yy+equ_axis_special2_y);
if (mouse_in(xx+equ_axis_special2_x,xx+equ_axis_special2_x+32,yy+equ_axis_special2_y,yy+equ_axis_special2_y+32))
   {
   draw_hover_block(xx+equ_axis_special2_x,xx+equ_axis_special2_x+32,yy+equ_axis_special2_y,yy+equ_axis_special2_y+32);
   }
}
// Draw belt slot 
if (oPlayer.equ_draw_belt)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_belt_x,yy+equ_axis_belt_y);
if (mouse_in(xx+equ_axis_belt_x,xx+equ_axis_belt_x+32,yy+equ_axis_belt_y,yy+equ_axis_belt_y+32))
   {
   draw_hover_block(xx+equ_axis_belt_x,xx+equ_axis_belt_x+32,yy+equ_axis_belt_y,yy+equ_axis_belt_y+32);
   }
}
// Draw left boot slot 
if (oPlayer.equ_draw_left_boot)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_left_boot_x,yy+equ_axis_left_boot_y);
if (mouse_in(xx+equ_axis_left_boot_x,xx+equ_axis_left_boot_x+32,yy+equ_axis_left_boot_y,yy+equ_axis_left_boot_y+32))
   {
   draw_hover_block(xx+equ_axis_left_boot_x,xx+equ_axis_left_boot_x+32,yy+equ_axis_left_boot_y,yy+equ_axis_left_boot_y+32);
   }
}
// Draw right boot slot 
if (oPlayer.equ_draw_left_boot)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_right_boot_x,yy+equ_axis_right_boot_y);
if (mouse_in(xx+equ_axis_right_boot_x,xx+equ_axis_right_boot_x+32,yy+equ_axis_right_boot_y,yy+equ_axis_right_boot_y+32))
   {
   draw_hover_block(xx+equ_axis_right_boot_x,xx+equ_axis_right_boot_x+32,yy+equ_axis_right_boot_y,yy+equ_axis_right_boot_y+32);
   }
}

// Draw equipment infobox
if (draw_equ_infobox)
   {
   if (mouse_check_button_released(mb_right)) {draw_equ_infobox = 0;}
   
   if (draw_equ_infobox_id = 0) {draw_equ_infobox_xx = xx+equ_axis_right_hand_x; draw_equ_infobox_yy = yy+equ_axis_right_hand_y;}
   if (draw_equ_infobox_id = 1) {draw_equ_infobox_xx = xx+equ_axis_head_x; draw_equ_infobox_yy = yy+equ_axis_head_y;}
  

  
   }
yy = yy - 36;

#define equipmentDrawInfobox
/// equipmentDrawInfobox(x,y,id,yoffset,xoffset)


var width,height,idd,xx,yy;

width   = 256;
height  = 16;
xx      = argument0;
yy      = argument1;
idd     = argument2;
yoffset = 16;
xoffset = 16;


height += string_height(oInventory.equiped_stats[idd,inv_item_info_head]) + string_height(oInventory.equiped_stats[idd,inv_item_info_text]);

 for (a = 0; a < celkem_vlastnosti; a++)
                             {
                            if (oInventory.equiped_vlastnost[idd,a] != 0) {height += 8}    // 12
                             }
 

draw_sprite_stretched(sInfoboxTexture,0,xx-width+xoffset,yy+yoffset,width,height);
clr(c_black);
draw_rectangle(xx-width+xoffset,yy+yoffset,xx+xoffset,yy+height+yoffset,1);

draw_set_font(fntText);
scrCenterText();
draw_text_colour(xx - (width / 2),yy + yoffset+12,oInventory.equiped_stats[idd,inv_item_info_head],oInventory.equiped_stats[idd,inv_item_info_color],oInventory.equiped_stats[idd,inv_item_info_color],oInventory.equiped_stats[idd,inv_item_info_color],oInventory.equiped_stats[idd,inv_item_info_color],1);
scrCenterText(0);
equipmentDrawAbilities(idd,width,yoffset,xx,yy,xoffset);

#define equipmentDrawAbilities
/// equipmentDrawAbilities(id,width,yoffset,xx,yy,xoffset)

var t_text,idd,width,yoffset,xx,yy;

t_text   = "#";
idd      = argument0;
width    = argument1;
yoffset  = argument2;
xx       = argument3;
yy       = argument4;
xoffset  = argument5;


t_text += oInventory.equiped_stats[idd,inv_item_info_text];

for(a = 0; a < celkem_vlastnosti; a++)
      {
      //if (equiped_vlastnost[idd,inv_id] = 0) {break;}      

      
      
       if (oInventory.equiped_vlastnost[idd,a] > 0)
          {
            switch(a)
                    {
                     case(vlastnost_poskozeni):
                         {
                           t_text += "#Poškození: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_max_zivot):
                         {
                           t_text += "#Život: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_stamina_cost):
                         {
                           t_text += "#Stamina za úder: -"+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_mana):
                         {
                           t_text += "#Mana: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_sila):
                         {
                           t_text += "#Síla: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_obratnost):
                         {
                           t_text += "#Obratnost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_kovarstvi):
                         {
                           t_text += "#Kovářství: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tezarstvi):
                         {
                           t_text += "#Těžařství: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_odolnost):
                         {
                           t_text += "#Odolnost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_vytrvalost):
                         {
                           t_text += "#Vytrvalost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_presnost):
                         {
                           t_text += "#Přesnost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_rychlost):
                         {
                           t_text += "#Rychlost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zrucnost):
                         {
                           t_text += "#Zručnost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_svadeni):
                         {
                           t_text += "#Svádění: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zastrasovani):
                         {
                           t_text += "#Zastrašování: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_dustojnost):
                         {
                           t_text += "#Důstojnost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_vyrecnost):
                         {
                           t_text += "#Výřečnost: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_elegance):
                         {
                           t_text += "#Elegance: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_cest):
                         {
                           t_text += "#Čest: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                         
                    case(vlastnost_kapsarstvi):
                         {
                           t_text += "#Kapsářství: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_paceni_zanmku):
                         {
                           t_text += "#Páčení zámků: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_vule):
                         {
                           t_text += "#Vůle: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_inteligence):
                         {
                           t_text += "#Inteligence: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_ritualy):
                         {
                           t_text += "#Rituály: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tradicni_magie):
                         {
                           t_text += "#Tradiční magie: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_astralni_videni):
                         {
                           t_text += "#Astrální vidění: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_mece):
                         {
                           t_text += "#Meče: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_dyky):
                         {
                           t_text += "#Dýky: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_luky):
                         {
                           t_text += "#Lukostřelba: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_kopi):
                         {
                           t_text += "#Kopí: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                     case(vlastnost_jednorucni):
                         {
                           t_text += "#Jednoruční zbraně: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_dvojrucni):
                         {
                           t_text += "#Dvojruční zbraně: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_stity):
                         {
                           t_text += "#Štíty: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vse):
                         {
                           t_text += "#Ochrana proti všem elementům: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_zeme):
                         {
                           t_text += "#Ochrana proti zemi: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_ohen):
                         {
                           t_text += "#Ochrana proti ohni: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_voda):
                         {
                           t_text += "#Ochrana proti vodě: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_temnota):
                         {
                           t_text += "#Ochrana proti temnotě: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                         
                     case(vlastnost_rezistence_svetlo):
                         {
                           t_text += "#Ochrana proti světlu: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vitr):
                         {
                           t_text += "#Ochrana proti vodě: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zivot):
                         {
                           t_text += "#Obnoví zdraví: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_mana):
                         {
                           t_text += "#Obnoví manu: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_stamina):
                         {
                           t_text += "#Obnoví výdrž: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                         
                    case(vlastnost_max_stamina):
                         {
                           t_text += "#Výdrž: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_sance):
                         {
                           t_text += "#Šance na kritický úder: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_nasobic):
                         {
                           t_text += "#Násobič kritického úderu: "+string(oInventory.equiped_vlastnost[idd,a])+"%";
                           break;                                                                   
                         }
                    case(vlastnost_stit):
                         {
                           t_text += "#Obnoví štít: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_stit):
                         {
                           t_text += "#Štít: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_zkusenosti):
                         {
                           t_text += "#Přidá zkušenosti: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_zkusenosti):
                         {
                           t_text += "#Zvýší tkušenosti potřebné k dosažení další úravně: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_level):
                         {
                           t_text += "#Zváší úroveň: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina):
                         {
                           t_text += "#Zvýší rychlost obnovy výdrže: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina_add):
                         {
                           t_text += "#Zváší množství obnovené výdrže: "+string(oInventory.equiped_vlastnost[idd,a]);
                           break;                                                                   
                         }


                    
                    }               
          }      
      }

draw_text(xx - (width) + 5 + xoffset,yy + yoffset+10,t_text);