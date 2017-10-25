var tmp_equipSlot;
tmp_equipSlot = v_equipmentLastHover;

if (argument_count > 0) {tmp_equipSlot = argument[0];}

				var tmp_switchDone, tmp_itemsSwitched;
				tmp_switchDone = false;
				tmp_itemsSwitched = 0;
			
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
					var tmp_atrb, tmp_prop, tmp_req, tmp_anim, tmp_gem;
					
					for (var k = 0; k < 20; k++)
					{
						tmp_gem[k] = v_slotGems[v_slotBeingDragged, k];						
					}
					
					for (var k = 0; k <= mcInvenotryAtributes; k++)
					{
						tmp_atrb[k] = v_slot[v_slotBeingDragged, k];			
					}
				
					for (var k = 0; k < mcInventoryProperties; k++)
					{
						tmp_prop[k] = v_slotProperty[v_slotBeingDragged, k];	
						tmp_propS[k] = v_slotPropertyStatic[v_slotBeingDragged, k];
						
						tmp_req[k] = v_slotReq[v_slotBeingDragged, k];
					}

					for (var k = 0; k < mcAnimations; k++)
					{
						tmp_anim[k] = v_slotAnimations[v_slotBeingDragged, k];		
					}					
				
					for (var k = 0; k <= mcInvenotryAtributes; k++)
					{
						v_slot[v_slotBeingDragged, k] = v_equipmentSlot[tmp_equipSlot, k];					
						v_equipmentSlot[tmp_equipSlot, k] = tmp_atrb[k];
					}
					
					for (var k = 0; k < 20; k++)
					{
						v_slotGems[v_slotBeingDragged, k] = v_equipmentSlotGems[tmp_equipSlot, k];
						v_equipmentSlotGems[tmp_equipSlot, k] = tmp_gem[k]
					}
				
			
					for (var k = 0; k < mcInventoryProperties; k++)
					{
				     	v_slotProperty[v_slotBeingDragged, k] = v_equipmentSlotProperty[tmp_equipSlot, k];
						v_equipmentSlotProperty[tmp_equipSlot, k] = tmp_prop[k];
					
						v_slotReq[v_slotBeingDragged, k] = v_equipmentReq[tmp_equipSlot, k];
						v_equipmentReq[tmp_equipSlot, k] = tmp_req[k];	
						
					    v_slotPropertyStatic[v_slotBeingDragged, k] = v_equipmentSlotPropertyStatic[tmp_equipSlot, k];
						v_equipmentSlotPropertyStatic[tmp_equipSlot, k] = tmp_propS[k];		
						
						//oHUD.v_playerProperty[k] += tmp_prop[k];
						//oHUD.v_playerPropertyStatic[k] += tmp_propS[k];
					}
					
					for (var k = 0; k < mcAnimations; k++)
					{
						v_slotAnimations[v_slotBeingDragged, k] = v_equipmentSlotAnimations[tmp_equipSlot, k];					
						v_equipmentSlotAnimations[tmp_equipSlot, k] = tmp_anim[k];										
					}
					
					for (var k = 0; k < mcAnimations; k++)
					{
						oPlayer.v_bci[k, v_equipmentSlot[tmp_equipSlot, e_inventoryAtributes.valEquipSlot]] = v_equipmentSlotAnimations[tmp_equipSlot, k];	
					}				
				}