/// inventoryCreate(slots)

slots                = 9;
proceed              = 0;
drag                 = 0;
draw_item_mouse      = 0;
combine              = 0;
combine_id           = 0;
combine_default_slot = 0;
c_a                  = 0;
h_c                  = 0;
draw_equ_infobox     = 0;
draw_equ_infobox_xx  = 0;
draw_equ_infobox_yy  = 0;
draw_equ_infobox_id  = -1;
hover_alpha          = 0;
draw_book            = 0;
draw_inventory       = 0;
draw_equipment       = 0;
draw_quest           = 0;
draw                 = 1;
drag_alpha           = 1;
drag_controll        = 0;
effect_scale         = 1;
inventory_title      = "Inventář";
currentPage          = 0;
slotsPerPage         = 101;
inventoryDetails     = false;
detailsHeight        = 0;
detailsMaxHeight     = 128;
detailsAlpha         = 0;
mouseInStarRectangle = false;
mYes                 = false;
starText[0]          = "Oblíbené";
starText[1]          = "Odpad";
starText[2]          = "Odznačit"; 
details[0]           = "Seřadit";
details[1]           = "Vyhodit odpad";
global.QuestionResult = -1;


if (argument_count > 0) {slots = argument[0]}

for (a=0; a < slots; a++)
{
 slot[a]                 = 0;
 hover_slot_alpha[a]     = 0;
 
 for(b=0;b<inv_atributes_total;b++)
                  {
                  
                   if(b!= inv_item_info_head && b!= inv_item_info_text && b!= inv_options && b!=inv_item_equip_slot)
                   {
                   slot[a,b] = 0;
                   }
                   else {slot[a,b] = "";}      
                   
                   
                       
                  }
                  
 for(c=0 c<10 c++)
 {
  slot_option[a,c]    = "";
  equiped_option[a,c] = "";
 }
                  
 slot[a,inv_sprite] = sFreeSlot;
 
 for(d=0; d<celkem_vlastnosti; d++)
          {
           slot_vlastnosti[a,d]   = 0;
           equiped_vlastnost[a,d] = 0;

          }
}

for(a=0; a<100; a++)
{
equiped[a] = 0;

equiped_image[a,0] = sFreeSlot; // sprite
equiped_image[a,1] = 0;         // index 
equiped_image[a,2] = 0;         // rarity
}



slot[0,inv_sprite]              = sFreeSlot;
slot[0,inv_id]                  = 0;
slot[0,inv_number]              = 0;
slot[0,inv_item_effect]         = 0;
slot[0,inv_options]             = 0;
slot[0,inv_item_info_head]      = "";
slot[0,inv_item_info_text]      = "";
slot[0,inv_item_equip_slot]     = "";

instance_create(x,y,oInventoryDepthHelper);
