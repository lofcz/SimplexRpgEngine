/// inventoryCreate(slots)

slots           = 9;
proceed         = 0;
drag            = 0;
draw_item_mouse = 0;

if (argument_count > 0) {slots = argument[0]}

for (a=0; a<slots; a++)
{
 slot[a] = 0;
 
 for(b=0;b<inv_atributes_total;b++)
                  {
                  
                   if(b!= inv_item_info_head && b!= inv_item_info_text && b!= inv_options)
                   {
                   slot[a,b] = 0;
                   }
                   else {slot[a,b] = "";}      
                   
                       
                  }
 for(c=0 c<10 c++)
 {
  slot_option[a,c] = "";
 }
                  
 slot[a,inv_sprite] = sFreeSlot;
}



slot[0,inv_sprite] = sFreeSlot;
slot[0,inv_id]     = 0;
slot[0,inv_item_info_head]     = "";
slot[0,inv_item_info_text]     = "";