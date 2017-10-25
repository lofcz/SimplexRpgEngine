/// @function cpInventoryHelperSwitch(slotOwner1, slotOwner2, slotID1, slotID2, [specialMode])
/// @desc Switches two slots between any IContainer interface
/// @arg {object} slotOwner1 Owner of the current slot
/// @arg {object} slotOwner2 Owner of the target slot
/// @arg {int} slotID1 ID of the current slot
/// @arg {int} slotID2 ID of the target slot
/// @arg {string} specialMode "E2I, I2E"

var tmp_owner1, tmp_owner2, tmp_slot1, tmp_slot2, tmp_sm, tmp_gem;
tmp_owner1 = id;
tmp_owner2 = id;
tmp_slot1 = 0;
tmp_slot2 = 0;
tmp_sm = "";

if (argument_count > 0) {tmp_owner1 = argument[0];}
if (argument_count > 1) {tmp_owner2 = argument[1];}
if (argument_count > 2) {tmp_slot1 = argument[2];}
if (argument_count > 3) {tmp_slot2 = argument[3];}
if (argument_count > 4) {tmp_sm = argument[4];}

var tmp_atrb, tmp_prop, tmp_req, tmp_opt, tmp_anim, tmp_propS;
	
#region Store temp vars			
for (var k = 0; k <= mcInvenotryAtributes; k++)
{
	tmp_atrb[k] = tmp_owner1.v_slot[tmp_slot1, k];
}
				
for (var k = 0; k < mcInventoryProperties; k++)
{
	tmp_prop[k] = tmp_owner1.v_slotProperty[tmp_slot1, k];	
	tmp_req[k] = tmp_owner1.v_slotReq[tmp_slot1, k];
	tmp_propS[k] = tmp_owner1.v_slotPropertyStatic[tmp_slot1, k];
}
					
for (var k = 0; k < 16; k++)
{
	tmp_opt[k] = tmp_owner1.v_itemOptions[tmp_slot1, k];
}
					
for (var k = 0; k < mcAnimations; k++)
{
	tmp_anim[k] = tmp_owner1.v_slotAnimations[tmp_slot1, k];
}

for (var k = 0; k < 20; k++)
{
	tmp_gem[k] = tmp_owner1.v_slotGems[tmp_slot1, k];	
}
	
#endregion	
#region Swap values
for (var k = 0; k <= mcInvenotryAtributes; k++)
{
	tmp_owner1.v_slot[tmp_slot1, k] = tmp_owner2.v_slot[tmp_slot2, k];					
	tmp_owner2.v_slot[tmp_slot2, k] = tmp_atrb[k];
}
			
for (var k = 0; k < mcInventoryProperties; k++)
{
	tmp_owner1.v_slotProperty[tmp_slot1, k] = tmp_owner2.v_slotProperty[tmp_slot2, k];
	tmp_owner2.v_slotProperty[tmp_slot2, k] = tmp_prop[k];
					
	tmp_owner1.v_slotReq[tmp_slot1, k] = tmp_owner2.v_slotReq[tmp_slot2, k];
	tmp_owner2.v_slotReq[tmp_slot2, k] = tmp_req[k];				
	
	tmp_owner1.v_slotPropertyStatic[tmp_slot1, k] = tmp_owner2.v_slotPropertyStatic[tmp_slot2, k];
	tmp_owner2.v_slotPropertyStatic[tmp_slot2, k] = tmp_propS[k];
}

for (var k = 0; k < 16; k++)
{
	tmp_owner1.v_itemOptions[tmp_slot1, k] = tmp_owner2.v_itemOptions[tmp_slot2, k];
	tmp_owner2.v_itemOptions[tmp_slot2, k] = tmp_opt[k];
}			
					
for (var k = 0; k < mcAnimations; k++)
{
	tmp_owner1.v_slotAnimations[tmp_slot1, k] = tmp_owner2.v_slotAnimations[tmp_slot2, k];
	tmp_owner2.v_slotAnimations[tmp_slot2, k] = tmp_anim[k];
}	

for (var k = 0; k < 20; k++)
{
	tmp_owner1.v_slotGems[tmp_slot1, k] = tmp_owner2.v_slotGems[tmp_slot2, k];					
	tmp_owner2.v_slotGems[tmp_slot2, k] = tmp_gem[k];
}
#endregion	