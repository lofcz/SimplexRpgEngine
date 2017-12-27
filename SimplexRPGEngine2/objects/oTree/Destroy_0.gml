/// @description Insert description here
// You can write your code in this editor

if (v_alwaysOn)
{
	for(var i = 0; i < ds_list_size(global.refl_insts); i++)
	{
		var inst = global.refl_insts[|i];
	
		if (inst == id) {ds_list_delete(global.refl_insts, i); break;}
	}
}	