/// @fucntion cpInventoryHelperHandleInput(containerID, index, hover)
/// @desc Handles input of target container
/// @arg {object} containerID ID of container
/// @arg {int} index Current slot
/// @arg {bool} hover If mouse hover over indexed slot

var tmp_id, tmp_i, tmp_hover;
tmp_id = 0; 
tmp_i = 0;
tmp_hover = false;

if (argument_count > 0) {tmp_id = argument[0];}
if (argument_count > 1) {tmp_i = argument[1];}
if (argument_count > 2) {tmp_hover = argument[2];}


// We can drag item now
if (tmp_hover)
{
	// Drag item
	if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_middle)) && oHUD.v_mouseFree)
	{
		if (tmp_id.v_itemMouse == -1)
		{
			if (mouse_check_button_pressed(mb_left))
			{
				if (tmp_id.v_slot[tmp_i, e_inventoryAtributes.valID] != e_items.valNONE)
				{
					tmp_id.v_slotBeingDragged = tmp_i;
					oHUD.v_mouseFree = false;
				}
			}
		}
		else
		{
			if (tmp_id.v_slot[tmp_i, e_inventoryAtributes.valID] == e_items.valNONE)
			{
				for (var j = 0; j <= mcInvenotryAtributes; j++)
				{
					tmp_id.v_slot[tmp_i, j] = tmp_id.v_slot[tmp_id.v_itemMouse, j];
				}
					
				for (var j = 0; j <= mcInventoryProperties; j++)
				{
					tmp_id.v_slotProperty[tmp_i, j] = tmp_id.v_slotProperty[tmp_id.v_itemMouse, j];
					tmp_id.v_slotReq[tmp_i, j] = tmp_id.v_slotReq[tmp_id.v_itemMouse, j];
				}
					
				tmp_id.v_slot[tmp_i, e_inventoryAtributes.valCurrentStackSize] = tmp_id.v_splitRemainning;
				tmp_id.v_itemMouse = -1;
				oHUD.v_mouseFree = true;
			}				
		}
			
	}
		
	// Split item stack
	if (mouse_check_button_pressed(mb_middle) && tmp_id.v_itemMouse == -1 && oHUD.v_mouseFree)
	{
		if (tmp_id.v_slot[tmp_i, e_inventoryAtributes.valCurrentStackSize] >= 2)
		{
			var tmp_number;
				
			tmp_id.v_splitNumber = tmp_id.v_slot[tmp_i, e_inventoryAtributes.valCurrentStackSize] div 2;
			tmp_id.v_splitRemainning = tmp_id.v_slot[tmp_i, e_inventoryAtributes.valCurrentStackSize] - tmp_id.v_splitNumber;
				
			tmp_number = tmp_id.v_splitNumber;
			tmp_id.v_splitNumber = tmp_id.v_splitRemainning;
			tmp_id.v_splitRemainning = tmp_number;
				
			tmp_id.v_itemMouse = tmp_i;	
			tmp_id.v_slot[tmp_i, e_inventoryAtributes.valCurrentStackSize] = tmp_id.v_splitNumber;			
		}
	}				
	else if ((mouse_check_button_pressed(mb_middle) || mouse_check_button_pressed(mb_left)) && tmp_id.v_itemMouse != -1) // Join item stack
	{
		if (tmp_id.v_slot[tmp_i, e_inventoryAtributes.valID] == tmp_id.v_slot[tmp_i, e_inventoryAtributes.valID])
		{
			var tmp_done;
			tmp_done = true;
				
			repeat(tmp_id.v_splitRemainning)
			{
				if (tmp_id.v_slot[tmp_i, e_inventoryAtributes.valCurrentStackSize] < tmp_id.v_slot[tmp_i, e_inventoryAtributes.valMaxStackSize])
				{
					tmp_id.v_slot[tmp_i, e_inventoryAtributes.valCurrentStackSize]++;
					tmp_id.v_splitRemainning--;
				}
				else
				{
					tmp_done = false;
					break;
				}
			}
				
			if (tmp_done)
			{
				tmp_id.v_itemMouse = -1;
				oHUD.v_mouseFree = true;
			}
		}
	}		
}