#define inventoryDelete
///inventoryDelete(id,count)

ar_id = 0;
ar_count = 1;

if (argument_count > 0) {ar_id = argument[0]}
if (argument_count > 1) {ar_count = argument[1]}

if (inventoryNumber(ar_id) > 0)
{
for(a = (oInventory.slots - 1); a >= 0; a--)
{
if (oInventory.slot[a,inv_id] == ar_id)
   {
    slot_count = oInventory.slot[a,inv_number];
    
    if (slot_count >= ar_count)
       {
       if (slot_count == ar_count) 
          {
          inventoryResetSlot(a);
          }
       else {oInventory.slot[a,inv_number] -= ar_count;}
       }
       else
           {                                                                                                       //show_message(ar_count);           ar_count -= slot_count;                                                                                                       //show_message("reset clot: slot_count< ar_count"); 
           inventoryResetSlot(a);  
           inventoryDelete(ar_id,ar_count);
           }
    break;
  }                 
 }
}

#define inventoryResetSlot
/// inventoryResetSlot(slot)
sslot = 0;
if (argument_count > 0) {sslot = argument[0];}
 
 for(b=0;b<inv_atributes_total;b++)
                  {                  
                   if(b!= inv_item_info_head && b!= inv_item_info_text && b!= inv_options && b != inv_item_equip_slot)
                   {
                   oInventory.slot[sslot,b] = 0;
                   }
                   else {oInventory.slot[sslot,b] = "";}      
                   
                       
                  }
 for(c=0 c<10 c++)
 {
  oInventory.slot_option[sslot,c] = "";
 }
                  
 oInventory.slot[sslot,inv_sprite] = sFreeSlot;