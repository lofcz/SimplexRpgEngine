var tmp_equipSlot, tmp_freeSlot;
tmp_equipSlot = v_equipmentLastHover;
tmp_freeSlot = -1;

if (argument_count > 0) {tmp_equipSlot = argument[0];}

var tmp_switchDone, tmp_itemsSwitched;
tmp_switchDone = false;
tmp_itemsSwitched = 0;

tmp_freeSlot = cpInventoryHelperFindFreeSlot();
			
				// We try to join item slots if they have the same id and are stackable
				/*if (v_slot[tmp_lastHover, e_inventoryAtributes.valID] == v_slot[v_slotBeingDragged, e_inventoryAtributes.valID] && v_slot[tmp_lastHover, e_inventoryAtributes.valStackable] && v_slot[v_slotBeingDragged, e_inventoryAtributes.valStackable])
				{			
					repeat(v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize])
					{
						if (v_slot[tmp_lastHover, e_inventoryAtributes.valCurrentStackSize] < v_slot[tmp_lastHover, e_inventoryAtributes.valMaxStackSize])
						{
							v_slot[tmp_lastHover, e_inventoryAtributes.valCurrentStackSize]++;
							v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize]--;
							tmp_itemsSwitched++;
						
							if (v_slot[v_slotBeingDragged, e_inventoryAtributes.valCurrentStackSize] <= 0)
							{
								cpInventoryHelperClearSlot(v_slotBeingDragged);
								oHUD.v_mouseFree = true;
								break;
							}
						}
						else
						{
							tmp_switchDone = false;
						}
					}
				}
				else
				{
					tmp_switchDone = false;
				}*/
				if (!tmp_switchDone && tmp_itemsSwitched == 0)
				{
					//cpInventoryHelperSwitch(id, id, tmp_equipSlot, tmp_freeSlot, "E2I");
					
					var tmp_atrb, tmp_prop, tmp_req, tmp_anim;
					for (var k = 0; k <= mcInvenotryAtributes; k++)
					{
						tmp_atrb[k] = v_equipmentSlot[tmp_equipSlot, k];			
					}
				
					for (var k = 0; k < mcInventoryProperties; k++)
					{
						tmp_prop[k] = v_equipmentSlotProperty[tmp_equipSlot, k];	
						tmp_req[k] = v_equipmentReq[tmp_equipSlot, k];
					}

					for (var k = 0; k < mcAnimations; k++)
					{
						tmp_anim[k] = v_equipmentSlotAnimations[tmp_equipSlot, k];		
					}					
				
					for (var k = 0; k <= mcInvenotryAtributes; k++)
					{
						v_slot[tmp_freeSlot, k] = tmp_atrb[k];		
						if (!cpInventoryHelpIsStringAtr(k)) {v_equipmentSlot[tmp_equipSlot, k] = 0;} else {v_equipmentSlot[tmp_equipSlot, k] = "";}
					}
			
					for (var k = 0; k < mcInventoryProperties; k++)
					{
						v_slotProperty[tmp_freeSlot, k] = tmp_prop[k];		
						v_equipmentSlotProperty[tmp_equipSlot, k] = 0;
					
						v_slotReq[tmp_freeSlot, k] = tmp_req[k];	
						v_equipmentReq[tmp_equipSlot, k] = 0;		
					}
					
					for (var k = 0; k < mcAnimations; k++)
					{
						v_slotAnimations[tmp_freeSlot, k] = tmp_anim[k];		
						v_equipmentSlotAnimations[tmp_equipSlot, k] = 0;									
					}
					
					for (var k = 0; k < mcAnimations; k++)
					{
						oPlayer.v_bci[k, v_slot[tmp_freeSlot, e_inventoryAtributes.valEquipSlot]] = oPlayer.v_bciDef[k, v_slot[tmp_freeSlot, e_inventoryAtributes.valEquipSlot]];
					}
				}