var tmp_equipSlot, tmp_freeSlot;
tmp_equipSlot = v_equipmentLastHover;
tmp_freeSlot = -1;

if (argument_count > 0) {tmp_equipSlot = argument[0];}

var tmp_switchDone, tmp_itemsSwitched;
tmp_switchDone = false;
tmp_itemsSwitched = 0;

tmp_freeSlot = cpInventoryHelperFindFreeSlot();
			

				if (!tmp_switchDone && tmp_itemsSwitched == 0)
				{
					
					var tmp_atrb, tmp_prop, tmp_req, tmp_anim, tmp_gems;
					for (var k = 0; k <= mcInvenotryAtributes; k++)
					{
						tmp_atrb[k] = v_equipmentSlot[tmp_equipSlot, k];			
					}
					
					for (var k = 0; k < 20; k++)
					{
						tmp_gems[k] = v_equipmentSlotGems[tmp_equipSlot, k];			
					}
					
					for (var k = 0; k < mcInventoryProperties; k++)
					{
						tmp_prop[k] = v_equipmentSlotProperty[tmp_equipSlot, k];	
						tmp_propS[k] = v_equipmentSlotPropertyStatic[tmp_equipSlot, k];
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
						//oHUD.v_playerProperty[k] -= tmp_prop[k];
						//oHUD.v_playerPropertyStatic[k] -= tmp_propS[k];

						v_slotProperty[tmp_freeSlot, k] = tmp_prop[k];		
						v_equipmentSlotProperty[tmp_equipSlot, k] = 0;
						
						v_slotPropertyStatic[tmp_freeSlot, k] = tmp_propS[k];		
						v_equipmentSlotPropertyStatic[tmp_equipSlot, k] = 0;
					
						v_slotReq[tmp_freeSlot, k] = tmp_req[k];	
						v_equipmentReq[tmp_equipSlot, k] = 0;														
					}
					
					for (var k = 0; k < mcAnimations; k++)
					{
						v_slotAnimations[tmp_freeSlot, k] = tmp_anim[k];		
						v_equipmentSlotAnimations[tmp_equipSlot, k] = 0;									
					}
					
					for (var k = 0; k < 20; k++)
					{
						v_slotGems[tmp_freeSlot, k] = tmp_gems[k];		
						v_equipmentSlotGems[tmp_equipSlot, k] = "";									
					}
					
					for (var k = 0; k < mcAnimations; k++)
					{
						oPlayer.v_bci[k, v_slot[tmp_freeSlot, e_inventoryAtributes.valEquipSlot]] = oPlayer.v_bciDef[k, v_slot[tmp_freeSlot, e_inventoryAtributes.valEquipSlot]];
					}
				}