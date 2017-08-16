/// @description Insert description here
// You can write your code in this editor

draw_self();
event_inherited();

var tmp_list;
tmp_list = instance_position_list(x, y, parGameObject);

if (tmp_list != noone)
{
	for (var i = 0; i < ds_list_size(tmp_list); i++)
	{
		if (tmp_list[| i] == id) {continue;}
		
		if (tmp_list[| i].v_canBeDamaged)
		{
			if (libUtilityCheckCollisionRect(v_collisionMain, tmp_list[| i].v_collisionMain)) 
			{
				if (!ds_list_contains(v_hitList, tmp_list[| i]) && tmp_list[|i].v_alive)
				{
					ds_list_add(v_hitList, tmp_list[| i]);
					tmp_list[| i].v_properties[e_inventoryProperties.valHp] -= 5;
					
					var tmp_d1, tmp_d2;
					if (sprite_index == sSwingRight) {tmp_d1 = 315; tmp_d2 = 405;}
					if (sprite_index == sSwingLeft) {tmp_d1 = 135; tmp_d2 = 225;}
					if (sprite_index == sSwingDown) {tmp_d1 = 225; tmp_d2 = 315;}
					if (sprite_index == sSwingUp) {tmp_d1 = 45; tmp_d2 = 135;}
					
					cpGoreBlood(tmp_list[| i].x, tmp_list[| i].y, 5, c_red, tmp_d1, tmp_d2);

					with(tmp_list[| i])
					{
						if (v_alive)
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
							
							event_user(0);
							v_alive = false;
						}
																	
					}					
				}
			}
		}
	}
}

if (tmp_list != noone) {ds_list_destroy(tmp_list);}