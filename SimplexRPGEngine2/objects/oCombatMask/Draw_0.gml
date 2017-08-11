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
				if (!ds_list_contains(v_hitList, tmp_list[| i]))
				{
					ds_list_add(v_hitList, tmp_list[| i]);
					tmp_list[| i].v_properties[e_inventoryProperties.valHp] -= 5;
					cpGoreFull(tmp_list[| i].x, tmp_list[| i].y);
				}
			}
		}
	}
}

if (tmp_list != noone) {ds_list_destroy(tmp_list);}