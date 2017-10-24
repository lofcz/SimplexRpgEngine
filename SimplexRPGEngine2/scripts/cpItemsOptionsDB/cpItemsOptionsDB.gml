/// @fucntion cpItemsOptionsDB(itemID, optionID, callAsFiler)
/// @desc Holds database for items options
/// @arg {e_items} itemID ID of item 
/// @arg {int} optionID ID of option
/// @arg {int} callAsFilter Can be called as combinations filter with id of slot returns true / false

var tmp_item, tmp_option, tmp_caf;
tmp_item = e_items.valNONE;
tmp_option = 0;
tmp_caf = -1;

if (argument_count > 0) {tmp_item   = argument[0];}
if (argument_count > 1) {tmp_option = argument[1];}
if (argument_count > 2) {tmp_caf    = argument[2];}

if (tmp_caf == -1)
{
	switch (tmp_item)
	{
		case e_items.valSwordWooden:
		{
			if (tmp_option == 0) 
			{
				show_message("Test");
			}
			break;
		}
	
		case e_items.valPearlGreen:
		{
			if (tmp_option == 0) 
			{			
				// Render combinations ON
				v_slot[v_menuItem, e_inventoryAtributes.valBeingUsed] = true;
				v_usedItem = v_menuItem;
				v_usedOption = tmp_option;
				v_drawCombinations = true;					
			}
			break;
		}
	}
}
else
{
	switch (tmp_item)
	{
		case e_items.valPearlGreen:
		{
			if (tmp_option == 0) 
			{			
				// Filter
				if (v_slot[tmp_caf, e_inventoryAtributes.valEquipSlot] == e_equipmentSlots.valWeaponRight) {return true;}
				return false;			
			}
			break;
		}
	}		
}

return false;