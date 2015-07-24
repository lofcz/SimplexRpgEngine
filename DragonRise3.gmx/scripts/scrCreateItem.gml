/// scrCreateItem

instance.slot = a;
instance.image_speed               = 0;             
instance.itm_stackable             = oInventory.switch_temp[inv_slot_stackable];                         //show_message(oInventory.drop[inv_stackable]);
instance.itm_id                    = oInventory.switch_temp[inv_id];
instance.itm_number                = oInventory.switch_temp[inv_number];
instance.itm_sprite_number         = oInventory.switch_temp[inv_sprite_number];
instance.itm_sprite                = oInventory.switch_temp[inv_sprite];
instance.itm_info_text             = oInventory.switch_temp[inv_item_info_text];
instance.itm_info_head             = oInventory.switch_temp[inv_item_info_head];
instance.itm_info_color            = oInventory.switch_temp[inv_item_info_color];
instance.itm_effect                = oInventory.switch_temp[inv_item_effect];
instance.on_click = 1;
instance.hover_info = 1;
instance.xx = xx+16;
instance.yy = yy+16;
instance.loot = 1;
instance.drop_id = id;

instance.image_index               = instance.itm_sprite_number;
instance.sprite_index              = instance.itm_sprite;
instance.o                         = 1;
for(a=0 a<10 a++)         {instance.itm_options[a] = oInventory.switch_option[a];}

