/// @description Insert description here
// You can write your code in this editor

if (alarm[1] == -1)
{
	alarm[1] = 60;
	with(other) {cpGoreBlood(x, y, 30); v_properties[e_inventoryProperties.valHp] -= 10;}
	
	
	if (other.v_properties[e_inventoryProperties.valHp] <= 0)
	{
		with(other)
		{
			if (v_alive)
			{
				if (v_isVivid)
				{
					v_splitStartX = 32;
					v_splitStartY = 0;

					v_splitEndX = 32;
					v_splitEndY = 64;

					v_restX = x;
					v_restY = y;

					v_restStartX = v_restX;
					v_restStartY = v_restY;


					d_spriteList = sprite_divide(v_sprite,v_splitStartX,v_splitStartY,v_splitEndX,v_splitEndY);

					sprite_index = d_spriteList[| 1];
					v_spriteRest = d_spriteList[| 0];

					ds_list_destroy(d_spriteList);
				}	

				v_alive = false;
				event_user(0);
				}
			}
		}
}