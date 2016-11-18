#define inventoryDraw
/// inventoryDraw()

xx             = x;
yy             = (y + 36);
hover          = 0;
hover_id       = 0;
hover_x        = 0;
hover_y        = 0;
pre_switch     = 0;
pages          = (((array_length_1d(hover_slot_alpha) - 1) div slotsPerPage) + 1);

// Handle alpha when combining items
if(combine) {c_a = lin(c_a, 0.1, 0.01);}
else {c_a = 0;}

// Draw header 
clr();
fnt(fntPixelHuge);
draw_sprite(sInventoryTitle, 0, x, y);
alg("center");
draw_text(x + 144, y + 14, inventory_title);
fnt(fntPixelSmall);
draw_text(x + 144, y + 28, "Strana " + string(currentPage + 1) + " / " + string(pages));
alg();
 
// Pagination
fnt(fntPixelHuge);
draw_text(x + 14, y + 2, "<");
draw_text(x + 256 + 14, y + 2, ">");

// Movement between pages 
if (mouse_in(x, x + 32, y, y + 32))
   {
    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right))
       {
        if (currentPage > 0) {currentPage--;}
       }
   }
   
if (mouse_in(x + 256, x + 256 + 32, y, y + 32))
   {
    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right))
       {
       if (currentPage < (pages - 1)) {currentPage++;}
       }
   }
       
// Draw all slots on the current page
if (currentFilter == 1)
        {
         filterAlpha = lerp(filterAlpha, 0.1, 0.1);
        }
else {filterAlpha = lerp(filterAlpha, 1, 0.1);}
        
for (a = (currentPage*slotsPerPage); a < min(array_height_2d(slot), ((currentPage*slotsPerPage) + slotsPerPage)); a++)
    {
     // Handle filtering
     passed = true;
     
     if (currentFilter == 1)
        {
         passed = false;
         if (slot[a, inv_item_star] == 1) {passed = true;}
         
         if (passed) {fAlpha = 1;} else {fAlpha = filterAlpha;}
        }
     else {if (slot[a, inv_item_star] != 1) {fAlpha = filterAlpha;} else {fAlpha = 1;}}
         
     // Draw base rectangle and item
     clr();
     draw_sprite(sSlotTexture, 0, xx, yy);     
     draw_rectangle(xx, yy, xx + 32,yy + 32, 1);   
     clr(c_black, fAlpha);                                                                             
     draw_sprite(sRarityEffect, itemRarityEffect(slot[a, inv_item_effect]), xx, yy); 
     draw_sprite(slot[a, inv_sprite], slot[a, inv_sprite_number], xx + 16, yy + 16);
     
     if (slot_vlastnosti[a, vlastnost_durability] > 0)
        {
         percent = ((slot_vlastnosti[a, vlastnost_durability] / slot_vlastnosti[a, vlastnost_max_durability]) * 100);
       
         if (slot_vlastnosti[a, vlastnost_durability] == 1) {draw_sprite(sRarityEffect, 15, xx, yy);}         
         else if (percent < 25) {draw_sprite(sRarityEffect, 14, xx, yy);}         
         else if (percent < 50) {draw_sprite(sRarityEffect, 13, xx, yy);}
        }
     
     // If item is stackable, draw it's count
     if (slot[a, inv_slot_stackable])
       {
        scrValueIndex(slot[a, inv_number], a);
       }
            
     if (slot[a,inv_item_beingUsed]) {clr(c_black, 0.5); draw_rectangle(xx, yy, xx + 32, yy + 32, false); clr();}     

     if (!proceed)
        { 
         clr(c_yellow, hover_slot_alpha[a]);
         draw_rectangle(xx, yy, xx + 32,yy + 32, 0);  
        }
  
     // Handle on-hover event
     if (mouse_in(xx, xx + 32, yy, yy + 32) && !scrGettActiveComponent())
        {  
         hover_slot_alpha[a] = lin(hover_slot_alpha[a], 0.5, 0.03);
         hover               = true;
         hover_id            = a;
         hover_x             = xx;
         hover_y             = yy; 
         hover_x_stand       = hover_x;
         hover_y_stand       = hover_y;
        } 
     else {hover_slot_alpha[a] = lin(hover_slot_alpha[a], 0, -0.03);} 
     clr();
 
     // Handle combinations
     if (combine)
        { 
         if (a == combine_default_slot) {clr(c_yellow, c_a * 3); draw_rectangle(xx, yy, xx + 32, yy + 32, false) clr();}
         if (inventoryCombinations(slot[combine_default_slot, inv_id], slot[a, inv_id]) && a != combine_default_slot) {clr(c_lime,c_a * 3); draw_rectangle(xx, yy, xx + 32, yy + 32, false) clr();}
         else if (a != combine_default_slot) {clr(c_red, c_a); draw_rectangle(xx, yy, xx + 32,yy + 32, false) clr();}
  
         if (mouse_check_button_pressed(mb_left)) 
            {
             if (mouse_in(xx, xx + 32, yy, yy + 32)) 
         
             if (hover_id != combine_default_slot)
                {
                 id1 = slot[combine_default_slot,inv_id];
                 id2 = slot[hover_id,inv_id];
                 
                 inventoryCombine(id1,id2,combine_default_slot,hover_id);
                 combine = 0;
                }
            } 
       }    

    draw_sprite(sSlotOutline, 0, xx, yy);
    if (slot[a, inv_item_star] == 1) {draw_sprite(sRarityEffect, 5, xx, yy);}
    if (slot[a, inv_item_star] == 2) {draw_sprite(sRarityEffect, 6, xx, yy);}
        
    xx+=36
    if (xx > x + 256) {yy += 36; xx = x;}    
   }
   
// Draw footer
used_y = yy;

if (detailsHeight < 32)
    {
     draw_sprite(sInventoryTitle, 3, x, used_y);
     detailsAlpha = 0;
    }
else
    {
    draw_sprite_part(sInventoryDetails, 0, 0, 0, 288, clamp(detailsHeight, 32, 128), x, used_y);

    if (detailsHeight >= 127)
       {
        detailsAlpha = lerp(detailsAlpha, 1, 0.1);
       }
    else
       {
        detailsAlpha = lerp(detailsAlpha, 0, 0.1);
        }    
    
    // Draw options fe. "sort"    
    fnt(fntPixelSmall);
    for (i = 0; i < array_length_1d(details); i++)
        {
         color = c_black;     
         if (mouse_in(x, x + string_width(string(details[i])) + 6, used_y + (i * 24) + 32, used_y + (i * 24) + 55)) {color = c_white;}
              
         clr(color, detailsAlpha);
         draw_text(x + 6, used_y + (i * 24) + 32, details[i]);
     
        if (mouse_check_button_pressed(mb_left) && color == c_white)
            {
             audio_play_sound(sndMenuClick1, 0, false);
             
             // Sort
             if (i == 0)
                {
                 for (j = 0; j < slots; j++) {inventorySort(j);}
                }
             // Throw out trash
             if (i == 1)
                {
                 for (j = 0; j < slots; j++) {if (slot[j, inv_item_star] == 2) {inventoryDrop(j);}}
                }
            }
        }
    }    
clr();
draw_sprite(sStackableItem1, 7, x + 16, used_y + 16);
fnt();
draw_text(x + 30, used_y, oPlayer.gold);

fnt(fntPixelBig);
if (!inventoryDetails)
    {
     draw_text_transformed(x + 270, used_y + 24, "^", 1, 1, 180);     
     if (detailsHeight > 0) {detailsHeight = lerp(detailsHeight, -0.1, 0.1);}
    }
else
    {
     draw_text(x + 264, used_y, "^");    
     if (detailsHeight < detailsMaxHeight) {detailsHeight = lerp(detailsHeight, detailsMaxHeight + 1, 0.1);}
    }
    
if (mouse_in(x + 260, x + 288, used_y + 10, used_y + 44))
    {
     if (mouse_check_button_pressed(mb_left)) 
        {
         inventoryDetails = !inventoryDetails;
        }
    }   
    
// Draw filters
clr(c_black, detailsAlpha);
if (currentFilter == 1) {outline = true;} else {outline = false;}

draw_sprite(sSlotTexture, 8, x + 256, used_y + 24 + detailsHeight - 48);
draw_sprite(sRarityEffect, 11, x + 256, used_y + 24 + detailsHeight - 48);
if (outline) {clr(c_yellow, detailsAlpha / 2); draw_rectangle( x + 256, used_y + 24 + detailsHeight - 48,  x + 256 + 16, used_y + 24 + detailsHeight - 32, false); clr(c_black, detailsAlpha);}
draw_sprite(sSlotTexture, 7, x + 256, used_y + 24 + detailsHeight - 48);


if (mouse_in(x + 256, x + 276, used_y + 24 + detailsHeight - 48, used_y + 24 + detailsHeight - 32))
    {
     if (mouse_check_button_pressed(mb_left) && detailsHeight >  (detailsMaxHeight - 1))
        {
         if (currentFilter == 0) {currentFilter = 1;} else {currentFilter = 0;}
        }
    }
clr();
   
// Draw infobox
// **************************************************************** 
if (proceed) {hover_alpha = 1; hover = true; hover_id = hover_idd;}

clr(c_black, hover_alpha);    
if ((hover || hover_alpha > 0))
  {
   tText = inventoryDrawStats();
   fnt(fntPixelTiny);
   currentHeight = string_height(string(tText));
   fnt(fntPixel);
   currentHeight += (string_height(string(slot[hover_id, inv_item_info_head])) + string_height(string(slot[hover_id, inv_item_info_text])));
   currentHeight  = max(196, currentHeight + 16); 
   
   if (currentHeight <= 196) {draw_sprite(sInfoboxTexture, 0, x, used_y + 32);}
   else {draw_sprite_stretched(sInfoboxTexture, 0, x, used_y + 32, 288, currentHeight);}
  
   if (slot[hover_id,inv_item_info_head] != "" && hover) {hover_alpha = lin(hover_alpha, 1, 0.1);} else {hover_alpha = lin(hover_alpha, 0, -0.1);}

   if (hover)
      {
       alg("center");
      
       if (!proceed) {f = hover_id;} else {f = hover_idd;}      
       if (proceed) {hover_alpha = 1;}
               
       clr(slot[f, inv_item_info_color], hover_alpha);
       alg("center", fntPixel);
      
       if (string_width(string(string(slot[f,inv_item_info_head]))) >= 250) {fnt(fntPixelSmall);}      
       draw_text(x + 128, used_y + 44, slot[f, inv_item_info_head]);      
   
       // Draw attached pearls
       if (slot_vlastnosti[f, vlastnost_upgradeSloty] > 0) {inventoryDrawPearls(f);}       
   
       // Draw price info
       clr(c_black, hover_alpha);
   
       if (slot_vlastnosti[f,vlastnost_cena] > 0)
          {
           fnt(fntPixelTiny);
           alg();
           priceStr = (string(slot_vlastnosti[f,vlastnost_cena]) + "G");
           draw_text(x + (283 - string_width(priceStr)), used_y + (max(196, currentHeight) + 5), priceStr);      
          }
          
       // Draw item type
       fnt(fntPixelExtraTiny);
       alg();
       if (slot[f, inv_item_equip_slot] != "") {typeStr = "[" + slot[f, inv_item_equip_slot] + ",";}
       else if (slot[f, inv_item_materialType] != materialEnum.materialNone && slot[f, inv_item_materialType] != -1) {if (slot[f, inv_item_materialType] == materialEnum.materialFood) {typeStr = "[Jídlo]";} else {typeStr = "[Materiál]";}}
       else if (slot_vlastnosti[f, vlastnost_canBeFastEquiped]) {typeStr = "[Spotřební]";}
       else {typeStr = "";}
       
       draw_text(x + 4, used_y + (max(196, currentHeight) + 9), typeStr);  
       
       // Draw durability
       if (slot_vlastnosti[f, vlastnost_durability] > 0)
          {
           alg();
           fnt(fntPixelExtraTiny);
           color = c_black;
           if (slot_vlastnosti[f, vlastnost_durability] == 1) {color = c_red;}
           
           clr(color, hover_alpha);
           draw_text(x + 8 + string_width(typeStr), used_y + (max(196, currentHeight) + 9), "" + string(slot_vlastnosti[f, vlastnost_durability]) + " / " + string(slot_vlastnosti[f, vlastnost_max_durability]));
           clr(c_black, hover_alpha);
           draw_text(x + 8 + string_width(typeStr) + string_width("" + string(slot_vlastnosti[f, vlastnost_durability]) + " / " + string(slot_vlastnosti[f, vlastnost_max_durability])), used_y + (max(196, currentHeight) + 9), "]"); 
          }

       
       // Draw item count
       alg("center");
       fnt(fntPixelSmall);  
       if (slot[f, inv_slot_stackable])
          {
           draw_text_colour(x + 264, used_y + 49, "x" + string(slot[f, inv_number]), c_black, c_black, c_black, c_black, 1);
          }
 
       alg();        
       draw_text_colored(x + 4, used_y + 56, string(slot[f, inv_item_info_text])); 
       fnt(fntPixelTiny);      
       draw_text_colored(x + 4, used_y + 56 + string_height(string(slot[f, inv_item_info_text])), tText);
       if (string(slot[f, inv_item_info_footer]) != "0")
          {
           clr(slot[f, inv_item_info_footer_color], hover_alpha);
           draw_text(x + 4, used_y + 56 + string_height(string(slot[f, inv_item_info_text])) + string_height(inventoryDrawStats()) + 16, string(slot[f, inv_item_info_footer]));
          }
       clr(); 
      }                                                                  
  }
  
if (!hover) {hover_alpha = lin(hover_alpha, 0, -0.1);}
clr();     

if (mouse_in(hover_x, hover_x + 32, hover_y, hover_y + 32))
   {  
    if (mouse_check_button_pressed(mb_right) && !slot[hover_id, inv_item_beingUsed] && slot[hover_id, inv_item_info_head] != "")
       {
        proceed = !proceed;
        
        hover_xx = hover_x;
        hover_yy = hover_y;
        hover_idd = hover_id;  
        
        h_dec_x = view_xview;
        h_dec_y = view_yview;        
       }
       
    if (mouse_check_button_pressed(mb_left) && !drag && !proceed && slot[hover_id,inv_id] != 0 && !slot[hover_id, inv_item_beingUsed])
       {
        h_c           = hover_id;
        drag          = true;
        drag_controll = 1;
            
        for (a = 0; a < inv_atributes_total; a++)
            {
             switch_temp[0,a]   = slot[hover_id,a];
             switch_slot        = hover_id;
             temp_equip[a]      = slot[hover_id,a];         
             
             if (a != inv_item_equip_slot)
                { 
                 if (a == inv_sprite)            {equip_sprite_s[0] = slot[hover_id,a];}
                 if (a == inv_sprite_number)     {equip_sprite_s[1] = slot[hover_id,a];}
                 if (a == inv_item_effect)       {equip_sprite_s[2] = slot[hover_id,a];}
                 if (a == inv_item_materialType) {equip_sprite_s[3] = slot[hover_id,a];}
                 if (a == inv_item_beingUsed)    {equip_sprite_s[4] = slot[hover_id,a];}
                 if (a == inv_number)            {equip_sprite_s[5] = slot[hover_id,a];}             
                 if (a == inv_id)                {equip_sprite_s[6] = slot[hover_id,a]; use_this_id = a;}

                        
                 if (a!= inv_item_info_head && a!= inv_item_info_text && a!= inv_options && a!= inv_item_equip_slot)
                    {
                    slot[hover_id, a] = 0;
                    }
                 else {slot[hover_id, a] = "";}  
                 
                 if (a == inv_sprite) {slot[hover_id, a] = sFreeSlot;}    
               }
               if (a == inv_item_equip_slot)   {equip_sprite_s[7] = slot[hover_id,a];}

            } 

       draw_item_mouse = 1;
           
       for (b = 0; b < 10; b++)
           {
            switch_option[0, b] = slot_option[hover_id, b];
            temp_option[a]      = slot_option[hover_id, b]
           }
       for(d = 0; d < celkem_vlastnosti; d++)
          {
           temp_vlastnosti[d] = slot_vlastnosti[h_c,d];
          }
           
       // Fast equip
       if (keyboard_check(vk_shift)) {inventoryFastEquip();}
      }
           
    if (mouse_check_button_released(mb_left) && drag && !proceed)
          {          
           if (!inventorySwitchPre())
              {
               drag          = false;
               drag_controll = 0;

               for (a = 0; a < inv_atributes_total; a++)
                   {
                    switch_temp[1, a] = slot[hover_id, a];
             
                    if (a != inv_item_info_head && a != inv_item_info_text && a != inv_options && a != inv_item_equip_slot)
                       {
                        slot[hover_id, a] = 0; 
                       }
                    else {slot[hover_id, a] = "";}     
                  
                    slot[switch_slot, a] = switch_temp[1, a]; 
                    slot[hover_id, a]    = switch_temp[0, a]; 
                   } 
                
            for (b = 0; b < 10; b++)
                {
                 switch_option[1, b] = slot_option[hover_id,b];               
                }
                
            for (c = 0; c < 10; c++)
                {
                 slot_option[switch_slot, c] = switch_option[1, c];
                 slot_option[hover_id, c]    = switch_option[0, c];
                }
                  
            for (d = 0; d < celkem_vlastnosti; d++)
                {
                 slot_vlastnosti[switch_slot, d] = slot_vlastnosti[hover_id, d];   
                 slot_vlastnosti[hover_id, d]    = temp_vlastnosti[d];      
                }

             draw_item_mouse = 0;
             drag_alpha      = 1;
             h_c = hover_id; 
             }
          }
       }
       else
           {
            if (mouse_check_button_released(mb_left))
               {
                if (drag)
                   {
                    drag = false;
                    
                    for (a = 0; a<inv_atributes_total; a++)
                        {           
                         if (a!= inv_item_beingUsed) { slot[switch_slot,a] = switch_temp[0,a]; }     
                        }  
                                               
                    for (c = 0; c<10; c++)
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
    drag_alpha = lin(drag_alpha, 0.5, -0.05);
    draw_sprite_ext(switch_temp[0, inv_sprite], switch_temp[0, inv_sprite_number], mouse_x, mouse_y, 1, 1, 0, c_white, drag_alpha);       
   }  
                  
if (proceed)
    {
     mouseInStarRectangle = inventoryDrawOptionbox();
           
     if (!(mouse_in(min_x, max_x, min_y, max_y) || (mouseInStarRectangle)))
        {
         proceed = false;
        }
    }      
   

#define inventoryDrawStats
/// inventoryDrawStats()

t_text   = "";
tempBool = false;

if (!proceed) {f = hover_id;}
else {f = hover_idd;}

if (slot[f, inv_item_equip_slot] != "")
   {
    if (slot[f, inv_item_equip_slot] == "zbraň" && equiped[0])
       {
        tempBool = true;
       }
   }

for(a = 0; a < celkem_vlastnosti; a++)
      {
       if (slot[f,inv_id] = 0) {break;}      

       if (slot_vlastnosti[f, a] > 0)
          {
           switch(a)
                    {
                    case(vlastnost_bonusove_poskozeni_vuci_zviratum):
                         {
                           t_text += "#Poškození vůči zvířatům: "+string(slot_vlastnosti[f, a]) + "%";
                           break;                                                                   
                         }
                    case(vlastnost_stackSezehnuti):
                         {
                           t_text += "#Šance na sežehnutí při zásahu: "+string(slot_vlastnosti[f, a]) + "%";
                           break;                                                                   
                         }
                     case(vlastnost_poskozeni):
                         {
                           t_text += "#Poškození: " +string(slot_vlastnosti[f, a]);
                           inventoryDrawStatsCompare(vlastnost_poskozeni);
                           break;                                                                   
                         }
                     case(vlastnost_max_zivot):
                         {
                           t_text += "#Život: "+string(slot_vlastnosti[f, a]);
                           inventoryDrawStatsCompare(vlastnost_max_zivot);
                           break;                                                                   
                         }
                     case(vlastnost_stamina_cost):
                         {
                           t_text += "#Stamina za úder: "+string(slot_vlastnosti[f, a]);
                           inventoryDrawStatsCompare(vlastnost_stamina_cost, 1);
                           break;                                                                   
                         }
                    case(vlastnost_max_mana):
                         {
                           t_text += "#Mana: "+string(slot_vlastnosti[f, a]);
                           inventoryDrawStatsCompare(vlastnost_max_mana);
                           break;                                                                   
                         }
                    case(vlastnost_sila):
                         {
                           t_text += "#Síla: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_obratnost):
                         {
                           t_text += "#Obratnost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_kovarstvi):
                         {
                           t_text += "#Kovářství: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_tezarstvi):
                         {
                           t_text += "#Těžařství: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_odolnost):
                         {
                           t_text += "#Odolnost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_vytrvalost):
                         {
                           t_text += "#Vytrvalost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                     case(vlastnost_presnost):
                         {
                           t_text += "#Přesnost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                     case(vlastnost_rychlost):
                         {
                           t_text += "#Rychlost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_zrucnost):
                         {
                           t_text += "#Zručnost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_svadeni):
                         {
                           t_text += "#Svádění: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_zastrasovani):
                         {
                           t_text += "#Zastrašování: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_dustojnost):
                         {
                           t_text += "#Důstojnost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_vyrecnost):
                         {
                           t_text += "#Výřečnost: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_elegance):
                         {
                           t_text += "#Elegance: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_cest):
                         {
                           t_text += "#Čest: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                         
                    case(vlastnost_kapsarstvi):
                         {
                           t_text += "#Kapsářství: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                     case(vlastnost_paceni_zanmku):
                         {
                           t_text += "#Páčení zámků: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                     case(vlastnost_vule):
                         {
                           t_text += "#Vůle: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_inteligence):
                         {
                           t_text += "#Inteligence: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_ritualy):
                         {
                           t_text += "#Rituály: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_tradicni_magie):
                         {
                           t_text += "#Tradiční magie: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_astralni_videni):
                         {
                           t_text += "#Astrální vidění: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_mece):
                         {
                           t_text += "#Meče: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_dyky):
                         {
                           t_text += "#Dýky: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_luky):
                         {
                           t_text += "#Lukostřelba: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                     case(vlastnost_kopi):
                         {
                           t_text += "#Kopí: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                     case(vlastnost_jednorucni):
                         {
                           t_text += "#Jednoruční zbraně: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_dvojrucni):
                         {
                           t_text += "#Dvojruční zbraně: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_stity):
                         {
                           t_text += "#Štíty: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vse):
                         {
                           t_text += "#Ochrana proti všem elementům: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_zeme):
                         {
                           t_text += "#Ochrana proti zemi: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_ohen):
                         {
                           t_text += "#Ochrana proti ohni: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_voda):
                         {
                           t_text += "#Ochrana proti vodě: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_temnota):
                         {
                           t_text += "#Ochrana proti temnotě: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                         
                     case(vlastnost_rezistence_svetlo):
                         {
                           t_text += "#Ochrana proti světlu: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vitr):
                         {
                           t_text += "#Ochrana proti vodě: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_zivot):
                         {
                           t_text += "#Obnoví zdraví: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_mana):
                         {
                           t_text += "#Obnoví manu: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_stamina):
                         {
                           t_text += "#Obnoví výdrž: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                         
                    case(vlastnost_max_stamina):
                         {
                           t_text += "#Výdrž: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_sance):
                         {
                           t_text += "#Šance na kritický úder: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_nasobic):
                         {
                           t_text += "#Násobič kritického úderu: "+string(slot_vlastnosti[f, a]) + "%";
                           break;                                                                   
                         }
                    case(vlastnost_stit):
                         {
                           t_text += "#Obnoví štít: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_stit):
                         {
                           t_text += "#Štít: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_zkusenosti):
                         {
                           t_text += "#Přidá zkušenosti: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_max_zkusenosti):
                         {
                           t_text += "#Zvýší tkušenosti potřebné k dosažení další úravně: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_level):
                         {
                           t_text += "#Zváší úroveň: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina):
                         {
                           t_text += "#Zvýší rychlost obnovy výdrže: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina_add):
                         {
                           t_text += "#Zvýší množství obnovené výdrže: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_bonusoveZkusenosti):
                         {
                           t_text += "#Bonusové zkušenosti: "+string(slot_vlastnosti[f, a]) + "%";
                           break;                                                                   
                         }
                    case(vlastnost_healHp):
                         {
                           t_text += "#Obnoví zdraví: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_healMp):
                         {
                           t_text += "#Obnoví manu: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_healStamina):
                         {
                           t_text += "#Obnoví výdrž: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }
                    case(vlastnost_healShield):
                         {
                           t_text += "#Obnoví štít: "+string(slot_vlastnosti[f, a]);
                           break;                                                                   
                         }                                                                                     
               }                    
          }      
      }

return t_text;

#define inventoryDrawWrapper
/// inventoryDrawWrapper(x, y)

var tX,tY;

tX = view_xview;
tY = view_yview;

if (argument_count > 0) {tX = argument[0];}
if (argument_count > 1) {tY = argument[1];}

x = tX;
y = tY;

fnt(fntText);
if (instance_number(oPlayer) > 0)
    { 
     if (oPlayer.can_move2)
        {
         if (keyboard_check_pressed(ord("I")) && oHUD.iconActive[hudIcons.inventory] && !scrGettActiveComponent())
            {
             draw_inventory = !draw_inventory;
             hover_alpha = 0;

             if (draw_inventory)
                {
                 oHUD.iconActive[hudIcons.crafting]  = true;
                 oHUD.iconActive[hudIcons.equipment] = true;
                 oHUD.iconActive[hudIcons.quest]     = false;
                 oHUD.iconActive[hudIcons.status]    = false;
                }
            else
                {
                 oHUD.iconActive[hudIcons.crafting]  = false;
                 oHUD.iconActive[hudIcons.equipment] = false;
                 oHUD.iconActive[hudIcons.quest]     = true;
                 oHUD.iconActive[hudIcons.status]    = true;
                 oHUD.draw_crafting                  = false;
                 draw_equipment = false;
                }
            } 

        if (keyboard_check_pressed(ord("Q"))  && !scrGettActiveComponent()) {draw_quest = !draw_quest;} 
       }
    }

if (draw_equipment) {equipmentDraw();}
if (draw_inventory) {inventoryDraw();}

if (draw)
   {
    if (effect_scale < 1.2 && draw_inventory) {effect_scale += 0.02;}
     
    tempAlpha = min(0.7, oHUD.iconAlpha[hudIcons.inventory], oHUD.hudAlpha);
    if (oHUD.iconAlpha[hudIcons.inventory] < 1) {tempAlpha = 0;}    
    draw_sprite_ext(sprite_index,0,view_xview+48+16,view_yview+560+16 + oHUD.yoffset,effect_scale,effect_scale,0,c_black,tempAlpha);    
    draw_sprite_ext(sprite_index,-1,view_xview+48+16,view_yview+560+16+ oHUD.yoffset, oHUD.iconAlpha[hudIcons.inventory],  oHUD.iconAlpha[hudIcons.inventory],  0, c_white, min(oHUD.iconAlpha[hudIcons.inventory], oHUD.hudAlpha))
   }
     
if (!draw_inventory) {effect_scale = lin(effect_scale, 1, -0.02);}
 

#define inventoryDrawStatsCompare
/// inventoryDrawStatsCompare(property, mode)

var p, b, deltaB, m;
p      = vlastnost_poskozeni;
b      = 0;
deltaB = 0;
m      = 0;

if (argument_count > 0) {p  = argument[0];}
if (argument_count > 1) {m  = argument[1];}

if (tempBool) 
    {
     b      = equiped_vlastnost[0, p];
     deltaB = (slot_vlastnosti[f, a] - b);

     if (m == 0)
        {                              
         if (deltaB > 0) {t_text += " " + scrColorflag(c_lime) + " (+" + string(deltaB) + ")"  + scrEndColorflag() + " ";}
         else if (deltaB < 0) {t_text += " " + scrColorflag(c_red) + " (" + string(deltaB) + ")" + scrEndColorflag() + " ";}
         else {t_text += " " + scrColorflag(c_yellow) + " (" + string(deltaB) + ")" + scrEndColorflag() + " ";}                                                          
        }

    if (m == 1)
       {
        if (deltaB > 0) {t_text += " " + scrColorflag(c_red) + " (+" + string(deltaB) + ")"  + scrEndColorflag() + " ";}
        else if (deltaB < 0) {t_text += " " + scrColorflag(c_lime) + " (" + string(deltaB) + ")" + scrEndColorflag() + " ";}
        else {t_text += " " + scrColorflag(c_yellow) + " (" + string(deltaB) + ")" + scrEndColorflag() + " ";}                                                          
       }
    }

return t_text;

#define inventoryFastEquip
/// inventoryFastEquip()

if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "helma")
    {
     equipmentHoldEquip(1, 0, 0, 0, 0, true);     
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "leftPlate")
    {
     equipmentHoldEquip(4, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "rightPlate")
    {
     equipmentHoldEquip(3, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "armor")
    {
     equipmentHoldEquip(2, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "zbraň")
    {
     equipmentHoldEquip(0, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "shield")
    {
     equipmentHoldEquip(5, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "ring")
    {
     if (!equiped[6]) {equipmentHoldEquip(6, 0, 0, 0, 0, true);}
     else if (!equiped[7]) {equipmentHoldEquip(7, 0, 0, 0, 0, true);}  
     else if (!equiped[8]) {equipmentHoldEquip(8, 0, 0, 0, 0, true);}  
     else if (!equiped[9]) {equipmentHoldEquip(9, 0, 0, 0, 0, true);}  
     else {{equipmentHoldEquip(6, 0, 0, 0, 0, true);}}
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "necklace")
    {
     equipmentHoldEquip(10, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "card")
    {
     equipmentHoldEquip(11, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "medal")
    {
     equipmentHoldEquip(12, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "trophy")
    {
     equipmentHoldEquip(13, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "crystallisator")
    {
     equipmentHoldEquip(14, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "booster")
    {
     equipmentHoldEquip(15, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "belt")
    {
     equipmentHoldEquip(16, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "leftBoot")
    {
     equipmentHoldEquip(17, 0, 0, 0, 0, true);    
    }
else if (oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "rightBoot")
    {
     equipmentHoldEquip(18, 0, 0, 0, 0, true);    
    }

#define inventoryDrawPearls
/// inventoryDrawPearls(slot)

var s, i, ox, j;
s = 0;

if (argument_count > 0) {s = argument[0];}

i  = slot_vlastnosti[s, vlastnost_upgradeSloty];
ox = (x + 288 - (i * 14));


for (j = 0; j < i; j++)
    {     
     if (slot_vlastnosti[s, vlastnost_upgradeSprite1 + j] != 0)
        {
         draw_sprite_stretched(sTestItem, slot_vlastnosti[s, vlastnost_upgradeSprite1 + j], ox + (j * 14) - 8, used_y + 44 - 9, 20, 20);
        } 
     else
        {
         clr(c_black, 0.3);
         draw_circle(ox + (j * 14), used_y + 44, 6, false);
         clr();
         draw_circle(ox + (j * 14), used_y + 44, 6, true);
        }    
    }