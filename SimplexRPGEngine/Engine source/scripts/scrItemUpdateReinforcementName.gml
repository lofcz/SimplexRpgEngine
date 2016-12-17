/// scrItemUpdateReinforcementName([slot])

var s, p;
s = -1;

if (argument_count > 0) {s = argument[0];}

// If item is not in the inventory
if (s == -1)
   {
    if (vlastnost[vlastnost_reinforcementLevel] > 0)
    {
    if (string_pos(" +", itm_info_head) == 0)
       {
        itm_info_head += " +" +string(vlastnost[vlastnost_reinforcementLevel]); 
       }
    else 
       {
        p = string_pos(" +", itm_info_head);
        itm_info_head = string_delete(itm_info_head, p, (string_length(itm_info_head)));
        itm_info_head += " +" +string(vlastnost[vlastnost_reinforcementLevel]);   
       }
    }
   }
else
    {
    if (oInventory.slot_vlastnosti[s, vlastnost_reinforcementLevel] > 0)
       {
       if (string_pos(" +", oInventory.slot[s, inv_item_info_head]) == 0)
          {
           oInventory.slot[s, inv_item_info_head] += " +" +string(oInventory.slot_vlastnosti[s, vlastnost_reinforcementLevel]); 
          }
          else 
          {
           p = string_pos(" +", oInventory.slot[s, inv_item_info_head]);
           oInventory.slot[s, inv_item_info_head] = string_delete(oInventory.slot[s, inv_item_info_head], p, (string_length(oInventory.slot[s, inv_item_info_head])));
           oInventory.slot[s, inv_item_info_head] += " +" +string(oInventory.slot_vlastnosti[s, vlastnost_reinforcementLevel]);   
          }
       }    
    }
