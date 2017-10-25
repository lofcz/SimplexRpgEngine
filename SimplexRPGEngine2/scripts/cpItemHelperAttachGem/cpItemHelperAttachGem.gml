/// @function cpItemHelperAttachGem(attachingSlot, attachedSlot)
/// @desc Attaches gem into item if possible
/// @arg {int} attachingSlot Slot 1
/// @arg {int} attachedSlot Slot 2

var tmp_s1, tmp_s2, tmp_gemSlot, tmp_sourceList, tmp_value;
tmp_s2 = argument[0];
tmp_s1 = argument[1];
tmp_gemSlot = -1;
tmp_sourceList = ds_list_create();

// 1) Determine to which slot we gonna attach gem
for (var i = 0; i < oInventory.v_slot[tmp_s2, e_inventoryAtributes.valGemSlots]; i++)
{
	if (oInventory.v_slotGems[tmp_s2, i * 4] == "")
	{
		tmp_gemSlot = i * 4;
		break;
	}
}

// Yayy, we've found an emtpy slot
if (tmp_gemSlot != -1)
{
	// Gonna deserialize string containing info
	tmp_sourceList = string_parse(oInventory.v_slotGems[tmp_s1, 1], ",", true);
	
	// And finally we have info we need
	for (var i = 0; i < ds_list_size(tmp_sourceList); i++)
	{
		tmp_value = real(tmp_sourceList[| i]);
		oInventory.v_slotPropertyStatic[tmp_s2, i] += tmp_value;
	}
	
	oInventory.v_slotGems[tmp_s2, tmp_gemSlot] = "FUCK OFF";
}

ds_list_destroy(tmp_sourceList);
return 0;