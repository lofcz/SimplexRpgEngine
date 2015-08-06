///inventoryDrop(id,x,y)

ar_slot  = 0;
xx       = oPlayer.x;
yy       = oPlayer.y;

if (argument_count > 0) {ar_slot  = argument[0]}
if (argument_count > 1) {xx       = argument[1]}
if (argument_count > 1) {yy       = argument[2]}

for(a = 0; a < inv_atributes_total; a++)
{

             drop[a] = slot[ar_slot,a];
            
             
                if(a!= inv_item_info_head && a!= inv_item_info_text && a!= inv_options && a != inv_item_equip_slot)
                   {
                   slot[ar_slot,a] = 0;
                   }
                   else {slot[ar_slot,a] = "";}  
                   
                 if (a = inv_sprite) {slot[ar_slot,a] = sFreeSlot;}    

} 

for (b = 0; b < 10; b++)
    {
     drop_options[b] = slot_option[ar_slot,b];
     slot_option[ar_slot,b] = "";    
    }

if (place_empty(xx+16,yy)) {xx = xx+16;}
else if (place_empty(xx-16,yy)) {xx = xx+16;}
else if (place_empty(xx,yy+16)) {yy = yy+16;}
else if (place_empty(xx,yy-16)) {yy = yy-16;}
 
instance = instance_create(xx,yy,oBasicItem);

with(instance)
              {
            
image_speed               = 0;             
itm_stackable             = oInventory.drop[inv_slot_stackable];                         //show_message(oInventory.drop[inv_stackable]);
itm_id                    = oInventory.drop[inv_id];
itm_number                = oInventory.drop[inv_number];
itm_sprite_number         = oInventory.drop[inv_sprite_number];
itm_sprite                = oInventory.drop[inv_sprite];
itm_info_text             = oInventory.drop[inv_item_info_text];
itm_info_head             = oInventory.drop[inv_item_info_head];
itm_info_color            = oInventory.drop[inv_item_info_color];
itm_effect                = oInventory.drop[inv_item_effect];


image_index               = itm_sprite_number;
sprite_index              = itm_sprite;

for(a=0 a<10 a++)         {itm_options[a] = oInventory.drop_options[a];}

              
              }   
          


        